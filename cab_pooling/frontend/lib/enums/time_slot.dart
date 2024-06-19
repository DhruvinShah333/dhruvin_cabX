enum TimeSlot {
  hourHalf('1/2 hour', 0.5),
  hour_1('1 hour', 1),
  hour_2('2 hour',2);

  final String label;
  final double val;
  const TimeSlot(this.label, this.val);

  String get value => label;
}
