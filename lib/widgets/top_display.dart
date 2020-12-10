import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class TopDisplay extends StatelessWidget {
  final double height;
  final double width;
  final String cityName,time,temperature;
  final Color textColor;


  TopDisplay({this.height, this.width,this.time,this.cityName,this.temperature,this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: Column(
        children: [
          Container(
            height: height * 0.5,
            padding: EdgeInsets.only(
                top: height * 0.1, left: 5, right: 5, bottom: height * 0.05),
            child: AutoSizeText(
              cityName.toUpperCase(),
              maxLines: 1,
              style: TextStyle(
                  color: textColor,
                  fontSize: height * 0.35,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 6),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: width * 0.15,vertical: height*0.10),
            child: AutoSizeText(
              '$time , $temperature',
              maxLines: 1,
              style: TextStyle(
                color: textColor,
                  fontSize: height * 0.20,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1),overflow: TextOverflow.clip,
            ),
          ),
        ],
      ),
    );
  }
}
