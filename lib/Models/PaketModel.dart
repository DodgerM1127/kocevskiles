import 'package:flutter/material.dart';

class PaketModel {
  final String paket;
  final String debelina;
  final String vrsta;
  final String kvaliteta;
  final List<String> SeznamDolzin = ["Dolžina Ploha (m)"];
  final List<String> SeznamSirin = ["Širina Ploha (cm)"];

  PaketModel({required this.paket,required this.debelina,required this.kvaliteta,required this.vrsta});
}