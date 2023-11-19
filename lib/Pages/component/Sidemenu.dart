import 'package:app/Pages/FabTabs.dart';
import 'package:flutter/material.dart';

import '../LeaderboardPage.dart';
import '../ProfilePage.dart';
import '../SelectQuizPage.dart';
import '../settings.dart';
class Sidemenu extends StatefulWidget {

  @override
  State<Sidemenu> createState() => _SidemenuState();
}

class _SidemenuState extends State<Sidemenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(

        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('lib/images/background.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('lib/images/profile_pic.png'),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'User Name',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person), // Profile icon
              title: const Text('Profil'),
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Fabtabs(selectedIndex:3)));
              },
            ),
            ListTile(
              leading: const Icon(Icons.quiz), // Quiz icon
              title: const Text('Quiz'),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Fabtabs(selectedIndex:1)));
              },
            ),
            ListTile(
              leading: const Icon(Icons.leaderboard), // Scoreboard icon
              title: const Text('Classement'),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Fabtabs(selectedIndex:2)));
                // Navigate to the scoreboard page
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings), // Settings icon
              title: const Text('Paramètres'),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const Settings()));
              },
            ),
          ],
        ),
    );
  }
}
