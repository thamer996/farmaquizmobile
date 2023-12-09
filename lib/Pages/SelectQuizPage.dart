import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'component/Sidemenu.dart';

class SelectQuizPage extends StatefulWidget {
  @override
  _SelectQuizPageState createState() => _SelectQuizPageState();
}

class _SelectQuizPageState extends State<SelectQuizPage> {
  List<Map<String, dynamic>> quizCategories = [];
  List<bool> categoryVisibility = [];

  @override
  void initState() {
    super.initState();
    _fetchCategories();
  }

  Future<void> _fetchCategories() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:5000/api/Categories'));

    if (response.statusCode == 200) {
      final List<dynamic> categoriesData = json.decode(response.body);
      final List<Map<String, dynamic>> categories = categoriesData.map((category) {
        return {
          'categoryId': category['categoryId'] ?? '',
          'categoryName': category['nom'] ?? 'Default Category Name',
          'categoryDescription': category['description'] ?? 'Default Description',
          'quizzes': (category['quizzes'] as List<dynamic> ?? []).map((quiz) {
            return {
              'quizName': quiz['nom'] ?? 'Default Quiz Name',
              'quizDescription': quiz['description'] ?? 'Default Quiz Description',
            };
          }).toList(),
        };
      }).toList();

      setState(() {
        quizCategories = categories;
        categoryVisibility = List.generate(quizCategories.length, (index) => false);
      });
    } else {
      throw Exception('Failed to load categories');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidemenu(),
      appBar: AppBar(
        backgroundColor: const Color(0xff03919B),
        title: const Text('Les Catégories'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.blue[900],
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
                      categoryVisibility[categoryIndex] = !categoryVisibility[categoryIndex];
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

              // Display quizzes for the category
              if (categoryVisibility[categoryIndex])
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: quizzes.map<Widget>((quiz) {
                    final quizName = quiz['quizName'];
                    final quizDescription = quiz['quizDescription'];

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.green, // You can customize the color
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
                    );
                  }).toList(),
                ),
            ],
          );
        },
      ),
    );
  }
}
