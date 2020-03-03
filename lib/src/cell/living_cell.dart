import 'package:GameOfLifeAndDeath/GameOfLifeAndDeath.dart';
import 'package:GameOfLifeAndDeath/src/cell/cell_state.dart';
import 'package:GameOfLifeAndDeath/src/player/player.dart';

class LivingCell extends Cell {

  Player player;

  LivingCell(this.player) : super(CellState.ALIVE);

  LivingCell._withNextState(CellState nextState) : super(CellState.ALIVE) {
    this.nextState = nextState;
  }

  @override
  Cell clone() {
    return LivingCell._withNextState(nextState);
  }
}