import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

import 'FabTabs.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _nomController = TextEditingController();
  TextEditingController _prenomController = TextEditingController();
  TextEditingController _professionController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  bool _isTermsAndConditionsChecked = false;

  String? _nomError;
  String? _prenomError;
  String? _professionError;
  String? _emailError;
  String? _passwordError;
  String? _confirmPasswordError;

  // static const String apiUrl = 'http://localhost:3000/api/auth/signup';

  Future<void> _performSignUp() async {
    final nom = _nomController.text;
    final prenom = _prenomController.text;
    final profession = _professionController.text;
    final email = _emailController.text;
    final password = _passwordController.text;

    setState(() {
      _nomError = _validateField(nom, 'Nom');
      _prenomError = _validateField(prenom, 'Prénom');
      _professionError = _validateField(profession, 'Profession');
      _emailError = _validateField(email, 'Email');
      _passwordError = _validateField(password, 'Mot de passe');
      _confirmPasswordError =
          _validateConfirmPassword(_confirmPasswordController.text, password);
    });

    if (_isTermsAndConditionsChecked &&
        _nomError == null &&
        _prenomError == null &&
        _professionError == null &&
        _emailError == null &&
        _passwordError == null &&
        _confirmPasswordError == null) {
      try {
        // Simulate a successful signup
        // Uncomment this section when you integrate the actual API
        /*final response = await http.post(
          Uri.parse(apiUrl),
          body: json.encode({
            'nom': nom,
            'prenom': prenom,
            'profession': profession,
            'email': email,
            'password': password,
          }),
          headers: {'Content-Type': 'application/json'},
        );

        if (response.statusCode == 201) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Fabtabs(selectedIndex: 0)),
          );
        } else if (response.statusCode == 400) {
          // Handle validation error from the server
        } else {
          // Handle other status codes
        }*/
        // Navigate to the next screen (comment this line if using actual API)
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Fabtabs(selectedIndex: 0)),
        );
      } catch (e) {
        print('Error connecting to API: $e');
      }
    }
  }

  String? _validateField(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return 'Veuillez entrer votre $fieldName';
    }
    return null;
  }

  String? _validateConfirmPassword(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return 'Veuillez confirmer votre mot de passe';
    } else if (password != null && password != value) {
      return 'Les mots de passe ne correspondent pas';
    }
    return null;
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
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    'lib/images/My-password-pana.png',
                    width: 250,
                    height: 220,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _nomController,
                        style: const TextStyle(fontSize: 16),
                        decoration: InputDecoration(
                          labelText: 'Nom',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                          errorText: _nomError,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        controller: _prenomController,
                        style: const TextStyle(fontSize: 16),
                        decoration: InputDecoration(
                          labelText: 'Prénom',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                          errorText: _prenomError,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _professionController,
                  style: const TextStyle(fontSize: 16),
                  decoration: InputDecoration(
                    labelText: 'Profession',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                    errorText: _professionError,
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _emailController,
                  style: const TextStyle(fontSize: 16),
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                    errorText: _emailError,
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  obscureText: !_isPasswordVisible,
                  style: const TextStyle(fontSize: 16),
                  decoration: InputDecoration(
                    labelText: 'Mot de passe',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                    suffixIcon: IconButton(
                      icon: Icon(_isPasswordVisible ? Icons.visibility : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                    errorText: _passwordError,
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: !_isConfirmPasswordVisible,
                  style: const TextStyle(fontSize: 16),
                  decoration: InputDecoration(
                    labelText: 'Confirmez votre mot de passe',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                    suffixIcon: IconButton(
                      icon: Icon(_isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                        });
                      },
                    ),
                    errorText: _confirmPasswordError,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Checkbox(
                      value: _isTermsAndConditionsChecked,
                      onChanged: (value) {
                        setState(() {
                          _isTermsAndConditionsChecked = value ?? false;
                        });
                      },
                    ),
                    const Flexible(
                      child: Text(
                        'En vous inscrivant, vous acceptez nos conditions générales\n d\'utilisation, ainsi que notre politique de confidentialité',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _performSignUp,
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xff03919B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text('S\'inscrire'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
