import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class ArunSawadFirebaseUser {
  ArunSawadFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

ArunSawadFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<ArunSawadFirebaseUser> arunSawadFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<ArunSawadFirebaseUser>(
      (user) {
        currentUser = ArunSawadFirebaseUser(user);
        return currentUser!;
      },
    );
