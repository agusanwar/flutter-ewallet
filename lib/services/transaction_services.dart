import 'dart:convert';

import 'package:aipay/models/data_provider_form_model.dart';
import 'package:aipay/models/topup_form_model.dart';
import 'package:aipay/models/transaction_model.dart';
import 'package:aipay/models/transfer_form_model.dart';
import 'package:aipay/services/auth_services.dart';
import 'package:http/http.dart' as http;
import '../shared/shared_values.dart';

class TransactionServices {
  // top up
  Future<String> topUp(TopUpFormModel data) async {
    try {
      // get token from access
      final token = await AuthServices().getToken();

      final res = await http.post(
        Uri.parse(
          '$baseUrl/top_ups',
        ),
        body: data.toJson(),
        headers: {
          'Authorization': token,
        },
      );
      if (res.statusCode == 200) {
        return jsonDecode(res.body)['redirect_url'];
      }
      throw jsonDecode(res.body)['message'];
    } catch (e) {
      rethrow;
    }
  }

  // transfer
  Future<void> transfer(TransferFormModel data) async {
    try {
      // get token from access
      final token = await AuthServices().getToken();

      final res = await http.post(
        Uri.parse(
          '$baseUrl/transfers',
        ),
        body: data.toJson(),
        headers: {
          'Authorization': token,
        },
      );
      if (res.statusCode != 200) {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  // Transaksi paket data
  Future<void> dataProvider(DataProviderFormModel data) async {
    try {
      // get token from access
      final token = await AuthServices().getToken();

      // get url API
      final res = await http.post(
        Uri.parse(
          '$baseUrl/data_plans',
        ),
        body: data.toJson(),
        headers: {
          'Authorization': token,
        },
      );
      if (res.statusCode != 200) {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<TransactionModel>> getTransactions() async {
    try {
      // get token from access
      final token = await AuthServices().getToken();

      // get url API
      // get url API
      final res = await http.get(
        Uri.parse(
          '$baseUrl/transactions',
        ),
        headers: {
          'Authorization': token,
        },
      );
      if (res.statusCode == 200) {
        return List<TransactionModel>.from(
          jsonDecode(res.body)['data'].map(
            (transaction) => TransactionModel.fromJson(transaction),
          ),
        ).toList();
      }
      throw jsonDecode(res.body)['message'];
    } catch (e) {
      rethrow;
    }
  }
}
