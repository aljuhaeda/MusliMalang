class JadwalShalat {
  String? status;
  Querys? query;
  Jadwal? jadwal;

  JadwalShalat({this.status, this.query, this.jadwal});

  JadwalShalat.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    query = json['query'] != null ? Querys.fromJson(json['query']) : null;
    jadwal = json['jadwal'] != null ? Jadwal.fromJson(json['jadwal']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (query != null) {
      data['query'] = query!.toJson();
    }
    if (jadwal != null) {
      data['jadwal'] = jadwal!.toJson();
    }
    return data;
  }
}

class Querys {
  String? format;
  String? kota;
  String? tanggal;

  Querys({this.format, this.kota, this.tanggal});

  Querys.fromJson(Map<String, dynamic> json) {
    format = json['format'];
    kota = json['kota'];
    tanggal = json['tanggal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['format'] = format;
    data['kota'] = kota;
    data['tanggal'] = tanggal;
    return data;
  }
}

class Jadwal {
  String? status;
  Data? data;

  Jadwal({this.status, this.data});

  Jadwal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? ashar;
  String? dhuha;
  String? dzuhur;
  String? imsak;
  String? isya;
  String? maghrib;
  String? subuh;
  String? tanggal;
  String? terbit;

  Data(
      {this.ashar,
      this.dhuha,
      this.dzuhur,
      this.imsak,
      this.isya,
      this.maghrib,
      this.subuh,
      this.tanggal,
      this.terbit});

  Data.fromJson(Map<String, dynamic> json) {
    ashar = json['ashar'];
    dhuha = json['dhuha'];
    dzuhur = json['dzuhur'];
    imsak = json['imsak'];
    isya = json['isya'];
    maghrib = json['maghrib'];
    subuh = json['subuh'];
    tanggal = json['tanggal'];
    terbit = json['terbit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ashar'] = ashar;
    data['dhuha'] = dhuha;
    data['dzuhur'] = dzuhur;
    data['imsak'] = imsak;
    data['isya'] = isya;
    data['maghrib'] = maghrib;
    data['subuh'] = subuh;
    data['tanggal'] = tanggal;
    data['terbit'] = terbit;
    return data;
  }
}
