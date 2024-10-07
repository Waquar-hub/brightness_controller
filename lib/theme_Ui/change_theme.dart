import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:screen_brightness/screen_brightness.dart';
import 'package:theme_change/theme_Ui/theme_provider.dart';
class ThemeChangeDemo extends StatefulWidget {
  const ThemeChangeDemo({super.key});
  @override
  State<ThemeChangeDemo> createState() => _ThemeChangeDemoState();
}

class _ThemeChangeDemoState extends State<ThemeChangeDemo> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(builder: (BuildContext context, value, Widget? child) {
      return StreamBuilder(
        stream: ScreenBrightness().onCurrentBrightnessChanged,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if(snapshot.hasData){
              if(snapshot.data <0.4){
                value.makeLight();
              }else{
                value.makeDark();
              }
            }
          });

        return Scaffold(
          backgroundColor:value.isDarkTheme?Colors.grey: Colors.white,
          appBar: AppBar(
            title: const Text('Theme Change Demo'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Lottie animation for visual feedback
                Lottie.asset(
                  value.isDarkTheme
                      ? 'assets/dark_theme_animation.json'
                      : 'assets/light_theme_animation.json',
                  height: 150,
                ),
                const SizedBox(height: 30),

                // Card to display the current theme
                Card(
                  color:value.isDarkTheme? Colors.black:Colors.white,
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      'Current Theme: ${value.isDarkTheme ? 'Dark' : 'Light'}',
                      style: TextStyle(fontSize: 20,color:value.isDarkTheme? Colors.white:Colors.black),
                    ),
                  ),
                ),
                // Card to display the current theme
                SizedBox(height: 100),
                // Beautifully styled button to toggle theme
              ],
            ),
          ),
        );
      },);
    },);
  }
}


