import '../widgets/animation_widget.dart';
import 'package:flutter/material.dart';
import '../services/weather_info.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void setupWeather() async {
    WeatherInfo instance = WeatherInfo(location: 'Pune');
    await instance.getWeather();
    if (instance.weather != null) {
      Navigator.pushReplacementNamed(context, '/home',
          arguments: {'object': instance});
    } else {
      Alert(
          context: context,
          title: 'Connectivity issue!',
          desc: 'No internet connection',
          buttons: [
            DialogButton(
              color: Colors.deepPurple,
              child: Text('Ok',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  )),
              onPressed: () => Navigator.pushReplacementNamed(context, '/'),
            ),
          ]).show();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setupWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimationWidget(
          height: 500,
          animationFolder: 'assets/animations/panda_loading.flr',
          animationName: 'loading',
        ),
      ),
    );
  }
}
