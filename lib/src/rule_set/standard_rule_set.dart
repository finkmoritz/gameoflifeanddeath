import 'package:GameOfLifeAndDeath/src/rule/birth_rule.dart';
import 'package:GameOfLifeAndDeath/src/rule/death_rule.dart';
import 'package:GameOfLifeAndDeath/src/rule/stay_rule.dart';
import 'package:GameOfLifeAndDeath/src/rule_set/custom_rule_set.dart';

class StandardRuleSet extends CustomRuleSet {

  StandardRuleSet() : super(
      {0 : DeathRule(),
      1 : DeathRule(),
      2 : StayRule(),
      3 : BirthRule(),
      4 : DeathRule(),
      5 : DeathRule(),
      6 : DeathRule(),
      7 : DeathRule(),
      8 : DeathRule()}
  );
}