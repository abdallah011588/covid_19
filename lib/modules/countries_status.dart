
import 'dart:convert';

import 'package:covid_19/localization/localization_methods.dart';
import 'package:covid_19/shared/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class countriesStatus extends StatefulWidget
{
  const countriesStatus({Key? key}) : super(key: key);

  @override
  State<countriesStatus> createState() => _countriesStatusState();
}

class _countriesStatusState extends State<countriesStatus> 
{


  late List countriesData;
  fetchCountriesWideData() async
  {
    http.Response response =await http.get(Uri.parse('https://corona.lmao.ninja/v2/countries?yesterday&sort=cases'));
    setState(() {
      countriesData= json.decode(response.body);
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchCountriesWideData();
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      
      appBar: AppBar(
        title: Text(getTranslated(context, 'countries status')!),
        backgroundColor: primaryBlack,
      ),
      body:countriesData==null? Center(child: CircularProgressIndicator()): ListView.separated(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${countriesData[index]['country'].toString()}',style: TextStyle(fontWeight: FontWeight.bold),),
                      SizedBox(height: 5,),
                      Image.network('${countriesData[index]['countryInfo']['flag']}',height: 50,width: 60,),
                    ],
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${ getTranslated(context,'CONFIRMED')!} : ${countriesData[index]['cases'].toString()}',style: TextStyle(color: Colors.blue),),
                    SizedBox(height: 5,),
                    Text('${ getTranslated(context,'ACTIVE')!} : ${countriesData[index]['active'].toString()}',style: TextStyle(color: Colors.black54),),
                    SizedBox(height: 5,),
                    Text('${ getTranslated(context,'RECOVERED')!} : ${countriesData[index]['recovered'].toString()}',style: TextStyle(color: Colors.green),),
                    SizedBox(height: 5,),
                    Text('${ getTranslated(context,'DEATHS')!} : ${countriesData[index]['deaths'].toString()}',style: TextStyle(color: Colors.red),),
                  ],
                ),
              ],
            ),
          );
        },
        separatorBuilder:(context, index)=>Container(
          height: 15,
          width: double.infinity,
          color: Colors.grey[200],
        ) ,
        itemCount: countriesData.length==null ? 0: countriesData.length,
      ),
    );
  }
}

