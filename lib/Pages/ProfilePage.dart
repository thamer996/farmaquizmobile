import 'package:flutter/material.dart';
import 'package:app/Pages/EditPage.dart';
import 'package:app/Pages/settings.dart';

import 'component/Sidemenu.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidemenu(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 8,
        automaticallyImplyLeading: false,
        title: const Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 0.0),
              child: Text(
                'Profil',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
            Spacer(),
            Center(
              child: SizedBox(
                height: 90,
                width: 90,
                child: Image(
                  image: AssetImage('lib/images/applogo.png'),
                ),
              ),
            ),
            Spacer(),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.black),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Settings()));
            },
          ),
        ],
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/images/bluebackground.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(35),
                child: Container(
                  width: double.infinity,
                  height: 185,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage('lib/images/background.png'),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 16.0),
                    child: CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage('lib/images/profile_pic.png'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'User Name',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        '@user_tag',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const EditPage()));
                      },
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xff03919B),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text(
                        'Modifier le profil',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const TabBar(
                indicatorColor: Color(0xff03919B),
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(text: "Score"),
                  Tab(text: "Badges"),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    SingleChildScrollView(
                      child: ScoreTabContent(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ScoreTabContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildScoreCard("Total de Quiz joués", "0"),
                const SizedBox(width: 20),
                _buildScoreCard("Série de victoires", "0"),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildScoreCard("Accomplissements", "0"),
                const SizedBox(width: 20),
                _buildScoreCard("Rang", "Gold"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScoreCard(String title, String value) {
    return Container(
      width: 160, // Adjusted width
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20), // Adjusted padding
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6),
              Text(
                value,
                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
