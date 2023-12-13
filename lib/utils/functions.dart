import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:jiffy/jiffy.dart';
import 'package:montra_app_a1/modules/home/presentation/bloc/recent_transaction/recent_transaction_bloc.dart';

Future<String?> getId() async {
  var deviceInfo = DeviceInfoPlugin();
  if (Platform.isIOS) {
    // import 'dart:io'
    var iosDeviceInfo = await deviceInfo.iosInfo;
    return iosDeviceInfo.identifierForVendor; // unique ID on iOS
  } else if (Platform.isAndroid) {
    var androidDeviceInfo = await deviceInfo.androidInfo;
    return androidDeviceInfo.id; // unique ID on Android
  } else {
    return null;
  }
}

String safeParseDate(String date, {String? pattern}) {
  if (date.isNotEmpty) {
    print('not Empty');
    try {
      var dateTime = Jiffy.parse(date, pattern: 'yyyy-MM-dd hh:mm:ss');

      return dateTime.format(pattern: pattern ?? 'hh:mm');
    } catch (e) {
      print(e.toString() + ' dateError');
      return 'no date';
    }
  } else {
    print('empty');
    return 'empty date';
  }
}

calculateDayTitle(RecentTransactionState state, int index,
    {required Function(String) onChange}) {
  var currentDate = safeParseDateDateTime(state.list[index].date);
  if (index > 0 && currentDate != null) {
    var previous = safeParseDateDateTime(state.list[index - 1].date);

    var difference = getDayDifference(currentDate, previous!);
    var nowDifference =
        getDayDifference(currentDate, DateTime.now(), reverseSubstract: true);

    if (nowDifference == 0) {
      if (difference! != 0) {
        onChange('Today');
      }
    } else if (nowDifference == 1) {
      if (difference! != 0) {
        onChange('Yesterday');
      }
    } else {
      if (difference! != 0) {
        onChange(safeParseDate(state.list[index].date, pattern: 'dd.MM.yyyy'));
      } else {}
    }
  } else if (currentDate != null) {
    var nowDifference = getDayDifference(currentDate, DateTime.now());
    if (nowDifference == 0) {
      onChange('Today');
    } else if (nowDifference == 1) {
      onChange('Yesterday');
    } else {
      onChange(safeParseDate(state.list[index].date, pattern: 'dd.MM.yyyy'));
    }
  }
}

DateTime? safeParseDateDateTime(String date, {String? pattern}) {
  if (date.isNotEmpty) {
    print('not Empty');
    try {
      var dateTime = Jiffy.parse(date, pattern: 'yyyy-MM-dd hh:mm:ss');

      return dateTime.dateTime;
    } catch (e) {
      print(e.toString() + ' dateError');
      return null;
    }
  } else {
    print('empty');
    return null;
  }
}

DateTime? safeParseDateNoHh(String date, {String? pattern}) {
  if (date.isNotEmpty) {
    print('not Empty');
    try {
      var dateTime = Jiffy.parse(date, pattern: 'yyyy-MM-dd hh:mm:ss');

      return dateTime.dateTime;
    } catch (e) {
      print(e.toString() + ' dateError');
      return null;
    }
  } else {
    print('empty');
    return null;
  }
}

int? getDayDifference(DateTime current, DateTime previous,
    {bool reverseSubstract = false}) {
  if (reverseSubstract) {
    return previous.day - current.day;
  } else {
    return current.day - previous.day;
  }
}
