class HomeEntity {
  final String circleImage;
  final String month;
  final int price;
  final int incomePrice;
  final int expensesPrice;
  final RecentTransactionEntity recentTransaction;
  final int spendFrequency;

  HomeEntity(
      {required this.circleImage,
      required this.expensesPrice,
      required this.incomePrice,
      required this.month,
      required this.price,
      required this.spendFrequency,
      required this.recentTransaction});
}

class RecentTransactionEntity {
  final String iconPath;
  final String title;
  final String image;
  final String color;
  final String subTitle;
  final int transactionPrice;
  final bool isExpense;
  final String time;

  RecentTransactionEntity(
      {required this.iconPath,
      required this.title,
      required this.subTitle,
      required this.color,
      required this.image,
      required this.time,
      required this.isExpense,
      required this.transactionPrice});
}
