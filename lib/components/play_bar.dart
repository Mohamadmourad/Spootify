import 'package:flutter/material.dart';
import 'package:mobile_project_1/classes/music.dart';

class PlayBar extends StatefulWidget {
  final Music music;
  final Function play;
  final Function pause;
  final Function moveForward;
  final Function moveBackward;
   final Function onPlay;
   const PlayBar({super.key, required this.music, required this.moveForward, required this.moveBackward, required this.play, required this.pause, required this.onPlay});

  @override
  State<PlayBar> createState() => _PlayBarState();
}

class _PlayBarState extends State<PlayBar> {
  IconData playButton = Icons.pause;
  void playPause(){
    setState(() {
      if(playButton == Icons.play_arrow){
        playButton = Icons.pause;
        widget.play(widget.music.audio);
        widget.onPlay(true);
      }else{
        playButton = Icons.play_arrow;
        widget.pause();
        widget.onPlay(false);
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