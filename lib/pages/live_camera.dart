import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:kilo_project/pages/camera_page.dart';
import 'package:kilo_project/SSD/bounding_box.dart';
import 'dart:math' as math;
import 'package:tflite/tflite.dart';

class LiveCamera extends StatefulWidget {
  final List<CameraDescription> cameras;
  LiveCamera(this.cameras);
  @override
  _LiveCameraState createState() => _LiveCameraState();
}

class _LiveCameraState extends State<LiveCamera> {
  List<dynamic> _recognitions;
  int _imageHeight = 0;
  int _imageWidth = 0;
  initCameras() async {}
  loadTfModel() async {
    await Tflite.loadModel(
      model: "assets/machine/ssd_mobilenet.tflite",
      labels: "assets/machine/ssd_mobilenet.txt",
    );
  }

  /* 
  The set recognitions function assigns the values of recognitions, imageHeight and width to the variables defined here as callback
  */
  setRecognitions(recognitions, imageHeight, imageWidth) {
    if (mounted) {
      setState(() {
        _recognitions = recognitions;
        _imageHeight = imageHeight;
        _imageWidth = imageWidth;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    loadTfModel();
  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF37335),
        title: Text("Real Time Object Detection",style: TextStyle(color: Colors.white),),
      ),
      body: Stack(
        children: <Widget>[
          CameraPage(widget.cameras, setRecognitions),
          BoundingBox(
            _recognitions == null ? [] : _recognitions,
            math.max(_imageHeight, _imageWidth),
            math.min(_imageHeight, _imageWidth),
            screen.height,
            screen.width,
          ),
        ],
      ),
    );
  }
}
