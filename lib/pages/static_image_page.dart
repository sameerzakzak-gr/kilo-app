import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

const String ssd = "SSD MobileNet";

class StaticImagePage extends StatefulWidget {
  @override
  _StaticImagePage createState() => _StaticImagePage();
}

class _StaticImagePage extends State<StaticImagePage> {
  File _image;
  List _recognitions;
  bool _busy;
  double _imageWidth, _imageHeight;
  bool res = false;

  final picker = ImagePicker();

  // this function loads the model
  loadTfModel() async {
    await Tflite.loadModel(
      model: "assets/machine/ssd_mobilenet.tflite",
      labels: "assets/machine/ssd_mobilenet.txt",
    );
  }

  // this function detects the objects on the image
  detectObject(File image) async {
    var recognitions = await Tflite.detectObjectOnImage(
        path: image.path, // required
        model: "SSDMobileNet",
        imageMean: 127.5,
        imageStd: 127.5,
        threshold: 0.4, // defaults to 0.1
        numResultsPerClass: 10, // defaults to 5
        asynch: true // defaults to true
        );
    FileImage(image)
        .resolve(ImageConfiguration())
        .addListener((ImageStreamListener((ImageInfo info, bool _) {
          setState(() {
            _imageWidth = info.image.width.toDouble();
            _imageHeight = info.image.height.toDouble();
          });
        })));
    setState(() {
      _recognitions = recognitions;
    });
  }

  @override
  void initState() {
    super.initState();
    _busy = true;
    loadTfModel().then((val) {
      {
        setState(() {
          _busy = false;
        });
      }
    });
  }

  // display the bounding boxes over the detected objects
  List<Widget> renderBoxes(Size screen) {
    if (_recognitions == null) return [];
    if (_imageWidth == null || _imageHeight == null) return [];

    double factorX = screen.width;
    double factorY = _imageHeight / _imageHeight * screen.width;

    Color unitedColor = Color(0xFFF37335);

    return _recognitions.map((re) {
      return Container(
        child: Positioned(
            left: re["rect"]["x"] * factorX,
            top: re["rect"]["y"] * factorY,
            width: re["rect"]["w"] * factorX,
            height: re["rect"]["h"] * factorY,
            child: ((re["confidenceInClass"] > 0.50))
                ? Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: unitedColor,
                      width: 3,
                    )),
                    child: Text(
                      "${re["detectedClass"]} ${(re["confidenceInClass"] * 100).toStringAsFixed(0)}%",
                      style: TextStyle(
                        background: Paint()..color = Color(0xFFF37335),
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  )
                : Container()),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    List<Widget> stackChildren = [];

    stackChildren.add(Positioned(
      // using ternary operator
      child: _image == null
          ? Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                      child: Text(
                    ("selectimage").tr(),
                    style: TextStyle(
                        color: Color(0xFFF37335),
                        fontSize: 30.0,
                        fontFamily: 'Original Surfer',
                        fontWeight: FontWeight.bold),
                  )),
                  SizedBox(
                    height: 150.0,
                  )
                ],
              ),
            )
          : // if not null then
          Container(child: Image.file(_image)),
    ));

    stackChildren.addAll(renderBoxes(size));

    if (_busy) {
      // stackChildren.add(Center(
      //   child: CircularProgressIndicator(backgroundColor: Color(0xFFF37335),),
      // ));
    }
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFF37335),
          title: Text(
            ("snappageheader").tr(),
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Original Surfer',
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xFFF37335),
          heroTag: "Fltbtn2",
          child: Icon(Icons.camera_alt),
          onPressed: getImageFromCamera,
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter,
              colors: [
                Colors.white,
                Color(0xFFF37335),
              ],
            ),
          ),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Stack(
                children: stackChildren,
              ),
              Container(
                margin: EdgeInsets.only(left: 40.0, right: 40.0),
                child: Column(
                  children: [
                    Text(("result").tr(),
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Original Surfer',
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                        width: 80.0,
                        height: 30.0,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: FractionalOffset.topCenter,
                            end: FractionalOffset.bottomCenter,
                            colors: [
                              Colors.white,
                              Colors.white,
                            ],
                          ),
                        ),
                        child: Center(
                            child: Text(res.toString(),
                                style: TextStyle(
                                    color: Color(0xFFF37335),
                                    fontFamily: 'Original Surfer',
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold)))),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // gets image from camera and runs detectObject
  Future getImageFromCamera() async {
    final pickedFile = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print("No image Selected");
      }
    });
    detectObject(_image);
  }
}
