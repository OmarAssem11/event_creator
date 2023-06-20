class RegisterDataModel {
  final String name;
  final String emailAddress;
  final String password;
  final String phoneNumber;
  final String gender;

  const RegisterDataModel({
    required this.name,
    required this.emailAddress,
    required this.password,
    required this.phoneNumber,
    required this.gender,
  });

  Map<String, dynamic> toJson() => {
        'USERNAME': name,
        'Email': emailAddress,
        'PASSWORD': password,
        'CPASSWORD': password,
        'PHONE': phoneNumber,
        'GENDER': gender,
      };
}
