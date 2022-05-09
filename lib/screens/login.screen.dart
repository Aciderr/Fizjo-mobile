import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String _email;
  late String _password;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Padding(padding: EdgeInsets.symmetric(vertical: 20), child: Text("Logowanie", style: TextStyle(fontSize: 17),)),
              TextField(
                onChanged: (String value) {
                  setState(() {
                    _email = value;
                  });
                },
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.greenAccent, width: 1.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  hintText: 'Email',
                ),
              ),
              Padding(padding: const EdgeInsets.symmetric(vertical: 20), child: TextField(
                onChanged: (String value) {
                  setState(() {
                    _password = value;
                  });
                },
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.greenAccent, width: 1.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  hintText: 'Hasło',
                ),
              ),),
              ElevatedButton(onPressed: () {
                FirebaseAuth.instance.userChanges().listen((event) {
                  print("event" + event.toString());
                });
                FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
              }, child: const Text('Zaloguj'))
            ],
          ),
        ),
      ),
    );
  }
}

