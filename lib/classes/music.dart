class Music{
  String title;
  String artist;
  String imageUrl;
  int playsCount;
  String audio;

  Music({
    required this.title, 
    required this.artist, 
    required String imageUrl,
    required this.playsCount,
    required this.audio
  }) : imageUrl = 'lib/assets/music_covers/$imageUrl.png';

  String countFormat() {
    if (playsCount > 1000000) {
      return "${playsCount / 1000000}M";
    } else if (playsCount > 1000) {
      return "${playsCount / 1000}K";
    } else {
      return playsCount.toString();
    }
  }

}
