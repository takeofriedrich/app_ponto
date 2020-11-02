import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User> getGoogleLogin() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final User user = (await _auth.signInWithCredential(credential)).user;

    await saveUser(user);
    return user;
  }

  Future<User> getUser() async {
    return _auth.currentUser;
  }

  Future getLogout() {
    return _auth.signOut();
  }

  Future saveUser(User fUser) async {
    if (fUser != null) {
      String id = fUser.uid;

      final doc =
          await FirebaseFirestore.instance.collection('users').doc(fUser.email);

      final docAts = FirebaseFirestore.instance
          .collection('atendimentos')
          .doc(fUser.email);

      final docAlu =
          FirebaseFirestore.instance.collection('alunos').doc(fUser.email);

      if ((await doc.get()).exists == false) {
        doc.set(
          {
            'nome': '',
            'disciplina': '',
            'orientador': '',
            'photo': fUser.photoURL,
          },
        );
      }

      if ((await docAts.get()).exists == false) {
        docAts.set({});
      }

      if ((await docAlu.get()).exists == false) {
        docAlu.set({});
      }
    }
  }
}
