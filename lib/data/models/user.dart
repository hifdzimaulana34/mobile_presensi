class User {
  User({
    required this.id,
    required this.nip,
    required this.categoryId,
    required this.name,
    required this.phone,
    required this.email,
    this.dateOfBirth,
    this.photo,
    required this.gender,
    this.emailVerifiedAt,
    this.twoFactorSecret,
    this.twoFactorRecoveryCodes,
    this.twoFactorConfirmedAt,
    required this.createdAt,
    required this.updatedAt,
  });
  int id;
  String nip;
  int categoryId;
  String name;
  String phone;
  String email;
  String? dateOfBirth;
  dynamic photo;
  String gender;
  dynamic emailVerifiedAt;
  dynamic twoFactorSecret;
  dynamic twoFactorRecoveryCodes;
  dynamic twoFactorConfirmedAt;
  String createdAt;
  String updatedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        nip: json['nip'],
        categoryId: json['category_id'],
        name: json['name'],
        phone: json['phone'],
        email: json['email'],
        dateOfBirth: json['date_of_birth'],
        photo: json['photo'],
        gender: json['gender'],
        emailVerifiedAt: json['email_verified_at'],
        twoFactorSecret: json['two_factor_secret'],
        twoFactorRecoveryCodes: json['two_factor_recovery_codes'],
        twoFactorConfirmedAt: json['two_factor_confirmed_at'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nip": nip,
        "category_id": categoryId,
        "name": name,
        "phone": phone,
        "email": email,
        "date_of_birth": dateOfBirth,
        "photo": photo,
        "gender": gender,
        "email_verified_at": emailVerifiedAt,
        "two_factor_secret": twoFactorSecret,
        "two_factor_recovery_codes": twoFactorRecoveryCodes,
        "two_factor_confirmed_at": twoFactorConfirmedAt,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
  User.empty()
      : id = 0,
        nip = '',
        categoryId = 0,
        email = '',
        phone = '',
        name = '',
        dateOfBirth = null,
        photo = null,
        gender = '',
        emailVerifiedAt = null,
        twoFactorSecret = null,
        twoFactorRecoveryCodes = null,
        twoFactorConfirmedAt = null,
        createdAt = '',
        updatedAt = '';
}
