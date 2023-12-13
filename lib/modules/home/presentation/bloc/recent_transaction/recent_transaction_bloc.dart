import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:montra_app_a1/core/db/sqldb.dart';
import 'package:montra_app_a1/modules/home/data/model/transaction_model.dart';
import 'package:montra_app_a1/utils/action_status.dart';
import 'package:montra_app_a1/utils/failures.dart';

part 'recent_transaction_state.dart';
part 'recent_transaction_event.dart';
part 'recent_transaction_bloc.freezed.dart';

class RecentTransactionBloc
    extends Bloc<RecentTransactionEvent, RecentTransactionState> {
  final DatabaseService db = DatabaseService();

  RecentTransactionBloc() : super(const RecentTransactionState()) {
    on<_GetTransaction>((event, emit) async {
      emit(state.copyWith(status: ActionStatus.inProcess));
      final Either<Failure, List<TransactionModel>> response =
          await db.getTransactions();

      response.fold(
        (failure) {
          emit(state.copyWith(status: ActionStatus.isFailure));
        },
        (transactions) {
          emit(
            state.copyWith(list: transactions, status: ActionStatus.isSuccess),
          );
        },
      );
    });
  }
}
