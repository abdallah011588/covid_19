import 'package:covid_19/localization/localization_methods.dart';
import 'package:flutter/material.dart';

class affectedCountries extends StatelessWidget
{
   final List countriesData;
   affectedCountries({required this.countriesData}) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric( horizontal: 10.0,vertical: 5),
      child: ListView.separated(
      itemBuilder: (context, index)
      {
        return Container(
          child: Row(
            children: [
              Image.network(countriesData[index]['countryInfo']['flag'],height: 30.0,width: 50.0,),
              SizedBox(width: 10.0,),
              Text(countriesData[index]['country'].toString()),
              SizedBox(width: 10.0,),
              Text(getTranslated(context,'Deaths:')!,style: TextStyle(
                fontWeight: FontWeight.bold,color: Colors.indigo,
              ),),
              SizedBox(width: 10.0,),
              Text(countriesData[index]['deaths'].toString(),style: TextStyle(
                fontWeight: FontWeight.bold,color: Colors.red,
              ),),
            ],
          ),
        );
      },
      separatorBuilder:  (context, index)=>SizedBox(height: 10,),
      itemCount: 5,
      shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
      ),
    );
  }
}
