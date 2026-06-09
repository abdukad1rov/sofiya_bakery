import 'package:shop_app/src/core/tools/file_importers.dart';

class LangListTile extends StatefulWidget {
  const LangListTile({
    required this.icon,
    required this.title,
    required this.onTap,
    required this.isSellected,
    super.key,
  });

  final String icon;
  final String title;
  final VoidCallback onTap;
  final bool isSellected;

  @override
  State<LangListTile> createState() => _LangListTileState();
}

class _LangListTileState extends State<LangListTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: ListTile(
        onTap: () {
          widget.onTap();
        },
        leading: Image(
          image: AssetImage(widget.icon),
        ),
        title: Text(widget.title),
        trailing: widget.isSellected
            ? CircleAvatar(
                radius: 10.sp,
                backgroundColor: AppColors.mainColor,
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
