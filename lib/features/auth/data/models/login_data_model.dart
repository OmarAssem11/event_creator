class LoginDataModel {
  final String emailAddress;
  final String password;

  const LoginDataModel({
    required this.emailAddress,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
        'Email': emailAddress,
        'PASSWORD': password,
      };
}
