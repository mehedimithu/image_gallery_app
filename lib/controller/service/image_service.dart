import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:task_app/core/core.dart';

class ImageService {
  static const fetchLimit = 15;

  Future<List<dynamic>?> fetchImages({required int page}) async {
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    var uri = Uri.parse("${AllApis.listOfImagesUrl}?page=$page&limit=$fetchLimit");
    try {
      final response = await http.get(uri, headers: headers);
      debugPrint('Response: ' + response.body.toString());
      return jsonDecode( utf8.decode(response.bodyBytes)) as List<dynamic>;

    } catch (err) {
      return [];
    }
  }
}
