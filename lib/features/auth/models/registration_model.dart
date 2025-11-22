class RegistrationModel {
  // Institute fields
  String instituteName;
  String instituteEmail;
  String instituteContact;
  String instituteType;
  String instituteAddress;

  // Admin fields
  String adminName;
  String adminEmail;
  String adminPassword;

  // OTP
  String otpRefId;

  RegistrationModel({
    this.instituteName = "",
    this.instituteEmail = "",
    this.instituteContact = "",
    this.instituteType = "",
    this.instituteAddress = "",
    this.adminName = "",
    this.adminEmail = "",
    this.adminPassword = "",
    this.otpRefId = "",
  });

  Map<String, dynamic> toJson() {
    return {
      "institute": {
        "name": instituteName,
        "email": instituteEmail,
        "contact": instituteContact,
        "type": instituteType,
        "address": instituteAddress,
      },
      "admin": {
        "adminName": adminName,
        "adminEmail": adminEmail,
        "adminPassword": adminPassword,
      }
    };
  }
}
