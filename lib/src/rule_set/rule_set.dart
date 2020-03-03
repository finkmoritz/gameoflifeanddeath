import 'dart:math';

import 'package:GameOfLifeAndDeath/GameOfLifeAndDeath.dart';
import 'package:GameOfLifeAndDeath/src/board/board.dart';

abstract class RuleSet {

  Cell applyToCell(Board board, Point coord);
  Board apply(Board board);
}