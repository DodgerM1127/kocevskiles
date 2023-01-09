import 'package:flutter/material.dart';
import 'package:kocevskiles/Models/PaketModel.dart';
import 'package:kocevskiles/Paket.dart';
import 'package:kocevskiles/Homescreen.dart';

class CustomCard extends StatefulWidget {

  final PaketModel paketModel ;
  const CustomCard ({required this.paketModel}) ;
  @override
  _CustomCardState createState() => _CustomCardState();


}
class _CustomCardState extends State<CustomCard> {



  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Paket(paketModel: widget.paketModel,)));
      },
      onLongPress: (){
        showDialog(context: context, builder: (context) => AlertDialog(
          content: Form(child: Text("Ali res hočete izbrisati paket?"),),
          actions: <Widget>[
            Row(
              children: [
                TextButton(
                  child: Text("Izbriši"),
                  onPressed: (){
                    Navigator.of(context).pop();
                    setState(() {
                      paketi.removeAt(paketi.indexOf(this.widget.paketModel));
                    });
                    setState(() {});
                  },

                ),
                Spacer(),
                TextButton(
                  child: Text("NE Izbriši"),
                  onPressed: (){
                    Navigator.of(context).pop();
                  },

                )
              ],
            )
          ],
        ));
      },
      child: Column(
        children: [
          ListTile(
            leading: Text(widget.paketModel.paket, style: TextStyle(fontSize: 20),),
            title: Text(widget.paketModel.vrsta),
            subtitle: Text(widget.paketModel.kvaliteta),
            trailing: Text(widget.paketModel.debelina, style: TextStyle(fontSize: 20)),
          ),
          Padding(padding: const EdgeInsets.only(),child: Divider(thickness: 1,),)
        ],
      ),
    );
  }

}