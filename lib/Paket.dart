import 'package:flutter/material.dart';
import 'package:kocevskiles/Models/PaketModel.dart';
import 'package:kocevskiles/UI/CustomCard.dart';
import 'package:kocevskiles/UI/CustomCardPloh.dart';
import 'dart:convert';
class Paket extends StatefulWidget {
  Paket({required this.paketModel});
  final PaketModel paketModel ;
  @override
  _PaketState createState() => _PaketState();
}

class _PaketState extends State<Paket> {
  late TextEditingController dolzinaControler = TextEditingController();
  late TextEditingController sirinaControler = TextEditingController();

  void addPloh(List<String> stvari){
    setState(() {
      widget.paketModel.SeznamDolzin.add(stvari[0]);
      widget.paketModel.SeznamSirin.add(stvari[1]);
    });

  }
  Future<List<String>> DodajPloh(BuildContext context) async {
    return await showDialog(context: context,
        builder: (context){

          return AlertDialog(
            content: Form(child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: dolzinaControler,
                  decoration: InputDecoration(hintText: "dolzina (m)"),
                ),
                TextFormField(
                  controller: sirinaControler,
                  decoration: InputDecoration(hintText: "sirina (cm)"),
                ),
            ],),),
            actions: <Widget>[
              TextButton(
                  child: Text("Dodaj"),
                  onPressed: (){
                    Navigator.of(context).pop([dolzinaControler.text,sirinaControler.text]);
                  },

              )
            ],
          );
        });
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Row(
          children: [
            Text(widget.paketModel.paket),
            SizedBox(width: 10),
            Text(widget.paketModel.kvaliteta),
            SizedBox(width: 20),
            Text(widget.paketModel.vrsta),
            Spacer(),
            Text(widget.paketModel.debelina),
            Text("mm"),
          ],
        ),
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: ListView.builder(
            itemCount: widget.paketModel.SeznamDolzin.length,
            itemBuilder: (cuntext, index)=>
              InkWell(
                child: Column(
                  children: [
                    ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(widget.paketModel.SeznamDolzin[index]),
                          Text(widget.paketModel.SeznamSirin[index]),
                          IconButton(onPressed: (){
                            setState(() {
                              widget.paketModel.SeznamSirin.removeAt(index);
                              widget.paketModel.SeznamDolzin.removeAt(index);
                            });
                          }, icon: Icon(Icons.delete))
                      ],
                      ),
                    ),
                    Padding(padding: const EdgeInsets.only(),child: Divider(thickness: 1,),)
                  ],
                ),
              ),
            ),


            floatingActionButton: FloatingActionButton(
              onPressed: () async{
                final List<String> stvari = await DodajPloh(context);
                addPloh(stvari);
              },
              backgroundColor: Colors.blue,
              child: const Icon(Icons.edit),
            ),
    );
  }
}