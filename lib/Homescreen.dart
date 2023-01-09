import 'package:flutter/material.dart';
import 'package:kocevskiles/Models/PaketModel.dart';
import 'package:kocevskiles/UI/CustomCard.dart';

List<PaketModel> paketi = [];
class Homescreen extends StatefulWidget {
  const Homescreen ({required this.title}) ;
  final String title;
  @override
  _HomescreenState createState() => _HomescreenState();


}
class _HomescreenState extends State<Homescreen> {

  late TextEditingController paketControler = TextEditingController();
  late TextEditingController kvalitetaControler = TextEditingController();
  late TextEditingController vrstaControler = TextEditingController();
  late TextEditingController debelinaControler = TextEditingController();

  void addPaket(){
    setState(() {
      paketi.add(PaketModel(
          paket: paketControler.text,
          debelina: debelinaControler.text,
          kvaliteta: kvalitetaControler.text,
          vrsta: vrstaControler.text
      ));
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          const Padding(padding:  EdgeInsets.only(),child: Divider(thickness: 1,),),
           TextField(
            controller: paketControler,
            decoration: const InputDecoration(
              hintText:  "Številka paketa",
              labelText: "Številka paketa",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8),),
              ),
              isDense: true,
            ),
          ),

           TextField(
             controller: debelinaControler,
             decoration: const InputDecoration(
              hintText:  "Debelina (mm)",
              labelText: "Debelina (mm)",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8),),
              ),
              isDense: true,
            ),
          ),

           TextField(
             controller: vrstaControler,
             decoration: const InputDecoration(
              hintText:  "Vrsta",
              labelText: "Vrsta",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8),),
              ),
              isDense: true,
            ),
          ),

           TextField(
             controller: kvalitetaControler,
             decoration: const InputDecoration(
              hintText:  "Kvaliteta",
              labelText: "Kvaliteta",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8),),
              ),
              isDense: true,
            ),
          ),
          ElevatedButton(onPressed: () async{
            addPaket();
          }, child: const Text("Ustvari nov paket")),
          const Padding(padding: EdgeInsets.only(),child: Divider(thickness: 1,),),
          Expanded(
            child: ListView.builder(

              itemCount: paketi.length,
              itemBuilder: (cuntext, index)=> CustomCard(paketModel: paketi[index]),
            ),)

        ],
      )
    );

  }
}