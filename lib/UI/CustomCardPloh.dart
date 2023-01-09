import 'package:flutter/material.dart';
import 'package:kocevskiles/Models/PaketModel.dart';
import 'package:kocevskiles/Paket.dart';

class CustomCardPloh extends StatelessWidget {
  const CustomCardPloh ({required this.dolzina, required this.sirina});
  final String dolzina;
  final String sirina;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Column(
        children: [
          ListTile(
            title: Row(children: [
              Text(dolzina),
              Spacer(),
              Text(sirina),
            ],),
          ),
          Padding(padding: const EdgeInsets.only(),child: Divider(thickness: 1,),)
        ],
      ),
    );
  }
}