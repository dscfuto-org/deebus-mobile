
class DefaultResponseModel {
    Object data;
    String message;
    int status;

    DefaultResponseModel({this.data, this.message, this.status});

    factory DefaultResponseModel.fromJson(Map<String, dynamic> json) {
        return DefaultResponseModel(
            data: json['data'],
            message: json['message'],
            status: json['status'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['message'] = this.message;
        data['status'] = this.status;
        if (this.data != null) {
            data['data'] = this.data;
        }
        return data;
    }
}
