import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:task_app/controller/controller.dart';
import 'package:task_app/core/core.dart';

class InfoImageService {
  static const fetchLimit = 100;

  Future<ImageModel?> fetchInfo({required String id}) async {
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    var uri = Uri.parse("${AllApis.getInfoAboutImagesUrl}$id/info");
    try {
      final response = await http.get(uri, headers: headers);
      debugPrint('Response: ' + response.body.toString());
      ImageModel imageModel = ImageModel.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
      return imageModel;
    } catch (err) {
      debugPrint(err.toString());
    }
  }
}
