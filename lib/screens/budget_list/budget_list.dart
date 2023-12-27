import 'package:flutter/material.dart';
import 'package:minco/screens/budget_list/budget_list_component.dart';
import 'package:minco/themes/minco.dart';

class BudgetList extends StatelessWidget {
  const BudgetList({super.key});

  static const routeName = 'budget-list';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Minco.defaultTheme,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'BUDGETS',
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: BudgetListView(),
            ),
          ],
        ),
      ),
    );
  }
}
