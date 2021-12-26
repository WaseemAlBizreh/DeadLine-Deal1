import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waseem/Model/loginModel.dart';
import 'package:waseem/Provider/LoginProvider.dart';
import 'package:waseem/Service/authApi.dart';
// import 'package:intl/intl.dart';
import '../Variables.dart';
import 'Register.dart';

class login_page extends StatefulWidget {
  @override
  State<login_page> createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  late loginRequestModel login_requestModel;
  AuthApi login_api = AuthApi();

  final _formkey1 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var Devheight = MediaQuery.of(context).size.height;
    var Devwidth = MediaQuery.of(context).size.width;
    return ChangeNotifierProvider<LoginProvider>(
      create: (_) => LoginProvider(),
      child: Consumer<LoginProvider>(builder: (context, log, child) {
        return Scaffold(
          body: Container(
            color: c1,
            height: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: Devheight * 0.12),
                  Container(
                    height: Devheight * 0.3,
                    child: CircleAvatar(
                      radius: 110,
                      backgroundImage:
                          AssetImage('assets/imgs/logo_transparent_mid.png'),
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                  Container(
                    height: Devheight * 0.6,
                    child: SingleChildScrollView(
                      child: Card(
                        margin: EdgeInsets.all(Devwidth * 0.05),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        elevation: 75,
                        color: Colors.white,
                        child: Form(
                          key: _formkey1,
                          child: Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.fromLTRB(
                                    Devwidth * 0.06,
                                    Devheight * 0.04,
                                    Devwidth * 0.06,
                                    Devheight * 0.025),
                                child: TextFormField(
                                  controller: log.email,
                                  onFieldSubmitted: log.setEmail,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'please enter EmailAddress';
                                    }
                                    if (!log.email.text.contains('@')) {
                                      return 'please enter valid Email';
                                    }
                                  },
                                  autocorrect: false,
                                  decoration: InputDecoration(
                                    fillColor: c3,
                                    filled: true,
                                    hintText: "E-mail",
                                    prefixIcon: Icon(Icons.mail, color: c4),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(width: 0.4),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                  textInputAction: TextInputAction.next,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(Devwidth * 0.06, 0,
                                    Devwidth * 0.06, Devheight * 0.025),
                                child: TextFormField(
                                  controller: log.pass,
                                  onFieldSubmitted: log.setPass,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'please enter Password';
                                    }
                                    if (value.length < 8) {
                                      return 'Must be more than 8 number or characters';
                                    }
                                  },
                                  obscureText: log.visible,
                                  autocorrect: false,
                                  keyboardType: TextInputType.text,
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                    hintText: "Password",
                                    fillColor: c3,
                                    filled: true,
                                    prefixIcon:
                                        Icon(Icons.lock_rounded, color: c4),
                                    suffixIcon: IconButton(
                                      onPressed: log.setvisible,
                                      icon: Icon(
                                          log.visible
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color: c2),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(width: 0.4),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                child: Ink(
                                  padding: EdgeInsets.fromLTRB(
                                      Devwidth * 0.2,
                                      Devheight * 0.02,
                                      Devwidth * 0.2,
                                      Devheight * 0.02),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    gradient: LinearGradient(colors: [c2, c1]),
                                  ),
                                  child: Container(
                                    child: Text(
                                      'Log In',
                                      style: TextStyle(
                                        fontSize: Devwidth * 0.05,
                                      ),
                                    ),
                                  ),
                                ),
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                  padding: MaterialStateProperty.all(
                                      const EdgeInsets.all(0)),
                                  elevation: MaterialStateProperty.all(10),
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.transparent),
                                ),
                                onPressed: () async {
                                  _formkey1.currentState!.validate();
                                  if (_formkey1.currentState!.validate()) {
                                    String email = log.email.text;
                                    String password = log.pass.text;
                                    login_requestModel = loginRequestModel(
                                        email: email,
                                        password: password);
                                    await login_api
                                        .login(login_requestModel)
                                        .then((response) {
                                      if (response.token.isNotEmpty) {
                                        final snackBar = SnackBar(
                                            content: Text("Logged In Successfully"));
                                      } else {
                                        final snackBar = SnackBar(
                                            content: Text("Log In Failed Due To ${response.error}"));
                                      }
                                      print(response.token.toString());
                                      print(response.error);
                                    });
                                  }
                                  print(log.email.text);
                                  print(log.pass.text);
                                },
                              ),
                              SizedBox(height: Devheight * 0.01),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Don't have an account?",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: Devwidth * 0.04,
                                      color: c5,
                                    ),
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) => Register()));
                                      },
                                      style: TextButton.styleFrom(
                                        primary: c1,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(32.0),
                                        ),
                                      ),
                                      child: Text(
                                        "Sign up",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: Devwidth * 0.04,
                                            color: c4),
                                      )),
                                ],
                              ),
                              SizedBox(
                                height: Devheight * 0.02,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
