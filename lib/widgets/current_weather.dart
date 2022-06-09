import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CurrentWeather extends StatefulWidget {
  final String? city;
  final double? tempC;
  final String? currentCondition;
  const CurrentWeather({Key? key, this.city, this.tempC, this.currentCondition})
      : super(key: key);

  @override
  State<CurrentWeather> createState() => _CurrentWeatherState();
}

class _CurrentWeatherState extends State<CurrentWeather> {
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formatter = DateFormat.yMMMMd('en_US');
    String date = formatter.format(now);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${widget.city}',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Text(
              date,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text('${widget.tempC}°C',
                style: Theme.of(context).textTheme.bodyText1),
            Text('${widget.currentCondition}',
                style: Theme.of(context).textTheme.bodyText1),
          ],
        ),
      ],
    );
  }
}
