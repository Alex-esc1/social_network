// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:social_network_chat/pages/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  static const String id = 'sign_up_screen';

  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  String _email = '';
  String _username = '';
  String _password = '';

  late FocusNode _passwordFocusNode = FocusNode();
  late FocusNode _usernameFocusNode = FocusNode();

  @override
  void initState() {
    _passwordFocusNode = FocusNode();
    _usernameFocusNode = FocusNode();

    super.initState();
  }

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    _usernameFocusNode.dispose();

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
                  FocusScope.of(context).requestFocus(_usernameFocusNode);
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
              //username
              TextFormField(
                focusNode: _usernameFocusNode,
                decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    labelText: 'Enter your username'),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_passwordFocusNode);
                },
                onSaved: (value) {
                  _username = value!.trim();
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your username';
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
                  child: Text('Sign Up')),
              TextButton(
                  onPressed: () {
                    // Go to sign screen
                    Navigator.of(context).pushReplacementNamed(SignInScreen.id);
                  },
                  child: Text('Sign In instead'))
            ]),
          ),
        ),
      )),
    );
  }
}
