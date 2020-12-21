import 'package:flutter/material.dart';
import 'fancy_button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  void validate() {
    if (formkey.currentState.validate()) {
      print("Ok");
    } else {
      print("Error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Login Page')),
          backgroundColor: Colors.purple,
        ),
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image(
              image: AssetImage('image/download.png'),
              fit: BoxFit.cover,
              color: Colors.white70,
              colorBlendMode: BlendMode.dstOut,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                  key: formkey,
                  autovalidateMode: AutovalidateMode.always,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Email",
                          border: OutlineInputBorder(),
                        ),
                        validator: (val) {
                          if (val.isEmpty) {
                            return "Required";
                          } else {
                            return null;
                          }
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Password"),
                          validator: (val) {
                            if (val.isEmpty) {
                              return "Required";
                            } else if (val.length < 6) {
                              return "At Least 6 characters are required";
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: FancyButton(
                            onPressed: () {},
                          ))
                    ],
                  )),
            ),
          ],
        ));
  }
}
