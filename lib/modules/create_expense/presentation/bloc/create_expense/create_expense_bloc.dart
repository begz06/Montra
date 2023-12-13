import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jiffy/jiffy.dart';
import 'package:montra_app_a1/core/db/my_db.dart';
import 'package:montra_app_a1/modules/home/data/model/transaction.dart';
import 'package:montra_app_a1/utils/action_status.dart';
import 'package:montra_app_a1/utils/enums.dart';

part 'create_expense_event.dart';

part 'create_expense_state.dart';

part 'create_expense_bloc.freezed.dart';

class CreateExpenseBloc extends Bloc<CreateExpenseEvent, CreateExpenseState> {
  final db = DatabaseService();
  final bool isExpense;

  CreateExpenseBloc(this.isExpense) : super(const CreateExpenseState()) {
    on<_CreateExpense>((event, emit) async {
      emit(state.copyWith(status: ActionStatus.inProcess));
      final result = await db.insertTransaction(TransactionModel(
          id: 0,
          text: event.desc,
          colorHex: state.category!.colorHex,
          type: state.category!.type,
          title: state.category!.title,
          price: int.parse(event.price),
          iconPath: state.category!.iconPath,
          subtransactions: [],
          image: state.image,
          isExpenses: 0,
          date: Jiffy.now()
              .subtract(days: 5)
              .format(pattern: 'yyyy-MM-dd hh:mm:ss')));

      emit(state.copyWith(status: ActionStatus.isSuccess));
    });

    on<_ChangeImage>((event, emit) {
      emit(state.copyWith(image: event.image));
    });
    on<_ChangeCategory>((event, emit) {
      emit(state.copyWith(category: event.category));
    });
  }
}
