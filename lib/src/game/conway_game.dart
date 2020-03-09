import 'dart:math';

import 'package:GameOfLifeAndDeath/GameOfLifeAndDeath.dart';
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

  @override
  final List<Player> players;
  int _currentPlayerIndex;

  final Map _nMoves = {};
  List _toggledCells = [];

  ConwayGame(this._board, this._ruleSet, this.players, this._currentPlayerIndex) {
    _boardBackup = _board.clone();
    for(var i=0; i<players.length; i++) {
      _nMoves[players[i]] = 0;
    }
    _nMoves[currentPlayer] = 1;
    _updateBoard();
  }

  @override
  Board get board => _board;

  @override
  Player get currentPlayer => players[_currentPlayerIndex];

  @override
  void nextTurn() {
    _board = _ruleSet.apply(_board);
    _boardBackup = _board.clone();
    _currentPlayerIndex = (_currentPlayerIndex+1) % players.length;
    _nMoves[currentPlayer]++;
    _toggledCells = [];
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
    if(_toggledCells.contains(cell)) {
      _nMoves[currentPlayer]++;
    } else {
      if(_nMoves[currentPlayer] > 0) {
        _nMoves[currentPlayer]--;
      } else {
        throw Exception('Not allowed!');
      }
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

  @override
  Player get winner {
    var winningPlayer;
    for(var x=0; x<board.width; x++) {
      for(var y=0; y<board.height; y++) {
        var cell = board.getCell(Point(x,y));
        if(cell is LivingCell) {
          if(winningPlayer == null) {
            winningPlayer = cell.player;
          } else if(winningPlayer != cell.player) {
            return null;
          }
        }
      }
    }
    return winningPlayer;
  }

  @override
  int getMoves(Player player) {
    return _nMoves[player];
  }
}