import 'package:dinamik_hesaplama/constants/app_constant.dart';
import 'package:dinamik_hesaplama/widgets/ortalama_hesapla_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dinamik Ortalama Hesapla',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Sabitler.anaRenk,
        //her ortamda çalıştırabilmek için bunu kullanıyoruz.
        visualDensity: VisualDensity.adaptivePlatformDensity,
       ),
      home:OrtalamaHesaplaPage(),
    );
  }
} 