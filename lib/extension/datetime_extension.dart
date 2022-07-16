extension DateTimeExtension on DateTime {
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  DateTime setYear(int year) {
    return DateTime(
        year, month, day, hour, minute, second, millisecond, microsecond);
  }

  DateTime setMonth(int month) {
    return DateTime(
        year, month, day, hour, minute, second, millisecond, microsecond);
  }

  DateTime setDay(int day) {
    return DateTime(
        year, month, day, hour, minute, second, millisecond, microsecond);
  }

  DateTime setHour(int hour) {
    return DateTime(
        year, month, day, hour, minute, second, millisecond, microsecond);
  }

  DateTime setMinute(int minute) {
    return DateTime(
        year, month, day, hour, minute, second, millisecond, microsecond);
  }

  DateTime setDate(DateTime date) {
    return DateTime(date.year, date.month, date.day, hour, minute, second,
        millisecond, microsecond);
  }

  DateTime setTime(DateTime time) {
    return DateTime(year, month, day, time.hour, time.minute, time.second,
        time.millisecond, time.microsecond);
  }

  DateTime getDateEnd() {
    return DateTime(year, month, day);
  }

  DateTime getDateStart() {
    return DateTime(year, month, day, 23, 59, 59, 999, 999);
  }
}
