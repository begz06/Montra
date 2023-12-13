import 'package:jiffy/jiffy.dart';
import 'package:montra_app_a1/modules/home/domain/entity/homeEntity.dart';

class TransactionModel extends RecentTransactionEntity {
  final int id;
  final String title;
  final String text;
  final int price;
  final String colorHex;
  final String type;
  final String iconPath;
  final String image;
  final String date;
  final int isExpenses;

  List<SubTransaction> subtransactions;

  TransactionModel({
    required this.id,
    required this.isExpenses,
    required this.text,
    required this.colorHex,
    required this.date,
    required this.type,
    required this.title,
    required this.image,
    required this.price,
    required this.iconPath,
    required this.subtransactions,
  }) : super(
            image: image,
            isExpense: isExpenses == 0,
            color: '',
            iconPath: iconPath,
            title: title,
            subTitle: text,
            time: '',
            transactionPrice: price);

  Map<String, dynamic> toJson() => {
        "name": title,
        "description": text,
        "price": price,
        "image": image,
        "type": type,
        "color_hex": colorHex,
        "icon_path": iconPath,
        "isExpense": isExpense ? 0 : 1,
        "date": date

        // "id": id,
        // "color_hex": colorHex,
      };

  factory TransactionModel.fromJson(Map<String, dynamic> json,
      {List<SubTransaction> list = const []}) {
    return TransactionModel(
        id: json['id'] ?? 0,
        date: json['date'] ?? '',
        text: json['description'] ?? '',
        title: json['name'] ?? '',
        price: json['price'] ?? 0,
        iconPath: json['icon_path'] ?? '',
        subtransactions: list,
        colorHex: json['color_hex'] ?? '',
        type: json['type'] ?? '',
        image: json['image'] ?? '',
        isExpenses: json['isExpense'] ?? 0);
  }
}

class SubTransaction {
  final int id;
  final int transactionId;
  final String title;
  final String text;
  final int price;

  final String image;

  SubTransaction(
      {required this.id,
      required this.text,
      required this.transactionId,
      required this.title,
      required this.price,
      required this.image});

  Map<String, dynamic> toJson({int? id}) => {
        "name": title,
        "description": text,
        "price": price,
        "image": image,
        // "id": id,
        "transactionId": id ?? transactionId,
      };

  factory SubTransaction.fromJson(Map<String, dynamic> json) {
    return SubTransaction(
        id: json['id'] ?? 0,
        text: json['description'] ?? '',
        title: json['name'] ?? '',
        price: json['price'] ?? 0,
        image: json['image'] ?? '',
        transactionId: json['transactionId'] ?? 0);
  }
}
