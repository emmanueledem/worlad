import 'package:intl/intl.dart';

class TimeFmt {
  static String getOnlyDate(String timeString) {
    final date = DateTime.parse(timeString);
    final formattedDate = DateFormat('yyyy-MM-dd').format(date);
    return formattedDate;
  }

  static String getCurrentDate() {
    final formatedDate = DateFormat.yMMMMd('en_US').format(DateTime.now());
    final formatedTime = DateFormat("hh:mm:ss a").format(DateTime.now());
      var dateTime = formatedDate + ' ' + formatedTime;
    return dateTime;
  }

  static String greeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Morning';
    }
    if (hour < 17) {
      return 'Afternoon';
    }
    return 'Evening';
  }

  static String datePublished(DateTime dateTime) {
    final formatter = DateFormat('yMMMMd');
    return formatter.format(dateTime);
  }

}
