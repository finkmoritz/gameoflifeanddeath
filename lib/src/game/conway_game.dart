import 'dart:math';

import 'package:GameOfLifeAndDeath/src/board/board.dart';
import 'package:GameOfLifeAndDeath/src/cell/cell_state.dart';
import 'package:GameOfLifeAndDeath/src/cell/dead_cell.dart';
import 'package:GameOfLifeAndDeath/src/cell/living_cell.dart';
import 'package:GameOfLifeAndDeath/src/game/game.dart';
import 'package:GameOfLifeAndDeath/src/player/player.dart';
import 'package:GameOfLifeAndDeath/src/rule_set/rule_set.dart';

class ConwayGame implements Game {

  Board _board;
  Board _boardBackup;

  final RuleSet _ruleSet;

  List<Player> _players;
  int _currentPlayerIndex;

  ConwayGame(this._board, this._ruleSet, this._players, this._currentPlayerIndex) {
    _updateBoard();
  }

  @override
  Board get board => _board;

  @override
  Player get currentPlayer => _players[_currentPlayerIndex];

  @override
  void nextTurn() {
    _board = _ruleSet.apply(_board);
    _boardBackup = _board.clone();
    _currentPlayerIndex = (_currentPlayerIndex+1) % _players.length;
    _updateBoard();
  }

  @override
  void toggleCell(Point<num> coord) {
    var cell = _board.getCell(coord);
    if(cell.state == CellState.ALIVE) {
      _board.setCell(coord, DeadCell());
    } else if(cell.state == CellState.DEAD) {
      _board.setCell(coord, LivingCell(currentPlayer));
    }
    _updateBoard();
  }

  @override
  void undoChanges() {
    _board = _boardBackup.clone();
  }

  void _updateBoard() {
    var nextBoard = _ruleSet.apply(_board);
    for(var x=0; x<_board.width; x++) {
      for(var y=0; y<_board.height; y++) {
        var coord = Point(x,y);
        var nextState = nextBoard.getCell(coord).state;
        _board.getCell(coord).nextState = nextState;
      }
    }
  }
}