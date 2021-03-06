import 'dart:math';

import 'package:GameOfLifeAndDeath/src/cell/cell_state.dart';
import 'package:GameOfLifeAndDeath/src/game/conway_game.dart';
import 'package:GameOfLifeAndDeath/src/player/player.dart';
import 'package:GameOfLifeAndDeath/src/rule_set/standard_rule_set.dart';
import 'package:test/test.dart';

import '../board/test_rect_board.dart';

void main() {
  group('Test game', () {
    ConwayGame _conwayGame;

    setUp(() {
      var players = <Player>[];
      players.add(Player("P1", "red"));
      players.add(Player("P2", "blue"));
      var board = TestRectBoard(players);
      var ruleSet = StandardRuleSet();
      _conwayGame = ConwayGame(board, ruleSet, players, 0);
    });

    test('Check status after nextTurn()', () {
      _conwayGame.nextTurn();
      expect(_conwayGame.board.getCell(Point(0,0)).state, CellState.ALIVE);
      expect(_conwayGame.board.getCell(Point(1,0)).state, CellState.ALIVE);
      expect(_conwayGame.board.getCell(Point(2,0)).state, CellState.ALIVE);
      expect(_conwayGame.board.getCell(Point(0,1)).state, CellState.ALIVE);
      expect(_conwayGame.board.getCell(Point(1,1)).state, CellState.DEAD);
      expect(_conwayGame.board.getCell(Point(2,1)).state, CellState.ALIVE);
      expect(_conwayGame.board.getCell(Point(0,2)).state, CellState.ALIVE);
      expect(_conwayGame.board.getCell(Point(1,2)).state, CellState.ALIVE);
      expect(_conwayGame.board.getCell(Point(2,2)).state, CellState.VOID);
    });

    test('Check nextStatus after nextTurn()', () {
      _conwayGame.nextTurn();
      expect(_conwayGame.board.getCell(Point(0,0)).nextState, CellState.ALIVE);
      expect(_conwayGame.board.getCell(Point(1,0)).nextState, CellState.DEAD);
      expect(_conwayGame.board.getCell(Point(2,0)).nextState, CellState.ALIVE);
      expect(_conwayGame.board.getCell(Point(0,1)).nextState, CellState.DEAD);
      expect(_conwayGame.board.getCell(Point(1,1)).nextState, CellState.DEAD);
      expect(_conwayGame.board.getCell(Point(2,1)).nextState, CellState.ALIVE);
      expect(_conwayGame.board.getCell(Point(0,2)).nextState, CellState.ALIVE);
      expect(_conwayGame.board.getCell(Point(1,2)).nextState, CellState.ALIVE);
      expect(_conwayGame.board.getCell(Point(2,2)).nextState, CellState.VOID);
    });

    test('Check toggleCell() for LivingCell', () {
      _conwayGame.toggleCell(Point(1,0));
      expect(_conwayGame.board.getCell(Point(1,0)).state, CellState.DEAD);
      _conwayGame.toggleCell(Point(1,0));
      expect(_conwayGame.board.getCell(Point(1,0)).state, CellState.ALIVE);
    });

    test('Check toggleCell() for DeadCell', () {
      _conwayGame.toggleCell(Point(0,0));
      expect(_conwayGame.board.getCell(Point(0,0)).state, CellState.ALIVE);
      _conwayGame.toggleCell(Point(0,0));
      expect(_conwayGame.board.getCell(Point(0,0)).state, CellState.DEAD);
    });

    test('Check toggleCell() for EmptyCell', () {
      _conwayGame.toggleCell(Point(2,2));
      expect(_conwayGame.board.getCell(Point(2,2)).state, CellState.VOID);
      _conwayGame.toggleCell(Point(2,2));
      expect(_conwayGame.board.getCell(Point(2,2)).state, CellState.VOID);
    });

    test('Check undoChanges() for LivingCell', () {
      _conwayGame.toggleCell(Point(1,0));
      expect(_conwayGame.board.getCell(Point(1,0)).state, CellState.DEAD);
      _conwayGame.undoChanges();
      expect(_conwayGame.board.getCell(Point(1,0)).state, CellState.ALIVE);
    });

    test('Check undoChanges() for DeadCell', () {
      _conwayGame.toggleCell(Point(0,0));
      expect(_conwayGame.board.getCell(Point(0,0)).state, CellState.ALIVE);
      _conwayGame.undoChanges();
      expect(_conwayGame.board.getCell(Point(0,0)).state, CellState.DEAD);
    });

    test('Check undoChanges() for EmptyCell', () {
      _conwayGame.toggleCell(Point(2,2));
      expect(_conwayGame.board.getCell(Point(2,2)).state, CellState.VOID);
      _conwayGame.undoChanges();
      expect(_conwayGame.board.getCell(Point(2,2)).state, CellState.VOID);
    });
  });
}