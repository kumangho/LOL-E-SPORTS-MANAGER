import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/list.dart';
import 'package:flutter_application_1/src/ui/LandingPage/LandingScreen.dart';
import 'package:flutter_application_1/src/ui/Widget/Widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../BanPick.dart';

class LoadingScreen extends StatefulWidget {
  @override
  State createState() => LoadingState();
}

class LoadingState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    displayHeight = MediaQuery.of(context).size.height;
    displayWidth = MediaQuery.of(context).size.width;
    displayRatio = displayHeight / displayWidth;
    return GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
          FocusManager.instance.primaryFocus.unfocus();
          new TextEditingController().clear();
          Get.to(() => LandingScreen());
        },
        child: Scaffold(
            backgroundColor: mainColor,
            resizeToAvoidBottomInset: false,
            body: Column(
              children: [
                Expanded(
                  flex: 7,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: SvgPicture.asset(
                      'assets/images/SVG/Logo.svg',
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Stack(children: [
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        'LEAGUE OF LEGENDS',
                        style: titleLogo(16, subColor, FontStyle.italic),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(65, 50, 0, 0),
                      child: Text(
                        'E-SPORTS',
                        style: titleLogo(20, subColor, FontStyle.italic),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.fromLTRB(10, 90, 0, 0),
                        child: Text(
                          'MANAGER',
                          style: titleLogo(30, subColor, FontStyle.italic),
                        ))
                  ]),
                ),
                Expanded(
                  flex: 1,
                  child: Column(children: [
                    Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 340, 0),
                        child: Text(
                          'Loading..',
                          style: titleLogo(5, subColor, FontStyle.italic),
                        )),
                    Container(
                        height: 30,
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: TweenAnimationBuilder(
                          tween: Tween(begin: 0.0, end: 1.0),
                          duration: Duration(seconds: 4),
                          builder: (context, value, _) =>
                              LinearProgressIndicator(
                            value: value,
                            minHeight: 2,
                            backgroundColor: Colors.grey,
                            valueColor: AlwaysStoppedAnimation<Color>(subColor),
                          ),
                        )),
                  ]),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.only(top: 30),
                    child: Text(
                        "LOL E-Sports Manager IS NOT endorsed by Riot Games and does not reflect the views or opinions of those who produce or manage Riot Games or the League of Legends officially. League of Legends and Riot Games are trademarks or registered trademarks of Riot Games. Inc. League of Legends © Riot Games. Inc. v1.00",
                        style: TextStyle(color: Colors.white54)),
                  ),
                ),
              ],
            )));
  }
}
