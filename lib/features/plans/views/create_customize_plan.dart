part of '../../../core/helpers/export_manager/export_manager.dart';

class CreateCustomizePlan extends StatelessWidget {
  const CreateCustomizePlan({
    super.key,
    required this.cId,
  });
  final String cId;

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
          CustomCard(
            cId: cId,
          ).onlyPadding(bottomPadding: 20),
        ],
      ),
    );
  }
}
