import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musmal_app/view/jadwalshalatscreen.dart';
import 'package:musmal_app/view/loginscreen.dart';
import 'package:musmal_app/view/suratacakscreen.dart';

import '../controller/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var controller = Get.find<Service>();
  List pages = [
    SuratAcakScreen(),
    JadwalShalatScreen(),
  ];
  int indexpages = 0;

  void initState() {
    super.initState();
    controller.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // create a body
        body: pages[indexpages],
        // create a bottom navigation bar
        bottomNavigationBar: BottomNavigationBar(
            // set the current index
            currentIndex: indexpages,
            // when the user taps the button, it will set the current index to the index of the selected item
            onTap: (int index) {
              setState(() {
                if (index != 2) {
                  indexpages = index;
                } else {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                  controller.logout();
                }
              });
              print(indexpages);
            },
            // create a list of bottom navigation bar items
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.book),
                label: 'Surat Acak',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today),
                label: 'Jadwal Shalat',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.logout_outlined),
                label: 'Logout',
              )
            ]));
  }
}
