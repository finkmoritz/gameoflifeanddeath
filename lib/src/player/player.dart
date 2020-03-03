class Player {

  final String name;
  final String color;

  Player(this.name, this.color);

  Player clone() => Player(name, color);
}