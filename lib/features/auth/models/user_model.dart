class UserModel {
  String id;
  String userName;
  String userEmail;
  String institutionId;
  bool isLoggedIn;

  UserModel({
    this.id = "",
    this.userName = "",
    this.userEmail = "",
    this.institutionId = "",
    this.isLoggedIn = false,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["_id"] ?? "",
      userName: json["userName"] ?? "",
      userEmail: json["userEmail"] ?? "",
      institutionId: json["institutionId"] ?? "",
      isLoggedIn: json["isLoggedIn"] ?? false, // FIXED,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "userName": userName,
      "userEmail": userEmail,
      "institutionId": institutionId,
      "isLoggedIn": isLoggedIn,
    };
  }
}
