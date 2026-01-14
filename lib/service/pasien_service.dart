import 'package:dio/dio.dart';
import '../helpers/api_client.dart';
import '../model/pasien.dart';

class PasienService {
  Future<List<Pasien>> listData() async {
    final Response response = await ApiClient().get('pasien');
    final List data = response.data;
    return data.map((json) => Pasien.fromJson(json)).toList();
  }

  Future<Pasien> simpan(Pasien pasien) async {
    final Response response = await ApiClient().post('pasien', pasien.toJson());
    return Pasien.fromJson(response.data);
  }

  Future<Pasien> ubah(Pasien pasien, String id) async {
    final Response response = await ApiClient().put(
      'pasien/$id',
      pasien.toJson(),
    );
    return Pasien.fromJson(response.data);
  }

  Future<Pasien> getById(String id) async {
    final Response response = await ApiClient().get('pasien/$id');
    return Pasien.fromJson(response.data);
  }

  Future<void> hapus(String id) async {
    await ApiClient().delete('pasien/$id');
  }
}
