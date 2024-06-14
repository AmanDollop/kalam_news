import 'package:intl/intl.dart';

class CMForDateTime {

  static String dateFormatForDateMonthYearHourMinSec({required String dateAndTime}) {
    return DateFormat('dd MMM yyyy h:mm a').format(DateTime.parse(dateAndTime)); ///Todo Output: 27 Mar 2024 1:45 PM
  }

  static String dateFormatForDateMonthYear({required String date}) {
    return DateFormat('dd MMM yyyy').format(DateTime.parse(date)); ///Todo output => 03 Feb 2002
  }

  static String timeFormatForHourMinuetAmPm({required String dateAndTime}) {
    return DateFormat('hh:mm a').format(DateTime.parse(dateAndTime)); ///Todo output => 05:40 PM
  }

  static String dateTimeFormatForApi({required String dateTime,bool dayNameValue = false}) {
    String formattedTime;
    if(dayNameValue){
      formattedTime = DateFormat('yyyy-MM-dd').format(DateFormat('EEEE, dd MMM yyyy').parse(dateTime));
    }else {
      formattedTime = DateFormat('yyyy-MM-dd').format(DateFormat('d MMM y').parse(dateTime));
    }
    return formattedTime;
  }

  static String getMonthAbbreviation({required String month}) {
    switch (month) {
      case 'January':
        return 'Jan';
      case 'February':
        return 'Feb';
      case 'March':
        return 'Mar';
      case 'April':
        return 'Apr';
      case 'May':
        return 'May';
      case 'June':
        return 'Jun';
      case 'July':
        return 'Jul';
      case 'August':
        return 'Aug';
      case 'September':
        return 'Sep';
      case 'October':
        return 'Oct';
      case 'November':
        return 'Nov';
      case 'December':
        return 'Dec';
      default:
        return '';
    }
  }

  static String getFormattedDay({required int day}) {
    if (day >= 11 && day <= 13) {
      return '$day' 'th';
    }
    switch (day % 10) {
      case 1:
        return '$day' 'st';
      case 2:
        return '$day' 'nd';
      case 3:
        return '$day' 'rd';
      default:
        return '$day' 'th';
    }
}

  static int monthToNumber({required String month}) {
    switch (month) {
      case "January":
        return 1;
      case "February":
        return 2;
      case "March":
        return 3;
      case "April":
        return 4;
      case "May":
        return 5;
      case "June":
        return 6;
      case "July":
        return 7;
      case "August":
        return 8;
      case "September":
        return 9;
      case "October":
        return 10;
      case "November":
        return 11;
      case "December":
        return 12;
      default:
        return 1; // Default to January if month name is unrecognized
    }
  }

}
