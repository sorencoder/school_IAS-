class UserModel {
  int? userId;
  int? id;
  String? email;
  String? password;
  String? phoneNo;
  String? aadharNo;
  String? address;
  String? updatedOn;
  String? createdOn;

  UserModel(
      {this.userId,
      this.id,
      this.email,
      this.password,
      this.phoneNo,
      this.aadharNo,
      this.address,
      this.updatedOn,
      this.createdOn});

  UserModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    email = json['email'];
    password = json['password'];
    phoneNo = json['phoneNo'];
    aadharNo = json['aadharNo'];
    address = json['address'];
    updatedOn = json['updatedOn'];
    createdOn = json['createdOn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['id'] = id;
    data['email'] = email;
    data['password'] = password;
    data['phoneNo'] = phoneNo;
    data['aadharNo'] = aadharNo;
    data['address'] = address;
    data['updatedOn'] = updatedOn;
    data['createdOn'] = createdOn;
    return data;
  }
}
