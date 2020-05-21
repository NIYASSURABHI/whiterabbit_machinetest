import 'dart:convert';

List<Employee> employeeFromJson(String str) =>
    List<Employee>.from(json.decode(str).map((x) => Employee.fromJson(x)));

String employeeToJson(List<Employee> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Employee {
  int id;
  String email;
  String firstName;
  String userName;
  String companyName;
  String address;
  String phone;
  String website;
  String company;
  String avatar;

  Employee(
      {this.id,
      this.email,
      this.firstName,
      this.userName,
      this.companyName,
      this.avatar,
      this.address,
      this.phone,
      this.website,
      this.company});

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
        id: json["id"],
        email: json["email"],
        firstName: json["name"],
        userName: json["username"],
        avatar: json["profile_image"],
        companyName: json["name"],
        address: json["name"],
        phone: json["phone"],
        website: json["website"],
        company: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "firstName": firstName,
        "userName": userName,
        "companyName": companyName,
        "address": address,
        "phone": phone,
        "website": website,
        "company": company,
        "avatar": avatar,
      };
}
