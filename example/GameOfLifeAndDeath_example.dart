import 'dart:io';
import 'dart:math';

import 'package:GameOfLifeAndDeath/GameOfLifeAndDeath.dart';
import 'package:ansicolor/ansicolor.dart';

void main() {
  //Create a list of players:
  var players = <Player>[];
  players.add(Player('P0', 'red'));
  players.add(Player('P1', 'blue'));

  //Create a board:
  var board = BoardFactory.createRandomRectBoard(8, 8, players);

  //Define a rule set:
  var ruleSet = StandardRuleSet();

  //Setup the game:
  var conwayGame = ConwayGame(board, ruleSet, players, 0);

  var nextTurn = true;
  while(conwayGame.winner == null || !nextTurn) {
    nextTurn = false;
    _printBoard(conwayGame);
    var input = _getInput(conwayGame);
    if(input.contains('#')) {
      var coordInput = input.split('#');
      var x = coordInput[0].codeUnitAt(0) - 'A'.codeUnitAt(0);
      var y = int.parse(coordInput[1]);
      conwayGame.toggleCell(Point(x,y));
    } else if(input == 'U') {
      conwayGame.undoChanges();
    } else if(input == 'N') {
      conwayGame.nextTurn();
      nextTurn = true;
    } else if(input == 'Q') {
      return;
    } else {
      print('Unknown command!');
    }
  }

  _printBoard(conwayGame);
  var winner = conwayGame.winner;
  if(winner != null) {
    print('Player ${conwayGame.winner.name} wins!');
  } else {
    print('Draw');
  }
}

/// Print the game's board in a readable form.
/// Example:
///    ABC
///  0 X1
///  1 XXX
///  2 0 1
void _printBoard(Game game) {
  var board = game.board;
  var players = game.players;
  _print('  ', AnsiPen());
  for(var x=0; x<board.width; x++) {
    _print(' ${String.fromCharCode('A'.codeUnitAt(0) + x)} ', AnsiPen());
  }
  _print('\n', AnsiPen());
  for(var y=0; y<board.width; y++) {
    _print(y.toString() + ' ', AnsiPen());
    for(var x=0; x<board.height; x++) {
      var cell = board.getCell(Point(x,y));
      if(cell is LivingCell) {
        _print(' ${players.indexOf(cell.player)} ', _playerPen(cell.player));
      } else if(cell is DeadCell) {
        _print(' X ', AnsiPen()..black(bold: true)..red(bg: true));
      } else {
        _print('   ', AnsiPen());
      }
    }
    _print('\n', AnsiPen());
  }
}

void _print(String text, AnsiPen pen) {
  stdout.write(pen(text));
}

String _getInput(Game game) {
  print('');
  print(game.currentPlayer.name + ' choose an action:');
  print('<A>#<0>: toggle cell A0');
  print('U: undo changes');
  print('N: next turn');
  print('Q: quit');
  return stdin.readLineSync();
}

AnsiPen _playerPen(Player player) {
  switch(player.color) {
    case('red'): return AnsiPen()..green(bg: true)..red(bold: true);
    case('blue'): return AnsiPen()..green(bg: true)..blue(bold: true);
  }
  return AnsiPen()..green(bg: true);
}