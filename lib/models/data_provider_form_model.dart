class DataProviderFormModel {
  final int? dataProviderId;
  final String? phoneNumber;
  final String? pin;

  // conmstuctor
  DataProviderFormModel({
    this.dataProviderId,
    this.phoneNumber,
    this.pin,
  });

  // funtion to json || ubah to json
  Map<String, dynamic> toJson() {
    return {
      'data_plan_id': dataProviderId.toString(),
      'phone_number': phoneNumber,
      'pin': pin,
    };
  }
}
