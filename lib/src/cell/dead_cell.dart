import 'package:GameOfLifeAndDeath/GameOfLifeAndDeath.dart';
import 'package:GameOfLifeAndDeath/src/cell/cell_state.dart';

class DeadCell extends Cell {

  DeadCell() : super(CellState.DEAD);

  DeadCell._withNextState(CellState nextState) : super(CellState.DEAD) {
    this.nextState = nextState;
  }

  @override
  Cell clone() {
    return DeadCell._withNextState(nextState);
  }
}