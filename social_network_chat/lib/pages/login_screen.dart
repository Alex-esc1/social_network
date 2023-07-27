// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:social_network_chat/pages/sign_up_screen.dart';

class SignInScreen extends StatefulWidget {
  static const String id = 'sign_in_screen';

  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();

  String _email = '';
  String _password = '';

  late FocusNode _passwordFocusNode = FocusNode();

  @override
  void initState() {
    _passwordFocusNode = FocusNode();

    super.initState();
  }

  @override
  void dispose() {
    _passwordFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 18),
                child: Text('Social Chat',
                    style: Theme.of(context).textTheme.headlineLarge),
              ),
              SizedBox(height: 15),
              //email
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    labelText: 'Enter your email'),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_passwordFocusNode);
                },
                onSaved: (value) {
                  _email = value!.trim();
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),
              //password
              TextFormField(
                focusNode: _passwordFocusNode,
                decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    labelText: 'Enter your password'),
                textInputAction: TextInputAction.done,
                obscureText: true,
                onFieldSubmitted: (_) {
                  // TODO: - Submit fo
                },
                onSaved: (value) {
                  _password = value!.trim();
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter longer password';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),
              TextButton(
                  onPressed: () {
                    // TODO: - Submit form
                  },
                  child: Text('Sign In')),
              TextButton(
                  onPressed: () {
                    // Go to sign up screen
                    Navigator.of(context).pushReplacementNamed(SignUpScreen.id);
                  },
                  child: Text('Sign Up instead'))
            ]),
          ),
        ),
      )),
    );
  }
}
