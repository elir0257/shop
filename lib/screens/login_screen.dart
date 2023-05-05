import 'package:flutter/material.dart';
import 'package:shop/screens/elements/input_fields/login_field.dart';
import 'package:shop/screens/second_screen.dart';

class LoginScreen extends StatelessWidget{
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: const Text(
          'SHOP',
        ),
        backgroundColor: Colors.amber,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const InputField('Login'),
              const InputField('Password'),
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SecondPage(),
                      )
                  );
                },
                color: Colors.amberAccent,
                splashColor: Colors.amberAccent,
                highlightColor: Colors.amberAccent,
                child: const Text('login'),
              )
            ],
          ),
        ),
      ),
    );
  }
}