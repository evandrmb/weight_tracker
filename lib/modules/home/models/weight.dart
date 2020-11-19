import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

class Weight {
  final double value;

  Weight._({@required this.value});

  Map<String, dynamic> toMap() {
    return {
      'weight': value,
    };
  }

  factory Weight.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Weight._(
      value: map['weight'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Weight.fromJson(String source) => Weight.fromMap(json.decode(source));

  @override
  String toString() => 'Weight(weight: $value)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Weight && o.value == value;
  }

  @override
  int get hashCode => value.hashCode;
}

Option<Weight> createWeight(double value) =>
    value > 600 ? None() : Some(Weight._(value: value));
