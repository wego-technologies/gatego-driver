import 'dart:convert';

class HttpException implements Exception {
  final String msg;

  HttpException(
    this.msg,
  );

  @override
  String toString() => 'HttpException(msg: $msg)';

  HttpException copyWith({
    String? msg,
  }) {
    return HttpException(
      msg ?? this.msg,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'msg': msg,
    };
  }

  factory HttpException.fromMap(Map<String, dynamic> map) {
    return HttpException(
      map['msg'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory HttpException.fromJson(String source) =>
      HttpException.fromMap(json.decode(source));

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is HttpException && other.msg == msg;
  }

  @override
  int get hashCode => msg.hashCode;
}
