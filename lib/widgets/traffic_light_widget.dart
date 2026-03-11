import 'package:flutter/material.dart';

enum TrafficLightState { red, redAmber, green, amber }

class TrafficLightWidget extends StatelessWidget {
  final TrafficLightState state;
  const TrafficLightWidget({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final off = Colors.grey.shade300;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFF353535), width: 1.5),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _circle(
            color: Colors.red,
            isOn: state == TrafficLightState.red ||
                state == TrafficLightState.redAmber,
            offColor: off,
          ),
          const SizedBox(height: 12),
          _circle(
            color: Colors.amber,
            isOn: state == TrafficLightState.amber ||
                state == TrafficLightState.redAmber,
            offColor: off,
          ),
          const SizedBox(height: 12),
          _circle(
            color: Colors.green,
            isOn: state == TrafficLightState.green,
            offColor: off,
          ),
        ],
      ),
    );
  }

  Widget _circle({
    required Color color,
    required bool isOn,
    required Color offColor,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 280),
      curve: Curves.easeOut,
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: isOn ? color : offColor,
        shape: BoxShape.circle,
        boxShadow: [
          if (isOn)
            BoxShadow(
              color: color.withValues(alpha: 0.7),
              blurRadius: 20,
              spreadRadius: 2,
            ),
        ],
      ),
    );
  }
}
