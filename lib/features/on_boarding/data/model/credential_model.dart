class CredentialModel {
  String? accessToken;
  String? token;

  CredentialModel({this.accessToken, this.token});

  CredentialModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['accessToken'] = accessToken;
    data['token'] = token;
    return data;
  }
}
