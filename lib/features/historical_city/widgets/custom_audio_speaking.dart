part of './../../../core/helpers/export_manager/export_manager.dart';

class CustomAudioSpeaking extends StatelessWidget {
  const CustomAudioSpeaking({
    super.key,
    required this.voidCallback,
  });

  final VoidCallback voidCallback;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: const StadiumBorder(
        side: BorderSide(
          color: ColorsManager.whiteColor,
        ),
      ),
      child: CircleAvatar(
        radius: 30.r,
        backgroundColor: ColorsManager.whiteColor,
        child: IconButton(
          onPressed: voidCallback,
          icon: Icon(
            Icons.record_voice_over,
            color: ColorsManager.primaryColor,
            size: 30.sp,
          ),
        ),
      ),
    );
  }
}
