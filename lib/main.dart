import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebese_auth/screens/login.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: LoginScreen());
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

String userEmail = '';
String userNAme = '';
String photoUrl = '';
String id = '';
String idToken = '';
String accessToken = '';

class _MyHomePageState extends State<MyHomePage> {
  // String userEmail = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Authencation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 20),
              child: Column(
                children: [
                  Text(userEmail),
                  SizedBox(
                    height: 10,
                  ),
                  Text(userNAme),
                  SizedBox(
                    height: 10,
                  ),
                  Image.network(
                    photoUrl != ""
                        ? photoUrl
                        : "https://www.gstatic.com/mobilesdk/160503_mobilesdk/logo/2x/firebase_28dp.png",
                    scale: 1,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    id,
                    style: TextStyle(color: Colors.amber),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    idToken,
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    accessToken,
                    style: TextStyle(color: Colors.blue),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  signInWithGoogle();
                  print(userEmail);
                  setState(() {});
                },
                child: Text("login")),
            ElevatedButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  userEmail = '';
                  userNAme = '';
                  photoUrl = '';
                  id = '';
                  idToken = '';
                  accessToken = '';
                  await GoogleSignIn().signOut();
                  setState(() {});
                },
                child: Text("logout"))
          ],
        ),
      ),
    );
  }
}

Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );
  userEmail = googleUser!.displayName;
  userNAme = googleUser.email;
  photoUrl = googleUser.photoUrl;
  id = googleUser.id;
  idToken = googleAuth!.idToken;
  accessToken = googleAuth.accessToken;

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}
