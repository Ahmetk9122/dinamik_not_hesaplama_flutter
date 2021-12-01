import 'package:dinamik_hesaplama/constants/app_constant.dart';
import 'package:dinamik_hesaplama/helper/data_helper.dart';
import 'package:flutter/material.dart';

class HarfDropDownWidget extends StatefulWidget {
     final Function onHarfSecildi;

  HarfDropDownWidget({required this.onHarfSecildi, Key? key}) : super(key: key);

  @override
  _HarfDropDownWidgetState createState() => _HarfDropDownWidgetState();
}

class _HarfDropDownWidgetState extends State<HarfDropDownWidget> {
      double secilenHarfDegeri =4;

  @override
  Widget build(BuildContext context) {
    return  Container(
      alignment: Alignment.center,
      padding: Sabitler.dropDownPadding,
      decoration: BoxDecoration(
        color: Sabitler.anaRenk.shade100.withOpacity(0.3),
        borderRadius: Sabitler.borderRadius,
      ),
      child: DropdownButton<double>(
      value: secilenHarfDegeri,
      elevation: 16,
      iconEnabledColor: Sabitler.anaRenk.shade200,
      onChanged: (deger)
      {
        setState(() {
          
        });
          secilenHarfDegeri=deger!;
          widget.onHarfSecildi(secilenHarfDegeri);                  
      },
      //dropdown da alttaki çıkan çizgiyi silme işlemi.
      underline: Container(),
      items:DataHelper.tumDerslerinHarfler(),
     ),
    );

  }
}