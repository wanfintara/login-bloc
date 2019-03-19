import 'dart:async';
import 'validators.dart';
import 'package:rxdart/rxdart.dart';

// class Bloc with Validators {
class Bloc extends Object with Validators {
  // ! Make Stream can access multiple
  final _email = StreamController<String>.broadcast();
  final _password = StreamController<String>.broadcast();

  // Add data to stream
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);

  Stream<bool> get submitValid => Observable.combineLatest2(
      email, password, (String vEmail, String vPassword) => true);

  // Change data
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  // Need to close sink when done with it
  void dispose() {
    _email.close();
    _password.close();
  }
}

/// *This only for global scoped bloc approach
// final bloc = Bloc();
