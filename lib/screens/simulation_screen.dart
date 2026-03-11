import 'package:flutter/material.dart';
import 'dart:async';

import '../widgets/control_panel.dart';
import '../widgets/traffic_light_widget.dart';

class SimulationScreen extends StatefulWidget {
  const SimulationScreen({super.key});

  @override
  State<SimulationScreen> createState() => _SimulationScreenState();
}

class _SimulationScreenState extends State<SimulationScreen> {
  Timer? _timer;
  bool _isRunning = false;

  int _redSeconds = 30;
  int _redAmberSeconds = 2;
  int _greenSeconds = 25;
  int _amberSeconds = 3;

  TrafficLightState _state = TrafficLightState.red;
  int _secondsRemaining = 30;

  int _durationFor(TrafficLightState state) {
    switch (state) {
      case TrafficLightState.red:
        return _redSeconds;
      case TrafficLightState.redAmber:
        return _redAmberSeconds;
      case TrafficLightState.green:
        return _greenSeconds;
      case TrafficLightState.amber:
        return _amberSeconds;
    }
  }

  TrafficLightState _nextState(TrafficLightState current) {
    switch (current) {
      case TrafficLightState.red:
        return TrafficLightState.redAmber;
      case TrafficLightState.redAmber:
        return TrafficLightState.green;
      case TrafficLightState.green:
        return TrafficLightState.amber;
      case TrafficLightState.amber:
        return TrafficLightState.red;
    }
  }

  void _start() {
    if (_isRunning) {
      return;
    }

    setState(() => _isRunning = true);
    _timer = Timer.periodic(const Duration(seconds: 1), (_) => _tick());
  }

  void _pause() {
    _timer?.cancel();
    setState(() => _isRunning = false);
  }

  void _tick() {
    if (!mounted) {
      return;
    }

    setState(() {
      if (_secondsRemaining <= 1) {
        _state = _nextState(_state);
        _secondsRemaining = _durationFor(_state);
      } else {
        _secondsRemaining -= 1;
      }
    });
  }

  void _goToNextPhase() {
    setState(() {
      _state = _nextState(_state);
      _secondsRemaining = _durationFor(_state);
    });
  }

  void _reset() {
    _pause();
    setState(() {
      _state = TrafficLightState.red;
      _secondsRemaining = _durationFor(_state);
    });
  }

  void _setDuration(
    TrafficLightState targetState,
    int value,
    void Function(int) setter,
  ) {
    setState(() {
      setter(value);
      if (_state == targetState) {
        _secondsRemaining = _durationFor(_state);
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.sizeOf(context).width >= 900;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Traffic Light Simulation'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: isWide
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Center(
                        child: TrafficLightWidget(state: _state),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: ControlPanel(
                        isRunning: _isRunning,
                        secondsRemaining: _secondsRemaining,
                        currentState: _state,
                        redSeconds: _redSeconds,
                        redAmberSeconds: _redAmberSeconds,
                        greenSeconds: _greenSeconds,
                        amberSeconds: _amberSeconds,
                        onRedChanged: (value) => _setDuration(
                          TrafficLightState.red,
                          value,
                          (newValue) => _redSeconds = newValue,
                        ),
                        onRedAmberChanged: (value) => _setDuration(
                          TrafficLightState.redAmber,
                          value,
                          (newValue) => _redAmberSeconds = newValue,
                        ),
                        onGreenChanged: (value) => _setDuration(
                          TrafficLightState.green,
                          value,
                          (newValue) => _greenSeconds = newValue,
                        ),
                        onAmberChanged: (value) => _setDuration(
                          TrafficLightState.amber,
                          value,
                          (newValue) => _amberSeconds = newValue,
                        ),
                        onToggleRun: _isRunning ? _pause : _start,
                        onNextPhase: _goToNextPhase,
                        onReset: _reset,
                      ),
                    ),
                  ],
                )
              : ListView(
                  children: [
                    Center(child: TrafficLightWidget(state: _state)),
                    const SizedBox(height: 16),
                    ControlPanel(
                      isRunning: _isRunning,
                      secondsRemaining: _secondsRemaining,
                      currentState: _state,
                      redSeconds: _redSeconds,
                      redAmberSeconds: _redAmberSeconds,
                      greenSeconds: _greenSeconds,
                      amberSeconds: _amberSeconds,
                      onRedChanged: (value) => _setDuration(
                        TrafficLightState.red,
                        value,
                        (newValue) => _redSeconds = newValue,
                      ),
                      onRedAmberChanged: (value) => _setDuration(
                        TrafficLightState.redAmber,
                        value,
                        (newValue) => _redAmberSeconds = newValue,
                      ),
                      onGreenChanged: (value) => _setDuration(
                        TrafficLightState.green,
                        value,
                        (newValue) => _greenSeconds = newValue,
                      ),
                      onAmberChanged: (value) => _setDuration(
                        TrafficLightState.amber,
                        value,
                        (newValue) => _amberSeconds = newValue,
                      ),
                      onToggleRun: _isRunning ? _pause : _start,
                      onNextPhase: _goToNextPhase,
                      onReset: _reset,
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
