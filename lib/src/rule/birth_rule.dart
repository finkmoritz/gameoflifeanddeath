import 'dart:collection';
import 'dart:math';

import 'package:GameOfLifeAndDeath/src/board/board.dart';
import 'package:GameOfLifeAndDeath/src/cell/cell.dart';
import 'package:GameOfLifeAndDeath/src/cell/living_cell.dart';
import 'package:GameOfLifeAndDeath/src/player/player.dart';
import 'package:GameOfLifeAndDeath/src/rule/rule.dart';

class BirthRule implements Rule {

  @override
  Cell apply(Board board, Point<num> coord) {
    var cellNeighbours = board.getCellNeighbours(coord);
    var dominantPlayer;
    var cell = board.getCell(coord);
    if(cell is LivingCell) {
      dominantPlayer = cell.player;
    } else {
      dominantPlayer = _getDominantPlayer(cellNeighbours);
    }
    return LivingCell(dominantPlayer);
  }

  Player _getDominantPlayer(List<Cell> cellNeighbours) {
    var count = {};
    for(var cell in cellNeighbours) {
      if(cell is LivingCell) {
        var player = cell.player;
        if(count.containsKey(player)) {
          count[player]++;
        } else {
          count[player] = 1;
        }
      }
    }
    var dominantPlayer;
    var maxCount = 0;
    for(var player in count.keys) {
      var n = count[player];
      if(n > maxCount) {
        maxCount = n;
        dominantPlayer = player;
      }
    }
    return dominantPlayer;
  }
}