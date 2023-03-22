import 'dart:convert';

import 'package:aipay/models/tips_model.dart';
import 'package:aipay/services/auth_services.dart';
import 'package:aipay/shared/shared_values.dart';
import 'package:http/http.dart' as http;

class TipsServices {
  Future<List<TipsModel>> getTips() async {
    try {
      // get token
      final token = await AuthServices().getToken();

      // get url api tips
      final res = await http.get(
        Uri.parse(
          '$baseUrl/tips',
        ),
        headers: {
          'Authorization': token,
        },
      );

      // success
      if (res.statusCode == 200) {
        return List<TipsModel>.from(
          jsonDecode(res.body)['data'].map(
            (tip) => TipsModel.fromJson(tip),
          ),
        ).toList();
      }

      // error
      throw jsonDecode(res.body)['message'];
    } catch (e) {
      rethrow;
    }
  }
}
