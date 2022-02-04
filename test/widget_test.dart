// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:task_app/controller/controller.dart';

void main() {
  InfoImageService repository;

  test('main', () async {
    String id = '0';

    final response = await InfoImageService().fetchInfo(id: id);
    ImageModel imageModel =
        ImageModel.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));

    debugPrint(imageModel.toJson().toString());
    expect(response.statusCode.toString(), '200');
  });
}
