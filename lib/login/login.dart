import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email = '';
  String _password = '';

  bool get _isValidEmail {
    return _email.contains('@');
  }

  bool get _isValidPass {
    return _password.replaceAll(' ', '').length > 5;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('email:'),
            TextField(
              onChanged: (String text) {
                _email = text;
                setState(() {});
              },
            ),
            const SizedBox(height: 30),
            const Text('password:'),
            TextField(
              onChanged: (String text) {
                _password = text;
                setState(() {});
              },
            ),
            const SizedBox(height: 50),
            MaterialButton(
              color: Colors.greenAccent,
              // los booleanos me devolveran si son true o false el correo y la pass
              // en base a eso onpresset sera nulo o sera una funcion
              onPressed: _isValidEmail && _isValidPass ? () {} : null,
              child: const Text('SEND'),
            ),
          ],
        ),
      )),
    );
  }
}

// si se neceista un widget que tenga su propi estado mejor usar un stateful 
// si solo se necesita rendereizar info mejor usar un stateless
