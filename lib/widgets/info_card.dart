
import 'package:covid_19/localization/localization_methods.dart';
import 'package:covid_19/widgets/line_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class infoCard  extends StatelessWidget
{

  final String title;
  final int effectedNum;
  final Color iconColor;
  final Color cartColor;
  final Map ? historyData;
  final Function press;

   infoCard({
     required this.title,
     required this.effectedNum,
     required this.iconColor,
     required this.press,
     required this.cartColor,
     required this.historyData
   });


  @override
  Widget build(BuildContext context)

  {
    return LayoutBuilder(
      builder: (context, constraints)
      {
        return Container(
          margin: EdgeInsets.all (2),
          child: GestureDetector(
            onTap: () =>press,
            child: Container(
              width: MediaQuery.of(context).size.width/2 -10,//constraints.maxHeight/2 -10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: cartColor,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(2.0),
                      child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                          color: iconColor.withOpacity(0.12),
                          shape: BoxShape.circle,
                          ),
                        child: SvgPicture.asset(
                        'assets/svg.svg',
                        height: 12,
                        width: 12,
                        color: iconColor,
                          ),
                        ),
                        Text(
                          getTranslated(context,'$title')!,
                          style: TextStyle(fontWeight: FontWeight.bold),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 5),
                      child:Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(5),
                            child: RichText(
                            text: TextSpan(
                              style: TextStyle(color: Color(0xFF1E2432)),
                              children: [
                                TextSpan(
                                  text: '$effectedNum',
                                  style: TextStyle(fontWeight: FontWeight.bold,),
                                ),
                                // TextSpan(
                                //   text: 'people',
                                //   style: TextStyle(fontSize: 16,height: 2),
                                // ),
                              ],
                            ),
                          ),
                          ),
                          Expanded( child: lineChartReport(title: title,historyData:historyData !=null? historyData: null ) ),
                        ],
                      ) ,
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
