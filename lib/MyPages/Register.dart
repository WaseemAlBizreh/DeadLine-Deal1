

import 'package:flutter/material.dart';

import 'login_page.dart';

var c1 = const Color(0xFF06487f);
var c2 = const Color(0xFF86a9db);
var c3 = const Color(0xffdcdcf6);
var c4 = const Color(0xff345b8e);
var c5 = const Color(0xff5c97d5);

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool visible = true;
  bool visible1 = true;

  TextEditingController _NameController = TextEditingController();
  TextEditingController _EmailController = TextEditingController();
  TextEditingController _PassController = TextEditingController();
  TextEditingController _CPassController = TextEditingController();

  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var Devheight = MediaQuery.of(context).size.height;
    var Devwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        color: c1,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: Devheight * 0.08,),
              Container(
                height: Devheight * 0.23,
                child: CircleAvatar(
                  radius: 110,
                  backgroundImage: AssetImage('assets/imgs/logo_transparent_mid.png'),
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
                                Devwidth * 0.06, Devheight * 0.04,
                                Devwidth * 0.06, Devheight * 0.025
                            ),
                            child: TextFormField(
                              controller: _NameController,
                              onFieldSubmitted: (value) {
                                setState(() {
                                  _NameController.text = value;
                                });
                              },
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
                                prefixIcon: Icon(Icons.person_sharp, color: c4),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 0.4),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                              ),
                              keyboardType: TextInputType.name,
                              textInputAction: TextInputAction.next,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                Devwidth * 0.06, 0,
                                Devwidth * 0.06, Devheight * 0.025
                            ),
                            child: TextFormField(
                              controller: _EmailController,
                              onFieldSubmitted: (value) {
                                setState(() {
                                  _EmailController.text = value;
                                });
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'please enter EmailAddress';
                                }
                                if (!_EmailController.text.contains('@')) {
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
                            margin: EdgeInsets.fromLTRB(
                                Devwidth * 0.06, 0,
                                Devwidth * 0.06, Devheight * 0.025
                            ),
                            child: TextFormField(
                              controller: _PassController,
                              onFieldSubmitted: (value) {
                                setState(() {
                                  _PassController.text = value;
                                });
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'please enter Password';
                                }
                                if (value.length < 8) {
                                  return 'Must be more than 8 number or characters';
                                }
                              },
                              obscureText: visible1,
                              autocorrect: false,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                hintText: "Password",
                                fillColor: c3,
                                filled: true,
                                prefixIcon: Icon(Icons.lock_rounded, color: c4),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      visible1 = !visible1;
                                    });
                                  },
                                  icon: Icon(
                                      visible1
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
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                Devwidth * 0.06, 0,
                                Devwidth * 0.06, Devheight * 0.025
                            ),
                            child: TextFormField(
                              controller: _CPassController,
                              onFieldSubmitted: (value) {
                                setState(() {
                                  _CPassController.text = value;
                                });
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'please Confirm Password';
                                }
                                if (value != _PassController.text) {
                                  return 'Not Match with password';
                                }
                              },
                              autocorrect: false,
                              obscureText: visible,
                              decoration: InputDecoration(
                                fillColor: c3,
                                filled: true,
                                hintText: "Confirm Password",
                                prefixIcon: Icon(Icons.lock, color: c4),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      visible = !visible;
                                    });
                                  },
                                  icon: Icon(
                                      visible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: c2),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 0.4),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                              ),
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                            ),
                          ),
                          ElevatedButton(
                            child: Ink(
                              padding:EdgeInsets.fromLTRB(
                                  Devwidth * 0.12, Devheight * 0.02,
                                  Devwidth * 0.12, Devheight * 0.02
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                gradient: LinearGradient(colors: [c2, c1]),
                              ),
                              child: Container(
                                child:Text(
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
                              backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                            ),
                            onPressed: () {
                              _formkey.currentState!.validate();
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
                                  fontSize: Devwidth * 0.04 ,
                                  color: c5,
                                ),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => login_page()));},
                                  style: TextButton.styleFrom(
                                    primary: c1,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(32.0),
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
                          SizedBox(height: Devheight * 0.02,),
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
  }
}
