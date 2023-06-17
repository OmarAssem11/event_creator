class ContactUsDataModel {
  final String name;
  final String emailAddress;
  final String subject;
  final String message;

  const ContactUsDataModel({
    required this.name,
    required this.emailAddress,
    required this.subject,
    required this.message,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': emailAddress,
        'subject': subject,
        'message': message,
      };
}
