import 'package:covid_19/layout/layout.dart';
import 'package:covid_19/localization/app_localization.dart';
import 'package:covid_19/localization/localization_methods.dart';
import 'package:covid_19/localization/set_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'shared/constants/constants.dart';

/*
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:layout(),
      debugShowCheckedModeBanner: false,
    );
  }
}
*/

/*
void main()
{
  runApp(
      MaterialApp(
        home: layout() ,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: primaryBlack,
        ),

        supportedLocales: [
          Locale('en','US'),
          Locale('ar','EG')
        ],

        localizationsDelegates: [

          AppLocalization.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],



        localeResolutionCallback: (locale,supportedLocales)
        {
          for(Locale supportedLocale in supportedLocales)
            {
              if(supportedLocale.languageCode==locale?.languageCode && supportedLocale.countryCode==locale?.countryCode)
                {
                  return supportedLocale;
                }
                  return supportedLocales.first;
            }
        },

      ),
  );
}

*/



void main() {

  runApp(MyApp());

}

class MyApp extends StatefulWidget {

  static void setLocale(BuildContext context, Locale locale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state!.setLocale(locale);
  }

  @override
  _MyAppState createState() {

    /*
    var f = new NumberFormat("###,###", "en_US");
    print(f.format(245315));*/

    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp>
{

   Locale? _local;

  void setLocale(Locale locale) {
    setState(() {
      _local = locale;
    });
  }

  @override
  void didChangeDependencies() {

    getLocale().then((locale) {
      setState(() {
        this._local = locale;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context)
  {

    if (_local == null) {
      return Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    else {
      return MaterialApp(

        title:_local!.languageCode=='en'? 'Covid-19_Panel':'لوحة تحكم كوفيد-19' ,//getTranslated(context, 'Covid-19_Panel') ==null ? 'Covid-19 Panel':getTranslated(context, 'Covid-19_Panel')!,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: layout(),

        locale: _local,

        supportedLocales: [
          Locale('en', 'US'),
          Locale('ar', 'EG')
        ],

        localizationsDelegates: [
          SetLocalization.localizationsDelegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],

        localeResolutionCallback: (deviceLocal, supportedLocales)
        {
          for (var local in supportedLocales)
          {
            if (local.languageCode == deviceLocal!.languageCode &&
                local.countryCode == deviceLocal.countryCode)
            {
              return deviceLocal;
            }
          }
          return supportedLocales.first;
        },
      );
    }
  }
}