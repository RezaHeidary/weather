import 'package:flutter/material.dart';
import 'package:flutter_application_3/home/controller/home_controller.dart';
import 'package:get/get.dart';

class ResultView extends StatelessWidget {
  const ResultView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Color.fromARGB(200, 78, 182, 207),
              Color.fromARGB(200, 86, 93, 183),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Icon(
                Icons.location_on,
                color: Colors.white,
              ),
              Text(Get.arguments.areaName,
                  style: const TextStyle(color: Colors.white, fontSize: 30)),
              const SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.device_thermostat,
                    color: Colors.white,
                  ),
                  Text(
                    "${Get.arguments.tempMax}°C",
                    style: const TextStyle(color: Colors.white, fontSize: 40),
                  )
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              Text(
                "${DateTime.now().year.toString()} - ${DateTime.now().month.toString()} - ${DateTime.now().day.toString()}",
                style: const TextStyle(color: Colors.white, fontSize: 20),
              )
            ]),
          ),
          Positioned(
            left: 10,
            top: 30,
            child: FloatingActionButton(
              onPressed: () {
                Get.find<HomeController>().setWeather();
                Get.back();
              },
              child: const Icon(Icons.arrow_back),
            ),
          ),
        ],
      ),
    );
  }
}
