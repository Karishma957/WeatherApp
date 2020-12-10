import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './bottom_sub_unit.dart';

class BottomDisplay extends StatelessWidget {
  final double height, width;
  final Color textColor;
  final String weather, description, humidity, windSpeed;

  BottomDisplay(
      {this.height,
      this.width,
      this.textColor,
      this.weather,
      this.windSpeed,
      this.humidity,
      this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: Column(
        children: [
          Row(
            children: [
              BottomSubUnit(
                width: width * 0.5,
                height: height * 0.5,
                title: 'Weather',
                value: weather,
                iconVal: FaIcon(
                  FontAwesomeIcons.cloud,
                  color: textColor,
                ),
                textColor: textColor,
              ),
              BottomSubUnit(
                width: width * 0.5,
                height: height * 0.5,
                title: 'Description',
                value: description,
                iconVal: FaIcon(
                  weather == 'Clouds'
                      ? FontAwesomeIcons.cloud
                      : (weather == 'Thunderstorm' ||
                              weather == 'Drizzle' ||
                              weather == 'Rain')
                          ? FontAwesomeIcons.cloudRain
                          : weather == 'Snow'
                              ? FontAwesomeIcons.snowflake
                              : weather == 'Clear'
                                  ? FontAwesomeIcons.solidSun
                                  : FontAwesomeIcons.square,
                  color: textColor,
                ),
                textColor: textColor,
              )
            ],
          ),
          Row(
            children: [
              BottomSubUnit(
                width: width * 0.5,
                height: height * 0.5,
                title: 'Humidity',
                value: humidity,
                iconVal: FaIcon(
                  FontAwesomeIcons.sun,
                  color: textColor,
                ),
                textColor: textColor,
              ),
              BottomSubUnit(
                width: width * 0.5,
                height: height * 0.5,
                title: 'Wind speed',
                value: windSpeed,
                iconVal: FaIcon(
                  FontAwesomeIcons.wind,
                  color: textColor,
                ),
                textColor: textColor,
              )
            ],
          ),
        ],
      ),
    );
  }
}
