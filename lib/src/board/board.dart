import 'dart:math';

import 'package:GameOfLifeAndDeath/GameOfLifeAndDeath.dart';

abstract class Board {

  final int width;
  final int height;
  List<List<Cell>> _cells;

  Board(this.width, this.height) {
    _cells = List<List<Cell>>(width);
    for(var i=0; i<width; i++) {
      _cells[i] = List<Cell>(height);
    }
  }

  void setCell(Point coord, Cell cell) {
    _cells[coord.x][coord.y] = cell;
  }

  Cell getCell(Point coord) => _cells[coord.x][coord.y];

  List<Cell> getCellNeighbours(Point coord);
  Board clone();
}