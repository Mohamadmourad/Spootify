import 'package:flutter/material.dart';
import 'package:mobile_project_1/classes/music.dart';

class PlayBar extends StatefulWidget {
  final Music music;
  final Function moveForward;
  final Function moveBackward;
  const PlayBar({super.key, required this.music, required this.moveForward, required this.moveBackward});

  @override
  State<PlayBar> createState() => _PlayBarState();
}

class _PlayBarState extends State<PlayBar> {
  IconData playButton = Icons.play_arrow;
  void playPause(){
    setState(() {
      if(playButton == Icons.play_arrow){
        playButton = Icons.pause;
      }else{
        playButton = Icons.play_arrow;
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return  Container(
        width: double.infinity,
        height: 60,
        color: Colors.grey[800],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  widget.music.imageUrl,
                  height: 60,
                  width: 60,
                ),
                const SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.music.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      widget.music.artist,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ],
                )
              ],
            ),
            Row(
              children: [
                IconButton(
                  onPressed: (){
                    widget.moveBackward();
                  },
                  icon: const Icon(
                    Icons.skip_previous,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                IconButton(
                  onPressed: playPause,
                  icon: Icon(
                    playButton,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                IconButton(
                  onPressed: (){
                    widget.moveForward();
                  },
                  icon: const Icon(
                    Icons.skip_next,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ],
            )
          ],
        )
      );
  }
}