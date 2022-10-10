import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:maheey_task/constant/app_large_text.dart';
import 'package:maheey_task/view/home.dart';
import 'package:maheey_task/view/signup.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String email;
  late String password;
  bool showSpinner = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool submit = true;
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: height,
        width: width,
        decoration: const BoxDecoration(color: Color(0xffF2F2F3)),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              //all of the login widgets would be here
              children: [
                //first container consisting of logo
                SizedBox(
                  width: 300,
                  height: 300,
                  child: Image.asset('assets/imag/maahey-logo.png'),
                ),

                //login text
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Center(
                        child: AppLargeText(
                            text: "Lets begin", size: 26, color: Colors.black),
                      ),
                    ],
                  ),
                ),

                //email field
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: SizedBox(
                    height: 90.0,
                    width: width - 30,
                    child: TextFormField(
                      controller: emailController,
                      //onSaved: (input) => loginRequestModel.email = input!,
                      cursorColor: Colors.white,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle:
                            const TextStyle(color: Colors.grey, fontSize: 18),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 241, 91, 21),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 241, 91, 21),
                          ),
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 20),
                        prefixIcon: const Icon(
                          Icons.email,
                          color: Color.fromARGB(255, 241, 91, 21),
                        ),
                        filled: true,
                        fillColor: const Color(0xffF2F2F3),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      style: const TextStyle(color: Colors.black),

                      //the validator receive the text that the user has entered
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "please enter some text";
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 15)),
                //password field
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: SizedBox(
                    height: 90,
                    width: width - 30,
                    child: TextFormField(
                      controller: passwordController,
                      //onSaved: (input) => loginRequestModel.password = input!,

                      cursorColor: Color.fromARGB(255, 241, 91, 21),
                      obscureText: obscure,
                      enableSuggestions: false,
                      autocorrect: false,
                      decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 241, 91, 21),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 241, 91, 21),
                            ),
                          ),
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 25.0),
                          prefixIcon: const Icon(
                            Icons.lock_open,
                            color: Color.fromARGB(255, 241, 91, 21),
                            size: 28,
                          ),
                          filled: true,
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                obscure = !obscure;
                              });
                            },
                            child: Icon(
                              obscure ? Icons.visibility : Icons.visibility_off,
                              color: Colors.blueGrey,
                            ),
                          ),
                          //Icon(Icons.remove_red_eye,color: Color(0xffFCDA17),),
                          fillColor: const Color(0xffF2F2F3),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            //gapPadding: 5.0,
                          )),
                      style: const TextStyle(
                          color: Colors.black, fontFamily: 'productsan'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please enter some text';
                        } else if (value.length < 6) {
                          return 'password length at least 6(characters and alphabets)';
                        }
                        return null;
                      },
                    ),
                  ),
                ),

                //remeber me + forgot password
                SizedBox(
                  height: 65,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Navigator.push(context, MaterialPageRoute(builder: (context)=>const ForgotPassword()));
                          },
                          child: Text(
                            'Forgot Password',
                            style: TextStyle(
                                color: Color.fromARGB(255, 241, 91, 21),
                                fontFamily: 'productsan'),
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                const Padding(padding: EdgeInsets.only(top: 45)),

                //login button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blueGrey,
                    minimumSize: const Size(200, 50),
                    maximumSize: const Size(200, 50),
                  ),
                  onPressed: () {
                    FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: emailController.text,
                            password: passwordController.text)
                        .then((value) => {
                              print("Login Successful"),
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const HomePage()))
                            })
                        .onError((error, stackTrace) =>
                            {print("Error ${error.toString()}")});
                  },
                  child: Text("Login"),
                ),

                const Padding(padding: EdgeInsets.only(top: 4)),
                //not registered clickable text
                SizedBox(
                  height: 20,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpPage()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Not registered yet? ',
                          style: TextStyle(color: Color(0xff424242)),
                        ),
                        Text(
                          'Create an Account?',
                          style: TextStyle(
                            color: Color.fromARGB(255, 241, 91, 21),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ], //closing of child widgets
            ),
          ),
        ),
      ),
    );
  }

  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
