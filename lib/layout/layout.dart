
import 'dart:convert';
import 'package:covid_19/localization/localization_methods.dart';
import 'package:covid_19/localization/set_localization.dart';
import 'package:covid_19/main.dart';
import 'package:covid_19/models/language.dart';
import 'package:covid_19/modules/countries_status.dart';
import 'package:covid_19/panels/affected_countries.dart';
import 'package:covid_19/panels/data_source.dart';
import 'package:covid_19/panels/info_panel.dart';
import 'package:covid_19/panels/world_wide_panel.dart';
import 'package:covid_19/shared/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class layout extends StatefulWidget {
  const layout({Key? key}) : super(key: key);

  @override
  State<layout> createState() => _layoutState();
}

class _layoutState extends State<layout>
{

  // late Map worldWideData;
  Map? worldWideData;
  fetchWorldWideData() async
  {
    http.Response response =await http.get(Uri.parse('https://corona.lmao.ninja/v2/all?yesterday'));

    setState(() {
      worldWideData= json.decode(response.body);
    });

    print('response.statusCode 1 :' +response.statusCode.toString());
  }


   List? countriesData;
   fetchCountriesWideData() async
   {
     http.Response response =await http.get(Uri.parse('https://corona.lmao.ninja/v2/countries?yesterday&sort=cases'));
       setState(() {
         countriesData= json.decode(response.body);
       });
    }


  Map? historyData;
  fetchHistoryData() async
  {
    http.Response response =await http.get(Uri.parse('https://corona.lmao.ninja/v2/historical/all'));
    setState(() {
      historyData= json.decode(response.body);
    });
  }

  @override
  void initState()
  {
    super.initState();
    fetchWorldWideData();
    fetchCountriesWideData();
    fetchHistoryData();
  }

  @override
  Widget build(BuildContext context)
  {

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(getTranslated(context, 'Covid-19_Panel')!),
        backgroundColor: primaryBlack,
        actions: [
          Padding(
            padding: EdgeInsets.all(8),
            child: DropdownButton(
                underline: SizedBox(),
                icon: Icon(
                  Icons.language,
                  color: Colors.white,
                ),
                items: Language.languageList()
                    .map<DropdownMenuItem<Language>>(
                        (lang) => DropdownMenuItem(
                      value: lang,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(
                            lang.flag,
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(lang.name)
                        ],
                      ),
                    )
                ).toList(),

                onChanged: (value){

                  Language lang=value as Language;
                 // print(lang.name);
                  _changeLanguage(lang,context);
                  //print(lang.languageCode);

                }
            ),
          )
        ],
      ),

      body: SingleChildScrollView(

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              Container(
                alignment: AlignmentDirectional.center,
                height: 100,
                color: Colors.orange[100],
                padding: EdgeInsetsDirectional.all(10.0),
                child: Text(
                  getLangCode(context)==ARABIC ?dataSource.quoteAr :dataSource.quote,
                  style: TextStyle(
                    color: Colors.orange[500],
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(getTranslated(context, 'WorldWide')!,//'${AppLocalization.of(context)!.translate('first_string')}',//'World Wide Panel',
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,),
                ),
              ),
              worldWideData==null? Center(child: CircularProgressIndicator()): worldWidePanel(data: worldWideData!, historyData: historyData!,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(getTranslated(context,'Most affected countries')!,
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => countriesStatus(),));
                        },


                        child: Text(getTranslated(context, 'Regional')!),//'${set_localization.of(context)!.translate('second_string')}'),//'Regional'),
                      style: ElevatedButton.styleFrom(
                        primary:primaryBlack,
                      ),
                    ),
                  ),
                ],
              ),
              countriesData==null?Container(): affectedCountries(countriesData:countriesData! ),
              SizedBox(height: 5,),
              infoPanel(),
              SizedBox(height: 10,),
              Center(
                  child: Text(getTranslated(context,'STAY_SAVE')!,style: TextStyle(fontSize: 18,color: Colors.green),)
              ),
              SizedBox(height: 35,),
            ],
          ),
      ),
    );

  }
}

void _changeLanguage(Language lang ,context) async
{
  Locale _temp = await setLocale(lang.languageCode);
  MyApp.setLocale( context, _temp);
}
