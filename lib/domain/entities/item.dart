class Item {
  Item(
    this.startedAt,
    this.endedAt,
    this.isAllDay,
  );

  final DateTime startedAt;
  final DateTime endedAt;
  final bool isAllDay;
}
