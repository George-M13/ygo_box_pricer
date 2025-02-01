class YgoSet {
  String status;
  YgoSetData? data;

  YgoSet({
    required this.status,
    this.data,
  });

  factory YgoSet.fromJson(Map<String, dynamic> json) => YgoSet(
        status: json["status"] ?? "Unknown",
        data: json["data"] != null ? YgoSetData.fromJson(json["data"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
      };
}

class TcgBoosterValues {
  double high;
  double low;
  double average;

  TcgBoosterValues({
    required this.high,
    required this.low,
    required this.average,
  });

  TcgBoosterValues copyWith({
    double? high,
    double? low,
    double? average,
  }) =>
      TcgBoosterValues(
        high: high ?? this.high,
        low: low ?? this.low,
        average: average ?? this.average,
      );

  factory TcgBoosterValues.fromJson(Map<String, dynamic> json) =>
      TcgBoosterValues(
        high: json["high"]?.toDouble() ?? 0.0,
        low: json["low"]?.toDouble() ?? 0.0,
        average: json["average"]?.toDouble() ?? 0.0,
      );

  Map<String, dynamic> toJson() => {
        "high": high,
        "low": low,
        "average": average,
      };
}

class YgoSetData {
  Rarities? rarities;
  double average;
  double lowest;
  double highest;
  TcgBoosterValues? tcgBoosterValues;
  List<Card> cards;

  YgoSetData({
    this.rarities,
    required this.average,
    required this.lowest,
    required this.highest,
    this.tcgBoosterValues,
    required this.cards,
  });

  factory YgoSetData.fromJson(Map<String, dynamic> json) => YgoSetData(
        rarities: json["rarities"] != null
            ? Rarities.fromJson(json["rarities"])
            : null,
        average: (json["average"] ?? 0.0).toDouble(),
        lowest: (json["lowest"] ?? 0.0).toDouble(),
        highest: (json["highest"] ?? 0.0).toDouble(),
        tcgBoosterValues: json["tcg_booster_values"] != null
            ? TcgBoosterValues.fromJson(json["tcg_booster_values"])
            : null,
        cards: json["cards"] != null
            ? List<Card>.from(json["cards"].map((x) => Card.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "rarities": rarities?.toJson(),
        "average": average,
        "lowest": lowest,
        "highest": highest,
        "tcg_booster_values": tcgBoosterValues?.toJson(),
        "cards": cards.map((x) => x.toJson()).toList(),
      };
}

class Card {
  String name;
  List<Number> numbers;
  String cardType;
  String? property;
  String family;
  String type;

  Card({
    required this.name,
    required this.numbers,
    required this.cardType,
    this.property,
    required this.family,
    required this.type,
  });

  factory Card.fromJson(Map<String, dynamic> json) => Card(
        name: json["name"] ?? "Unknown",
        numbers: json["numbers"] != null
            ? List<Number>.from(json["numbers"].map((x) => Number.fromJson(x)))
            : [],
        cardType: json["card_type"] ?? "Unknown",
        property: json["property"],
        family: json["family"] ?? "Unknown",
        type: json["type"] ?? "Unknown",
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "numbers": numbers.map((x) => x.toJson()).toList(),
        "card_type": cardType,
        "property": property,
        "family": family,
        "type": type,
      };
}

class Number {
  String name;
  String printTag;
  String rarity;
  PriceData? priceData;

  Number({
    required this.name,
    required this.printTag,
    required this.rarity,
    this.priceData,
  });

  factory Number.fromJson(Map<String, dynamic> json) => Number(
        name: json["name"] ?? "Unknown",
        printTag: json["print_tag"] ?? "Unknown",
        rarity: json["rarity"] ?? "Unknown",
        priceData: json["price_data"] != null
            ? PriceData.fromJson(json["price_data"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "print_tag": printTag,
        "rarity": rarity,
        "price_data": priceData?.toJson(),
      };
}

class PriceData {
  String status;
  PriceDataData? data;

  PriceData({
    required this.status,
    this.data,
  });

  factory PriceData.fromJson(Map<String, dynamic> json) => PriceData(
        status: json["status"] ?? "Unknown",
        data:
            json["data"] != null ? PriceDataData.fromJson(json["data"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
      };
}

class PriceDataData {
  List<dynamic> listings;
  Prices? prices;

  PriceDataData({
    required this.listings,
    this.prices,
  });

  factory PriceDataData.fromJson(Map<String, dynamic> json) => PriceDataData(
        listings: json["listings"] != null
            ? List<dynamic>.from(json["listings"])
            : [],
        prices: json["prices"] != null ? Prices.fromJson(json["prices"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "listings": listings,
        "prices": prices?.toJson(),
      };
}

class Prices {
  double high;
  double low;
  double average;
  int shift;
  double shift3;
  double shift7;
  double shift21;
  double shift30;
  double shift90;
  double shift180;
  int shift365;
  String updatedAt;

  Prices({
    required this.high,
    required this.low,
    required this.average,
    required this.shift,
    required this.shift3,
    required this.shift7,
    required this.shift21,
    required this.shift30,
    required this.shift90,
    required this.shift180,
    required this.shift365,
    required this.updatedAt,
  });

  factory Prices.fromJson(Map<String, dynamic> json) => Prices(
        high: (json["high"] ?? 0.0).toDouble(),
        low: (json["low"] ?? 0.0).toDouble(),
        average: (json["average"] ?? 0.0).toDouble(),
        shift: json["shift"] ?? 0,
        shift3: (json["shift_3"] ?? 0.0).toDouble(),
        shift7: (json["shift_7"] ?? 0.0).toDouble(),
        shift21: (json["shift_21"] ?? 0.0).toDouble(),
        shift30: (json["shift_30"] ?? 0.0).toDouble(),
        shift90: (json["shift_90"] ?? 0.0).toDouble(),
        shift180: (json["shift_180"] ?? 0.0).toDouble(),
        shift365: json["shift_365"] ?? 0,
        updatedAt: json["updated_at"] ?? "Unknown",
      );

  Map<String, dynamic> toJson() => {
        "high": high,
        "low": low,
        "average": average,
        "shift": shift,
        "shift_3": shift3,
        "shift_7": shift7,
        "shift_21": shift21,
        "shift_30": shift30,
        "shift_90": shift90,
        "shift_180": shift180,
        "shift_365": shift365,
        "updated_at": updatedAt,
      };
}

class Rarities {
  int rare;
  int common;
  int superRare;
  int secretRare;
  int ultimateRare;
  int ultraRare;
  int ghostRare;
  int shortPrint;

  Rarities({
    required this.rare,
    required this.common,
    required this.superRare,
    required this.secretRare,
    required this.ultimateRare,
    required this.ultraRare,
    required this.ghostRare,
    required this.shortPrint,
  });

  factory Rarities.fromJson(Map<String, dynamic> json) => Rarities(
        rare: json["Rare"] ?? 0,
        common: json["Common"] ?? 0,
        superRare: json["Super Rare"] ?? 0,
        secretRare: json["Secret Rare"] ?? 0,
        ultimateRare: json["Ultimate Rare"] ?? 0,
        ultraRare: json["Ultra Rare"] ?? 0,
        ghostRare: json["Ghost Rare"] ?? 0,
        shortPrint: json["Short Print"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "Rare": rare,
        "Common": common,
        "Super Rare": superRare,
        "Secret Rare": secretRare,
        "Ultimate Rare": ultimateRare,
        "Ultra Rare": ultraRare,
        "Ghost Rare": ghostRare,
        "Short Print": shortPrint,
      };
}
