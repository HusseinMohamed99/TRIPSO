part of './../../../core/helpers/export_manager/export_manager.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      color: ColorsManager.whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20).r,
      ),
      child: Container(
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
                  CustomTitle(
                    title:
                        'Can\'t find what you\'re looking for?\nCreate your plan from\nthe start',
                  ),
                  DefaultMaterialButton(
                    function: () {
                      context.pushNamed(
                        Routes.selectDateScreen,
                      );
                    },
                    text: 'Create',
                    context: context,
                    width: 100.w,
                    height: 35.h,
                    radius: 20.r,
                    color: ColorsManager.primaryColor,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
