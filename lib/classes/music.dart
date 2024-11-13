class Music{
  String title;
  String artist;
  String imageUrl;
  int playsCount;

  Music({
    required this.title, 
    required this.artist, 
    required String imageUrl,
    required this.playsCount,
  }) : imageUrl = 'lib/assets/music_covers/$imageUrl.png';

  String countFormat() {
    if (playsCount > 1000000) {
      return (playsCount / 1000000).toString() + "M";
    } else if (playsCount > 1000) {
      return (playsCount / 1000).toString() + "K";
    } else {
      return playsCount.toString();
    }
  }

}
