part of './../../../core/helpers/export_manager/export_manager.dart';

class SelectDateCalendar extends StatelessWidget {
  const SelectDateCalendar({
    super.key,
    required this.voidCallback,
    required this.title,
  });
  final VoidCallback voidCallback;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 10.w,
        vertical: 10.h,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 10.w,
        vertical: 10.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10).r,
        border: Border.all(color: Colors.grey),
      ),
      child: GestureDetector(
        onTap: voidCallback,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomTitle(
              title: title,
              color: Colors.grey,
            ),
            Icon(
              Icons.calendar_month,
              size: 24.sp,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
