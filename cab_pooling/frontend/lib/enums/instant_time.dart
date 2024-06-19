enum InstantTime {
  now(0),
  min15(15),
  min30(30),
  min45(45),
  hour1(60);

  final int minutes;
  const InstantTime(this.minutes);

  String get value => minutes.toString();

  String get label => minutes == 0 ? "Now" : "$minutes min";
}
