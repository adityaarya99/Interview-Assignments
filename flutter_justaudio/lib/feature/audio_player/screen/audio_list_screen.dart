import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:testplayer/feature/audio_player/cubit/audio_player_cubit.dart';
import 'package:testplayer/feature/audio_player/cubit/audio_player_state.dart';
import 'package:testplayer/feature/audio_player/screen/app_audio_player.dart';
import 'package:testplayer/common/widgets/audio_tile_widget.dart';

class AudioListScreen extends StatelessWidget {
  final List<String> audioFiles;
  AudioListScreen({super.key, required this.audioFiles});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Text('Audio Files (${audioFiles.length})'),
      ),
      body: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 12,
                ),
                ...List.generate(
                    audioFiles.length,
                    (index) => BlocConsumer<AudioPlayerCubit, AudioPlayerState>(
                          listener: (context, state) {
                            if(state is DisposeAudioPlayer){
                              // state.audioPlayer.dispose();
                            }
                          },
                          builder: (context, state) {
                            return ListTileWidget(
                              onTap: () {
                                globalAudioPlayer.dispose();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AppAudioPlayer(
                                              filePath: audioFiles[index],
                                              index: index,
                                            )));
                              },
                              index: index,
                              fileName: audioFiles[index],
                              isAudio: true,
                            );
                          },
                        )),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const AppAudioPlayer(filePath: '',index: 0,)));
        },
        child: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}