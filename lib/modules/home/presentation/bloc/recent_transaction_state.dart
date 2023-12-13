part of 'recent_transaction_bloc.dart';

@freezed
class RecentTransactionState with _$RecentTransactionState {
  const factory RecentTransactionState(
      {
    @Default([]) List<TransactionModel> list,
    @Default(ActionStatus.pure) ActionStatus status,
  }) = _RecentTransactionState;
}
