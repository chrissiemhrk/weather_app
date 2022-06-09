import 'package:flutter/material.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/services/weather_api_client.dart';
import 'package:intl/intl.dart';

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
      home: Scaffold(
        appBar: null,
        body: FutureBuilder(
            future: getCurrentWeatherData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                var now = DateTime.now();
                var formatter = DateFormat.yMMMMd('en_US');
                String date = formatter.format(now);
                return Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/sunny.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 50.0),
                    child: Column(
                      children: [
                        Card(
                            elevation: 1.2,
                            shadowColor: Colors.black,
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 30.0, horizontal: 16.0),
                              child: Column(
                                children: [
                                  (Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        date,
                                        style: const TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        '${currentWeatherData?.location?.name}, ${currentWeatherData?.location?.country}',
                                        style: const TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.w300),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                          '${currentWeatherData?.current?.tempC}°C',
                                          style: const TextStyle(
                                              fontSize: 35,
                                              fontWeight: FontWeight.w500)),
                                      const SizedBox(width: 10),
                                      Text(
                                          '${currentWeatherData?.current?.condition?.text}',
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w300)),
                                    ],
                                  )),
                                  const SizedBox(height: 40),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(Icons.water_drop_outlined),
                                          const SizedBox(width: 8),
                                          Text(
                                              '${currentWeatherData?.current?.humidity}%',
                                              style: const TextStyle(
                                                  fontSize: 16)),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Icon(Icons.air_sharp, size: 30),
                                          const SizedBox(width: 8),
                                          Text(
                                              '${currentWeatherData?.current?.windKph} Kph',
                                              style: const TextStyle(
                                                  fontSize: 16)),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Icon(Icons.cloud_outlined,
                                              size: 30),
                                          const SizedBox(width: 8),
                                          Text(
                                              '${currentWeatherData?.current?.cloud}',
                                              style: const TextStyle(
                                                  fontSize: 16)),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )),
                        const SizedBox(height: 50),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Air Quality',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400)),
                              (currentWeatherData?.current?.airQuality?.usEpaIndex ==
                                      1)
                                  ? const Text('Good',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600))
                                  : (currentWeatherData?.current?.airQuality?.usEpaIndex ==
                                          2)
                                      ? const Text('Moderate',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600))
                                      : (currentWeatherData?.current?.airQuality?.usEpaIndex ==
                                              3)
                                          ? const Text(
                                              'Unhealthy for sensitive group',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600))
                                          : (currentWeatherData
                                                      ?.current
                                                      ?.airQuality
                                                      ?.usEpaIndex ==
                                                  4)
                                              ? const Text('Unhealthy',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600))
                                              : (currentWeatherData
                                                          ?.current
                                                          ?.airQuality
                                                          ?.usEpaIndex ==
                                                      5)
                                                  ? const Text('Very Unhealthy',
                                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600))
                                                  : (currentWeatherData?.current?.airQuality?.usEpaIndex == 6)
                                                      ? const Text('Hazardous', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600))
                                                      : const Text('Unavailable', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                            ],
                          ),
                        ),
                        const SizedBox(height: 50),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
