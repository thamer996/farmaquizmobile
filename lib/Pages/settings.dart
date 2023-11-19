import 'package:app/Pages/ContactUs.dart';
import 'package:flutter/material.dart';

import 'ChangePasswordPage.dart';
import 'EditPage.dart';
import 'FabTabs.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff03919B),
        title: const Text('Paramètres', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Fabtabs(selectedIndex: 0)));
          },
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const EditPage()));
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey.withOpacity(0.5)),
                  ),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.account_circle, size: 36, color: Color(0xff03919B)),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Modifier le Profil',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          'Modifier vos détails de profil',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios, size: 24),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ChangePasswordPage()));
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey.withOpacity(0.5)),
                  ),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.lock, size: 36, color: Color(0xff03919B)),
                    SizedBox(width: 16),
                    Text(
                      'Mot de passe',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios, size: 24),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ContactUsPage()));
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey.withOpacity(0.5)),
                  ),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.mail_outline, size: 36, color: Color(0xff03919B)),
                    SizedBox(width: 16),
                    Text(
                      'Nous Contacter',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios, size: 24),
                  ],
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextButton(
                onPressed: () {
                  // Implémenter la fonctionnalité de déconnexion ici
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: const BorderSide(color: Color(0xff03919B)),
                  ),
                ),
                child: const Text(
                  'Déconnexion',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xff03919B),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
