import 'dart:async';

class AppPresenter {
  var inputsAdded = 0;

  final firebaseInitializedStream = StreamController();

  Sink get input => firebaseInitializedStream.sink;
  Stream get output => firebaseInitializedStream.stream;

  void changeFirebaseInitializedStream(bool _value) {
    input.add(_value);
    inputsAdded++;
  }

  void closeFirebaseInitializedStream() => firebaseInitializedStream.close();
}
