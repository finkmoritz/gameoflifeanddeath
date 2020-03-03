import 'dart:math';

import 'package:GameOfLifeAndDeath/src/board/board.dart';
import 'package:GameOfLifeAndDeath/src/cell/cell.dart';
import 'package:GameOfLifeAndDeath/src/cell/dead_cell.dart';
import 'package:GameOfLifeAndDeath/src/rule/rule.dart';

class DeathRule implements Rule {

  @override
  Cell apply(Board board, Point<num> coord) => DeadCell();
}