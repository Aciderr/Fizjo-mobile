import 'package:fizjo/providers/current-user.provider.dart';
import 'package:fizjo/ui-widgets/button.widget.dart';
import 'package:fizjo/ui-widgets/input.widget.dart';
import 'package:fizjo/validators/email.validator.dart';
import 'package:fizjo/validators/password.validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool isProcessingByEmailAndPassword = false;
  String? _formError;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future<void> loginWithEmailAndPassword() async {
      bool isValid = _formkey.currentState!.validate();
      if (isValid) {
        setState(() {
          isProcessingByEmailAndPassword = true;
        });

        try {
          await Provider.of<CurrentUserProvider>(context, listen: false).signInWithEmailAndPassword(_emailController.text, _passwordController.text);
          Navigator.pushReplacementNamed(context, '/');
        } on String catch(error) {
          _formError = error;
        }

        setState(() {
          isProcessingByEmailAndPassword = false;
        });
      }
    }

    Future<void> loginWithGoogle() async {
      await Provider.of<CurrentUserProvider>(context, listen: false).signInWithGoogle();
      Navigator.pushReplacementNamed(context, '/');
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Padding(padding: EdgeInsets.symmetric(vertical: 20), child: Text("Logowanie", style: TextStyle(fontSize: 17),)),
              Form(
                key: _formkey,
                child: Column(children: [
                  PellaInput(controller: _emailController, inputText: "Email", validator: emailValidator,),
                  PellaInput(controller: _passwordController, inputText: "Has??o", isPassword: true, validator: passwordValidator,),
                  const SizedBox(height: 16,),
                  PellaButton(text: 'ZALOGUJ', onPressed: loginWithEmailAndPassword, isProcessing: isProcessingByEmailAndPassword, backgroundColor: MaterialStateProperty.all<Color>(Colors.orangeAccent), textColor: Colors.white,),
                  _formError != null ? Padding(padding: const EdgeInsets.symmetric(vertical: 16), child: Text(_formError!, style: const TextStyle(color: Colors.red)),) : Container(),
                  Padding(padding: const EdgeInsets.symmetric(vertical: 20), child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    const Text('Nie masz konta?',),
                    Padding(padding: const EdgeInsets.only(left: 4), child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, '/registration');
                      },
                      child: const Text('Przejd?? do rejestracji', style: TextStyle(decoration: TextDecoration.underline),),),
                    ),
                  ],),),
                  PellaButton(text: 'ZALOGUJ Z GOOGLE', onPressed: loginWithGoogle, suffixImagePath: 'assets/images/google.png', backgroundColor: MaterialStateProperty.all<Color>(Colors.white)),
              ],))
            ],
          ),
        ),
      ),
    );
  }
}

