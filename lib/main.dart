import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Screens/Covid_api/Provider/covid_provider.dart';
import 'Screens/Covid_api/view/covid_view.dart';

void main()
{
  runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => CovidProvider(),),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            routes: {
              '/':(context) => CovidScreen(),
            },
          ),
          ),
      );
}