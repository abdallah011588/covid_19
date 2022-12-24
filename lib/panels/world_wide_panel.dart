import 'package:covid_19/widgets/info_card.dart';
import 'package:flutter/material.dart';

class worldWidePanel extends  StatelessWidget {

  final Map data;
  final Map historyData;

  worldWidePanel({
     required this.data,
    required this.historyData,
   });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2,
      ),

        children: [
          infoCard(title: 'CONFIRMED', effectedNum: data['cases'], iconColor: Colors.blue[800]!, press: (){}, cartColor:Colors.blue[100]!, historyData: historyData ,),
          infoCard(title: 'DEATHS', effectedNum: data['deaths'], iconColor: Colors.red, press: (){}, cartColor: Colors.red[100]!,historyData: historyData ),
          infoCard( title: 'RECOVERED', effectedNum: data['recovered'], iconColor: Colors.green, press: (){}, cartColor: Colors.green[100]!,historyData: historyData ),
          infoCard( title: 'ACTIVE', effectedNum: data['active'], iconColor: Colors.black, press: (){}, cartColor: Colors.grey[300]!,historyData: null ),

          /*
          statusPanel(panelColor: Colors.blue[100]!, textColor: Colors.blue[800]!, text: 'CONFIRMED', count: data['cases'].toString()),
          statusPanel(panelColor: Colors.red[100]!, textColor: Colors.red, text: 'DEATHS', count: data['deaths'].toString()),
          statusPanel(panelColor: Colors.green[100]!, textColor: Colors.green, text: 'RECOVERED', count: data['recovered'].toString()),
          statusPanel(panelColor: Colors.grey[300]!, textColor: Colors.black, text: 'ACTIVE', count: data['active'].toString()),
       */
        ],
      ),
    );
  }
}


class statusPanel extends StatelessWidget
{
  final Color panelColor;
  final Color textColor;
  final String text;
  final String count;

  const statusPanel({
        required this.panelColor,
        required this.textColor,
        required  this.text,
        required this.count
      }) ;


  @override
  Widget build(BuildContext context)
  {
    double Width=MediaQuery.of(context).size.width;
    return Container(
      height: 80.0,
      width: Width/2,
      color: panelColor,
      margin: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('$text',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),),
          SizedBox(height: 5,),
          Text('$count',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),),
        ],
      ),
    );
  }
}

