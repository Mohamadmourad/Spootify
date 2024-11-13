import 'package:flutter/material.dart';
import 'package:mobile_project_1/classes/music.dart';
import 'package:mobile_project_1/components/big_song_btn.dart';
import 'package:mobile_project_1/components/play_bar.dart';
import 'package:mobile_project_1/components/song_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int songIndex = 0;

   void pickSong(int index){
    setState(() {
      songIndex = index;
      showPlayBar = true;
      playingMusic = musicList[songIndex];
    });
  }

  void moveForward(){
    setState(() {
      if(songIndex < musicList.length - 1){
        songIndex++;
        playingMusic = musicList[songIndex];
      }
    });
  }
  void moveBackward(){
    setState(() {
      if(songIndex > 0){
        songIndex--;
        playingMusic = musicList[songIndex];
      }
    });
  }
  bool showPlayBar = false;
  String samir = "";
  List<Music> musicList= 
  [
  Music(title: "Dim Lights",artist: "The weeknd",imageUrl: "dimLights",playsCount:1000000,),
  Music(title: "Min Samir ?",artist: "Tamer Hosny",imageUrl: "tamer",playsCount:3200,),
  Music(title: "My Pickels",artist: "Wael Mokhalallate",imageUrl: "pickels",playsCount:243,),
  Music(title: "Maestro",artist: "Magnus Carlsen",imageUrl: "magnus",playsCount:300000,),
];
late Music playingMusic;
 @override
  void initState() {
    super.initState();
    playingMusic = musicList[songIndex];  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'lib/assets/logo.png',
              height: 60,
              width: 60,
              ),
              Text(
                "Spootify",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[900],
                ),
              )
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
       ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),
               Text(
                "What's recomended for you ? $samir",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 30),
              ListView.builder(
                itemCount: musicList.length, 
                shrinkWrap: true, 
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      if(index == 0)
                       Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                        BigSongBtn(music: musicList[index], pickSong: pickSong, index: index),
                        const SizedBox(width: 10),
                        BigSongBtn(music: musicList[index + 1], pickSong: pickSong, index: index + 1),
                       ],)
                       else if(index == 2)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                          BigSongBtn(music: musicList[index], pickSong: pickSong, index: index),
                          const SizedBox(width: 10),
                          BigSongBtn(music: musicList[index + 1], pickSong: pickSong, index: index + 1),
                        ],)
                        else
                        const SizedBox(height: 20)   // i know its spagetti code but atleast its working :)
                        
                    ],
                  );
                }
                ),
                const SizedBox(height: 20),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                     Text(
                      "Hot This Week",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // SongBar(),
                ListView.builder(
                itemCount: musicList.length, 
                shrinkWrap: true, 
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      SongBar(music: musicList[index], pickSong: pickSong, index: index),
                      const SizedBox(height: 5),
                    ],
                  );
                }
                ),
                const SizedBox(height: 70),
            ],
          ),
        ),
      ),
      bottomSheet: showPlayBar ?  PlayBar(
      music: playingMusic,
      moveForward: moveForward,
      moveBackward: moveBackward,
      ) : null,
    );
  }
}