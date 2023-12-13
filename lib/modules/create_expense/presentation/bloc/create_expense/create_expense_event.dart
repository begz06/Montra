part of 'create_expense_bloc.dart';

@freezed
class CreateExpenseEvent with _$CreateExpenseEvent {
  const factory CreateExpenseEvent.createExpense(
      {required String price, required String desc,required bool isExpense}) = _CreateExpense;
  const factory CreateExpenseEvent.changeImage(
      {required String image}) = _ChangeImage;
  const factory CreateExpenseEvent.changeCategory(
      {required CategoryEnum category}) = _ChangeCategory;
}
