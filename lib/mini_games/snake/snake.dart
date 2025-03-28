import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';

// Here onwards is youtube tutorial

//Create New Page for Snake Game


class SnakeGame extends StatefulWidget {
  @override
  _SnakeGameState createState() => _SnakeGameState();
}

class _SnakeGameState extends State<SnakeGame> {
  final int squaresPerRow = 20;
  final int squaresPerCol = 30;
  final fontStyle = TextStyle(color: Colors.white, fontSize: 20);
  final randomGen = Random();

  var snake = [
    [0, 1], //head
    [0, 0] //body - (first cell of body)
  ];
  var food = [0, 2];
  var direction = 'up';
  var isPlaying = false;

  void startGame() {
    const duration = Duration(milliseconds: 200);

    snake = [ // Snake head
      [(squaresPerRow / 2).floor(), (squaresPerCol / 2).floor()]
    ];

    snake.add([snake.first[0], snake.first[1]+1]); // Snake body

    createFood();

    isPlaying = true;
    Timer.periodic(duration, (Timer timer) {
      moveSnake();
      if (checkGameOver()) {
        timer.cancel();
        endGame();
      }
    });
  }

  void moveSnake() {
    setState(() {
      switch(direction) {
        case 'up':

          if (snake.first[1] <= 0) {                                   //make the snake go from top of grid to bottom
            snake.insert(0, [snake.first[0], squaresPerCol -1]);
          } else {
            snake.insert(0, [snake.first[0], snake.first[1] - 1]);   // keep the snake moving up
          }
          break;


        case 'down':

          if (snake.first[1] >= squaresPerCol -1) {
            snake.insert(0, [snake.first[0], 0]);
          } else {
            snake.insert(0, [snake.first[0], snake.first[1] + 1]);
          }
          break;

        case 'left':
          if (snake.first[0] <= 0) {
            snake.insert(0, [squaresPerRow - 1, snake.first[1]]);
          }
          snake.insert(0, [snake.first[0] - 1, snake.first[1]]);
          break;

        case 'right':
          if (snake.first[0] >= squaresPerRow - 1) {
            snake.insert(0, [0, snake.first[1]]);
          }
          snake.insert(0, [snake.first[0] + 1, snake.first[1]]);
          break;
      }

      if (snake.first[0] != food[0] || snake.first[1] != food[1]) {
        snake.removeLast();
      } else {
        createFood();
      }
    });
  }

  void createFood() {
    food = [
      randomGen.nextInt(squaresPerRow),
      randomGen.nextInt(squaresPerCol)
    ];
  }

  bool checkGameOver() {
    if (!isPlaying) {
      return true;
     }


    // Check if snake head has hit body
    for(var i=1; i < snake.length; ++i) {
      if (snake[i][0] == snake.first[0] && snake[i][1] == snake.first[1]) {
        return true;
      }
    }

    return false;
  }

  void endGame() {
    isPlaying = false;

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Game Over'),
            content: Text(
              'Score: ${snake.length - 2}',
              style: TextStyle(fontSize: 20),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Close'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        }
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(


      backgroundColor: Color.fromRGBO(33, 40, 69, 1),
      //backgroundColor: Colors.black,
      body:

      Column(
        children: <Widget>[
          Expanded(
            child: GestureDetector(
              onVerticalDragUpdate: (details) {
                if (direction != 'up' && details.delta.dy > 0) {
                  direction = 'down';
                } else if (direction != 'down' && details.delta.dy < 0) {
                  direction = 'up';
                }
              },
              onHorizontalDragUpdate: (details) {
                if (direction != 'left' && details.delta.dx > 0) {
                  direction = 'right';
                } else if (direction != 'right' && details.delta.dx < 0) {
                  direction = 'left';
                }
              },
              child: AspectRatio(
                aspectRatio: squaresPerRow / (squaresPerCol + 5),
                child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: squaresPerRow,
                    ),
                    itemCount: squaresPerRow * squaresPerCol,
                    itemBuilder: (BuildContext context, int index) {
                      var color;
                      var x = index % squaresPerRow;
                      var y = (index / squaresPerRow).floor();

                      bool isSnakeBody = false;
                      for (var pos in snake) {
                        if (pos[0] == x && pos[1] == y) {
                          isSnakeBody = true;
                          break;
                        }
                      }

                      if (snake.first[0] == x && snake.first[1] == y) {
                        color = Colors.green[700];
                      } else if (isSnakeBody) {
                        color = Colors.green[400];
                      } else if (food[0] == x && food[1] == y) {
                        color = Colors.red;
                      } else {
                        color = Color.fromRGBO(33, 40, 69, 1);
                      }

                      return Container(
                        margin: EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          color: color,
                          shape: BoxShape.circle,
                        ),
                      );
                    }),
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FlatButton(
                      color: isPlaying ? Colors.red : Color(0xFFF37335),
                      child: Text(
                        isPlaying ? 'End' : 'Start',
                        style: fontStyle,
                      ),
                      onPressed: () {
                        if (isPlaying) {
                          isPlaying = false;
                        } else {
                          startGame();
                        }
                      }),
                  Text(
                    'Score: ${snake.length - 2}',
                    style: fontStyle,
                  ),
                ],
              )),
        ],
      ),
    );
  }
}

//Here onwards is what alex and i had made

//class SnakePage extends StatefulWidget {
  // Create New Page for Snake Game
 // @override
//  SnakePageState createState() => SnakePageState();
//}

//class SnakePageState extends State<SnakePage> {
 // @override
  //Widget build(BuildContext context) {
 //   // Create New Page for Snake Game
  //  return Scaffold(
  //      backgroundColor: Colors.black,
  //      appBar: AppBar(
  //          title: Text("Snake")
  //      ),
        //body: Center(
        //child: FlatButton(
        //child: Text("Hello World")
        //  )
        //   )
 //   );
 // }
//}
