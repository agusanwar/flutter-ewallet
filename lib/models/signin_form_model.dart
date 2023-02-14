class SignInFormModel {
  final String? email;
  final String? password;

  // constuctor
  SignInFormModel({
    this.email,
    this.password,
  });

  // funtion to json || ubah to json
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}
