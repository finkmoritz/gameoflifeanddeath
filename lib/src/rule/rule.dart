import 'dart:math';

import 'package:GameOfLifeAndDeath/GameOfLifeAndDeath.dart';
import 'package:GameOfLifeAndDeath/src/board/board.dart';

abstract class Rule {

  Cell apply(Board board, Point coord);
}