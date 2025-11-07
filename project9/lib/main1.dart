import 'dart:async';
import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(const GeolocatorApp());
}

class GeolocatorApp extends StatelessWidget {
  const GeolocatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Geolocator Example',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        scaffoldBackgroundColor: const Color(0xFF30313C),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF30313C),
          foregroundColor: Colors.white,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.blueGrey,
        ),
      ),
      home: const GeolocatorWidget(),
    );
  }
}

class GeolocatorWidget extends StatefulWidget {
  const GeolocatorWidget({super.key});

  @override
  State<GeolocatorWidget> createState() => _GeolocatorWidgetState();
}

class _GeolocatorWidgetState extends State<GeolocatorWidget> {
  final GeolocatorPlatform _geolocatorPlatform = GeolocatorPlatform.instance;
  final List<String> _logs = [];
  StreamSubscription<Position>? _positionStreamSubscription;
  StreamSubscription<ServiceStatus>? _serviceStatusStreamSubscription;
  bool _isListening = false;

  @override
  void initState() {
    super.initState();
    _listenServiceStatus();
  }

  void _listenServiceStatus() {
    _serviceStatusStreamSubscription =
        _geolocatorPlatform.getServiceStatusStream().listen((status) {
      setState(() {
        _logs.add("Service status: $status");
      });
    });
  }

  Future<bool> _handlePermission() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      _logs.add("Location services disabled");
      setState(() {});
      return false;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        _logs.add("Permission denied");
        setState(() {});
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      _logs.add("Permission denied forever");
      setState(() {});
      return false;
    }

    _logs.add("Permission granted");
    setState(() {});
    return true;
  }

  Future<void> _getCurrentPosition() async {
    if (!await _handlePermission()) return;
    final pos = await Geolocator.getCurrentPosition();
    setState(() {
      _logs.add("Current position: ${pos.latitude}, ${pos.longitude}");
    });
  }

  Future<void> _getLastKnownPosition() async {
    final pos = await Geolocator.getLastKnownPosition();
    setState(() {
      _logs.add(pos != null
          ? "Last known position: ${pos.latitude}, ${pos.longitude}"
          : "No last known position available");
    });
  }

  void _toggleStream() {
    if (_positionStreamSubscription == null) {
      _positionStreamSubscription =
          Geolocator.getPositionStream().listen((pos) {
        setState(() {
          _logs.add("Stream position: ${pos.latitude}, ${pos.longitude}");
        });
      });
      _isListening = true;
    } else {
      if (_positionStreamSubscription!.isPaused) {
        _positionStreamSubscription!.resume();
        _isListening = true;
      } else {
        _positionStreamSubscription!.pause();
        _isListening = false;
      }
    }
    setState(() {});
  }

  @override
  void dispose() {
    _positionStreamSubscription?.cancel();
    _serviceStatusStreamSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Geolocator Example"),
        actions: [
          PopupMenuButton<int>(
            onSelected: (value) {
              if (value == 1) Geolocator.openAppSettings();
              if (value == 2) Geolocator.openLocationSettings();
              if (value == 3) setState(() => _logs.clear());
            },
            itemBuilder: (context) => [
              const PopupMenuItem(value: 1, child: Text("Open App Settings")),
              const PopupMenuItem(value: 2, child: Text("Open Location Settings")),
              const PopupMenuItem(value: 3, child: Text("Clear Logs")),
            ],
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _logs.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(
            _logs[index],
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "stream",
            backgroundColor: _isListening ? Colors.green : Colors.red,
            onPressed: _toggleStream,
            child: Icon(_isListening ? Icons.pause : Icons.play_arrow),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: "current",
            onPressed: _getCurrentPosition,
            child: const Icon(Icons.my_location),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: "last",
            onPressed: _getLastKnownPosition,
            child: const Icon(Icons.bookmark),
          ),
        ],
      ),
    );
  }
}
