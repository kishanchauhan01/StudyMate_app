class InstituteModel {
  String id;
  String instituteName;
  String instituteEmail;
  String instituteAddress;
  String instituteCode;

  InstituteModel({
    this.id = "",
    this.instituteName = "",
    this.instituteEmail = "",
    this.instituteAddress = "",
    this.instituteCode = "",
  });

  factory InstituteModel.fromJson(Map<String, dynamic> json) {
    return InstituteModel(
      id: json["_id"] ?? "",
      instituteName: json["name"] ?? "",
      instituteEmail: json["email"] ?? "",
      instituteAddress: json["address"] ?? "",
      instituteCode: json["code"] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "name": instituteName,
      "email": instituteEmail,
      "address": instituteAddress,
      "code": instituteCode,
    };
  }
}
