import 'dart:collection';
import 'dart:math';

import 'package:GameOfLifeAndDeath/src/board/board.dart';
import 'package:GameOfLifeAndDeath/src/cell/cell.dart';
import 'package:GameOfLifeAndDeath/src/cell/cell_state.dart';
import 'package:GameOfLifeAndDeath/src/cell/empty_cell.dart';
import 'package:GameOfLifeAndDeath/src/rule_set/rule_set.dart';

class CustomRuleSet implements RuleSet {

  final Map rules;

  CustomRuleSet(this.rules);

  @override
  Cell applyToCell(Board board, Point<num> coord) {
    if(board.getCell(coord).state == CellState.VOID) {
      return EmptyCell();
    }
    var cellNeighbours = board.getCellNeighbours(coord);
    var nLivingNeighbours = cellNeighbours.where((c) => c.state == CellState.ALIVE).toList().length;
    var rule = rules[nLivingNeighbours];
    return rule.apply(board, coord);
  }

  @override
  Board apply(Board board) {
    var newBoard = board.clone();
    for(var x=0; x<board.width; x++) {
      for(var y=0; y<board.height; y++) {
        var coord = Point(x,y);
        var newCell = applyToCell(board, coord);
        newBoard.setCell(coord, newCell);
      }
    }
    return newBoard;
  }
}