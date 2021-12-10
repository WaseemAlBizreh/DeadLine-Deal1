import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

void main() {
  runApp(MyApp());
}

var c1 = const Color(0xFF06487f);
var c2 = const Color(0xFF86a9db);
var c3 = const Color(0xffdcdcf6);
var c4 = const Color(0xff345b8e);
var c5 = const Color(0xff5c97d5);

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product App',
      debugShowCheckedModeBanner: false,
      home: SplashScreenView(
        navigateRoute: Register(),
        duration: 2000,
        imageSize: 130,
        imageSrc: "assets/imgs/1.png",
        backgroundColor: c3,
      ),
    );
  }
}

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
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sign up',
          style: TextStyle(fontSize: 25),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios),
        ),
        backgroundColor: c1,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            alignment: Alignment.topCenter,
            image: AssetImage('assets/imgs/15.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 100),
              Card(
                elevation: 75,
                color: Colors.white.withOpacity(0.4),
                child: Form(
                  key: _formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(25, 40, 25, 25),
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
                        margin: const EdgeInsets.fromLTRB(25, 0, 25, 25),
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
                        margin: const EdgeInsets.fromLTRB(25, 0, 25, 25),
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
                        margin: EdgeInsets.fromLTRB(25, 0, 25, 25),
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
                        style: ElevatedButton.styleFrom(
                          primary: c1,
                          padding: EdgeInsets.fromLTRB(60, 15, 60, 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                        ),
                        child: const Text(
                          'CREATE ACCOUNT',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        onPressed: () {
                          _formkey.currentState!.validate();
                        },
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Alredy have have an account?",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: c3,
                            ),
                          ),
                          TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                primary: c1,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32.0),
                                ),
                              ),
                              child: Text(
                                "Sign in",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                    color: c1),
                              )),
                        ],
                      ),
                      SizedBox(height: 15),
                    ],
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
//Navigator.push(context, MaterialPageRoute(builder: (_)=>Login()));
