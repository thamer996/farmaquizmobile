import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../Api/loginapi.dart';
import 'FabTabs.dart';
import 'ForgotPassword.dart';
import 'SignuPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isPasswordVisible = false;
  bool _emailError = false;
  bool _passwordError = false;

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Future<void> _performLogin() async {
    final email = _emailController.text;
    final password = _passwordController.text;

    setState(() {
      _emailError = email.isEmpty;
      _passwordError = password.isEmpty;
    });

    if (!_emailError && !_passwordError) {
      try {
        final token = await ApiService().login(email, password);

        if (token != null) {
          // Successful login, navigate to the next page
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Fabtabs(selectedIndex: 0)),
          );
        } else {

          // You can set a state variable to show an error message on the UI
        }
      } catch (e) {
        print('Error connecting to API: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  'lib/images/My-password-bro.png',
                  height: 250,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Connectez-vous pour continuer',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Email',
                  style: TextStyle(fontSize: 16),
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    prefixIcon: const Icon(Icons.email),
                    hintText: 'Saisissez votre e-mail',
                    errorText: _emailError ? 'Veuillez entrer votre e-mail' : null,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Mot de passe',
                  style: TextStyle(fontSize: 16),
                ),
                TextFormField(
                  controller: _passwordController,
                  obscureText: !_isPasswordVisible,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    prefixIcon: const Icon(Icons.lock),
                    hintText: 'Saisissez votre mot de passe',
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                      icon: Icon(_isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off),
                    ),
                    errorText: _passwordError ? 'Veuillez entrer votre mot de passe' : null,
                  ),
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ForgotPasswordPage()),
                      );
                    },
                    child: const Text(
                      'Mot de passe oublié?',
                      style: TextStyle(color: Color(0xff03919B)),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: _performLogin,
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xff03919B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text('Se connecter'),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Vous n'avez pas de compte ? ",
                      style: TextStyle(color: Colors.black),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SignUpPage()),
                        );
                      },
                      child: const Text(
                        "Inscrivez-vous ici",
                        style: TextStyle(color: Color(0xff03919B)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}