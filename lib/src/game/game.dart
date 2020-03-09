import 'dart:math';

import 'package:GameOfLifeAndDeath/src/board/board.dart';
import 'package:GameOfLifeAndDeath/src/player/player.dart';

abstract class Game {

  Board get board;
  List<Player> get players;
  Player get currentPlayer;
  void toggleCell(Point coord);
  void undoChanges();
  void nextTurn();
  Player get winner;
  int getMoves(Player player);
}