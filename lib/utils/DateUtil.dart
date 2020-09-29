import 'package:intl/intl.dart';

class DateUtils {
  static const String DATE_TIME_PATTERN = "yyyy-MM-dd HH:mm:ss";
  static const String MINUTE_PATTERN = "yyyy-MM-dd HH:mm";
  static const String HOUR_PATTERN = "yyyy-MM-dd HH:mm:ss";
  static const String DATE_PATTERN = "yyyy-MM-dd";
  static const String MONTH_PATTERN = "yyyy-MM";
  static const String YEAR_PATTERN = "yyyy";
  static const String MINUTE_ONLY_PATTERN = "mm";
  static const String HOUR_ONLY_PATTERN = "HH";

  static String strDataToString(String strDate, String pattern) {
    var date = DateTime.parse(strDate).toLocal();
    var format = new DateFormat(pattern);
    String formatted = format.format(date);
    return formatted;
  }

  static DateTime stringToDate(String strDate, String pattern) {
    var date = DateTime.parse(strDate).toLocal();
    return date;
  }
}
