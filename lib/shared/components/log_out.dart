import 'package:tripso/mobile/screens/sign_in/sign_in_screen.dart';
import 'package:tripso/shared/components/navigator.dart';
import 'package:tripso/shared/network/cache_helper.dart';

void logOut(context) {
  CacheHelper.removeData(
    key: 'uId',
  ).then((value) {
    if (value) {
      navigateAndFinish(context, routeName: SignInScreen.routeName);
    }
  });
}