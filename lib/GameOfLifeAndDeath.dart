/// The Game Of Life And Death library provides classes and methods needed to simulate
/// the popular Game Of Life And Death game.
library game_of_life_and_death;

export 'src/board/board.dart';
export 'src/board/board_factory.dart';
export 'src/board/rect_board.dart';
export 'src/cell/cell.dart';
export 'src/cell/cell_state.dart';
export 'src/cell/dead_cell.dart';
export 'src/cell/empty_cell.dart';
export 'src/cell/living_cell.dart';
export 'src/game/conway_game.dart';
export 'src/game/game.dart';
export 'src/player/player.dart';
export 'src/rule/birth_rule.dart';
export 'src/rule/death_rule.dart';
export 'src/rule/rule.dart';
export 'src/rule/stay_rule.dart';
export 'src/rule_set/custom_rule_set.dart';
export 'src/rule_set/rule_set.dart';
export 'src/rule_set/standard_rule_set.dart';