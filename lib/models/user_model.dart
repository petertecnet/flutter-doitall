class User {
  final String? token;
  final int? id;
  final int? status;
  final int? role;

  late final String? name;
  late final String? email;
  late final String? phone;
  late final String? cpf;

  late final String? address;
  late final String? city;
  late final String? uf;
  late final String? cep;
  late final String? forgotpasswordcode;
  late final String? temporaryemail;
  late final String? lastemail;

  late final String? password;

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
    return User(
      id: json['user']['id'],
      status: json['user']['status'],
      role: json['user']['role'],
      name: json['user']['name'],
      phone: json['user']['phone'],
      cpf: json['user']['cpf'],
      address: json['user']['address'],
      city: json['user']['city'],
      uf: json['user']['uf'],
      email: json['user']['email'],
      password: json['user']['password'],
      temporaryemail: json['user']['temporaryemail'],
      emailVerifiedAt: json['user']['email_verified_at'],
      twoFactorSecret: json['user']['two_factor_secret'],
      twoFactorRecoveryCodes: json['user']['two_factor_recovery_codes'],
      twoFactorConfirmedAt: json['user']['two_factor_confirmed_at'] == null
          ? null
          : DateTime.parse(json['user']['two_factor_confirmed_at']),
      uid: json['user']['uid'],
      createdAt: DateTime.parse(json['user']['created_at']),
      updatedAt: DateTime.parse(json['user']['updated_at']),
      deletedAt: json['user']['deleted_at'],
      token: json['token'],
    );
  }
}
