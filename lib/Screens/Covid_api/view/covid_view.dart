
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/api_helper.dart';
import '../contoler/covid_controler.dart';
import '../model/covid_model.dart';


class CovidPage extends StatefulWidget {
  const CovidPage({Key? key}) : super(key: key);

  @override
  State<CovidPage> createState() => _CovidPageState();
}

class _CovidPageState extends State<CovidPage> {
  @override
  Widget build(BuildContext context) {
    Homecontroller homecontroller = Get.put(Homecontroller());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.menu),
            ),
          ],
          backgroundColor: Colors.black,
          title: Text("COVID-19"),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.white54,
            ),
            GetBuilder<Homecontroller>(
              builder: (controller) =>
                  FutureBuilder(
                    future: Api_http().coviddata(homecontroller.name == ""
                        ? "india"
                        : "${homecontroller.name}"),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text("${snapshot.hasError}"),
                        );
                      } else if (snapshot.hasData) {
                        Homemodel? h1 = snapshot.data;
                        return SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                TextField(textInputAction: TextInputAction.next,
                                  controller: homecontroller.txtname,
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.black, width: 2.5),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.black, width: 2.5),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    suffixIcon: IconButton(
                                      icon: Icon(Icons.search, color: Colors.black),
                                      onPressed: () {
                                        homecontroller.asign();
                                      },
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 40,
                                ), Center(
                                  child: Text(
                                    "Covid Data",
                                    style: TextStyle(
                                        fontSize: 20, fontWeight: FontWeight.w600),
                                  ),
                                ),SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "  Country           : ${h1!.countryText}",
                                  style: TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.w600),
                                ),
                                SizedBox(height: 10,),
                                Text(
                                  "  Last Update    : ${h1.lastUpdate}",
                                  style: TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.w600),
                                ),SizedBox(height: 10,),
                                Text(
                                  "  Total Cases     : ${h1.totalCasesText}",
                                  style: TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.w600),
                                ),SizedBox(height: 10,),
                                Text(
                                  "  Total Deaths   : ${h1.totalDeathsText}",
                                  style: TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                      return Center(
                        child: CircularProgressIndicator(
                          color: Colors.black,
                        ),
                      );
                    },
                  ),
            ),
          ],
        ),
      ),
    );
  }
}