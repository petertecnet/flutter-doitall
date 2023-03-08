class User {
  final String? token;
  final int? id;
  final int? status;
  final int? role;

  late String? name;
  late String? email;
  late String? phone;
  late String? cpf;

  late String? address;
  late String? city;
  late String? uf;
  late String? cep;
  late String? forgotpasswordcode;
  late String? temporaryemail;
  late String? lastemail;

  late String? password;

  final String? emailVerifiedAt;
  final String? twoFactorSecret;
  final String? twoFactorRecoveryCodes;
  final DateTime? twoFactorConfirmedAt;
  final String? uid;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic deletedAt;

  User({
    this.id,
    this.status,
    this.role,
    this.name,
    this.email,
    this.password,
    this.phone,
    this.cpf,
    this.token,
    this.address,
    this.city,
    this.uf,
    this.cep,
    this.temporaryemail,
    this.emailVerifiedAt,
    this.twoFactorSecret,
    this.twoFactorRecoveryCodes,
    this.twoFactorConfirmedAt,
    this.uid,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    final userJson = json['user'] as Map<String, dynamic>?;

    return User(
      id: userJson?['id'],
      status: userJson?['status'],
      role: userJson?['role'],
      name: userJson?['name'],
      phone: userJson?['phone'],
      cpf: userJson?['cpf'],
      address: userJson?['address'],
      city: userJson?['city'],
      uf: userJson?['uf'],
      email: userJson?['email'],
      password: userJson?['password'],
      temporaryemail: userJson?['temporaryemail'],
      emailVerifiedAt: userJson?['email_verified_at'],
      twoFactorSecret: userJson?['two_factor_secret'],
      twoFactorRecoveryCodes: userJson?['two_factor_recovery_codes'],
      twoFactorConfirmedAt: userJson?['two_factor_confirmed_at'] == null
          ? null
          : DateTime.parse(userJson!['two_factor_confirmed_at']),
      uid: userJson?['uid'],
      createdAt: userJson?['created_at'] == null
          ? null
          : DateTime.parse(userJson!['created_at']),
      updatedAt: userJson?['updated_at'] == null
          ? null
          : DateTime.parse(userJson!['updated_at']),
      deletedAt: userJson?['deleted_at'],
      token: json['token'],
    );
  }
}
