import 'package:flutter/material.dart';
import 'QuizPage.dart';
import 'component/Sidemenu.dart';

class SelectQuizPage extends StatefulWidget {
  @override
  _SelectQuizPageState createState() => _SelectQuizPageState();
}

class _SelectQuizPageState extends State<SelectQuizPage> {
  final List<Map<String, dynamic>> quizCategories = [
    {
      'categoryName': 'Officine',
      'categoryDescription': 'This category includes quizzes related to workshops and craftsmanship.',
      'quizzes': [
        'Quiz 1',
        'Quiz 2',
        'Quiz 3',
      ],
    },
    {
      'categoryName': 'industrie',
      'categoryDescription': 'This category includes quizzes related to workshops and craftsmanship.',
      'quizzes': [
        'Quiz 1',
        'Quiz 2',
        'Quiz 3',
      ],
    },
    {
      'categoryName': 'hôpital',
      'categoryDescription': 'This category includes quizzes related to workshops and craftsmanship.',
      'quizzes': [
        'Quiz 1',
        'Quiz 2',
        'Quiz 3',
      ],
    },
    {
      'categoryName': 'Biologie',
      'categoryDescription': 'This category includes quizzes related to workshops and craftsmanship.',
      'quizzes': [
        'Quiz A',
        'Quiz B',
        'Quiz C',
      ],
    },
    // Add more categories...
  ];

  List<bool> categoryVisibility = [];

  @override
  void initState() {
    super.initState();
    categoryVisibility = List.generate(quizCategories.length, (index) => false);
  }

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
      backgroundColor: Colors.blue[900], // Ajout de la couleur de fond bleue ici
      body: ListView.builder(
        itemCount: quizCategories.length,
        itemBuilder: (context, categoryIndex) {
          final categoryName = quizCategories[categoryIndex]['categoryName'];
          final categoryDescription = quizCategories[categoryIndex]['categoryDescription'];
          final quizzes = quizCategories[categoryIndex]['quizzes'];

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      categoryVisibility[categoryIndex] =
                      !categoryVisibility[categoryIndex];
                    });
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          categoryName,
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          categoryDescription,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: categoryVisibility[categoryIndex],
                child: Column(
                  children: List.generate(quizzes.length, (quizIndex) {
                    final quizName = quizzes[quizIndex];
                    return Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 9,
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
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
                            color: Colors.white,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const QuizPage(),
                            ),
                          );
                        },
                      ),
                    );
                  }),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
