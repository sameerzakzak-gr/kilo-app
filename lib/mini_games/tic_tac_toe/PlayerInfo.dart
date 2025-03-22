import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kilo_project/mini_games/globals.dart';
import 'package:kilo_project/mini_games/tic_tac_toe/winning.dart';

Widget playerInfo(player1Name, player2Name, player1Score, player2Score,
    editPlayer1Name, editPlayer2Name, handleShowPlayerNameChange) {
  return Container(
      decoration: showWidgetBorders ? widgetBorder() : null,
      margin: EdgeInsets.all(32.0),
      child: Column(
        children: [
          Row(
            children: [
              Align(
                  alignment: Alignment.centerRight,
                  child: Column(
                    children: [
                      Container(
                        child: Text(
                          "Score",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFF37335)),
                        ),
                      )
                    ],
                  ))
            ],
          ),
          Row(
            children: [
              Container(
                  padding: EdgeInsets.all(2.0),
                  child: Column(children: [
                    IconButton(
                        color: Color(0xFFF37335),
                        icon: Icon(Icons.create),
                        onPressed: () {
                          handleShowPlayerNameChange(Player.PLAYER_1);
                        })
                  ])),
              Container(
                  padding: EdgeInsets.all(2.0),
                  child: Column(
                    children: [
                      editPlayer1Name
                          ? Container(
                              width: 100,
                              child: TextField(
                                onSubmitted: (newName) {
                                  handleShowPlayerNameChange(
                                      Player.PLAYER_1, newName);
                                },
                              ))
                          : Text(
                              '$player1Name: ',
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                    ],
                  )),
              Container(
                padding: EdgeInsets.all(2.0),
                child: Column(children: [
                  Text(
                    player1Score.toString(),
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFF37335)),
                  ),
                ]),
              )
            ],
          ),
          Row(
            children: [
              Container(
                  padding: EdgeInsets.all(2.0),
                  child: Column(children: [
                    IconButton(
                        color: Color(0xFFF37335),
                        icon: Icon(Icons.create),
                        onPressed: () {
                          handleShowPlayerNameChange(Player.PLAYER_2);
                        })
                  ])),
              Container(
                  padding: EdgeInsets.all(2.0),
                  child: Column(
                    children: [
                      editPlayer2Name
                          ? Container(
                              width: 100,
                              child: TextField(
                                onSubmitted: (newName) {
                                  handleShowPlayerNameChange(
                                      Player.PLAYER_2, newName);
                                },
                              ))
                          : Text(
                              '$player2Name: ',
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                    ],
                  )),
              Container(
                padding: EdgeInsets.all(2.0),
                child: Column(children: [
                  Text(
                    player2Score.toString(),
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFF37335)),
                  ),
                ]),
              )
            ],
          ),
        ],
      ));
}
