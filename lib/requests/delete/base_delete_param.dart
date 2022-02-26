import 'dart:convert';

class DeleteParams {
  int id;
  bool? force;
  DeleteParams({
    required this.id,
    this.force,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'force': force ?? false,
    };
  }

  factory DeleteParams.fromMap(Map<String, dynamic> map) {
    return DeleteParams(
      id: map['id']?.toInt() ?? 0,
      force: map['force'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DeleteParams.fromJson(String source) =>
      DeleteParams.fromMap(json.decode(source));
}
