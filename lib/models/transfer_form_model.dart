class TransferFormModel {
  final String? amount;
  final String? pin;
  final String? sendTo;

  // Constructor
  TransferFormModel({
    this.amount,
    this.pin,
    this.sendTo,
  });

  // copy with for general use and use old data
  TransferFormModel copyWith({
    String? amount,
    String? pin,
    String? sendTo,
  }) =>
      TransferFormModel(
        amount: amount ?? this.amount,
        pin: pin ?? this.pin,
        sendTo: sendTo ?? this.sendTo,
      );

  // Function / method udpate to json
  Map<String, dynamic> toJson() => {
        'amount': amount,
        'pin': pin,
        'send_to': sendTo,
      };
}
