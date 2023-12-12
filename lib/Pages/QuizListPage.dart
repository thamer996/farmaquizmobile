import 'package:flutter/material.dart';
import 'QuizPage.dart'; // Assurez-vous d'importer correctement votre QuizPage

class QuizListPage extends StatelessWidget {
  final String categoryName;
  final List<Map<String, dynamic>> quizzes;

  QuizListPage({required this.categoryName, required this.quizzes});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('lib/images/bluebackground.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(categoryName),
            backgroundColor: const Color(0xff03919B),
          ),
          backgroundColor: Colors.transparent, // Set transparent background to allow image to show through
          body: ListView.builder(
            itemCount: quizzes.length,
            itemBuilder: (context, index) {
              final quizName = quizzes[index]['quizName'];
              final quizDescription = quizzes[index]['quizDescription'];

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    // Naviguer vers la page QuizPage avec les détails du quiz
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QuizPage(

                          // Ajoutez d'autres données du quiz si nécessaire
                        ),
                      ),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          quizName,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          quizDescription,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
