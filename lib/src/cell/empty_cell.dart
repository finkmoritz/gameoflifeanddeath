import 'package:GameOfLifeAndDeath/GameOfLifeAndDeath.dart';
import 'package:GameOfLifeAndDeath/src/cell/cell_state.dart';

class EmptyCell extends Cell {

  EmptyCell() : super(CellState.VOID);

  @override
  Cell clone() {
    return EmptyCell();
  }
}