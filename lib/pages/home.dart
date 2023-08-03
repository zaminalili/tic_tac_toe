import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants/colors.dart';
import 'package:tic_tac_toe/constants/edge_insets.dart';
import 'package:tic_tac_toe/constants/text_styles.dart';

import '../widgets/game_board.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.title});

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> itemList = List.generate(9, (index) => '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        title: Text(
          widget.title,
          style: TextStyle(color: AppColors.primaryColor),
        ),
      ),
      body: Padding(
        padding: AppEdgeInsets.horizantal,
        child: Column(
          children: [
            Padding(
              padding: AppEdgeInsets.vertical * 2,
              child: Text(
                'Game',
                style: TextStyles.titleStyle,
              ),
            ),
            GameBoard(itemList: itemList)
          ],
        ),
      ),
    );
  }
}
