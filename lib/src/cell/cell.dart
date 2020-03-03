import 'package:GameOfLifeAndDeath/src/cell/cell_state.dart';

abstract class Cell {

  final CellState _state;
  CellState nextState = CellState.VOID;

  Cell(this._state);

  CellState get state => _state;

  Cell clone();
}