class Pasien {
  String? id;
  String nomorRm;
  String nama;
  String tanggalLahir;
  String nomorTelepon;
  String alamat;

  Pasien({
    this.id,
    required this.nomorRm,
    required this.nama,
    required this.tanggalLahir,
    required this.nomorTelepon,
    required this.alamat,
  });

  factory Pasien.fromJson(Map<String, dynamic> json) {
    return Pasien(
      id: json['id']?.toString() ?? '',
      nomorRm: json['nomor_rm']?.toString() ?? '',
      nama: json['nama']?.toString() ?? '',
      tanggalLahir: json['tanggal_lahir']?.toString() ?? '',
      nomorTelepon: json['nomor_telepon']?.toString() ?? '',
      alamat: json['alamat']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nomor_rm': nomorRm,
      'nama': nama,
      'tanggal_lahir': tanggalLahir,
      'nomor_telepon': nomorTelepon,
      'alamat': alamat,
    };
  }
}
