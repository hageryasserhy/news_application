import 'package:flutter/foundation.dart';

class ArticalModel
{
  final String? titel;
  final String? desc;
  final String? image;
  final String? date;
  ArticalModel({this.titel, this.desc, this.image, this.date});

  factory ArticalModel.fromjason(Map<String,dynamic> json)=>ArticalModel
    (
    image: json['urlToImage'],
    titel: json['title'],
    desc: json['description'] ,
    date: json["publishedAt"] ,
  );

}