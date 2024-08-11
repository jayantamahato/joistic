class UserModel {
  String? displayName;
  String? email;
  String? photoURL;
  String? uid;

  UserModel({this.displayName, this.email, this.photoURL, this.uid});

  UserModel.fromJson(Map<String, dynamic> json) {
    displayName = json['displayName'];
    email = json['email'];
    photoURL = json['photoURL'];
    uid = json['uid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['displayName'] = displayName;
    data['email'] = email;
    data['photoURL'] = photoURL;
    data['uid'] = uid;
    return data;
  }
}
