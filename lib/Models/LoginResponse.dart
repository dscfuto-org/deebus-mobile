class LoginResponse {
    String id;
    String email;
    String firstName;
    String lastName;
    String token;

    LoginResponse({this.id, this.email, this.firstName, this.lastName, this.token});

    factory LoginResponse.fromJson(Map<String, dynamic> json) {
        return LoginResponse(
            id: json['_id'],
            email: json['email'],
            firstName: json['firstName'],
            lastName: json['lastName'],
            token: json['token'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['_id'] = this.id;
        data['email'] = this.email;
        data['firstName'] = this.firstName;
        data['lastName'] = this.lastName;
        data['token'] = this.token;
        return data;
    }
}