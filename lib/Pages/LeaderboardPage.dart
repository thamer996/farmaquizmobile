import 'package:flutter/material.dart';

import 'component/Sidemenu.dart';

class User {
  final String username;
  final String profileImageUrl;
  final int rank;

  User({required this.username, required this.profileImageUrl, required this.rank});
}

class LeaderboardPage extends StatelessWidget {
  final List<User> otherUsers = [
    User(username: "User 1", profileImageUrl: "https://th.bing.com/th/id/R.581eb679a50357ed30ad0d7544081ec6?rik=54dcWNzgeTMHEg&pid=ImgRaw&r=0", rank: 2),
    User(username: "User 2", profileImageUrl: "https://th.bing.com/th/id/R.581eb679a50357ed30ad0d7544081ec6?rik=54dcWNzgeTMHEg&pid=ImgRaw&r=0", rank: 3),
    User(username: "User 3", profileImageUrl: "https://th.bing.com/th/id/R.581eb679a50357ed30ad0d7544081ec6?rik=54dcWNzgeTMHEg&pid=ImgRaw&r=0", rank: 1),
    User(username: "User 4", profileImageUrl: "https://th.bing.com/th/id/R.581eb679a50357ed30ad0d7544081ec6?rik=54dcWNzgeTMHEg&pid=ImgRaw&r=0", rank: 4),
  ];

  @override
  Widget build(BuildContext context) {
    // Sort users based on their ranks
    otherUsers.sort((a, b) => a.rank.compareTo(b.rank));

    return Scaffold(
      drawer: Sidemenu(),
      appBar: AppBar(
        backgroundColor: const Color(0xff03919B),
        title: const Text("Classment"),
        centerTitle: true,
        automaticallyImplyLeading: false, // Remove the back arrow
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage("https://th.bing.com/th/id/OIP.laXJdbmYhr3anACiKjlJogAAAA?pid=ImgDet&rs=1"),
            ),
            const SizedBox(height: 10),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Dhia",
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Mori11",
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
                Text(
                  "Rank:#2",
                  style: TextStyle(fontSize: 15, color: Colors.black),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Expanded(child: SingleChildScrollView(
              child:ListView.builder(
                shrinkWrap: true,
                itemCount: otherUsers.length,
                itemBuilder: (context, index) {
                  final user = otherUsers[index];

                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
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
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(user.profileImageUrl),
                      ),
                      title: Text(user.username),
                      subtitle: Text("Rank:# ${user.rank}"),
                    ),
                  );
                },
              ) ,
            ))

            ,
          ],
        ),
      ),
    );
  }
}
