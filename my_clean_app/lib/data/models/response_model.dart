class ResponseModel {
  dynamic data;
  int? statusCode;
  String? message;

  ResponseModel({
    this.data,
    this.statusCode,
    this.message,
  });

  Map<String, dynamic> toJson() => {
        "data": data ?? false,
        "statusCode": statusCode,
        "message": message,
      };
}
