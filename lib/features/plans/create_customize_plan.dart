part of './../../core/helpers/export_manager/export_manager.dart';

class CreateCustomizePlan extends StatelessWidget {
  const CreateCustomizePlan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsManager.primaryColor,
        leading: IconButton(
          icon: Icon(
            size: 24.sp,
            Icons.arrow_back_ios,
            color: ColorsManager.whiteColor,
          ),
          onPressed: () {
            context.pop();
          },
        ),
        title: Text(
          'Customize Plan',
          style: context.titleMedium?.copyWith(
            fontWeight:
                FontWeightHelper.semiBold, // Slightly heavier font weight
            color: ColorsManager.whiteColor,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Image.asset(
              AssetPath.plan,
            ),
          ),
          Card(
            elevation: 6,
            color: ColorsManager.whiteColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20).r,
            ),
            child: CustomCard(),
          ).onlyPadding(
            bottomPadding: 20,
          ),
        ],
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 10.h,
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      alignment: Alignment.center,
      width: double.infinity,
      height: 150.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/Group 66.png',
            width: 140.w,
            height: 200.h,
            fit: BoxFit.cover,
          ),
          Space(height: 0, width: 20),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Can\'t find what you\'re looking for?\nCreate your plan from\nthe start',
                maxLines: 4,
                style: context.labelLarge?.copyWith(
                  color: ColorsManager.blackPrimary,
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorsManager.primaryColor,
                ),
                onPressed: () {
                  // Navigator.pushNamed(
                  //   context,
                  //   SelectDateScreen.routeName,
                  // );
                },
                child: Text(
                  'Create',
                  style: context.labelLarge?.copyWith(
                    color: ColorsManager.whiteColor,
                  ),
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}
