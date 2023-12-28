import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:minco/screens/budget_list/budget_list_component.dart';
import 'package:minco/themes/minco.dart';

class BudgetList extends StatelessWidget {
  const BudgetList({super.key});

  static const routeName = 'budget-list';

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormBuilderState>();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (BuildContext context) {
                return Container(
                  height: 600,
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  // You can wrap this Column with Padding of 8.0 for better design
                  child: FormBuilder(
                    key: formKey,
                    child: ListView(
                      children: [
                        FormBuilderTextField(
                          name: 'email',
                          decoration: const InputDecoration(labelText: 'Email'),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                            FormBuilderValidators.email(),
                          ]),
                        ),
                        const SizedBox(height: 10),
                        FormBuilderTextField(
                          name: 'password',
                          decoration:
                          const InputDecoration(labelText: 'Password'),
                          obscureText: true,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                          ]),
                        ),
                        MaterialButton(
                          color: Theme.of(context).colorScheme.secondary,
                          onPressed: () {
                            // Validate and save the form values
                            formKey.currentState?.saveAndValidate();
                            debugPrint(formKey.currentState?.value.toString());

                            // On another side, can access all field values without saving form with instantValues
                            formKey.currentState?.validate();
                            debugPrint(
                                formKey.currentState?.instantValue.toString());
                          },
                          child: const Text('Login'),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          },
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Colors.white,
          shape: const CircleBorder(),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
