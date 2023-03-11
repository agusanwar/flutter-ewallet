class TopUpFormModel {
  final String? amount;
  final String? pin;
  final String? paymentMethodCode;

  // Constructor
  TopUpFormModel({
    this.amount,
    this.pin,
    this.paymentMethodCode,
  });

  // copy with for general use and use old data
  TopUpFormModel copyWith({
    String? amount,
    String? pin,
    String? paymentMethodCode,
  }) =>
      TopUpFormModel(
        amount: amount ?? this.amount,
        pin: pin ?? this.pin,
        paymentMethodCode: paymentMethodCode ?? this.paymentMethodCode,
      );

  // Function / method udpate to json
  Map<String, dynamic> toJson() => {
        'amount': amount,
        'pin': pin,
        'payment_method_code': paymentMethodCode,
      };
}
