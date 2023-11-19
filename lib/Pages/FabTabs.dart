import 'package:app/Pages/HomeScreen.dart';
import 'package:app/Pages/LeaderboardPage.dart';
import 'package:app/Pages/ProfilePage.dart';
import 'package:app/Pages/SelectQuizPage.dart';
import 'package:flutter/material.dart';

class Fabtabs extends StatefulWidget {
  final int selectedIndex;

  Fabtabs({Key? key, required this.selectedIndex}) : super(key: key);

  @override
  State<Fabtabs> createState() => _FabtabsState();
}

class _FabtabsState extends State<Fabtabs> {
  int currentIndex = 0;

  Widget buildTabButton(IconData icon, String label, int tabIndex) {
    return MaterialButton(
      minWidth: 0,
      onPressed: () {
        setState(() {
          currentIndex = tabIndex;
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: currentIndex == tabIndex ? const Color(0xff03919B) : Colors.grey,
          ),
          if (currentIndex == tabIndex)
            Text(
              label,
              style: const TextStyle(
                color: Color(0xff03919B),
              ),
            ),
        ],
      ),
    );
  }

  @override
  void initState() {
    currentIndex = widget.selectedIndex;
    super.initState();
  }

  final List<Widget> pages = [
    const HomeScreen(),
    SelectQuizPage(),
    LeaderboardPage(),
    const ProfilePage(),
  ];
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    Widget currentScreen = pages[currentIndex];

    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 4,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildTabButton(Icons.home_filled, "Accueil", 0),
              buildTabButton(Icons.quiz_outlined, "Quiz", 1),
              buildTabButton(Icons.leaderboard_outlined, "Classement", 2),
              buildTabButton(Icons.person, "Profil", 3),
            ],
          ),
        ),
      ),
    );
  }
}
