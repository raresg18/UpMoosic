import 'package:flutter/material.dart';
import 'playlist.dart';
import 'song.dart';
import 'dart:math';
import 'package:url_launcher/url_launcher.dart';
import 'quotes.dart';

class PlaylistScreen extends StatefulWidget {
  final int mood;

  const PlaylistScreen({Key? key, required this.mood}) : super(key: key);

  @override
  _PlaylistScreenState createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  String? randomQuote; // Variable to store the random quote when the button is pressed
  bool quoteDisplayed = false; // Flag to check if the quote has already been displayed
  late final Song randomSong; // Store the song so it doesn't change

  // Function to launch URL (YouTube or Spotify)
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Cannot open $url';
    }
  }

  // Function to display a random quote based on mood
  void showRandomQuote() {
    if (quoteDisplayed) return; // If quote has already been shown, do nothing

    Map<int, String> selectedQuote = {};

    // Select the appropriate quote map based on mood
    if (widget.mood == 1) {
      selectedQuote = HappyQuotes;
    } else if (widget.mood == 2) {
      selectedQuote = SadQuotes;
    } else if (widget.mood == 3) {
      selectedQuote = RelaxedQuotes;
    } else if (widget.mood == 4) {
      selectedQuote = EnergeticQuotes;
    } else if (widget.mood == 5) {
      selectedQuote = MotivatedQuotes;
    } else if (widget.mood == 6) {
      selectedQuote = StressedQuotes;
    } else if (widget.mood == 7) {
      selectedQuote = NostalgicQuotes;
    } else if (widget.mood == 8) {
      selectedQuote = FocusedQuotes;
    }

    // Generate a random index and fetch a random quote
    final randomIndex = Random().nextInt(selectedQuote.length) + 1;
    final randomQuoteSelected = selectedQuote[randomIndex] ?? "Stay positive!";

    // Update the UI with the new quote
    setState(() {
      randomQuote = randomQuoteSelected;
      quoteDisplayed = true; // Mark that the quote has been shown
    });
  }

  @override
  void initState() {
    super.initState();

    // Select playlist based on mood
    List<Song> selectedPlaylist = [];
    if (widget.mood == 1) {
      selectedPlaylist = playlistHappy; // Happy playlist
    } else if (widget.mood == 2) {
      selectedPlaylist = playlistSad; // Sad playlist
    } else if (widget.mood == 3) {
      selectedPlaylist = playlistRelaxed; // Relaxed playlist
    } else if (widget.mood == 4) {
      selectedPlaylist = playlistEnergetic; // Energetic playlist
    } else if (widget.mood == 5) {
      selectedPlaylist = playlistMotivated; // Motivated playlist
    } else if (widget.mood == 6) {
      selectedPlaylist = playlistStressed; // Stress-Free playlist
    } else if (widget.mood == 7) {
      selectedPlaylist = playlistNostalgic; // Nostalgic playlist
    } else if (widget.mood == 8) {
      selectedPlaylist = playlistFocused; // Focused playlist
    }

    // Select a random song from the playlist (store it in a final variable)
    final randomSongIndex = Random().nextInt(selectedPlaylist.length);
    randomSong = selectedPlaylist[randomSongIndex]; // This song won't change after initial selection
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Melodie recomandată'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            // Display the random song (song won't change)
            Text(
              'Melodie: ${randomSong.title}\nArtist: ${randomSong.artist}',
              style: TextStyle(fontSize: 25),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 150),

            // Display the random quote when it is available (only after button press)
            if (randomQuote != null)
              Text(
                '"$randomQuote"', // Display the random quote
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black54,
                  fontStyle: FontStyle.italic, // Styling the quote
                ),
                textAlign: TextAlign.center,
              ),

            // Button to show the quote
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: ElevatedButton(
                onPressed: showRandomQuote,
                child: Text('Quote Me'),
              ),
            ),

            // Buttons for YouTube and Spotify
            Padding(
              padding: const EdgeInsets.only(top: 40.0), // Adds space above the buttons
              child: ElevatedButton(
                onPressed: () {
                  _launchURL(randomSong.youtubeUrl); // Open song on YouTube
                },
                child: const Text('Ascultă pe YouTube'),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 20.0), // Adds space between buttons
              child: ElevatedButton(
                onPressed: () {
                  _launchURL(randomSong.spotifyUrl); // Open song on Spotify
                },
                child: const Text('Ascultă pe Spotify'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
