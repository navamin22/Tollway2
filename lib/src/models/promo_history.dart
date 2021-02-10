import 'package:meta/meta.dart';

class PromoHistoryItem {
  final String promoId;
  final String promoName;
  final String payDate;
  final double cost;

  const PromoHistoryItem({
    @required this.promoId,
    @required this.promoName,
    @required this.payDate,
    @required this.cost,
  });
}
