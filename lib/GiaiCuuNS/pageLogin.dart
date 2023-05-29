import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ngoctruong/GiaiCuuNS/pageGiaiCuuNS.dart';
import '../firebase/authentication/pageLogin.dart';
import '../firebase/firebase_widget.dart';

class GCNSLogin extends StatelessWidget {
  const GCNSLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WidgetConnectFirebase(
      builder: (context) => pageGCNSLogin(),
      connectingMessage: "Đang kết nối",
      errorMessage: "Lỗi",
    );
  }
}
class pageGCNSLogin extends StatefulWidget {
  const pageGCNSLogin({Key? key}) : super(key: key);

  @override
  State<pageGCNSLogin> createState() => _pageGCNSLoginState();
}

class _pageGCNSLoginState extends State<pageGCNSLogin> {
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
            SizedBox(height: 50,),
            Text("GIẢI CỨU NÔNG SẢN", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
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
                  var user = await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: EmailEditingController.text,
                      password: passwordEditingController.text);
                  if(user != null) {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => pageGiaiCuuNongSan(),));
                  }
                },
                child: Text("Đăng nhập")
            ),
          ],
        ),
      ),
    );
  }
}
