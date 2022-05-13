import 'dart:convert';

PortfolioContact contactModelFromJson(String str) =>
    PortfolioContact.fromJson(json.decode(str));

String contactModelToJson(PortfolioContact model) =>
    json.encode(model.toJson());

class PortfolioContact {
  final String name, email, subject, message;
  const PortfolioContact(
      {required this.name,
      required this.email,
      required this.subject,
      required this.message});

  factory PortfolioContact.fromJson(Map<String, dynamic> json) {
    return PortfolioContact(
      name: json["name"],
      email: json["email"],
      subject: json["subject"],
      message: json["message"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "subject": subject,
      "message": message
    };
  }
}
