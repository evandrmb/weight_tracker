import 'dart:convert';

import 'weight.dart';

class WeightRegister {
  final Weight weight;
  final DateTime weightDate;
  final DateTime createdAt;
  final DateTime updatedAt;

  WeightRegister(
    this.weight,
    this.weightDate,
    this.createdAt,
    this.updatedAt,
  );

  WeightRegister copyWith({
    Weight weight,
    DateTime createdAt,
    DateTime updatedAt,
  }) {
    return WeightRegister(
      weight ?? this.weight,
      weightDate ?? weightDate,
      createdAt ?? this.createdAt,
      updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'weight': weight.value,
      'weightDate': weightDate.millisecondsSinceEpoch,
      'created_at': createdAt?.millisecondsSinceEpoch,
      'updated_at': updatedAt?.millisecondsSinceEpoch,
    };
  }

  factory WeightRegister.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return WeightRegister(
      Weight.fromMap(map['weight']),
      DateTime.fromMillisecondsSinceEpoch(map['weightDate']),
      DateTime.fromMillisecondsSinceEpoch(map['created_at']),
      DateTime.fromMillisecondsSinceEpoch(map['updated_at']),
    );
  }

  String toJson() => json.encode(toMap());

  factory WeightRegister.fromJson(String source) =>
      WeightRegister.fromMap(json.decode(source));

  @override
  String toString() =>
      'WeightRegister(weight: $weight, createdAt: $createdAt, updatedAt: $updatedAt)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is WeightRegister &&
        o.weight == weight &&
        o.createdAt == createdAt &&
        o.updatedAt == updatedAt;
  }

  @override
  int get hashCode => weight.hashCode ^ createdAt.hashCode ^ updatedAt.hashCode;
}
