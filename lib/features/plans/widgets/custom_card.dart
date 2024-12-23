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
                      context.pushNamed(
                        Routes.selectDateScreen,
                      );
                    },
                    child: Text(
                      'Create',
                      style: context.labelLarge?.copyWith(
                        color: ColorsManager.whiteColor,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
