import 'package:montra_app_a1/assets/constants/svg_pictures.dart';

enum CategoryEnum {
  shopping('shopping', "Shopping", SvgPictures.shopping, 'FCEED4'),
  subscription("subc", "Subscription", SvgPictures.recuringBill, 'EEE5FF'),
  food("food", "Food", SvgPictures.restaurant, 'FDD5D7');

  final String type;
  final String title;
  final String iconPath;
  final String colorHex;

  const CategoryEnum(this.type, this.title, this.iconPath, this.colorHex);
}
