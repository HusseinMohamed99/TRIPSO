part of './../../core/helpers/export_manager/export_manager.dart';

class CreateCustomizePlan extends StatelessWidget {
  const CreateCustomizePlan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context: context,
        title: 'Customize Plan',
      ),
      body: Column(
        children: [
          Expanded(
            child: Image.asset(
              AssetPath.plan,
            ),
          ),
          CustomCard().onlyPadding(bottomPadding: 20),
        ],
      ),
    );
  }
}
