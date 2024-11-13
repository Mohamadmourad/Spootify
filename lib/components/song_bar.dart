import 'package:flutter/material.dart';
import 'package:mobile_project_1/classes/music.dart';

class SongBar extends StatelessWidget {
  final Music music;
  final Function pickSong;
  final int index;
  const SongBar({super.key,required this.music, required this.pickSong, required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        pickSong(index);
      },
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.grey, width: 1.0), 
            bottom: BorderSide(color: Colors.grey, width: 1.0), 
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  music.imageUrl,
                  height: 60,
                  width: 60,
                ),
                const SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      music.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      music.artist,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                const Icon(
                  Icons.headset,
                  color: Colors.white,
                ),
                Text(
                  music.countFormat(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ],
            )
          ],
        )
      ),
    );
  }
}
