import 'package:Tollway2/src/models/information.dart';
import 'package:Tollway2/src/models/payment_method.dart';
import 'package:Tollway2/src/models/promo_history.dart';

class Data {
  static final List<PaymentMethodItem> paymentList = [
    PaymentMethodItem(cardId: '12352', cardName: 'Visa'),
    PaymentMethodItem(cardId: '0252314', cardName: 'MasterCard'),
  ];

  static final List<InformationItem> informList = [
    InformationItem(
        informId: '1212312121',
        informImage: 'assets/images/info1.png',
        informLink: ''),
    InformationItem(
        informId: '7524164552',
        informImage: 'assets/images/info2.png',
        informLink: ''),
  ];

  static final List<PromoHistoryItem> promoHistoryList = [
    PromoHistoryItem(
        promoId: '3211125854',
        promoName: 'Promotion Coupon',
        payDate: '10/01/21',
        cost: 2000.0),
    PromoHistoryItem(
        promoId: '1820347144',
        promoName: 'Promotion Coupon2',
        payDate: '13/01/21',
        cost: 1500.0)
  ];
}