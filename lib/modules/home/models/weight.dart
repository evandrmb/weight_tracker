import 'dart:convert';

import 'package:dartz/dartz.dart';

class Weight {
  final double weight;
  Weight({
    this.weight,
  });

  Weight._(this.weight);

  Weight copyWith({
    double weight,
  }) {
    return Weight(
      weight: weight ?? this.weight,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'weight': weight,
    };
  }

  factory Weight.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Weight(
      weight: map['weight'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Weight.fromJson(String source) => Weight.fromMap(json.decode(source));

  @override
  String toString() => 'Weight(weight: $weight)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Weight && o.weight == weight;
  }

  @override
  int get hashCode => weight.hashCode;
}

Option<Weight> createWeight(double value) =>
    value > 600 ? None() : Some(Weight._(value));
