import 'package:app/Pages/FabTabs.dart';
import 'package:flutter/material.dart';

import 'HomeScreen.dart';

class QuizResultScreen extends StatelessWidget {
  final int score;
  final int totalQuestions;

  const QuizResultScreen({super.key, required this.score, required this.totalQuestions});

  @override
  Widget build(BuildContext context) {
    // images based on score
    String imageAsset = score >= totalQuestions / 2 ? 'Success factors-amico.png' : 'Cheer up-pana.png';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff03919B),
        title: const Text('Résultat'),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xff03919B), Color(0xff024873)],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
                Image.asset(
                  'lib/images/$imageAsset',
                  width: 250,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Quiz Terminé',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                const SizedBox(height: 10),
                Text(
                  'Votre Score: $score / $totalQuestions',
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
                const SizedBox(height: 10),
                Text(
                  score >= totalQuestions / 2 ? 'Excellent travail ! Continuez ainsi !.' : 'Ne t\'inquiète pas, continue de pratiquer !',
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    Navigator.popUntil(context, (route) => route.isFirst);
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Fabtabs(selectedIndex: 0)));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Retour à l\'accueil',
                    style: TextStyle(fontSize: 18, color: Color(0xff03919B)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
