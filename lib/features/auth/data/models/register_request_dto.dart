class RegisterRequest {
  String firstName;
  String lastName;
  String email;
  String phone;
  int role;
  String? profileImageUrl;
  String password;

  RegisterRequest({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.role,
    this.profileImageUrl,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phone': phone,
      'role': role,
      'profileImageUrl': profileImageUrl,
      'password': password,
    };
  }
}
