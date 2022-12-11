import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/services.dart';

class SuratAcakScreen extends StatefulWidget {
  const SuratAcakScreen({super.key});

  @override
  State<SuratAcakScreen> createState() => _SuratAcakScreenState();
}

class _SuratAcakScreenState extends State<SuratAcakScreen> {
  var controller = Get.find<Service>();

  // void initState() {
  //   super.initState();
  //   controller.fetchData();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Obx(() => controller.isFetching.value == true
                    ? const Center(child: CircularProgressIndicator())
                    : Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              controller.suratAcak!.surat!.nama.toString(),
                              style: const TextStyle(fontSize: 30),
                            ),
                            Text(
                              controller.suratAcak!.acak!.ar!.teks.toString(),
                              style: const TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ) //ListView
                )));
  }
}
