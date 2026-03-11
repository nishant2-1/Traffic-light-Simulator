import 'package:flutter/material.dart';

import 'traffic_light_widget.dart';

class ControlPanel extends StatelessWidget {
  final bool isRunning;
  final int secondsRemaining;
  final TrafficLightState currentState;
  final int redSeconds;
  final int redAmberSeconds;
  final int greenSeconds;
  final int amberSeconds;
  final ValueChanged<int> onRedChanged;
  final ValueChanged<int> onRedAmberChanged;
  final ValueChanged<int> onGreenChanged;
  final ValueChanged<int> onAmberChanged;
  final VoidCallback onToggleRun;
  final VoidCallback onNextPhase;
  final VoidCallback onReset;

  const ControlPanel({
    super.key,
    required this.isRunning,
    required this.secondsRemaining,
    required this.currentState,
    required this.redSeconds,
    required this.redAmberSeconds,
    required this.greenSeconds,
    required this.amberSeconds,
    required this.onRedChanged,
    required this.onRedAmberChanged,
    required this.onGreenChanged,
    required this.onAmberChanged,
    required this.onToggleRun,
    required this.onNextPhase,
    required this.onReset,
  });

  String _phaseLabel(TrafficLightState state) {
    switch (state) {
      case TrafficLightState.red:
        return 'Red';
      case TrafficLightState.redAmber:
        return 'Red + Amber';
      case TrafficLightState.green:
        return 'Green';
      case TrafficLightState.amber:
        return 'Amber';
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 0,
      color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.45),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Signal Control Panel',
              style: theme.textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text('Active phase: ${_phaseLabel(currentState)}'),
            Text('Time remaining: ${secondsRemaining}s'),
            const SizedBox(height: 16),
            _durationSlider(
              context,
              label: 'Red duration',
              value: redSeconds,
              min: 5,
              max: 120,
              onChanged: onRedChanged,
            ),
            _durationSlider(
              context,
              label: 'Red + Amber duration',
              value: redAmberSeconds,
              min: 1,
              max: 10,
              onChanged: onRedAmberChanged,
            ),
            _durationSlider(
              context,
              label: 'Green duration',
              value: greenSeconds,
              min: 5,
              max: 120,
              onChanged: onGreenChanged,
            ),
            _durationSlider(
              context,
              label: 'Amber duration',
              value: amberSeconds,
              min: 2,
              max: 10,
              onChanged: onAmberChanged,
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                FilledButton.icon(
                  onPressed: onToggleRun,
                  icon: Icon(isRunning ? Icons.pause : Icons.play_arrow),
                  label: Text(isRunning ? 'Pause' : 'Start'),
                ),
                OutlinedButton.icon(
                  onPressed: onNextPhase,
                  icon: const Icon(Icons.skip_next),
                  label: const Text('Next phase'),
                ),
                OutlinedButton.icon(
                  onPressed: onReset,
                  icon: const Icon(Icons.refresh),
                  label: const Text('Reset'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _durationSlider(
    BuildContext context, {
    required String label,
    required int value,
    required int min,
    required int max,
    required ValueChanged<int> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$label: ${value}s'),
        Slider(
          min: min.toDouble(),
          max: max.toDouble(),
          divisions: max - min,
          value: value.toDouble(),
          label: '$value s',
          onChanged: (newValue) => onChanged(newValue.round()),
        ),
      ],
    );
  }
}
