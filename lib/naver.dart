import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';

class NaverMapApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NaverMapScreen(),
    );
  }
}

class NaverMapScreen extends StatefulWidget {


  @override
  _NaverMapScreenState createState() => _NaverMapScreenState();
}

class _NaverMapScreenState extends State<NaverMapScreen> {
  bool isInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeMap();
  }

  Future<void> _initializeMap() async {
    try {
      await NaverMapSdk.instance.initialize(clientId: '');
      setState(() {
        isInitialized = true;
      });
    } catch (e) {
      print("Error initializing NaverMap SDK: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!isInitialized) {
      return Scaffold(
        appBar: AppBar(title: const Text('Loading Map...')),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Naver Map')),
      body: NaverMap(
        options: NaverMapViewOptions(
          indoorEnable: true,
          locationButtonEnable: true,
          consumeSymbolTapEvents: false,
          initialCameraPosition: NCameraPosition( // 지도 처음 위치
            target: NLatLng(37.552785, 126.924445),
            zoom: 15,
            bearing: 0,
            tilt: 0
          ),
        ),
        onMapReady: (controller) {
          print("Naver Map Loaded");
          final marker = NMarker(
              id: 'Marker 1',
              position: NLatLng(37.552785, 126.924445));
          controller.addOverlay(marker);
        },
      ),
    );
  }
}
