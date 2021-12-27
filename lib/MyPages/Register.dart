import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waseem/Model/RegisterModel.dart';
import 'package:waseem/Provider/RegisterProvider.dart';
import 'package:waseem/Service/authApi.dart';

import '../Variables.dart';
import 'login_page.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late registerRequestModel reg_requestModel;
  AuthApi reg_api = AuthApi();

  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var Devheight = MediaQuery.of(context).size.height;
    var Devwidth = MediaQuery.of(context).size.width;
    return ChangeNotifierProvider<RegisterProvider>(
      create: (_) => RegisterProvider(),
      child: Consumer<RegisterProvider>(
        builder: (context, reg, child) {
          return Scaffold(
            body: Container(
              color: c1,
              height: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: Devheight * 0.08,
                    ),
                    Container(
                      height: Devheight * 0.23,
                      child: CircleAvatar(
                        radius: 110,
                        backgroundImage:
                            AssetImage('assets/imgs/logo_transparent_mid.png'),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                    Container(
                      height: Devheight * 0.66,
                      child: SingleChildScrollView(
                        child: Card(
                          margin: EdgeInsets.all(Devwidth * 0.05),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          elevation: 75,
                          color: Colors.white,
                          child: Form(
                            key: _formkey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.fromLTRB(
                                      Devwidth * 0.06,
                                      Devheight * 0.04,
                                      Devwidth * 0.06,
                                      Devheight * 0.025),
                                  child: TextFormField(
                                    controller: reg.name,
                                    onFieldSubmitted: reg.setName,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'please enter UserName';
                                      }
                                    },
                                    autocorrect: false,
                                    decoration: InputDecoration(
                                      fillColor: c3,
                                      filled: true,
                                      hintText: "UserName",
                                      prefixIcon:
                                          Icon(Icons.person_sharp, color: c4),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(width: 0.4),
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                    ),
                                    keyboardType: TextInputType.name,
                                    textInputAction: TextInputAction.next,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(Devwidth * 0.06,
                                      0, Devwidth * 0.06, Devheight * 0.025),
                                  child: TextFormField(
                                    controller: reg.email,
                                    onFieldSubmitted: reg.setEmail,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'please enter EmailAddress';
                                      }
                                      if (!reg.email.text.contains('@')) {
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
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                    ),
                                    keyboardType: TextInputType.emailAddress,
                                    textInputAction: TextInputAction.next,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(Devwidth * 0.06,
                                      0, Devwidth * 0.06, Devheight * 0.025),
                                  child: TextFormField(
                                    controller: reg.pass,
                                    onFieldSubmitted: reg.setPass,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'please enter Password';
                                      }
                                      if (value.length < 8) {
                                        return 'Must be more than 8 number or characters';
                                      }
                                    },
                                    obscureText: reg.visible1,
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
                                        onPressed: reg.setvisible1,
                                        icon: Icon(
                                            reg.visible1
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                            color: c2),
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(width: 0.4),
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(Devwidth * 0.06,
                                      0, Devwidth * 0.06, Devheight * 0.025),
                                  child: TextFormField(
                                    controller: reg.cpass,
                                    onFieldSubmitted: reg.setCPass,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'please Confirm Password';
                                      }
                                      if (value != reg.pass.text) {
                                        return 'Not Match with password';
                                      }
                                    },
                                    autocorrect: false,
                                    obscureText: reg.visible,
                                    decoration: InputDecoration(
                                      fillColor: c3,
                                      filled: true,
                                      hintText: "Confirm Password",
                                      prefixIcon: Icon(Icons.lock, color: c4),
                                      suffixIcon: IconButton(
                                        onPressed: reg.setvisible,
                                        icon: Icon(
                                            reg.visible
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                            color: c2),
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(width: 0.4),
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                    ),
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                  ),
                                ),
                                ElevatedButton(
                                  child: Ink(
                                    padding: EdgeInsets.fromLTRB(
                                        Devwidth * 0.12,
                                        Devheight * 0.02,
                                        Devwidth * 0.12,
                                        Devheight * 0.02),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      gradient:
                                          LinearGradient(colors: [c2, c1]),
                                    ),
                                    child: Container(
                                      child: Text(
                                        'CREATE ACCOUNT',
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
                                    _formkey.currentState!.validate();
                                    if (_formkey.currentState!.validate()) {
                                      String username = reg.name.text;
                                      String email = reg.email.text;
                                      String pass = reg.pass.text;
                                      String cpass = reg.cpass.text;
                                      reg_requestModel = registerRequestModel(
                                          UserName: username,
                                          Email: email,
                                          Password: pass,
                                          C_Password: cpass);
                                      try{
                                        await reg_api
                                            .register(reg_requestModel)
                                            .then((response) {
                                          if (response.token != "") {
                                            final snackBar = SnackBar(
                                                content:
                                                Text("Registered Successfully"));
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(snackBar);
                                            token = response.token;
                                          } else {
                                            final snackBar = SnackBar(
                                                content: Text("Registration Failed Due To"+
                                                    response.error.toString()));
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(snackBar);
                                            // final snackBar = SnackBar(
                                            //     content: Text("Registration Failed Due To ${response.error}"));
                                          }
                                          print(response.token.toString());
                                          print(response.error);
                                        });
                                      }catch(e){
                                        final snackBar =
                                        SnackBar(content: Text(e.toString()));
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                        print(e.toString());
                                      }
                                    }
                                  },
                                ),
                                SizedBox(height: Devheight * 0.01),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Already have an account?",
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
                                                  builder: (_) =>
                                                      login_page()));
                                        },
                                        style: TextButton.styleFrom(
                                          primary: c1,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(32.0),
                                          ),
                                        ),
                                        child: Text(
                                          "Sign in",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: Devwidth * 0.04,
                                              color: c4),
                                        )),
                                  ],
                                ),
                                SizedBox(
                                  height: Devheight * 0.02,
                                ),
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
        },
      ),
    );
  }
}
