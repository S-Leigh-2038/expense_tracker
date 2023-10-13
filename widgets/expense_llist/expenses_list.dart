import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';
import '../../models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    required this.expenseList,
    Key? key,
    required this.removeListItem,
  }) : super(key: key);

  final List<Expense> expenseList;
  final void Function(Expense expense) removeListItem;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenseList.length,
      itemBuilder: (context, index) => Dismissible(
        key: ValueKey(expenseList[index]),
        background: Container(
          color: Theme.of(context).colorScheme.error,
          margin: EdgeInsets.symmetric(
              horizontal: Theme.of(context).cardTheme.margin!.horizontal),
        ),
        onDismissed: (direction) {
          removeListItem(expenseList[index]);
        },
        child: ExpenseItem(
          expenseList[index],
        ),
      ),
    );
  }
}
