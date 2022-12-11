class SuratAcak {
  String? status;
  Querys? query;
  Acak? acak;
  Surat? surat;

  SuratAcak({this.status, this.query, this.acak, this.surat});

  SuratAcak.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    query = json['query'] != null ? Querys.fromJson(json['query']) : null;
    acak = json['acak'] != null ? Acak.fromJson(json['acak']) : null;
    surat = json['surat'] != null ? Surat.fromJson(json['surat']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (query != null) {
      data['query'] = query!.toJson();
    }
    if (acak != null) {
      data['acak'] = acak!.toJson();
    }
    if (surat != null) {
      data['surat'] = surat!.toJson();
    }
    return data;
  }
}

class Querys {
  String? format;

  Querys({this.format});

  Querys.fromJson(Map<String, dynamic> json) {
    format = json['format'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['format'] = format;
    return data;
  }
}

class Acak {
  Id? id;
  Id? ar;

  Acak({this.id, this.ar});

  Acak.fromJson(Map<String, dynamic> json) {
    id = json['id'] != null ? Id.fromJson(json['id']) : null;
    ar = json['ar'] != null ? Id.fromJson(json['ar']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (id != null) {
      data['id'] = id!.toJson();
    }
    if (ar != null) {
      data['ar'] = ar!.toJson();
    }
    return data;
  }
}

class Id {
  String? id;
  String? surat;
  String? ayat;
  String? teks;

  Id({this.id, this.surat, this.ayat, this.teks});

  Id.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    surat = json['surat'];
    ayat = json['ayat'];
    teks = json['teks'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['surat'] = surat;
    data['ayat'] = ayat;
    data['teks'] = teks;
    return data;
  }
}

class Surat {
  String? nomor;
  String? nama;
  String? asma;
  String? name;
  String? start;
  String? ayat;
  String? type;
  String? urut;
  String? rukuk;
  String? arti;
  String? keterangan;

  Surat(
      {this.nomor,
      this.nama,
      this.asma,
      this.name,
      this.start,
      this.ayat,
      this.type,
      this.urut,
      this.rukuk,
      this.arti,
      this.keterangan});

  Surat.fromJson(Map<String, dynamic> json) {
    nomor = json['nomor'];
    nama = json['nama'];
    asma = json['asma'];
    name = json['name'];
    start = json['start'];
    ayat = json['ayat'];
    type = json['type'];
    urut = json['urut'];
    rukuk = json['rukuk'];
    arti = json['arti'];
    keterangan = json['keterangan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nomor'] = nomor;
    data['nama'] = nama;
    data['asma'] = asma;
    data['name'] = name;
    data['start'] = start;
    data['ayat'] = ayat;
    data['type'] = type;
    data['urut'] = urut;
    data['rukuk'] = rukuk;
    data['arti'] = arti;
    data['keterangan'] = keterangan;
    return data;
  }
}
