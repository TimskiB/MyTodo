import 'dart:io';

import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_path/json_path.dart';

import 'package:timeago/timeago.dart' as timeago;
import 'package:intl/intl.dart';

String dateTimeFormat(String format, DateTime dateTime) {
  if (format == 'relative') {
    return timeago.format(dateTime);
  }
  return DateFormat(format).format(dateTime);
}

Future launchURL(String url) async {
  var uri = Uri.parse(url).toString();
  if (await canLaunch(uri)) {
    await launch(uri);
  } else {
    throw 'Could not launch $uri';
  }
}

Timestamp get getCurrentTimestamp => Timestamp.fromDate(DateTime.now());

dynamic getJsonField(dynamic response, String jsonPath) {
  final field = JsonPath(jsonPath).read(response);
  return field.isNotEmpty ? field.first.value : null;
}

bool get isIos => Platform.isIOS;
