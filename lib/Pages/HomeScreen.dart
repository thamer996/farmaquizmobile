import 'dart:ui'; // Import dart:ui to use Image.asset
import 'package:flutter/material.dart';
import 'package:app/Pages/LoginPage.dart';
import 'package:app/Pages/QuizPage.dart';
import 'package:app/Pages/component/Sidemenu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isSearchOpen = false;

  List<String> quizTendanceImagePaths = [
    'lib/images/img.png',
    'lib/images/img.png',
    'lib/images/img.png',
    'lib/images/img.png',// Replace with the path to your local image
    // ... (remaining paths)
  ];

  List<String> NouveautesImagePaths = [
    'lib/images/img.png',
    'lib/images/img.png',
    'lib/images/img.png',
    'lib/images/img.png',// Replace with the path to your local image
    // ... (remaining paths)
  ];

  List<String> topPicksImagePaths = [
    'lib/images/img.png',
    'lib/images/img.png',
    'lib/images/img.png',
    'lib/images/img.png',// Replace with the path to your local image
    // ... (remaining paths)
  ];

  Widget _buildEventSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.white,
              ),
              onPressed: () {
                // Ajoutez ici le code à exécuter lorsque le bouton est pressé
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  ' Lancement Nouveau quiz  le 2 janvier',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildListItem(String title, String imagePath) {
    return InkWell(
      child: Container(
        width: 150,
        height: 200,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.blueGrey,
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
              Image.asset(
                imagePath, // Use Image.asset with the local image path
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
              Positioned.fill(
                child: Container(
                  color: Colors.black.withOpacity(0.3),
                  child: Center(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
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
    return Scaffold(
      drawer: Sidemenu(),
      appBar: AppBar(
        backgroundColor: Colors.white,
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
              // Handle filter icon click (i didn't know how)
            },
            icon: const Icon(Icons.filter_list),
            color: Colors.black,
          ),
        ],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildEventSection(),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Recommandés pour vous',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: topPicksImagePaths.length,
                itemBuilder: (context, index) {
                  return _buildListItem('Quiz $index', topPicksImagePaths[index]);
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Quiz Tendance',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: quizTendanceImagePaths.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    child: _buildListItem('Quiz $index', quizTendanceImagePaths[index]),
                  );
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Nouveautés',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: NouveautesImagePaths.length,
                itemBuilder: (context, index) {
                  return _buildListItem('Quiz $index', NouveautesImagePaths[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
