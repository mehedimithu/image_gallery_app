import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:task_app/core/core.dart';

class InfoImageService {
  static const fetchLimit = 100;

  Future fetchInfo({required String id}) async {
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    var uri = Uri.parse("${AllApis.getInfoAboutImagesUrl}$id/info");
    try {
      final response = await http.get(uri, headers: headers);
      debugPrint('Response: ' + response.body.toString());
      return response;
    } catch (err) {
      debugPrint(err.toString());
    }
  }
}
