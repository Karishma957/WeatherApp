import 'package:flutter/material.dart';
import '../widgets/animation_widget.dart';
import '../widgets/top_display.dart';
import '../widgets/bottom_display.dart';
import '../services/weather_info.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map dataMap = {};
  WeatherInfo data, inputInfo;
  int check = 0;
  final fieldText = TextEditingController();
  String animation_folder, animation_name;

  @override
  Widget build(BuildContext context) {
    dataMap = ModalRoute.of(context).settings.arguments;

    void onTextFieldSubmitted(String input) async {
      inputInfo = WeatherInfo(location: input);
      await inputInfo.getWeather();
      fieldText.clear();
      if (inputInfo.time != 'error caught') {
        setState(() {
          check += 1;
          data = inputInfo;
        });
      } else {
        Alert(
            context: context,
            title: 'Could not find $input',
            desc:
                'City $input entered does not exist \nOr check your internet connection',
            buttons: [
              DialogButton(
                color: Colors.deepPurple,
                child: Text('Ok',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    )),
                onPressed: () => Navigator.pop(context),
              ),
            ]).show();
      }
    }

    if (check == 0) {
      data = dataMap['object'];
    }

    double heightTotal = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double safePadding = MediaQuery.of(context).padding.top;
    double height = heightTotal - safePadding;

    Color textColor, backColor;
    if (data.isWhatTime == 'morning') {
      textColor = Colors.black;
      backColor = Colors.lightBlue;
    } else if (data.isWhatTime == 'evening') {
      textColor = Colors.brown[900];
      backColor = Colors.indigoAccent;
    } else {
      textColor = Colors.white;
      backColor = Colors.indigo;
    }

    if (data.isWhatWeather == 'rain') {
      animation_folder = 'assets/animations/panda_rainy.flr';
      animation_name = 'rainy_panda';
    } else if (data.isWhatWeather == 'cold') {
      animation_folder = 'assets/animations/panda_winter.flr';
      animation_name = 'winter_panda';
    } else if (data.isWhatWeather == 'hot') {
      animation_folder = 'assets/animations/panda_summer.flr';
      animation_name = 'summer_panda';
    }else if(data.isWhatWeather=='clouds') {
      animation_folder='assets/animations/panda_clouds.flr';
      animation_name='clouds_panda';
    }
    else {
      animation_folder = 'assets/animations/Panda_mist.flr';
      animation_name = 'mist_panda';
    }

    return Scaffold(
      backgroundColor: backColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage(data.isWhatTime == 'morning'
                  ? 'assets/images/daysky.jpg'
                  : data.isWhatTime == 'evening'
                      ? 'assets/images/eveningsky.jpg'
                      : 'assets/images/Nightsky.jpg'),
              fit: BoxFit.cover,
            )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: height * 0.07,
                  width: width,
                  child: Container(
                    margin:
                        EdgeInsets.only(top: 7, left: 20, right: 20, bottom: 5),
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TextField(
                      autocorrect: true,
                      controller: fieldText,
                      onSubmitted: (String input) {
                        onTextFieldSubmitted(input);
                      },
                      style: TextStyle(fontSize: 18, color: Colors.black87),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.black87,
                          size: 25,
                        ),
                        alignLabelWithHint: mounted,
                        hintText: 'Enter City name',
                        hintStyle:
                            TextStyle(fontSize: 18, color: Colors.black87),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: height * 0.015, horizontal: 0),
                    child: TopDisplay(
                      height: height * 0.20,
                      width: width,
                      cityName: data.location,
                      temperature: '${data.temperature}\u00B0C',
                      time: data.time,
                      textColor: textColor,
                    ),
                  ),
                ),
                Container(
                  height: height * 0.3, //remove
                  width: width, //remove
                  child: Container(
                    child: AnimationWidget(animationFolder: animation_folder,animationName: animation_name,height:height*0.3)
                  ),
                ),
                Container(
                  child: BottomDisplay(
                    height: height * 0.4,
                    width: width,
                    textColor: textColor,
                    description: data.description,
                    humidity: data.humidity.toString(),
                    weather: data.weather,
                    windSpeed: data.windSpeed.toString(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
