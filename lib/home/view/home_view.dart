import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_3/home/controller/home_controller.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());

    return Scaffold(
      backgroundColor: Colors.green[50],
      body: Obx(
        () => homeController.lod.isFalse
            ? Stack(
                children: [
                  OSMFlutter(
                    controller: homeController.mapController,
                    trackMyPosition: false,
                    initZoom: 5,
                    isPicker: true,
                    minZoomLevel: 2,
                    maxZoomLevel: 18,
                    stepZoom: .5,
                  ),
                  Positioned(
                      right: 10,
                      left: 10,
                      bottom: 10,
                      child: ElevatedButton(
                          onPressed: () async {
                            homeController.geoPoint = await homeController
                                .mapController
                                .getCurrentPositionAdvancedPositionPicker();

                            homeController.getLatAndLon();
                          },
                          child: const Text("Weather"))),
                  Positioned(
                    right: 10,
                    left: 10,
                    top: 30,
                    child: Container(
                        decoration: const BoxDecoration(color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            onChanged: (value) async {
                              homeController.getLocationFromUser(value);
                            },
                            style: const TextStyle(fontSize: 20),
                            decoration: const InputDecoration(
                                hintText: "Search Location"),
                          ),
                        )),
                  ),
                ],
              )
            : const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
