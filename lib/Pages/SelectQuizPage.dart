import 'package:app/Pages/HomeScreen.dart';
import 'package:app/Pages/LoginPage.dart';
import 'package:flutter/material.dart';
import 'QuizPage.dart';
import 'component/Sidemenu.dart';

class SelectQuizPage extends StatelessWidget {
  final List<Map<String, dynamic>> quizCategories = [
    {
      'categoryName': 'Catégorie 1',
      'quizzes': [
        'Quiz 1',
        'Quiz 2',
        'Quiz 3',
      ],
    },
    {
      'categoryName': 'Catégorie 2',
      'quizzes': [
        'Quiz A',
        'Quiz B',
        'Quiz C',
      ],
    },
    // Add more categories...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidemenu(),
      appBar: AppBar(
        backgroundColor: const Color(0xff03919B),
        title: const Text('Quizzes'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemCount: quizCategories.length,
        itemBuilder: (context, categoryIndex) {
          final categoryName = quizCategories[categoryIndex]['categoryName'];
          final quizzes = quizCategories[categoryIndex]['quizzes'];

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  categoryName,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
              Column(
                children: List.generate(quizzes.length, (quizIndex) {
                  final quizName = quizzes[quizIndex];
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ListTile(
                      title: Text(
                        quizName,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () {

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  const QuizPage(

                            ),
                          ),
                        );
                      },
                    ),
                  );
                }),
              ),
            ],
          );
        },
      ),
    );
  }
}
