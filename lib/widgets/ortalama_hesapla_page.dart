import 'package:dinamik_hesaplama/constants/app_constant.dart';
import 'package:dinamik_hesaplama/helper/data_helper.dart';
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
  
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              child:OrtalamaGoster(dersSayisi: 1, ortalama: 4.234),
            ),
              ],
            ),
           //liste+
            Expanded(
              child: Container(
               child: Text("Liste buraya Gelecek"),
               color: Colors.blue,
                       ),
            ),
         ],
      )
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
                child:_buildHarfler(),
                ),
              ),
              
              Expanded(
                child: Padding(padding:  Sabitler.yatayPadding8,
                child:_buildKrediler(),
                ),
              ),
              IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios),
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
      decoration: InputDecoration(

        hintText:"Matematik",
        border: OutlineInputBorder(
          borderRadius: Sabitler.borderRadius,
          borderSide: BorderSide.none),
          filled: true,
          fillColor: Sabitler.anaRenk.shade100.withOpacity(0.3),),
    );
  }

  _buildHarfler() {
    return Container(
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
          print("$secilenHarfDegeri");
      },
      //dropdown da alttaki çıkan çizgiyi silme işlemi.
      underline: Container(),
      items:DataHelper.tumDerslerinHarfler(),
     ),
    );

  }
  
  _buildKrediler() {
    return Container(
      alignment: Alignment.center,
      padding: Sabitler.dropDownPadding,
      decoration: BoxDecoration(
        color: Sabitler.anaRenk.shade100.withOpacity(0.3),
        borderRadius: Sabitler.borderRadius,
      ),
      child: DropdownButton<double>(
      value: secilenKrediDegeri,
      elevation: 16,
      iconEnabledColor: Sabitler.anaRenk.shade200,
      onChanged: (deger)
      {
        setState(() {
          
        });
          secilenKrediDegeri=deger!;
          print("$secilenKrediDegeri");
      },
      //dropdown da alttaki çıkan çizgiyi silme işlemi.
      underline: Container(),
      items:DataHelper.tumDerslerinKredileri(),
     ),
    );

  }

}