import 'package:flutter_test/flutter_test.dart';
import 'package:my_learing_with_testing/utils/time_helper.dart';

void main() {
  group("TimeHelper getTimeOfTheDay test", () {
    test('TimeHelper should return night', () {
      DateTime night = DateTime(2025, 1, 1, 2);

      String result = TimeHelper.getTimeOfTheDay(dateTime: night);
      expect(result, "night");
    });
    test('TimeHelper should return morning', () {
      DateTime morning = DateTime(2025, 1, 1, 8);

      String result = TimeHelper.getTimeOfTheDay(dateTime: morning);
      expect(result, "morning");
    });
    test('TimeHelper should return afternoon', () {
      DateTime afternoon = DateTime(2025, 1, 1, 14);

      String result = TimeHelper.getTimeOfTheDay(dateTime: afternoon);
      expect(result, "afternoon");
    });
    test('TimeHelper should return evening', () {
      DateTime evening = DateTime(2025, 1, 1, 20);

      String result = TimeHelper.getTimeOfTheDay(dateTime: evening);
      expect(result, "evening");
    });
  });
}
