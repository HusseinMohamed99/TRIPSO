part of './../../../core/helpers/export_manager/export_manager.dart';

class SelectDateContent extends StatefulWidget {
  const SelectDateContent({super.key});

  @override
  State<SelectDateContent> createState() => _SelectDateContentState();
}

class _SelectDateContentState extends State<SelectDateContent> {
  DateTime? _firstDate;
  DateTime? _lastDate;

  int _calculateNumberOfDays() {
    if (_firstDate == null || _lastDate == null) {
      return 0;
    }
    return _lastDate!.difference(_firstDate!).inDays + 1;
  }

  List<Widget> _buildDateListTiles() {
    return List.generate(_calculateNumberOfDays(), (index) {
      return ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomTitle(title: 'Day ${index + 1}'),
            Icon(Icons.arrow_circle_right_outlined, size: 24.sp),
          ],
        ),
        onTap: () {
          context.pushNamed(
            Routes.pickPlans,
            // arguments: NumOf(numOfDays: _calculateNumberOfDays(), index: index + 1),
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildDateLabelsRow(),
        _buildDatePickersRow(),
        const SizedBox(height: 16),
        CustomTitle(title: 'Number of Days: ${_calculateNumberOfDays()}'),
        Expanded(
          child: _calculateNumberOfDays() == 0 || _calculateNumberOfDays() >= 8
              ? Image.asset(AssetPath.imagesGroup92)
              : ListView(children: _buildDateListTiles()),
        ),
      ],
    ).allPadding(
      hPadding: 16,
      vPadding: 20,
    );
  }

  Row _buildDateLabelsRow() {
    return Row(
      children: [
        CustomTitle(title: 'Starts on', color: Colors.grey),
        Space(
          height: 0,
          width: context.screenWidth * 0.3,
        ),
        CustomTitle(title: 'Ends on', color: Colors.grey),
      ],
    );
  }

  Row _buildDatePickersRow() {
    return Row(
      children: [
        Expanded(
          child: SelectDateCalendar(
            voidCallback: () async => _selectFirstDate(),
            title: _firstDate == null
                ? 'Select date'
                : DateTimeUtils.formatTasksDate(_firstDate),
          ),
        ),
        Space(height: 0, width: 10),
        Expanded(
          child: SelectDateCalendar(
            voidCallback: () async => _selectLastDate(),
            title: _lastDate == null
                ? 'Select date'
                : DateTimeUtils.formatTasksDate(_lastDate),
          ),
        ),
      ],
    );
  }

  Future<void> _selectFirstDate() async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: _firstDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: _lastDate ?? DateTime.now().add(const Duration(days: 60)),
    );

    if (selectedDate != null) {
      setState(() => _firstDate = selectedDate);
    }
  }

  Future<void> _selectLastDate() async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: _firstDate ?? DateTime.now(),
      firstDate: _firstDate ?? DateTime.now(),
      lastDate: _firstDate?.add(const Duration(days: 6)) ??
          DateTime.now().add(const Duration(days: 60)),
    );

    if (selectedDate != null) {
      setState(() => _lastDate = selectedDate);
    }
  }
}

class NumOf {
  final int numOfDays;
  final int index;

  NumOf({required this.numOfDays, required this.index});
}
