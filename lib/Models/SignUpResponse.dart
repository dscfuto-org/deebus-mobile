/// _id : "5e729fddc0e0700004276a10"
/// firstName : "odii"
/// lastName : "Marshall"
/// email : "Chibuezeodii@gmail.com"

class SignUpResponse {
  // ignore: non_constant_identifier_names
  String _Id;
  String _firstName;
  String _lastName;
  String _email;

  // ignore: non_constant_identifier_names
  String get Id => _Id;
  String get firstName => _firstName;
  String get lastName => _lastName;
  String get email => _email;

  SignUpResponse(this._Id, this._firstName, this._lastName, this._email);

  SignUpResponse.map(dynamic obj) {
    this._Id = obj["Id"];
    this._firstName = obj["firstName"];
    this._lastName = obj["lastName"];
    this._email = obj["email"];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["Id"] = _Id;
    map["firstName"] = _firstName;
    map["lastName"] = _lastName;
    map["email"] = _email;
    return map;
  }

}