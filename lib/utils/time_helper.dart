class TimeHelper {
  static String getTimeOfTheDay({DateTime? dateTime}) {
    DateTime time = dateTime ?? DateTime.now();
    if (time.hour >= 0 && time.hour < 6) return "night";
    if (time.hour >= 6 && time.hour < 12) return "morning";
    if (time.hour >= 12 && time.hour < 18) return "afternoon";
    return "evening";
  }
}
