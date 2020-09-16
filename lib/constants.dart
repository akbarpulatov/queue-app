import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF00AB08);
const kPrimaryLightColor = Color(0x55B7FFBF);

const kSecondaryColor = Color(0xFF000000);
const kSecondaryLightColor = Color(0xFF838383);

const kBackgroundColor = Color(0xFFF9F9EC);
const kBackgroundLightColor = Color(0xfffffef5);

class MyUrls {
  static const historyCreatedList =
      'http://192.168.233.96:3000/history-created';
  static const historyBookedList = 'http://192.168.233.96:3000/history-booked';
  static const queueList = 'http://192.168.233.96:3000/queue-list';
  static const postQueueList = 'http://192.168.233.96:3000/queue-post';
}

class MyColors {
  static const enabled = Colors.lightGreen;
  static const disabled = Colors.black26;
  static const secondaryDarkColor = Colors.black;
  static const secondaryLightColor = Color(0xFF838383);
  static const secondaryColor = Colors.black12;
}

class MyAssets {
  static const check = "assets/icons/check.svg";
  static const rightArrow = "assets/icons/right-arrow.svg";
  static const leftArrow = "assets/icons/left-arrow.svg";
  static const cancel = "assets/icons/cancel.svg";
}
