part of './../../core/helpers/export_manager/export_manager.dart';

class SelectDateScreen extends StatefulWidget {
  const SelectDateScreen({super.key});
  @override
  State<SelectDateScreen> createState() => _SelectDateScreenState();
}

class _SelectDateScreenState extends State<SelectDateScreen> {
  DateTime? _firstDate;
  DateTime? _lastDate;

  int _numberOfDays() {
    if (_firstDate == null || _lastDate == null) {
      return 0;
    } else {
      return _lastDate!.difference(_firstDate!).inDays + 1;
    }
  }

  List<Widget> _buildDateCheckboxes() {
    List<Widget> checkboxes = [];
    for (int i = 0; i < _numberOfDays(); i++) {
      int index = i + 1;
      checkboxes.add(
        Padding(
          padding: const EdgeInsets.all(8.0).r,
          child: ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Day $index'),
                Icon(
                  Icons.arrow_circle_right_outlined,
                  size: 24.sp,
                )
              ],
            ),
            onTap: () {
              context.pushNamed(
                Routes.pickPlans,
                // arguments: NumOf(numOfDays: _numberOfDays(), index: index),
              );
              // Navigator.pushNamed(
              //   context,
              //   PickPlans.routeName,
              //   arguments: NumOf(numOfDays: _numberOfDays(), index: index),
              // );
            },
          ),
        ),
      );
    }
    return checkboxes;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: customAppBar(
          context: context,
          title: 'Select Date',
        ),
        body: Column(
          children: [
            Row(
              children: [
                Space(height: 0, width: context.width * 0.03),
                CustomTitle(
                  title: 'Starts on',
                  color: Colors.grey,
                ),
                Space(height: 0, width: context.width * 0.26),
                CustomTitle(
                  title: 'Ends on',
                  color: Colors.grey,
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: SelectDateCalendar(
                    voidCallback: () async {
                      buildFirstDatePicker(context);
                    },
                    title: _firstDate == null
                        ? 'Select date'
                        : DateTimeUtils.formatTasksDate(_firstDate),
                  ),
                ),
                Expanded(
                  child: SelectDateCalendar(
                    voidCallback: () async {
                      buildLastDatePicker(context);
                    },
                    title: _lastDate == null
                        ? 'Select date'
                        : DateTimeUtils.formatTasksDate(_lastDate),
                  ),
                ),
              ],
            ),
            Space(height: 16, width: 0),
            CustomTitle(
              title: 'Number of Days: ${_numberOfDays()}',
              // style: GoogleFonts.roboto(fontSize: 20.sp),
            ),
            if (_numberOfDays() >= 8)
              Padding(
                padding: const EdgeInsets.only(top: 60.0).r,
                child: CustomTitle(
                  title: 'You Can Selected Only 7 Days',
                  color: Colors.redAccent,
                ),
              ),
            _numberOfDays() == 0 || _numberOfDays() >= 8
                ? Expanded(
                    child: Image.asset(AssetPath.imagesGroup92),
                  )
                : Expanded(
                    child: ListView(
                      children: _buildDateCheckboxes(),
                    ),
                  ),
          ],
        ).onlyPadding(
          leftPadding: 20,
          rightPadding: 20,
          topPadding: 20,
        ),
      ),
    );
  }

  void buildLastDatePicker(BuildContext context) async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: _firstDate ?? DateTime.now(),
      firstDate: _firstDate ?? DateTime.now(),
      lastDate: _firstDate?.add(const Duration(days: 6)) ??
          DateTime.now().add(const Duration(days: 60)),
    );
    if (selectedDate != null) {
      setState(() {
        _lastDate = selectedDate;
      });
    }
  }

  void buildFirstDatePicker(BuildContext context) async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: _firstDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: _lastDate ?? DateTime.now().add(const Duration(days: 60)),
    );
    if (selectedDate != null) {
      setState(() {
        _firstDate = selectedDate;
      });
    }
  }
}

class NumOf {
  int numOfDays;
  int index;

  NumOf({required this.numOfDays, required this.index});
}
