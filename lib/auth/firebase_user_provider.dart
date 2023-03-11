import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class PetsFirebaseUser {
  PetsFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

PetsFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<PetsFirebaseUser> petsFirebaseUserStream() => FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<PetsFirebaseUser>(
      (user) {
        currentUser = PetsFirebaseUser(user);
        return currentUser!;
      },
    );
