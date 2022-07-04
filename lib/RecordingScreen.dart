import 'package:just_audio/just_audio.dart';
import 'package:microphone/microphone.dart';
import 'package:flutter/material.dart';
import 'selectHelp.dart';

enum AudioState { recording, stop, play }

class RecordingScreen extends StatefulWidget {
  @override
  _RecordingScreenState createState() => _RecordingScreenState();
}

class _RecordingScreenState extends State<RecordingScreen> {
  @override
  AudioState audioState;
  MicrophoneRecorder _recorder;
  AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _recorder = MicrophoneRecorder()..init();
  }

  void handleAudioState(AudioState state) {
    setState(
      () {
        if (audioState == null) {
          audioState = AudioState.recording;
          _recorder.start();
        } else if (audioState == AudioState.recording) {
          audioState = AudioState.play;
          _recorder.stop();
        } else if (audioState == AudioState.play) {
          audioState = AudioState.stop;
          _audioPlayer = AudioPlayer();
          _audioPlayer.setUrl(_recorder.value.recording.url).then(
            (_) {
              return _audioPlayer.play().then(
                (_) {
                  setState(() => audioState = AudioState.play);
                },
              );
            },
          );
        } else if (audioState == AudioState.stop) {
          audioState = AudioState.play;
          _audioPlayer.stop();
        }
      },
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SafeArea(
          child: Container(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: new Icon(Icons.arrow_back,
                          color: const Color(0xED000000), size: 30),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => selectHelp(),
                          ),
                        );
                      },
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        padding: EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: handleAudioColour(),
                        ),
                        child: RawMaterialButton(
                          fillColor: Colors.white,
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(30),
                          onPressed: () => handleAudioState(audioState),
                          child: getIcon(audioState),
                        ),
                      ),
                      SizedBox(width: 20),
                      if (audioState == AudioState.play ||
                          audioState == AudioState.stop)
                        Container(
                          padding: EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: RawMaterialButton(
                            fillColor: Colors.white,
                            shape: CircleBorder(),
                            padding: EdgeInsets.all(30),
                            onPressed: () => setState(
                              () {
                                audioState = null;
                                _recorder.dispose();
                                _recorder = MicrophoneRecorder()..init();
                              },
                            ),
                            child: Icon(Icons.replay, size: 50),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Color handleAudioColour() {
    if (audioState == AudioState.recording) {
      return Colors.deepOrangeAccent.shade700.withOpacity(0.5);
    } else if (audioState == AudioState.stop) {
      return Colors.green.shade900;
    } else {
      return Colors.white;
    }
  }

  Icon getIcon(AudioState state) {
    switch (state) {
      case AudioState.play:
        return Icon(Icons.play_arrow, size: 50);
      case AudioState.stop:
        return Icon(Icons.stop, size: 50);
      case AudioState.recording:
        return Icon(Icons.mic, color: Colors.redAccent, size: 50);
      default:
        return Icon(Icons.mic, size: 50);
    }
  }
}
