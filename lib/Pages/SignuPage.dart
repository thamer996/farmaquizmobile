import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'FabTabs.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _nomController = TextEditingController();
  TextEditingController _prenomController = TextEditingController();
  String? _selectedProfession;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  bool _isTermsAndConditionsChecked = false;

  String? _nomError;
  String? _prenomError;
  String? _emailError;
  String? _passwordError;
  String? _confirmPasswordError;

  List<String> _professions = ['Pharmacien', 'Etudiant'];

  String? _selectedDomaine;
  List<String> _etudiantDomaines = ['1er', '2eme', '3eme','4eme','5eme'];
  List<String> _pharmacienDomaines = ['industrie ', 'officine ', 'hôpital ','biologie','autre'];

  Future<void> _performSignUp() async {
    final nom = _nomController.text;
    final prenom = _prenomController.text;
    final email = _emailController.text;
    final password = _passwordController.text;

    setState(() {
      _nomError = _validateField(nom, 'Nom');
      _prenomError = _validateField(prenom, 'Prénom');
      _emailError = _validateField(email, 'Email');
      _passwordError = _validateField(password, 'Mot de passe');
      _confirmPasswordError =
          _validateConfirmPassword(_confirmPasswordController.text, password);
    });

    if (_isTermsAndConditionsChecked &&
        _nomError == null &&
        _prenomError == null &&
        _emailError == null &&
        _passwordError == null &&
        _confirmPasswordError == null) {
      // Simulate a successful signup
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Fabtabs(selectedIndex: 0)),
      );
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
                DropdownButtonFormField<String>(
                  value: _selectedProfession,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedProfession = newValue;
                      _selectedDomaine = null; // Reset the selected domaine when profession changes
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Profession',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  items: _professions.map((profession) {
                    return DropdownMenuItem<String>(
                      value: profession,
                      child: Text(profession),
                    );
                  }).toList(),
                ),
                if (_selectedProfession == 'Etudiant') ...[
                  const SizedBox(height: 20),
                  DropdownButtonFormField<String>(
                    value: _selectedDomaine,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedDomaine = newValue;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Année',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    items: _etudiantDomaines.map((domaine) {
                      return DropdownMenuItem<String>(
                        value: domaine,
                        child: Text(domaine),
                      );
                    }).toList(),
                  ),
                ],
                if (_selectedProfession == 'Pharmacien') ...[
                  const SizedBox(height: 20),
                  DropdownButtonFormField<String>(
                    value: _selectedDomaine,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedDomaine = newValue;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Domaine',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    items: _pharmacienDomaines.map((domaine) {
                      return DropdownMenuItem<String>(
                        value: domaine,
                        child: Text(domaine),
                      );
                    }).toList(),
                  ),
                ],
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
