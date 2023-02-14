class SignupFormModel {
  final String? name;
  final String? email;
  final String? password;
  final String? pin;
  final String? profilePicture;
  final String? ktp;

  // Constuctor
  SignupFormModel({
    this.name,
    this.email,
    this.password,
    this.pin,
    this.profilePicture,
    this.ktp,
  });

  // funtion to json || ubah to json
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'pin': pin,
      'profile_picture': profilePicture,
      'ktp': ktp,
    };
  }

  // function copy with data lama ttap dipake
  SignupFormModel copyWith({
    String? pin,
    String? profilePicture,
    String? ktp,
  }) =>
      SignupFormModel(
        name: name,
        email: email,
        password: password,
        pin: pin ?? this.pin,
        profilePicture: profilePicture ?? this.profilePicture,
        ktp: ktp ?? this.ktp,
      );
}
