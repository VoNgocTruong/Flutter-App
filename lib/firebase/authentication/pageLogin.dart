import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ngoctruong/firebase/firebase_widget.dart';
import 'package:google_sign_in/google_sign_in.dart';
class loginApp extends StatelessWidget {
  const loginApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WidgetConnectFirebase(
      builder: (context) => pageLogin(),
      connectingMessage: "Đang kết nối",
      errorMessage: "Lỗi",
    );
  }
}
class pageLogin extends StatefulWidget {
  const pageLogin({Key? key}) : super(key: key);

  @override
  State<pageLogin> createState() => _pageLoginState();
}

class _pageLoginState extends State<pageLogin> {
  final TextEditingController EmailEditingController = TextEditingController();
  final TextEditingController passwordEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page Login"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: EmailEditingController,
                    decoration: const InputDecoration(
                      labelText: 'Username',
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    controller: passwordEditingController,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
                onPressed: () async{
                  var user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: EmailEditingController.text,
                      password: passwordEditingController.text);
                  if(user != null){
                    showMySnackBar(context, "Tạo thành công User: ${user.user?.email}");
                  }
                },
                child: Text("ĐK bằng Email")
            ),
            ElevatedButton(
                onPressed: () async{
                  var user = await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: EmailEditingController.text,
                      password: passwordEditingController.text);
                  if(user != null) {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => PageHome(),));
                  }
                },
                child: Text("Đăng nhập bằng Email")
            ),
            ElevatedButton(
                onPressed: () async{
                  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
                  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
                  final credential = GoogleAuthProvider.credential(
                    accessToken: googleAuth?.accessToken,
                    idToken: googleAuth?.idToken,
                  );
                },
                child: Text("Đăng nhập bằng Google")
            ),
          ],
        ),
      ),
    );
  }
}

showMySnackBar(BuildContext context, String message){
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(message)),
  );
}

class PageHome extends StatelessWidget {
  const PageHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${FirebaseAuth.instance.currentUser?.toString()}"),
            ElevatedButton(
              onPressed: () async{
                FirebaseAuth.instance.signOut();
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                  builder: (context) => loginApp(),),
                        (route) => false);

              },
              child: Text("Sign out"),
            ),
          ],
        ),
      ),
    );
  }
}
