import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class AnimationWidget extends StatelessWidget {
  final String animationFolder;
  final String animationName;
  final double height;
  AnimationWidget({this.animationFolder,this.animationName,this.height});
  @override
  Widget build(BuildContext context) {
    return Container(
      height:height * 0.3,
      width:height * 0.3,
      child: FlareActor(
        animationFolder,
        alignment: Alignment.center,
        fit: BoxFit.contain,
        animation: animationName,
        shouldClip: true,

      ),
    );
  }
}
