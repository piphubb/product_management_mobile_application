/// phoneNumber : "0885133777"
/// password : "123456"

class LoginReq {
  LoginReq({
      String phoneNumber, 
      String password,}){
    _phoneNumber = phoneNumber;
    _password = password;
}

  LoginReq.fromJson(dynamic json) {
    _phoneNumber = json['phoneNumber'];
    _password = json['password'];
  }
  String _phoneNumber;
  String _password;
LoginReq copyWith({  String phoneNumber,
  String password,
}) => LoginReq(  phoneNumber: phoneNumber ?? _phoneNumber,
  password: password ?? _password,
);
  String get phoneNumber => _phoneNumber;
  String get password => _password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['phoneNumber'] = _phoneNumber;
    map['password'] = _password;
    return map;
  }

}