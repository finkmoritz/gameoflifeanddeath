import 'dart:math';

import 'package:GameOfLifeAndDeath/src/board/board.dart';
import 'package:GameOfLifeAndDeath/src/player/player.dart';

abstract class Game {

  Board get board;
  Player get currentPlayer;
  void toggleCell(Point coord);
  void undoChanges();
  void nextTurn();
}