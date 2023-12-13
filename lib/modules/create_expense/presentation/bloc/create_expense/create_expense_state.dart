part of 'create_expense_bloc.dart';

@freezed
class CreateExpenseState with _$CreateExpenseState {
  const factory CreateExpenseState(
  {

    @Default('') String image,
    CategoryEnum? category,
   @Default(ActionStatus.pure) ActionStatus status,

}
      ) = _CreateExpenseState;
}
