class OTPResponse {
    String message;
    int status;

    OTPResponse({this.message, this.status});

    factory OTPResponse.fromJson(Map<String, dynamic> json) {
        return OTPResponse(
            message: json['message'],
            status: json['status'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['message'] = this.message;
        data['status'] = this.status;
        return data;
    }
}