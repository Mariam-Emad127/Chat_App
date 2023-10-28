import 'package:flutter/material.dart';
import '../helper/show_snack_bar.dart';
import '../widget/Custom_button.dart';
import '../widget/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'chat_page.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  String id = " RegisterPage";


  @override

  State<RegisterPage> createState() => _RegisterPageState();}

class _RegisterPageState extends State<RegisterPage> {
  String? email;

  String? password;
  bool isloading = false;
  GlobalKey<FormState>formKey = GlobalKey();

  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        backgroundColor: Color(0xff2B475E),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          //child: ListView(
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                const SizedBox(
                  height: 100,
                ),
                Image.asset(
                  "assets/images/scholar.png",
                  height: 100,
                ),
                Text(
                  "Scholar Chat",
                  style: (TextStyle(
                      fontSize: 30,
                      fontFamily: "Pacifico",
                      color: Colors.white)),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Row(
                  children: [
                    Text(
                      "REGISTER",
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  hintText: "Email",
                  onChanged: (data) {
                    email = data;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    obscureText: true,

                    hintText: "Password",
                    onChanged: (data) {
                      password = data;
                    }),
                const SizedBox(
                  height: 10,
                ),
                CustomButon(
                  text: "Register",
                  onTab: () async {
                    // var auth=FirebaseAuth.instance;
                    if (formKey.currentState!.validate()) {
                      isloading = true;
                      setState(() {});
                      try {
                        UserCredential user = await registerUser();
                      //  showSnackBar(context, " success");
                        Navigator.pushNamed(context, ChatPage.id);
                        // print(user.user!.displayName);
                      } on FirebaseAuthException catch (ex) {
                        if (ex.code == 'weak-password') {
                          showSnackBar(context, "weak password");
                        } else if (ex.code == 'email-already-in-use') {
                          showSnackBar(context, 'email already exists');
                          //SnackBar(content, 'email already exists');
                        }
                      } catch (ex) {
                        showSnackBar(context, " 'there was an error'");
                      }
                      isloading = false;
                      setState(() {});
                    } else {}
                  },


                ),
                const SizedBox(height: 10),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    'already have an account?',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context, "Loginpage");
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Color(0xffC7EDE6),
                      ),
                    ),
                  ),
                ]),
              ],
            ),
          ),
        ),
        //),
      ),
    );
  }



  Future<UserCredential> registerUser() async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
    return user;
  }

}
