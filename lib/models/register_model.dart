class RegisterModel {
  String? firstName;
  String? lastName;
  String? username;
  String? password;
  String? telephone;
  String? profileImage;
  String? address;
  String? city;
  String? province;
  String? country;

  RegisterModel({
    this.firstName,
    this.lastName,
    this.username,
    this.password,
    this.telephone,
    this.profileImage,
    this.address,
    this.city,
    this.province,
    this.country,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        firstName: json['first_name'],
        lastName: json['last_name'],
        username: json['username'],
        password: json['password'],
        telephone: json['telephone'],
        profileImage: json['profile_image'],
        address: json['address'],
        city: json['city'],
        province: json['province'],
        country: json['country'],
      );

  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'username': username,
      'password': password,
      'telephone': telephone,
      'profile_image': profileImage,
      'address': address,
      'city': city,
      'province': province,
      'country': country,
    };
  }
}
