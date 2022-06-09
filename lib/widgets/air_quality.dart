import 'package:flutter/material.dart';

class AirQualityWidget extends StatefulWidget {
  final int? usEpaIndex;
  const AirQualityWidget({Key? key, this.usEpaIndex}) : super(key: key);

  @override
  State<AirQualityWidget> createState() => _AirQualityWidgetState();
}

class _AirQualityWidgetState extends State<AirQualityWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Air Quality',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.white)),
        (widget.usEpaIndex == 1)
            ? const Text('Good',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white))
            : (widget.usEpaIndex == 2)
                ? const Text('Moderate',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white))
                : (widget.usEpaIndex == 3)
                    ? const Text('Unhealthy for sensitive group',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white))
                    : (widget.usEpaIndex == 4)
                        ? const Text('Unhealthy',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white))
                        : (widget.usEpaIndex == 5)
                            ? const Text('Very Unhealthy',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white))
                            : (widget.usEpaIndex == 6)
                                ? const Text('Hazardous',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white))
                                : const Text('Unavailable',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white)),
      ],
    );
  }
}
