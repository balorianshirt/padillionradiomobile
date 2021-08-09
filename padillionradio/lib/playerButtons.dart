import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/audiofile.dart';

class PlayerControls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Controls(
            icon: Icons.repeat,
          ),
          Controls(
            icon: Icons.skip_previous,
          ),
          PlayControl(),
          Controls(
            icon: Icons.skip_next,
          ),
          Controls(
            icon: Icons.shuffle,
          ),
        ],
      ),
    );
  }
}

class PlayControl extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final audioFile = ModalRoute.of(context)!.settings.arguments as AudioFile;

    return
      Consumer<MyAudio>(
        builder: (_, myAudioModel, child)=>
            GestureDetector(
              onTap: (){
                myAudioModel.audioState=="Playing"? myAudioModel.pauseAudio():myAudioModel.playAudio();
              },
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: Color(0xffedd3cb),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xff6f3d2e).withOpacity(0.5),
                        offset: Offset(5, 10),
                        spreadRadius: 3,
                        blurRadius: 10),
                    BoxShadow(
                        color: Colors.white,
                        offset: Offset(-3, -4),
                        spreadRadius: -2,
                        blurRadius: 20)
                  ],
                ),
                child: Stack(
                  children: <Widget>[
                    Center(
                      child: Container(
                        margin: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                            color: Color(0xff6f3d2e),
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0xff6f3d2e).withOpacity(0.5),
                                  offset: Offset(5, 10),
                                  spreadRadius: 3,
                                  blurRadius: 10),
                              BoxShadow(
                                  color: Colors.white,
                                  offset: Offset(-3, -4),
                                  spreadRadius: -2,
                                  blurRadius: 20)
                            ]),
                      ),
                    ),
                    Center(
                      child: Container(
                        margin: EdgeInsets.all(12),
                        decoration:
                        BoxDecoration(color: Color(0xffedd3cb), shape: BoxShape.circle),
                        child: Center(
                            child: Icon(
                              myAudioModel.audioState=="Playing"?Icons.pause: Icons.play_arrow,
                              size: 50,
                              color:  Color(0xff6f3d2e),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
      );
  }
}

class Controls extends StatelessWidget {
  final IconData icon;

  const Controls({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: Color(0xffedd3cb),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
              color:  Color(0xff6f3d2e).withOpacity(0.5),
              offset: Offset(5, 10),
              spreadRadius: 3,
              blurRadius: 10),
          BoxShadow(
              color: Colors.white,
              offset: Offset(-3, -4),
              spreadRadius: -2,
              blurRadius: 20)
        ],
      ),
      child: Stack(
        children: <Widget>[
          Center(
            child: Container(
              margin: EdgeInsets.all(6),
              decoration: BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        color:  Color(0xff6f3d2e).withOpacity(0.5),
                        offset: Offset(5, 10),
                        spreadRadius: 3,
                        blurRadius: 10),
                    BoxShadow(
                        color: Colors.white,
                        offset: Offset(-3, -4),
                        spreadRadius: -2,
                        blurRadius: 20)
                  ]),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.all(10),
              decoration:
              BoxDecoration(color: Color(0xffedd3cb), shape: BoxShape.circle),
              child: Center(
                  child: Icon(
                    icon,
                    size: 30,
                    color:  Color(0xff6f3d2e),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
