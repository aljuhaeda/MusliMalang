import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musmal_app/model/jadwalshalat.dart';
import 'package:musmal_app/model/users.dart';

import '../model/suratacak.dart';

class Service extends GetxController {
  var isFetching = false.obs;
  JadwalShalat? jadwalShalat;
  SuratAcak? suratAcak;
  var user = DataUser().obs;
  var emailController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;
  var isLogin = false.obs;
  Users? users;

  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    isFetching.value = true;
    jadwalShalat = await getJadwalShalat();
    suratAcak = await getSuratAcak();
    isFetching.value = false;
  }

  //===============Jadwal Shalat================
  Future<JadwalShalat> getJadwalShalat() async {
    DateTime now = DateTime.now();
    String formattedDate = now.toString().substring(0, 10);
    Dio dio = Dio();
    var res = await dio.get(
        "https://api.banghasan.com/sholat/format/json/jadwal/kota/703/tanggal/$formattedDate");
    // print(res.data['jadwal']['data']['subuh']);
    JadwalShalat abc = JadwalShalat.fromJson(res.data);
    // JadwalShalat abc = JadwalShalat(
    //   status: res.data['status'],
    //   query: null,
    //   jadwal: Jadwal(
    //     data: Data(
    //       subuh: res.data['jadwal']['data']['subuh'],
    //       dzuhur: res.data['jadwal']['data']['dzuhur'],
    //       ashar: res.data['jadwal']['data']['ashar'],
    //       maghrib: res.data['jadwal']['data']['maghrib'],
    //       isya: res.data['jadwal']['data']['isya'],
    //     ),
    //   ),
    // );
    print("========Test Convert========");
    return abc;
  }

  //===============Surat Acak================
  Future<SuratAcak> getSuratAcak() async {
    Dio dio = Dio();
    var res = await dio.get("https://api.banghasan.com/quran/format/json/acak");
    SuratAcak abc = SuratAcak.fromJson(res.data);
    // SuratAcak abc = SuratAcak(
    //   acak: null,
    //   query: null,
    //   status: res.data['status'],
    //   surat: Surat(
    //     arti: res.data['surat']['arti'],
    //     ayat: res.data['surat']['ayat'],
    //     asma: res.data['surat']['asma'],
    //     keterangan: res.data['surat']['keterangan'],
    //     nama: res.data['surat']['nama'],
    //     nomor: res.data['surat']['nomor'],
    //     rukuk: res.data['surat']['rukuk'],
    //     type: res.data['surat']['type'],
    //     urut: res.data['surat']['urut'],
    //     name: res.data['surat']['name'],
    //     start: res.data['surat']['start'],
    //   ),
    // );
    return abc;
  }

  //===============Login================
  void cleanController() {
    emailController.value.clear();
    passwordController.value.clear();
  }

  Future<bool> login() async {
    isLogin.value = false;
    Dio dio = Dio();
    var res = await dio.get("https://reqres.in/api/users");

    Users abc = Users.fromJson(res.data);
    abc.data!.forEach((element) {
      if (element.email == emailController.value.text &&
          element.firstName == passwordController.value.text) {
        user.value = element;
        isLogin.value = true;
        print("Login Berhasil sebagai ${user.value.firstName}");
      }
    });
    cleanController();
    return isLogin.value;
  }

  void logout() {
    isLogin.value = false;
    cleanController();
  }
}
