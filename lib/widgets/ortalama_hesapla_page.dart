import 'package:dinamik_hesaplama/constants/app_constant.dart';
import 'package:dinamik_hesaplama/helper/data_helper.dart';
import 'package:dinamik_hesaplama/model/ders.dart';
import 'package:dinamik_hesaplama/widgets/ders_listesi.dart';
import 'package:dinamik_hesaplama/widgets/harf_dropdown_widget.dart';
import 'package:dinamik_hesaplama/widgets/kredi_dropdown_widget.dart';
import 'package:dinamik_hesaplama/widgets/ortalama_goster_widget.dart';
import 'package:flutter/material.dart';

class OrtalamaHesaplaPage extends StatefulWidget {
  OrtalamaHesaplaPage({Key? key}) : super(key: key);

  @override
  _OrtalamaHesaplaPageState createState() => _OrtalamaHesaplaPageState();
}

class _OrtalamaHesaplaPageState extends State<OrtalamaHesaplaPage> {
  GlobalKey<FormState> FormKey =GlobalKey<FormState>();
    double secilenHarfDegeri =4;
    double secilenKrediDegeri =1;
    String GirilenDersAdi ="";
  
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        //elevation değerini sıfır yapmalıyız çünkü tam bir transparan yani renksiz bir appbar istiyoruz.
        elevation: 0,
        title: Center(
          child: Text(Sabitler.baslikText, style: Sabitler.baslikStyle,),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
         children: [
           //form
            Row(
              children: [
                   Expanded(
                     flex: 2,
              child: _buildForm(),
            ),
             Expanded(
               flex: 1,
              child:OrtalamaGoster(dersSayisi: DataHelper.tumEklenenDersler.length, ortalama: DataHelper.OrtalamaHesapla()),
            ),
              ],
            ),
           //liste+
            Expanded(
              child: DersListesi(
                onElemanCikarildi:(index) 
                {
                  DataHelper.tumEklenenDersler.removeAt(index);
                  setState(() {
                    
                  });
                },
              ),
            ),
         ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()
        {
          setState(() {
            DataHelper.tumEklenenDersler.clear();
          });
        },
        child: Icon(Icons.delete),
      ) ,
    );
  }

  Widget _buildForm() {

    return Form(
      key: FormKey,
      child:Column(

      children: [
        Padding(padding: Sabitler.yatayPadding8,
        child: _buildTextFormField()
         ,),
         SizedBox(height: 5,),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              
              Expanded(
                
                child: Padding(padding: Sabitler.yatayPadding8,
                child:HarfDropDownWidget(
                  onHarfSecildi: (harf)
                  {
                    secilenHarfDegeri =harf;
                  },
                ),
                ),
              ),
              
              Expanded(
                child: Padding(padding:  Sabitler.yatayPadding8,
                child:KrediDropdownWidget(
                  onKrediSecildi: (kredi)
                  {
                    secilenKrediDegeri=kredi;
                  },),
                ),
              ),
              IconButton(
                onPressed: _dersEkleveOrtalamaHesapla,
               icon: Icon(Icons.arrow_forward_ios),
              color: Sabitler.anaRenk,
              iconSize: 30,),
            ],
          ),
          SizedBox(height: 5,)
      ],
      ) 
    
    );
  }

   _buildTextFormField() {

    return TextFormField(
      onSaved: (deger)
      {
        setState(() {
          GirilenDersAdi=deger!;
        });
        
      },
      validator: (s)
      {
        if(s!.length<=0)
        {
          return "Ders adını giriniz";
        }
        else
        return null;
      },
      decoration: InputDecoration(

        hintText:"Ders Adı Giriniz",
        border: OutlineInputBorder(
          borderRadius: Sabitler.borderRadius,
          borderSide: BorderSide.none),
          filled: true,
          fillColor: Sabitler.anaRenk.shade100.withOpacity(0.3),),
    );
  }
  void _dersEkleveOrtalamaHesapla() {
    if(FormKey.currentState!.validate())
    {
      FormKey.currentState!.save();
      var eklenecekDers =Ders(ad: GirilenDersAdi, harfDegeri: secilenHarfDegeri, krediDegeri: secilenKrediDegeri);
      DataHelper.dersEkle(eklenecekDers);
      print(DataHelper.OrtalamaHesapla());
      setState(() {
        
      }
      );
    }
  }
}