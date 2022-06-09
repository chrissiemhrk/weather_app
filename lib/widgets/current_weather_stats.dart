import 'package:flutter/material.dart';

class CurrentWeatherStats extends StatefulWidget {
  final int? humidity;
  final double? wind;
  final int? cloud;
  const CurrentWeatherStats({Key? key, this.cloud, this.humidity, this.wind})
      : super(key: key);

  @override
  State<CurrentWeatherStats> createState() => _CurrentWeatherStatsState();
}

class _CurrentWeatherStatsState extends State<CurrentWeatherStats> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(
              Icons.water_drop_outlined,
              size: 20,
              color: Colors.white,
            ),
            const SizedBox(width: 8),
            Text('${widget.humidity}%',
                style: Theme.of(context).textTheme.bodyText1),
          ],
        ),
        Row(
          children: [
            const Icon(
              Icons.air_sharp,
              size: 20,
              color: Colors.white,
            ),
            const SizedBox(width: 8),
            Text('${widget.wind} Kph',
                style: Theme.of(context).textTheme.bodyText1),
          ],
        ),
        Row(
          children: [
            const Icon(
              Icons.cloud_outlined,
              size: 20,
              color: Colors.white,
            ),
            const SizedBox(width: 8),
            Text('${widget.cloud}%',
                style: Theme.of(context).textTheme.bodyText1),
          ],
        ),
      ],
    );
  }
}
