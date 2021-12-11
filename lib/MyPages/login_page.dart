import 'package:flutter/material.dart';
import 'package:waseem/MyPages/home_page.dart';
import 'package:waseem/main.dart';

class login_page extends StatefulWidget {
  @override
  State<login_page> createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  bool visible1 = true;
  var c1 = const Color(0xFF06487f);
  var c2 = const Color(0xFF86a9db);
  var c3 = const Color(0xffdcdcf6);
  var c4 = const Color(0xff345b8e);
  var c5 = const Color(0xff5c97d5);

  TextEditingController _EmailController = TextEditingController();
  TextEditingController _PassController = TextEditingController();

  final _formkey1 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sign in',
          style: TextStyle(fontSize: 25),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_)=> home_page()));
          },
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
              SizedBox(height: 20,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(75.0),
                  gradient: LinearGradient(colors: [c1,c2]),
                ),
                child: const CircleAvatar(
                  radius: 75.0,
                  backgroundImage: AssetImage('assets/imgs/logo_transparent.png'),
                  backgroundColor: Colors.transparent,
                ),
              ),
              SizedBox(height: 20,),
              Card(
                elevation: 75,
                color: Colors.white.withOpacity(0.4),
                child: Form(
                  key: _formkey1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(25, 40, 25, 25),
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
                      ElevatedButton(
                        child: Ink(
                          padding: const EdgeInsets.fromLTRB(100, 15,100, 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            gradient: LinearGradient(colors: [c1,c2]),
                          ),
                          child: Container(
                            child: const Text(
                              'Log in',
                              style: TextStyle(
                                fontSize: 20,
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
                          backgroundColor: MaterialStateProperty.all(Colors.transparent),
                        ),
                        onPressed: () {
                          _formkey1.currentState!.validate();
                        },
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account?",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: c4,
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => Register()));
                              },
                              style: TextButton.styleFrom(
                                primary: c1,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32.0),
                                ),
                              ),
                              child: Text(
                                "Sign up",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
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
