import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:app/Pages/QuizPage.dart';
import 'package:app/Pages/component/Sidemenu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isSearchOpen = false;
  List<Map<String, dynamic>> quizzes = [];

  @override
  void initState() {
    super.initState();
    _fetchQuizzes();
  }

  Future<void> _fetchQuizzes() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:5000/api/Quizzes/'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      setState(() {
        quizzes = List<Map<String, dynamic>>.from(data);
      });
    } else {
      throw Exception('Failed to load quizzes');
    }
  }

  Widget _buildListItem(String name, String description) {
    return InkWell(
      child: Container(
        width: 150,
        height: 200,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Stack(
            children: [
              Positioned.fill(
                child: Container(
                  color: Colors.black.withOpacity(0.3),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          description,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (builder) => QuizPage()),
        );
      },
    );
  }

  void _openSearch() {
    setState(() {
      _isSearchOpen = true;
    });
  }

  void _closeSearch() {
    setState(() {
      _isSearchOpen = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> recommendedQuizzes = quizzes.take(2).toList();
    List<Map<String, dynamic>> newQuizzes = quizzes.skip(2).take(2).toList();
    List<Map<String, dynamic>> trendingQuizzes = quizzes.skip(8).toList();

    return Scaffold(
      drawer: Sidemenu(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: const SizedBox(
          height: 40,
          width: 40,
          child: Image(
            image: AssetImage('lib/images/applogo.png'),
          ),
        ),
        title: _isSearchOpen
            ? const TextField(
          decoration: InputDecoration(
            hintText: 'Search...',
            border: InputBorder.none,
          ),
        )
            : const Text(''),
        actions: [
        _isSearchOpen
        ? IconButton(
        onPressed: _closeSearch,
        icon: const Icon(Icons.close),
        color: Colors.black,
      )
          : IconButton(
      onPressed: _openSearch,
      icon: const Icon(Icons.search),
      color: Colors.black,
    ),
          IconButton(
            onPressed: () {
              // Handle notification icon click
            },
            icon: const Icon(Icons.notifications),
            color: Colors.grey,
          ),
          IconButton(
            onPressed: () {
              // Handle filter icon click
            },
            icon: const Icon(Icons.filter_list),
            color: Colors.black,
          ),
        ],
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/images/bluebackground.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 8,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Recommandé pour vous',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 150,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: recommendedQuizzes.length,
                    itemBuilder: (context, index) {
                      final quiz = recommendedQuizzes[index];
                      return _buildListItem(quiz['nom'], quiz['description']);
                    },
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Nouveautés',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 150,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: newQuizzes.length,
                    itemBuilder: (context, index) {
                      final quiz = newQuizzes[index];
                      return _buildListItem(quiz['nom'], quiz['description']);
                    },
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Tendances',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 150,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: trendingQuizzes.length,
                    itemBuilder: (context, index) {
                      final quiz = trendingQuizzes[index];
                      return _buildListItem(quiz['nom'], quiz['description']);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}