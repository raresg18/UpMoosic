import 'package:flutter/material.dart';
import 'playlist.dart';
import 'song.dart';
import 'dart:math';
import 'package:url_launcher/url_launcher.dart';


class PlaylistScreen extends StatelessWidget {
  final int mood;

  const PlaylistScreen({Key? key, required this.mood}) : super(key: key);

  // Funcție pentru a lansa URL-urile YouTube sau Spotify
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Cannot open $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Song> selectedPlaylist = [];
    if (mood == 1) {
      selectedPlaylist = playlistHappy; // Happy playlist
    } else if (mood == 2) {
      selectedPlaylist = playlistSad; // Sad playlist
    } else if (mood == 3) {
      selectedPlaylist = playlistRelaxed; // Relaxed playlist
    } else if (mood == 4) {
      selectedPlaylist = playlistEnergetic; // Energetic playlist
    } else if (mood == 5) {
      selectedPlaylist = playlistMotivated; // Motivated playlist
    } else if (mood == 6) {
      selectedPlaylist = playlistStressed; // Stress-Free playlist
    } else if (mood == 7) {
      selectedPlaylist = playlistNostalgic; // Nostalgic playlist
    } else if (mood == 8) {
      selectedPlaylist = playlistFocused; // Concentrate playlist
    }

    // Selectează o melodie aleatorie din playlist
    final randomIndex = Random().nextInt(selectedPlaylist.length); // Alege un index aleatoriu
    final randomSong = selectedPlaylist[randomIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text('Melodie recomandată'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Afișează melodia aleatorie
            Text(
              'Melodie: ${randomSong.title}\nArtist: ${randomSong.artist}',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _launchURL(randomSong.youtubeUrl); // Deschide melodia pe YouTube
              },
              child: const Text('Ascultă pe YouTube'),
            ),
            ElevatedButton(
              onPressed: () {
                _launchURL(randomSong.spotifyUrl); // Deschide melodia pe Spotify
              },
              child: const Text('Ascultă pe Spotify'),
            ),
          ],
        ),
      ),
    );
  }
}
