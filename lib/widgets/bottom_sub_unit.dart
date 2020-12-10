import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:auto_size_text/auto_size_text.dart';

class BottomSubUnit extends StatelessWidget {
  final double height, width;
  final String title, value;
  final FaIcon iconVal;
  final Color textColor;
  double desHeight;

  BottomSubUnit(
      {this.width,
      this.height,
      this.title,
      this.value,
      this.iconVal,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    if (title != 'Description') {
      desHeight = height * 0.18;
    } else {
      desHeight = height * 0.15;
    }
    return Container(
      height: height,
      width: width,
      padding:
          EdgeInsets.symmetric(vertical: height * 0.1, horizontal: width * 0.1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: width * 0.05, top: height * 0.05, bottom: height * 0.1),
            child: AutoSizeText(
              '$title:',
              maxLines: 1,
              style: TextStyle(
                  color: textColor,
                  fontSize: height * 0.17,
                  fontWeight: FontWeight.w400),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: height*0.4,
                  width: width * 0.1,
                  child: iconVal,
                ),
                Container(
                  height: height * 0.4,
                  width: width * 0.5,
                  child: AutoSizeText(
                    value,
                    maxLines: 2,
                    style: TextStyle(
                      color: textColor,
                      fontSize: desHeight,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
