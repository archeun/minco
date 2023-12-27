import 'package:flutter/material.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:minco/utils/db.dart';

class BudgetListView extends StatelessWidget with Db {
  BudgetListView({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    ColorScheme colorScheme = theme.colorScheme;
    return FirestoreListView(
      query: db.collection('budgets'),
      itemBuilder: (context, snapshot) {
        Map<String, dynamic> budget = snapshot.data();
        return Card(
          clipBehavior: Clip.hardEdge,
          child: InkWell(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          budget['name'],
                          style: theme.textTheme.titleMedium,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: Row(
                        children: [
                          ColoredBox(
                            color: colorScheme.secondary,
                            child: SizedBox(
                              width: 18,
                              height: 18,
                              child: Text(
                                'E',
                                textAlign: TextAlign.center,
                                style: theme.textTheme.titleMedium?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  height: 0,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                            child: Text(
                              '\$${budget['estimated']}',
                              style: theme.textTheme.bodyLarge,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                            child: Icon(
                              Icons.circle,
                              size: 5,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                            child: ColoredBox(
                              color: colorScheme.error,
                              child: SizedBox(
                                width: 18,
                                height: 18,
                                child: Text(
                                  'A',
                                  textAlign: TextAlign.center,
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    height: 0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                            child: Text(
                              '\$${budget['actual']}',
                              style: theme.textTheme.bodyLarge,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                            child: Icon(
                              Icons.circle,
                              size: 5,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                            child: Icon(
                              Icons.person,
                              size: theme.textTheme.titleMedium?.fontSize,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                            child: Text(
                              '${budget['no_of_users']}',
                              style: theme.textTheme.bodyLarge,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 11,
                            child: Text(
                              budget['from_to'],
                              style: theme.textTheme.bodyMedium,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Icon(
                              budget['status'] == 'Settled'
                                  ? Icons.check_box_rounded
                                  : Icons.warning_rounded,
                              color: budget['status'] == 'Settled'
                                  ? colorScheme.secondary
                                  : colorScheme.error,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            onTap: () {},
          ),
        );
      },
    );
  }
}
