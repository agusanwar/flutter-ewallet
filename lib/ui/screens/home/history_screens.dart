import 'package:aipay/blocs/transaction/transaction_bloc.dart';
import 'package:aipay/ui/widgets/home_last_transaction_widget.dart';
import 'package:flutter/material.dart';
import 'package:aipay/shared/themes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryScreens extends StatelessWidget {
  const HistoryScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // body: Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     // FEATURED
        //     Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         Padding(
        //           padding: const EdgeInsets.only(
        //             top: 20,
        //             left: 14,
        //             right: 14,
        //           ),
        //           child: Row(
        //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //             children: [
        //               Text(
        //                 'Last Transaction',
        //                 style: whiteTextStyle.copyWith(
        //                   fontSize: 18,
        //                   fontWeight: semiBold,
        //                 ),
        //               ),
        //               InkWell(
        //                 onTap: () {
        //                   Navigator.pushNamed(context, '/last-transaction');
        //                 },
        //                 child: Row(
        //                   children: [
        //                     Text(
        //                       'See All',
        //                       style: greenTextStyle.copyWith(
        //                         fontSize: 14,
        //                         fontWeight: semiBold,
        //                       ),
        //                     ),
        //                     const SizedBox(width: 5),
        //                     Icon(
        //                       Icons.keyboard_double_arrow_right_rounded,
        //                       color: kGreenColor,
        //                       size: 18,
        //                     ),
        //                   ],
        //                 ),
        //               ),
        //             ],
        //           ),
        //         ),
        //         Padding(
        //           padding: const EdgeInsets.symmetric(horizontal: 10),
        //           child: Container(
        //             margin: const EdgeInsets.only(top: 20),
        //             decoration: BoxDecoration(
        //               borderRadius: BorderRadius.circular(10),
        //               color: kDarkBackgraundColor.withOpacity(0.5),
        //             ),
        //             child: BlocProvider(
        //               create: (context) =>
        //                   TransactionBloc()..add(TransactionGet()),
        //               child: BlocBuilder<TransactionBloc, TransactionState>(
        //                 builder: (context, state) {
        //                   if (state is TransactionSuccess) {
        //                     return Column(
        //                       children: state.transactions.map((transaction) {
        //                         return HomeLastTransaction(
        //                           transaction: transaction,
        //                           color: kBlackSoftColor,
        //                         );
        //                       }).toList(),
        //                     );
        //                   }
        //                   return const Center(
        //                     child: CircularProgressIndicator(),
        //                   );
        //                 },
        //               ),
        //             ),
        //           ),
        //         ),
        //       ],
        //     ),
        //     const SizedBox(
        //       height: 20,
        //     ),
        //   ],
        // ),
        );
  }
}
