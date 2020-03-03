import 'package:GameOfLifeAndDeath/src/cell/cell_state.dart';

abstract class Cell {

  final CellState state;
  CellState nextState = CellState.VOID;

  Cell(this.state);

  Cell clone();
}