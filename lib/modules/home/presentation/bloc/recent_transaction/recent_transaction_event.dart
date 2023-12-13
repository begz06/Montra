part of 'recent_transaction_bloc.dart';

@freezed
class RecentTransactionEvent with _$RecentTransactionEvent {
  const factory RecentTransactionEvent.getTransaction() = _GetTransaction;
}
