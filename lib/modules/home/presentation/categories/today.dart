// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:montra_app_a1/globals/widgets/home/transaction_item.dart';
import 'package:montra_app_a1/modules/home/presentation/bloc/recent_transaction/recent_transaction_bloc.dart';
import 'package:montra_app_a1/modules/transaction/presentation/ui/info_page/transaction_detail.dart';
import 'package:montra_app_a1/utils/action_status.dart';

class TodayCategory extends StatelessWidget {
  const TodayCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RecentTransactionBloc, RecentTransactionState>(
      listener: (context, state) {
        print(state.list.length);
        print(state.list.length == state.list.length + 1);
        if (state.status == ActionStatus.isSuccess) {
          if (state.list.length == state.list.length + 1) {
            context
                .read<RecentTransactionBloc>()
                .add(const RecentTransactionEvent.getTransaction());
          }
        }
      },
      child: BlocBuilder<RecentTransactionBloc, RecentTransactionState>(
        builder: (context, state) {
          if (state.status == ActionStatus.inProcess) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          } else if (state.status == ActionStatus.isSuccess) {
            return CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => TransactionWidget(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (c) => TransactionDetailsPage(
                              info:
                                  state.list[state.list.length - 1 - index]))),
                      entity: state.list[state.list.length - 1 - index],
                      // state.list[index],
                    ),
                    childCount: state.list.length,
                  ),
                )
              ],
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
