import 'setting.dart';

class Profile {
  String userId;
  String username;
  String token;
  Setting setting;

  Profile({ this.userId, this.username, this.token, this.setting });

  Profile.fromJson(json) {
    userId = json['userId'];
    username = json['username'];
    token = json['token'];
    setting = Setting.fromJson(json['setting']);
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'userId': userId,
      'username': username,
      'token': token,
      'setting': setting.toJson()
    };
  }
}