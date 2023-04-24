import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Screens/Covid_api/model/covid_model.dart';
class ApiHelper
{
  Future<Datamodel> Apicall()
  async {
    String  link ="https://corona-virus-world-and-india-data.p.rapidapi.com/api";
    Uri uri = Uri.parse(link);
    var reespon = await http.get(uri,headers: {
      'content-type': 'application/octet-stream',
      'X-RapidAPI-Key': '0879344c6dmsha1627f90fd35f77p1ad740jsne6f395c3cb33',
      'X-RapidAPI-Host': 'corona-virus-world-and-india-data.p.rapidapi.com'
    });
    var json = jsonDecode(reespon.body);
    Datamodel d1 = Datamodel.fromJson(json);
    return d1;

    }
}
