import 'package:flutter/material.dart';
import 'package:weight_tracker/modules/auth/domain/entities/user.dart';

class UserNotifier extends ValueNotifier<User> {
  UserNotifier(User value) : super(value);

  void changeUser(User _value) => this.value = _value;
}
