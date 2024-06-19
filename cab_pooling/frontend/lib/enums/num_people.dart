enum NumPeople {
  one(1),
  two(2),
  three(3),
  four(4);

  final int label;

  const NumPeople(this.label);

  String get value => label.toString();
}
