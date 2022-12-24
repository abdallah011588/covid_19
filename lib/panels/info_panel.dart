

import 'package:covid_19/localization/localization_methods.dart';
import 'package:covid_19/modules/faqs.dart';
import 'package:covid_19/shared/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class infoPanel extends StatelessWidget
{
  const infoPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Column(
        children: [
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => faqsScreen(),));
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
              margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
              color: primaryBlack,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(getTranslated(context, 'FA&Q')!,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),),
                  Icon(Icons.arrow_forward,color: Colors.white,),
                ],
              ),
            ),
          ),
          SizedBox(height: 5,),
          GestureDetector(
            onTap: (){
              launch('https://covid19responsefund.org/en/');
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
              margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
              color: primaryBlack,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(getTranslated(context, 'DONATE')!,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),),
                  Icon(Icons.arrow_forward,color: Colors.white,),
                ],
              ),
            ),
          ),
          SizedBox(height: 5,),
          GestureDetector(
            onTap: (){
              launch('https://www.who.int/indonesia/news/novel-coronavirus/mythbusters');
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
              margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
              color: primaryBlack,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(getTranslated(context, 'MYTH BUSTERS')!,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),),
                  Icon(Icons.arrow_forward,color: Colors.white,),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
