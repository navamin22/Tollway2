import 'package:Tollway2/src/models/information.dart';
import 'package:flutter/material.dart';

class InformationItemWidget extends StatelessWidget {
  final InformationItem item;
  final Animation animation;
  final VoidCallback onClicked;

  const InformationItemWidget({
    @required this.item,
    @required this.animation,
    @required this.onClicked,
    Key key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: animation,
      child: Container(
        height: 130,
        margin: EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: AssetImage(item.informImage),
            fit: BoxFit.fill
          ),
        ),
        // child: ListTile(
        //   contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        //   // leading: CircleAvatar(
        //   //   radius: 32,
        //   //   backgroundImage: NetworkImage(item.urlImage),
        //   // ),
        //   title: Text("", style: TextStyle(fontSize: 20)),
        //   subtitle: Text("", style: TextStyle(fontSize: 20)),
        //
        // ),
      ),
    );
  }
}