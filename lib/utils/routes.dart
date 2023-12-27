import 'package:minco/screens/budget_list/budget_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:minco/utils/auth/sign_in.dart';

class MincoRoutes {
  static String initialRoute = FirebaseAuth.instance.currentUser == null
      ? '/sign-in'
      : BudgetList.routeName;

  static getRoutes() {
    return {
      '/sign-in': (context) {
        return MincoAuth.getSignInScreen();
      },
      BudgetList.routeName: (context) {
        return const BudgetList();
      }
    };
  }
}
