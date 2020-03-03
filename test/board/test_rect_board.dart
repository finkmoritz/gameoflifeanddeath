import 'dart:math';

import 'package:GameOfLifeAndDeath/src/board/rect_board.dart';
import 'package:GameOfLifeAndDeath/src/cell/dead_cell.dart';
import 'package:GameOfLifeAndDeath/src/cell/empty_cell.dart';
import 'package:GameOfLifeAndDeath/src/cell/living_cell.dart';
import 'package:GameOfLifeAndDeath/src/player/player.dart';

class TestRectBoard extends RectBoard {

  TestRectBoard(List<Player> players) : super(3, 3) {
    setCell(Point(0,0), DeadCell());
    setCell(Point(1,0), LivingCell(players[0]));
    setCell(Point(2,0), DeadCell());
    setCell(Point(0,1), LivingCell(players[0]));
    setCell(Point(1,1), LivingCell(players[1]));
    setCell(Point(2,1), LivingCell(players[0]));
    setCell(Point(0,2), DeadCell());
    setCell(Point(1,2), LivingCell(players[0]));
    setCell(Point(2,2), EmptyCell());
  }
}