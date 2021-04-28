import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool isCross = true;
  String msg;
  List<String> gameState;

  AssetImage cross = AssetImage("images/cross.png");
  AssetImage circle = AssetImage("images/circle.png");
  AssetImage edit = AssetImage("images/edit.png");

  @override
  void initState() {
    super.initState();
    setState(() {
      this.gameState = [
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
      ];
      this.msg = "";
    });
  }

  playGame(int index) {
    if (this.gameState[index] == "empty") {
      setState(() {
        if (this.isCross) {
          this.gameState[index] = "cross";
        } else {
          this.gameState[index] = "circle";
        }
        this.isCross = !this.isCross;
      });
      this.checkWin();
    }
  }

  resetGame() {
    setState(() {
      this.gameState = [
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
      ];
      this.msg = "";
      this.isCross = true;
    });
  }

  checkWin() {
    if ((gameState[0] != 'empty') &&
        (gameState[0] == gameState[1]) &&
        (gameState[1] == gameState[2])) {
      setState(() {
        this.msg = '${this.gameState[0]} Wins';
      });
    } else if ((gameState[3] != 'empty') &&
        (gameState[3] == gameState[4]) &&
        (gameState[4] == gameState[5])) {
      setState(() {
        this.msg = '${this.gameState[3]} Wins';
      });
    } else if ((gameState[6] != 'empty') &&
        (gameState[6] == gameState[7]) &&
        (gameState[7] == gameState[8])) {
      setState(() {
        this.msg = '${this.gameState[6]} Wins';
      });
    } else if ((gameState[0] != 'empty') &&
        (gameState[0] == gameState[3]) &&
        (gameState[3] == gameState[6])) {
      setState(() {
        this.msg = '${this.gameState[0]} Wins';
      });
    } else if ((gameState[1] != 'empty') &&
        (gameState[1] == gameState[4]) &&
        (gameState[4] == gameState[7])) {
      setState(() {
        this.msg = '${this.gameState[1]} Wins';
      });
    } else if ((gameState[2] != 'empty') &&
        (gameState[2] == gameState[5]) &&
        (gameState[5] == gameState[8])) {
      setState(() {
        this.msg = '${this.gameState[2]} Wins';
      });
    } else if ((gameState[0] != 'empty') &&
        (gameState[0] == gameState[4]) &&
        (gameState[4] == gameState[8])) {
      setState(() {
        this.msg = '${this.gameState[0]} Wins';
      });
    } else if ((gameState[2] != 'empty') &&
        (gameState[2] == gameState[4]) &&
        (gameState[4] == gameState[6])) {
      setState(() {
        this.msg = '${this.gameState[2]} Wins';
      });
    } else if (!gameState.contains('empty')) {
      setState(() {
        this.msg = 'Game Draw';
      });
    }
    if (this.msg != "") {
      Future.delayed(Duration(seconds: 3), () {
        resetGame();
      });
    }
  }

  AssetImage getImage(String value) {
    switch (value) {
      case ('empty'):
        return edit;
        break;
      case ('circle'):
        return circle;
        break;
      case ('cross'):
        return cross;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TicTacToe Game'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: GridView.builder(
                padding: EdgeInsets.all(20.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.0,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: 9,
                itemBuilder: (context, i) => SizedBox(
                      width: 100.0,
                      height: 100.0,
                      child: RaisedButton(
                        onPressed: () {
                          if (this.msg == "") {
                            this.playGame(i);
                          } else {
                            null;
                          }
                        },
                        color: Colors.white,
                        child: Image(image: this.getImage(this.gameState[i])),
                      ),
                    )),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text(
              this.msg,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          MaterialButton(
            onPressed: () {
              this.resetGame();
            },
            color: Colors.green,
            minWidth: 300.0,
            height: 50.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Text(
              'Reset Game',
              style: TextStyle(fontSize: 20.0, color: Colors.white),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text('created by Aritam'),
          )
        ],
      ),
    );
  }
}
