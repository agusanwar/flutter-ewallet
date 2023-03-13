import 'dart:convert';

import 'package:aipay/models/operator_card_model.dart';
import 'package:aipay/services/auth_services.dart';
import 'package:aipay/shared/shared_values.dart';
import 'package:http/http.dart' as http;

class ProviderServices {
  Future<List<OperatorCardModel>> getOperatorCards() async {
    try {
      // get / cek token bearer
      final token = await AuthServices().getToken();

      // get url for backend
      final res = await http.get(
        Uri.parse('$baseUrl/operator_cards'),
        headers: {
          'Authorization': token,
        },
      );
      // cek kondisi 200
      if (res.statusCode == 200) {
        return List<OperatorCardModel>.from(
          jsonDecode(res.body)['data'].map(
            (operatorCard) => OperatorCardModel.fromJson(operatorCard),
          ),
        ).toList();
      }
      // jika kondisi bukan res 200 / error
      return jsonDecode(res.body)['message'];
    } catch (e) {
      rethrow;
    }
  }
}
