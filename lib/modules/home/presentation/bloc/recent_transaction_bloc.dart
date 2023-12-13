import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:montra_app_a1/core/db/my_db.dart';
import 'package:montra_app_a1/modules/home/data/model/transaction.dart';
import 'package:montra_app_a1/utils/action_status.dart';

part 'recent_transaction_event.dart';

part 'recent_transaction_state.dart';

part 'recent_transaction_bloc.freezed.dart';

class RecentTransactionBloc
    extends Bloc<RecentTransactionEvent, RecentTransactionState> {
  final db = DatabaseService();

  RecentTransactionBloc() : super(const RecentTransactionState()) {
    on<_GetTransaction>((event, emit) async {
      emit(state.copyWith(status: ActionStatus.inProcess));

      final result = await db.getTransactions();
      if (result.isRight) {
        emit(
            state.copyWith(list: result.right, status: ActionStatus.isSuccess));
      } else {
        emit(state.copyWith(status: ActionStatus.isFailure));
      }
    });
  }
}
