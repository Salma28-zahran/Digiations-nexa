import 'package:flutter/material.dart';

class TimelineEntry {
  final DateTime dateTime;
  final TextEditingController task;
  final TextEditingController message;
  final TextEditingController project;

  TimelineEntry(this.dateTime)
      : task = TextEditingController(),
        message = TextEditingController(),
        project = TextEditingController();
}
