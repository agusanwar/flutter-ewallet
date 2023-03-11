import 'dart:convert';

import 'package:aipay/models/payment_method_model.dart';
import 'package:aipay/services/auth_services.dart';
import 'package:aipay/shared/shared_values.dart';
import 'package:http/http.dart' as http;

class PaymentMethodService {
  Future<List<PaymentMethodModel>> getPaymentMethods() async {
    try {
      final token = await AuthServices().getToken();

      final res = await http.get(
        Uri.parse('$baseUrl/payment_methods'),
        headers: {
          'Authorization': token,
        },
      );

      // succes
      if (res.statusCode == 200) {
        return List<PaymentMethodModel>.from(jsonDecode(res.body).map(
                (paymentMethod) => PaymentMethodModel.fromJson(paymentMethod)))
            .toList();
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
