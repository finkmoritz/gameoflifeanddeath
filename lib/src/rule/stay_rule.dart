import 'dart:math';

import 'package:GameOfLifeAndDeath/src/board/board.dart';
import 'package:GameOfLifeAndDeath/src/cell/cell.dart';
import 'package:GameOfLifeAndDeath/src/cell/dead_cell.dart';
import 'package:GameOfLifeAndDeath/src/cell/empty_cell.dart';
import 'package:GameOfLifeAndDeath/src/cell/living_cell.dart';
import 'package:GameOfLifeAndDeath/src/rule/rule.dart';

class StayRule implements Rule {

  @override
  Cell apply(Board board, Point<num> coord) {
    var cell = board.getCell(coord);
    var newCell;
    if(cell is LivingCell) {
      newCell = LivingCell(cell.player);
    } else if(cell is DeadCell) {
      newCell = DeadCell();
    } else {
      newCell = EmptyCell();
    }
    return newCell;
  }
}