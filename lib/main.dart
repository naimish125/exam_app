import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Screens/Covid_api/view/covid_view.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context) => CovidPage(),
      },
    ),
  );
}