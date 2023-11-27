import 'package:app/Pages/LoginPage.dart';
import 'package:app/Pages/QuizPage.dart';
import 'package:app/Pages/component/Sidemenu.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isSearchOpen = false;
  List<String> quizTendanceImageUrls = [
    'https://th.bing.com/th/id/R.0e94ad1972d8c83f9cde2128a1257dd1?rik=rWBkXOY099kopg&pid=ImgRaw&r=0',
    'https://th.bing.com/th/id/R.b8efcbdb9db0e01acb3bb93b3d570ec8?rik=FqY6zwwmqhfFkg&pid=ImgRaw&r=0',
    'https://th.bing.com/th/id/OIP.SgsXNrzRmp9rimjYNbk7jQHaJK?pid=ImgDet&rs=1',
    'https://cdn.shopify.com/s/files/1/0590/5858/5777/products/CreationofParadisePitreMaster25pc2021_400x.jpg?v=1641066803',
    'https://i1.sndcdn.com/artworks-lF5j1ZSj0RJxSOmF-WEzSpg-t500x500.jpg',

  ];
  List<String> NouveautesImageUrls = [
    'https://th.bing.com/th/id/R.0e94ad1972d8c83f9cde2128a1257dd1?rik=rWBkXOY099kopg&pid=ImgRaw&r=0',
    'https://th.bing.com/th/id/R.b8efcbdb9db0e01acb3bb93b3d570ec8?rik=FqY6zwwmqhfFkg&pid=ImgRaw&r=0',
    'https://th.bing.com/th/id/OIP.SgsXNrzRmp9rimjYNbk7jQHaJK?pid=ImgDet&rs=1',
    'https://cdn.shopify.com/s/files/1/0590/5858/5777/products/CreationofParadisePitreMaster25pc2021_400x.jpg?v=1641066803',
    'https://i1.sndcdn.com/artworks-lF5j1ZSj0RJxSOmF-WEzSpg-t500x500.jpg',
  ];
  List<String> topPicksImageUrls = [
    'https://th.bing.com/th/id/R.0e94ad1972d8c83f9cde2128a1257dd1?rik=rWBkXOY099kopg&pid=ImgRaw&r=0',
    'https://th.bing.com/th/id/R.b8efcbdb9db0e01acb3bb93b3d570ec8?rik=FqY6zwwmqhfFkg&pid=ImgRaw&r=0',
    'https://th.bing.com/th/id/OIP.SgsXNrzRmp9rimjYNbk7jQHaJK?pid=ImgDet&rs=1',
    'https://cdn.shopify.com/s/files/1/0590/5858/5777/products/CreationofParadisePitreMaster25pc2021_400x.jpg?v=1641066803',
    'https://i1.sndcdn.com/artworks-lF5j1ZSj0RJxSOmF-WEzSpg-t500x500.jpg',
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
        // Ajoutez votre contenu d'événement ici
      ],
    );
  }



  Widget _buildListItem(String title, String imageUrl) {
    return
      InkWell(
        child:Container(
          width: 150,
          height: 200,
          margin: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: Colors.blueGrey,
            borderRadius: BorderRadius.circular(15), // Apply circular border radius to the container
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15), // Apply circular border radius to the image and overlay
            child: Stack(
              children: [
                Image.network(
                  imageUrl,
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
                          fontSize: 20,
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
        ) ,
        onTap: ()=>{
          Navigator.push(
            context,
              MaterialPageRoute(
                  builder: (builder)=>QuizPage()
              )
          )

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
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: topPicksImageUrls.length,
                itemBuilder: (context, index) {
                  return _buildListItem('Quiz $index', topPicksImageUrls[index]);
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Quiz Tendance',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: quizTendanceImageUrls.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    child:_buildListItem('Quiz $index', quizTendanceImageUrls[index]),

                  );

                },
              ),
            ),

            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Nouveautés',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: NouveautesImageUrls.length,
                itemBuilder: (context, index) {
                  return _buildListItem('Quiz $index', NouveautesImageUrls[index]);
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}
