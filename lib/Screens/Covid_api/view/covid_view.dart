import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/covid_provider.dart';
import '../model/covid_model.dart';

class CovidScreen extends StatefulWidget {
  const CovidScreen({Key? key}) : super(key: key);

  @override
  State<CovidScreen> createState() => _CovidScreenState();
}

class _CovidScreenState extends State<CovidScreen> {
  CovidProvider? CovidProvidert,CovidProviderf;
  @override
  Widget build(BuildContext context) {
    CovidProviderf = Provider.of<CovidProvider>(context,listen: false);
    CovidProvidert = Provider.of<CovidProvider>(context,listen: true);
    return SafeArea(child: Scaffold(
        appBar: AppBar(
          title: Text("Covid APi"),centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: FutureBuilder(
          future: CovidProviderf!.getData(),
          builder: (context, snapshot) {
            if(snapshot.hasError)
            {
              return Text(("${snapshot.error}"),);
            }
            else if(snapshot.hasData)
            {
              Datamodel? rmap = snapshot.data;
              return ListView.builder(
                itemCount: rmap!.countriesStat!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(color: Colors.white54,border: Border.all(width: 1),),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Country Name      :  ${rmap.countriesStat![index].countryName}",style: TextStyle(fontSize: 24),),
                              SizedBox(height: 10,),
                              Text("Cases :  ${rmap.countriesStat![index].cases}",style: TextStyle(fontSize: 24),),
                              SizedBox(height: 10,),
                              Text("Deaths  : ${rmap.countriesStat![index].deaths}",style: TextStyle(fontSize: 24),),
                              SizedBox(height: 10,),
                              Text("Totel_Rev  : ${rmap.countriesStat![index].totalRecovered}",style: TextStyle(fontSize: 24),),
                              SizedBox(height: 10,),
                              Text("NewDeaths  : ${rmap.countriesStat![index].newDeaths}",style: TextStyle(fontSize: 24),),
                              SizedBox(height: 10,),
                              Text("NewCase  : ${rmap.countriesStat![index].newCases}",style: TextStyle(fontSize: 24),),
                              SizedBox(height: 10,),
                              Text("Serious  : ${rmap.countriesStat![index].seriousCritical}",style: TextStyle(fontSize: 24),),
                              SizedBox(height: 10,),
                              Text("ActCase  : ${rmap.countriesStat![index].activeCases}",style: TextStyle(fontSize: 24),),
                              SizedBox(height: 10,),
                              Text("T.Case.P  : ${rmap.countriesStat![index].totalCasesPer1MPopulation}",style: TextStyle(fontSize: 24),),
                              SizedBox(height: 10,),
                              Text("D.Momth.P  : ${rmap.countriesStat![index].deathsPer1MPopulation}",style: TextStyle(fontSize: 24),),
                              SizedBox(height: 10,),
                              Text("T.Tests  : ${rmap.countriesStat![index].totalTests}",style: TextStyle(fontSize: 24),),
                              SizedBox(height: 10,),
                              Text("T.Per.P  : ${rmap.countriesStat![index].testsPer1MPopulation}",style: TextStyle(fontSize: 24),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },);
            }
            return CircularProgressIndicator();

          },),
        ));
    }
}
