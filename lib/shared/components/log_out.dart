import 'package:tripso/shared/components/show_toast.dart';
import '../network/cache_helper.dart';
import 'navigator.dart';

void logOut(context) {
  CacheHelper.removeData(
    key: 'uId',
  ).then((value) {
    if (value) {
      navigateAndFinish(context,  routeName: 'SignInScreen');
      showToast(text: 'logOut is Successful', state: ToastStates.success);
    }
  });
}