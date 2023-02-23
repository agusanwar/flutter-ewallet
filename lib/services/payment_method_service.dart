import 'dart:convert';

import 'package:aipay/models/payment_method_model.dart';
import 'package:aipay/services/auth_services.dart';
import 'package:aipay/shared/shared_values.dart';
import 'package:http/http.dart' as http;

class PaymentMethodService {
  Future<List<PaymentMethodModel>> getPaymentMethod() async {
    try {
      final token = await AuthServices().getToken();

      final res = await http.get(
        Uri.parse('$baseUrl/payment_method'),
        headers: {
          'Authorization': token,
        },
      );
      // succes
      if (res.statusCode == 200) {
        return List<PaymentMethodModel>.from(
          jsonDecode(res.body).map(
            (paymentMathod) => PaymentMethodModel.fromJson(paymentMathod),
          ),
        ).toList();
      } else {
        throw jsonDecode(res.body)['mesagge'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
