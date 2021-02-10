import 'package:Tollway2/src/models/data.dart';
import 'package:Tollway2/src/screens/payment.cards.dart';
import 'package:Tollway2/src/widgets/payMethodWidget.dart';
import 'package:flutter/material.dart';

class PaymentMethodScreen extends StatefulWidget {
  @override
  _PaymentMethodScreenState createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  final key = GlobalKey<AnimatedListState>();
  final items = List.from(Data.paymentList);

  final List<String> payMethodList = ["Coupon", "Credit Card"];

  Widget showPaymentMethod() {
    return Column(
      children: [
        Expanded(
          child: AnimatedList(
            key: key,
            initialItemCount: items.length,
            itemBuilder: (context, index, animation) =>
                buildItem(items[index], index, animation),
          ),
        )
      ],
    );
  }

  Widget buildItem(item, int index, Animation<double> animation) =>
      PayMethodItemWidget(
        item: item,
        animation: animation,
        onClicked: () => removeItem(index),
      );

  void removeItem(int index) {
    final item = items.removeAt(index);
    key.currentState.removeItem(
      index,
      (context, animation) => buildItem(item, index, animation),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple[300],
          title: Text('Payment Method'),
        ),
        body: Column(
          children: [
            Expanded(
              child: AnimatedList(
                key: key,
                initialItemCount: items.length,
                itemBuilder: (context, index, animation) =>
                    buildItem(items[index], index, animation),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(40),
              // decoration: BoxDecoration(
              //   shape: BoxShape.rectangle,
              //   color: Colors.white,
              //   borderRadius: BorderRadius.circular(20.0)
              // ),
              child: RaisedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AddPaymentCards()));
                  },
                  color: Colors.purple[400],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      side: BorderSide(color: Colors.black, width: 1)),
                  child: Container(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      '+ Add Credit/Debit cards',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  )),
            )
          ],
        ));
  }
}
