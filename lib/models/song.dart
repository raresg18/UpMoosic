// the class Song will contain informations regarding songs
// such as title, artists and links to the youtube and spotify
// streaming platforms
class Song {
  final String title;
  final String artist;
  final String youtubeUrl;
  final String spotifyUrl;

// here it is the class Constructor
  Song({
    required this.title,
    required this.artist,
    required this.youtubeUrl,
    required this.spotifyUrl,
  });
}