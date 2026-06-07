class SilverModel {
  final String name;
  final num price;
  final String symbol;
  final String updatedAt;
  final String updatedAtReadable;
  final String currency;
  final String currencySymbol;

  SilverModel({
    required this.name,
    required this.price,
    required this.symbol,
    required this.updatedAt,
    required this.updatedAtReadable,
    required this.currency,
    required this.currencySymbol,
  });

  factory SilverModel.fromJson(Map<String, dynamic> json) {
    return SilverModel(
      name: json['name'],
      price: json['price'],
      symbol: json['symbol'],
      updatedAt: json['updatedAt'],
      updatedAtReadable: json['updatedAtReadable'],
      currency: json['currency'],
      currencySymbol: json['currencySymbol'],
    );
  }
}