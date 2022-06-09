import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/services/weather_api_client.dart';
import 'package:weather_app/widgets/air_quality.dart';
import 'package:weather_app/widgets/current_weather.dart';
import 'package:weather_app/widgets/current_weather_stats.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  WeatherApiClient client = WeatherApiClient();
  Weather? currentWeatherData;
  final now = DateTime.now();
  Future<void> getCurrentWeatherData() async {
    currentWeatherData = await client.fetchCurrentWeather('Kigali');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          headline6: TextStyle(
              fontSize: 24, fontWeight: FontWeight.w500, color: Colors.white),
          bodyText1: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
      home: Scaffold(
        appBar: null,
        body: FutureBuilder(
            future: getCurrentWeatherData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/cloudy.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.1),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 50.0),
                        child: Column(
                          children: [
                            CurrentWeather(
                              city: currentWeatherData?.location?.name,
                              tempC: currentWeatherData?.current?.tempC,
                              currentCondition:
                                  currentWeatherData?.current?.condition?.text,
                            ),
                            const SizedBox(height: 40),
                            CurrentWeatherStats(
                              humidity: currentWeatherData?.current?.humidity,
                              wind: currentWeatherData?.current?.windKph,
                              cloud: currentWeatherData?.current?.cloud,
                            ),
                            const SizedBox(height: 50),
                            AirQualityWidget(
                              usEpaIndex: currentWeatherData
                                  ?.current?.airQuality?.usEpaIndex,
                            ),
                            const SizedBox(height: 50),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    children: [
                                      const Text('Monday',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16)),
                                      const Spacer(),
                                      Row(
                                        children: const [
                                          Icon(
                                            Icons.wb_sunny_sharp,
                                            size: 30,
                                            color: Colors.amber,
                                          ),
                                          SizedBox(width: 8),
                                          Text('Sunny',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w300,
                                                  fontSize: 16)),
                                        ],
                                      ),
                                      const Spacer(),
                                      const Text('17/05/2022',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16)),
                                    ],
                                  ),
                                  const SizedBox(height: 25),
                                  Row(
                                    children: [
                                      const Text('Monday',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16)),
                                      const Spacer(),
                                      Row(
                                        children: const [
                                          Icon(
                                            Icons.wb_sunny_sharp,
                                            size: 30,
                                            color: Colors.amber,
                                          ),
                                          SizedBox(width: 8),
                                          Text('Sunny',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w300,
                                                  fontSize: 16)),
                                        ],
                                      ),
                                      const Spacer(),
                                      const Text('17/05/2022',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16)),
                                    ],
                                  ),
                                  const SizedBox(height: 25),
                                  Row(
                                    children: [
                                      const Text('Monday',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16)),
                                      const Spacer(),
                                      Row(
                                        children: const [
                                          Icon(
                                            Icons.wb_sunny_sharp,
                                            size: 30,
                                            color: Colors.amber,
                                          ),
                                          SizedBox(width: 8),
                                          Text('Sunny',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w300,
                                                  fontSize: 16)),
                                        ],
                                      ),
                                      const Spacer(),
                                      const Text('17/05/2022',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16)),
                                    ],
                                  ),
                                  const SizedBox(height: 25),
                                  Row(
                                    children: [
                                      const Text('Monday',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16)),
                                      const Spacer(),
                                      Row(
                                        children: const [
                                          Icon(
                                            Icons.wb_sunny_sharp,
                                            size: 30,
                                            color: Colors.amber,
                                          ),
                                          SizedBox(width: 8),
                                          Text('Sunny',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w300,
                                                  fontSize: 16)),
                                        ],
                                      ),
                                      const Spacer(),
                                      const Text('17/05/2022',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16)),
                                    ],
                                  ),
                                  const SizedBox(height: 25),
                                  Row(
                                    children: [
                                      const Text('Monday',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16)),
                                      const Spacer(),
                                      Row(
                                        children: const [
                                          Icon(
                                            Icons.wb_sunny_sharp,
                                            size: 30,
                                            color: Colors.amber,
                                          ),
                                          SizedBox(width: 8),
                                          Text('Sunny',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w300,
                                                  fontSize: 16)),
                                        ],
                                      ),
                                      const Spacer(),
                                      const Text('17/05/2022',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16)),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }
              return const Center(
                child: Text('Loading...'),
              );
            }),
      ),
    );
  }
}
