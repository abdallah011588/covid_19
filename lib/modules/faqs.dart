
import 'package:covid_19/localization/localization_methods.dart';
import 'package:covid_19/panels/data_source.dart';
import 'package:covid_19/shared/constants/constants.dart';
import 'package:flutter/material.dart';

class faqsScreen extends StatelessWidget
{
  const faqsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getTranslated(context,'FA&Q')!),
        backgroundColor: primaryBlack,
      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
        return ExpansionTile(
          title: Text(
           getLangCode(context)==ARABIC? '${dataSource.questionAnswersAr[index]['question']}':'${dataSource.questionAnswers[index]['question']}',
            style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                getLangCode(context)==ARABIC? '${dataSource.questionAnswersAr[index]['answer']}':'${dataSource.questionAnswers[index]['answer']}',

               // '${dataSource.questionAnswers[index]['answer']}',
                style: TextStyle(fontSize: 16,height: 2),
              ),
            ),
          ],
          backgroundColor: Colors.grey[100],
        );
      },
      itemCount: dataSource.questionAnswers.length,
      ),
    );
  }
}
