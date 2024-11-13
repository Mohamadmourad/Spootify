import 'package:flutter/material.dart';
import 'package:mobile_project_1/classes/music.dart';

class BigSongBtn extends StatelessWidget {
  final Music music;
  final Function pickSong;
  final int index;
  const BigSongBtn({super.key,required this.music, required this.pickSong, required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        pickSong(index);
      },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                music.imageUrl,
                height: 180,
                width: 180,
                ),
            ),
            const SizedBox(height: 10),
            Text(
              music.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              music.artist,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        )
      );
  }
}
