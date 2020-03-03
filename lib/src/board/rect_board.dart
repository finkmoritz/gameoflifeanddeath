import 'dart:math';

import 'package:GameOfLifeAndDeath/src/board/board.dart';
import 'package:GameOfLifeAndDeath/src/cell/cell.dart';

class RectBoard extends Board {

  RectBoard(int width, int height) : super(width, height);

  @override
  List<Cell> getCellNeighbours(Point<num> coord) {
    var neighbours = <Cell>[];
    if(coord.x != 0 && coord.y != 0) neighbours.add(_getCellNeighbour(coord, -1, -1));
    if(coord.y != 0) neighbours.add(_getCellNeighbour(coord, 0, -1));
    if(coord.x != width-1 && coord.y != 0) neighbours.add(_getCellNeighbour(coord, 1, -1));
    if(coord.x != 0) neighbours.add(_getCellNeighbour(coord, -1, 0));
    if(coord.x != width-1) neighbours.add(_getCellNeighbour(coord, 1, 0));
    if(coord.x != 0 && coord.y != height-1) neighbours.add(_getCellNeighbour(coord, -1, 1));
    if(coord.y != height-1) neighbours.add(_getCellNeighbour(coord, 0, 1));
    if(coord.x != width-1 && coord.y != height-1) neighbours.add(_getCellNeighbour(coord, 1, 1));
    return neighbours;
  }

  Cell _getCellNeighbour(Point coord, int dx, int dy) {
    var x = (coord.x + dx + width) % width;
    var y = (coord.y + dy + height) % height;
    return getCell(Point(x,y));
  }

  @override
  Board clone() {
    var clone = RectBoard(width, height);
    for(var x=0; x<width; x++) {
      for(var y=0; y<height; y++) {
        clone.setCell(Point(x,y), getCell(Point(x,y)).clone());
      }
    }
    return clone;
  }
}