import 'dart:developer';

import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:weather/weather.dart';

import '../view/result.dart';

class HomeController extends GetxController {
  late MapController mapController;
  Rx<double>? lat;
  Rx<double>? lon;
  Rx<bool> lod = false.obs;
  String apiKey = "856822fd8e22db5e1ba48c0e7d69844a";
  late WeatherFactory weatherFactory;
  late Weather weather;
  var geoPoint = GeoPoint(latitude: 35.715298, longitude: 51.404343);
  Future setWeather() async {
    lod.value = true;

    mapController = MapController(
      initMapWithUserPosition: false,
      initPosition: geoPoint,
    );
    lod.value = false;
  }

  getLatAndLon() async {
    weather = await weatherFactory.currentWeatherByLocation(
      geoPoint.latitude,
      geoPoint.longitude,
    );
    Get.to(const ResultView(), arguments: weather);
  }

  getLocationFromUser(value) async {
    if (value.isNotEmpty) {
      try {
        List<Location> locations = await locationFromAddress(value);
        mapController.goToLocation(GeoPoint(
            latitude: locations[0].latitude,
            longitude: locations[0].longitude));
      } catch (e) {
        log("null");
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
    weatherFactory = WeatherFactory(apiKey);
    setWeather();
  }

  @override
  void dispose() {
    super.dispose();
    mapController.dispose();
  }
}
