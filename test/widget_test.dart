import 'dart:convert';

import 'package:alquran/app/data/models/ayat.dart';
import 'package:alquran/app/data/models/surah.dart';
import 'package:alquran/app/modules/detail_surah/controllers/detail_surah_controller.dart';
import 'package:http/http.dart' as http;

// void main() async {
//   Uri url = Uri.parse("https://api.quran.gading.dev/surah/");
//   var res = await http.get(url);
//
//   // print(res.body);
//   var data = (json.decode(res.body) as Map<String, dynamic>)["data"];
//
//   Surah surah = Surah.fromJson(data[113]);
//
//   // print(data[0]);
//   print(surah);
//   print(surah.name?.long);
// }

// void main() async {
//   var a = DetailSurahController();
//   var b = await a.getDetailSurah(1.toString());
//   print(b);
// }

void main() async {
  Uri url = Uri.parse("https://api.quran.gading.dev/surah/1/1");
  var res = await http.get(url);

  var data = (json.decode(res.body) as Map<String, dynamic>)["data"];

  Ayat ayat = Ayat.fromJson(data);

  // print(data[0]);
  // print(ayat);
  print(ayat.text?.transliteration?.en);
}