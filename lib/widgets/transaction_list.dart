import 'package:chart_app/models/trasnaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../widgets/transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;

  TransactionList(this.transactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: transactions.isEmpty
          ? Column(
              children: [
                const Text(
                  'No transaction yet',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/image/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : Card(
              child: Container(
                child: ListView.builder(
                  itemBuilder: (ctx, index) {
                    return TransactionItem(
                        transaction: transactions[index],
                        deleteTransaction: deleteTransaction);
                  },
                  itemCount: transactions.length,
                ),
              ),
            ),
    );
  }
}
