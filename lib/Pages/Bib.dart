import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Bib extends StatefulWidget {
  @override
  _BibliothequeState createState() => _BibliothequeState();
}

class _BibliothequeState extends State<Bib> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: 'GVgvu6wosQk', // Replace with your YouTube video ID
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bibliothèque'),
      ),
      body: Stack(
        children: [
          // Background Image
          Image.asset(
            'lib/images/bluebackground.png', // Replace with your image path
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),

          // Video Player
          Center(
            child: YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              onReady: () {
                // You can do some action when the video is ready
              },
            ),
          ),

          // Title
          Positioned(
            top: 50.0, // Adjust the position as needed
            left: 20.0,
            right: 20.0,
            child: Text(
              'PharmaQuiz',
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controller.value.isPlaying ? _controller.pause() : _controller.play();
        },
        child: Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
      ),
    );
  }
}
