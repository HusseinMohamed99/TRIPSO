part of './../../core/helpers/export_manager/export_manager.dart';

class SelectDateScreen extends StatelessWidget {
  const SelectDateScreen({
    super.key,
    required this.argument,
  });
  final String argument;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: customAppBar(
          context: context,
          title: 'Select Date',
        ),
        body: SelectDateContent(
          cId: argument,
        ),
      ),
    );
  }
}
