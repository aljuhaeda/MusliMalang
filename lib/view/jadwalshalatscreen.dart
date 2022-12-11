import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/services.dart';

class JadwalShalatScreen extends StatefulWidget {
  const JadwalShalatScreen({super.key});

  @override
  State<JadwalShalatScreen> createState() => _JadwalShalatScreenState();
}

class _JadwalShalatScreenState extends State<JadwalShalatScreen> {
  var controller = Get.find<Service>();

  // void initState() {
  //   super.initState();
  //   controller.fetchData();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() => controller.isFetching.value == true
            ? const Center(child: CircularProgressIndicator())
            : //ListView
            ListView(
                children: [
                  ListTile(
                    title: Text("Subuh "),
                    subtitle: Text(
                      controller.jadwalShalat!.jadwal!.data!.subuh.toString(),
                    ),
                  ),
                  ListTile(
                    title: Text("Dzuhur "),
                    subtitle: Text(
                      controller.jadwalShalat!.jadwal!.data!.dzuhur.toString(),
                    ),
                  ),
                  ListTile(
                    title: Text("Ashar "),
                    subtitle: Text(
                      controller.jadwalShalat!.jadwal!.data!.ashar.toString(),
                    ),
                  ),
                  ListTile(
                    title: Text("Maghrib "),
                    subtitle: Text(
                      controller.jadwalShalat!.jadwal!.data!.maghrib.toString(),
                    ),
                  ),
                  ListTile(
                    title: Text("Isya "),
                    subtitle: Text(
                      controller.jadwalShalat!.jadwal!.data!.isya.toString(),
                    ),
                  ),
                ],
              )));
  }
}
