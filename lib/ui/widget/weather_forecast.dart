import 'package:flutter/material.dart';
import 'package:kevych_test_task/enum/weather_code.dart';
import 'package:kevych_test_task/extension/weather_extension.dart';
import 'package:kevych_test_task/mapper/weather_icon_mapper.dart';
import 'package:kevych_test_task/ui/controller/weather_controller.dart';
import 'package:kevych_test_task/ui/widget/glossy_background.dart';
import 'package:provider/provider.dart';

class WeatherForecast extends StatefulWidget {
  const WeatherForecast({super.key});

  @override
  State<WeatherForecast> createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast> {
  @override
  Widget build(BuildContext context) {
    final weatherController = context.watch<WeatherController>();
    final dailyWeather = weatherController.weather?.dailyWeather;
    const double fontSize = 20;


    return SizedBox(
      height: MediaQuery.of(context).size.height*0.2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: dailyWeather?.time.length,
        itemBuilder: (context, index) {
           double avgHumidity = 0;
           final maxHumidity = dailyWeather?.relativeHumidity2mMax[index];
           final mixHumidity = dailyWeather?.relativeHumidity2mMin[index];
           final weatherCode = dailyWeather?.weatherCode;
           WeatherType weatherCodes = WeatherType.unknown;
           if(weatherCode != null){
             weatherCodes = WeatherCodeMapper.fromCode(weatherCode[index]);
           }

           if(maxHumidity != null && mixHumidity != null){
            avgHumidity = (maxHumidity + mixHumidity)/2;
          }
          return Container(
            width: MediaQuery.of(context).size.width*0.5,
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GlossyBackground(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(weatherCodes.icon, size: 40,color: Colors.white,),
                    Text('Date ${dailyWeather?.time[index]}',style: TextStyle(fontSize: fontSize,color: Colors.white),),
                    Text('Humidity $avgHumidity%',style: TextStyle(fontSize: fontSize,color: Colors.white),),
                    Text('Min ${dailyWeather?.temperature2mMin[index]}°C',style: TextStyle(fontSize: fontSize,color: Colors.white)),
                    Text('Max ${dailyWeather?.temperature2mMax[index]}°C',style: TextStyle(fontSize: fontSize,color: Colors.white)),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
