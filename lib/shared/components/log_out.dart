import 'package:tripso/shared/network/cache_helper.dart';

void logOut(context) {
  CacheHelper.removeData(
    key: 'uId',
  ).then((value) {
    if (value) {
      // navigateAndFinish(context, routeName: OnBoard.routeName);
    }
  });
}
