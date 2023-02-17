class User {
  final String? token;
  final int id;
  final int status;
  final int role;
  final String name;
  final String phone;
  final String cpf;
  final String? address;
  final String? city;
  final String? uf;
  final String email;
  final DateTime? emailVerifiedAt;
  final String? twoFactorSecret;
  final String? twoFactorRecoveryCodes;
  final DateTime? twoFactorConfirmedAt;
  final String? uid;
  final DateTime createdAt;
  final DateTime updatedAt;
  final dynamic deletedAt;

  User({
    required this.id,
    required this.status,
    required this.role,
    required this.name,
    required this.phone,
    required this.cpf,
    this.token,
    this.address,
    this.city,
    this.uf,
    required this.email,
    this.emailVerifiedAt,
    this.twoFactorSecret,
    this.twoFactorRecoveryCodes,
    this.twoFactorConfirmedAt,
    this.uid,
    required this.createdAt,
    required this.updatedAt,
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
      emailVerifiedAt: json['user']['email_verified_at'] == null
          ? null
          : DateTime.parse(json['user']['email_verified_at']),
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
