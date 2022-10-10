import 'package:flutter/material.dart';
import 'package:maheey_task/constant/app_large_text.dart';
import 'package:maheey_task/view/home.dart';
import 'package:maheey_task/view/login.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUp();
}

class _SignUp extends State<SignUpPage> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  bool showSpinner = false;
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerCity = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool submit = true;
  bool obscure = true;
  // APIService apiService = APIService();
  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

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
                //this would be containing all the widgets of screen
                children: [
                  Padding(padding: EdgeInsets.only(top: 40)),
                  //first widget
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 200,
                        width: 300,
                        child: Image.asset(
                          'assets/imag/maahey-logo.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //second widget =>signup text
                  Padding(
                    padding: const EdgeInsets.only(left: 30, top: 12),
                    child: Row(
                      children: [
                        Center(
                          child: AppLargeText(
                              text: " Lets Signup",
                              size: 26,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //name field
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: SizedBox(
                      height: 85.0,
                      width: width - 30,
                      child: TextFormField(
                        controller: _controllerName,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Name can not be empty';
                          } else {
                            return null;
                          }
                        },
                        cursorColor: Color(0xff424242),
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          labelText: 'Enter your full name',
                          labelStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                            fontFamily: 'productsan',
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 241, 91, 21),
                              width: 0.5,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 241, 91, 21),
                              width: 0.5,
                            ),
                          ),
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 20),
                          prefixIcon: const Icon(
                            Icons.person,
                            color: Color.fromARGB(255, 241, 91, 21),
                            size: 25.0,
                          ),
                          filled: true,
                          fillColor: const Color(0xffF2F2F3),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        style: const TextStyle(
                          color: Color(0xff424242),
                        ),
                      ),
                    ),
                  ),

                  //email address field
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: SizedBox(
                      height: 85.0,
                      width: width - 30,
                      child: TextFormField(
                        controller: _controllerEmail,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email address cannot be empty';
                          } else {
                            return null;
                          }
                        },
                        cursorColor: Color(0xff424242),
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            labelText: 'Enter your email',
                            labelStyle: const TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                                fontFamily: 'productsan'),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 241, 91, 21),
                                width: 0.5,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 241, 91, 21),
                                width: 0.5,
                              ),
                            ),
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 20),
                            prefixIcon: const Icon(
                              Icons.mail,
                              color: Color.fromARGB(255, 241, 91, 21),
                              size: 20.0,
                            ),
                            filled: true,
                            fillColor: const Color(0xffF2F2F3),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            )),
                        style: const TextStyle(
                          color: Color(0xff424242),
                        ),
                      ),
                    ),
                  ),

                  //password
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: SizedBox(
                      height: 70,
                      width: width - 30,
                      child: TextFormField(
                        controller: _controllerPassword,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password cannot be empty';
                          } else if (value.length != 8) {
                            return 'Password cannot be less than 8 characters';
                          }
                          return null;
                        },
                        cursorColor: Color(0xff424242),
                        obscureText: obscure,
                        enableSuggestions: false,
                        autocorrect: false,
                        decoration: InputDecoration(
                            labelText: 'Enter Password',
                            labelStyle: const TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                                fontFamily: 'productsan'),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 241, 91, 21),
                                width: 0.5,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 241, 91, 21),
                                width: 0.5,
                              ),
                            ),
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 20.0),
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Color.fromARGB(255, 241, 91, 21),
                              size: 20,
                            ),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  obscure = !obscure;
                                });
                              },
                              child: Icon(
                                obscure
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Color.fromARGB(255, 241, 91, 21),
                              ),
                            ),
                            filled: true,
                            fillColor: const Color(0xffF2F2F3),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              gapPadding: 5.0,
                            )),
                        style: const TextStyle(
                            color: Color(0xff424242), fontFamily: 'productsan'),
                      ),
                    ),
                  ),

                  //atleast  8 charachters and forgot password

                  const Padding(padding: EdgeInsets.only(top: 10, bottom: 20)),

                  //signup-button
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blueGrey,
                        minimumSize: const Size(200, 50),
                        maximumSize: const Size(200, 50),
                      ),
                      onPressed: () {
                        FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: _controllerEmail.text,
                                password: _controllerPassword.text)
                            .then((value) => {
                                  print("Created New Account"),
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const HomePage()))
                                })
                            .onError((error, stackTrace) =>
                                {print("Error ${error.toString()}")});
                      },
                      child: const Text("LOgin with Firebase")),

                  const Padding(padding: EdgeInsets.only(top: 5)),

                  //have any account login
                  SizedBox(
                    height: 20,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Already have an account?    ',
                            style: TextStyle(
                              color: Color(0xff424242),
                            ),
                          ),
                          Text(
                            'Login',
                            style: TextStyle(
                                color: Color.fromARGB(255, 241, 91, 21)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
