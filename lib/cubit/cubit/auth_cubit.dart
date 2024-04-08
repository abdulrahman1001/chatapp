import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class registerlogincubit extends Cubit<AuthState> {
  registerlogincubit() : super(AuthInitial());
  login(String email, String password, String name) async {
    emit(AuthLoading());
    try {
      if (name == 'Register') {
        // Attempt to register
        UserCredential user =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        emit(AuthSuccess());
        print('success');
      } else if (name == 'login') {
        // Attempt to login
        final credential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );

        emit(AuthSuccess());
        print('success');
      }
    } on FirebaseAuthException catch (e) {
      // Handle FirebaseAuth exceptions
      String errorMessage = 'An error occurred';
      if (e.code == 'weak-password') {
        errorMessage = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        errorMessage = 'The account already exists for that email.';
      } else if (e.code == 'user-not-found') {
        errorMessage = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Wrong password provided for that user.';
      }
      emit(AuthError(errorMessage));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
