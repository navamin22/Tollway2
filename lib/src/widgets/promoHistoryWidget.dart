import 'package:Tollway2/src/models/promo_history.dart';
import 'package:Tollway2/src/widgets/CustomImage.dart';
import 'package:flutter/material.dart';

class PromoHistoryItemWidget extends StatelessWidget {
  final PromoHistoryItem item;
  final Animation animation;
  final VoidCallback onClicked;

  const PromoHistoryItemWidget({
    @required this.item,
    @required this.animation,
    @required this.onClicked,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: animation,
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
            margin: EdgeInsets.only(left: 25.0, right: 25.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Text(
              'Date: ${item.payDate}',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
            ),
            child: ListTile(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              leading: CircleAvatar(
                radius: 32,
                child: CustomImage(
                  width: 50.0,
                  height: 50.0,
                  margin: 0,
                  image_path: 'assets/logos/logo_changed.png',
                ),
              ),
              title: Text(item.promoName, style: TextStyle(fontSize: 16)),
              subtitle: Text('${item.payDate}', style: TextStyle(fontSize: 16)),
              trailing: Text('${item.cost.toString()} ฿'),
            ),
          ),
        ],
      ),
    );
  }
}
