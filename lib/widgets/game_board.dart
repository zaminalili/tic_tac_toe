import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants/edge_insets.dart';

import '../constants/colors.dart';

class GameBoard extends StatefulWidget {
  const GameBoard({super.key, required this.itemList});

  final List<String> itemList;

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  bool isPlayerX = true;
  String winner = '';
  int gameCount = 0;

  void _changePlayer(int index) {
    if (widget.itemList[index].isEmpty) {
      setState(() {
        gameCount++;

        if (isPlayerX) {
          widget.itemList[index] = 'x';
          isPlayerX = !isPlayerX;
        } else {
          widget.itemList[index] = 'o';
          isPlayerX = !isPlayerX;
        }
      });

      _checkWinner(index);
    }
  }

  void _checkWinner(int index) {
    var items = widget.itemList;
    if ((items[0].isNotEmpty && items[0] == items[1] && items[1] == items[2]) ||
        (items[0].isNotEmpty && items[0] == items[3] && items[3] == items[6]) ||
        (items[0].isNotEmpty && items[0] == items[4] && items[4] == items[8]) ||
        (items[1].isNotEmpty && items[1] == items[4] && items[4] == items[7]) ||
        (items[2].isNotEmpty && items[2] == items[4] && items[4] == items[6]) ||
        (items[2].isNotEmpty && items[2] == items[5] && items[5] == items[8]) ||
        (items[3].isNotEmpty && items[3] == items[4] && items[4] == items[5]) ||
        (items[6].isNotEmpty && items[6] == items[7] && items[7] == items[8])) {
      winner = 'Winner: Player ${widget.itemList[index].toUpperCase()}';
    } else if (gameCount == 9) {
      winner = 'There is no winner';
    }
  }

  void _resetGame() {
    setState(() {
      isPlayerX = true;
      winner = '';
      gameCount = 0;

      for (var i = 0; i < widget.itemList.length; i++) {
        widget.itemList[i] = '';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GridView.builder(
          padding: AppEdgeInsets.bottom * 2,
          shrinkWrap: true,
          itemCount: widget.itemList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // İki sütunlu bir ızgara
            mainAxisSpacing: 5.0,
            crossAxisSpacing: 5.0,
          ),
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
                onTap: () {
                  if (winner == '') _changePlayer(index);
                },
                child: Container(
                  color: AppColors.primaryColor,
                  child: Center(
                      child: Text(
                    widget.itemList[index],
                    style: TextStyle(fontSize: 40, color: AppColors.bgColor),
                  )),
                ));
          },
        ),
        Text(
          winner,
          style: TextStyle(fontSize: 32, color: AppColors.primaryColor),
        ),
        ElevatedButton.icon(
            onPressed: _resetGame,
            style: ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll(AppColors.secondaryColor)),
            icon: const Icon(Icons.restart_alt),
            label: const Text('New game'))
      ],
    );
  }
}
