import 'dart:math';

import 'package:GameOfLifeAndDeath/GameOfLifeAndDeath.dart';

class BoardFactory {

  static RectBoard createRandomRectBoard(int width, int height, List<Player> players) {
    var board = RectBoard(width, height);
    var random = Random(DateTime.now().millisecondsSinceEpoch);
    for(var x=0; x<width; x++) {
      for(var y=0; y<height; y++) {
        var coord = Point(x,y);
        var r = random.nextDouble();
        if(r < 0.45) {
          var playerIndex = random.nextInt(players.length);
          board.setCell(coord, LivingCell(players[playerIndex]));
        } else if(r < 0.9) {
          board.setCell(coord, DeadCell());
        } else {
          board.setCell(coord, EmptyCell());
        }
      }
    }
    return board;
  }
}