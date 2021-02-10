import 'package:Tollway2/src/models/data.dart';
import 'package:Tollway2/src/widgets/appBg.dart';
import 'package:Tollway2/src/widgets/informationList.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InformationScreen extends StatefulWidget {
  @override
  _InformationScreenState createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  int number = 0;
  String itemName;
  final key = GlobalKey<AnimatedListState>();
  final items = List.from(Data.informList);

  Widget buildItem(item, int index, Animation<double> animation) =>
      InformationItemWidget(
        item: item,
        animation: animation,
        onClicked: () => {

        },
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              AppBackground(),
              Container(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: AnimatedList(
                        key: key,
                        initialItemCount: items.length,
                        itemBuilder: (context, index, animation) =>
                            buildItem(items[index], index, animation),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      // body: Container(
      //   child: Column(
      //     children: <Widget>[
      //       Expanded(
      //         child: AnimatedList(
      //           key: key,
      //           initialItemCount: items.length,
      //           itemBuilder: (context, index, animation) =>
      //               buildItem(items[index], index, animation),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}