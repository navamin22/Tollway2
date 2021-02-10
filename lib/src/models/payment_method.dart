import 'package:meta/meta.dart';

class PaymentMethodItem {
  final String cardId;
  final String cardName;

  const PaymentMethodItem({
    @required this.cardId,
    @required this.cardName,
  });
}
