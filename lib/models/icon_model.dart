import 'dart:convert';

class IconModel {
  int id;
  String title_symbol;
  int file_id;
  String file_name;
  int actual_count;
  IconModel({
    required this.id,
    required this.title_symbol,
    required this.file_id,
    required this.file_name,
    required this.actual_count,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title_symbol': title_symbol,
      'file_id': file_id,
      'file_name': file_name,
      'actual_count': actual_count,
    };
  }

  factory IconModel.fromMap(Map<String, dynamic> map) {
    return IconModel(
      id: map['id']?.toInt() ?? 0,
      title_symbol: map['title_symbol'] ?? '',
      file_id: map['file_id']?.toInt() ?? 0,
      file_name: map['file_name'] ?? '',
      actual_count: map['actual_count']?.toInt() ?? 0,
    );
  }

 

  @override
  String toString() {
    return 'IconModel(id: $id, title_symbol: $title_symbol, file_id: $file_id, file_name: $file_name, actual_count: $actual_count)';
  }
}
