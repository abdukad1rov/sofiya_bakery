import 'package:shop_app/src/core/tools/file_importers.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (BuildContext context, HomeProvider value, Widget? child) =>
          Container(
        padding: EdgeInsets.all(16.sp),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Заголовок
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 24), // для выравнивания
                Text(
                  context.l10n.language,
                  style: Styles.poppins700.copyWith(
                    fontSize: 18.sp,
                    color: AppColors.mainColor,
                  ),
                ),
                // Кнопка закрытия
                IconButton(
                  icon: const Icon(Icons.close, color: Colors.white, size: 18),
                  onPressed: () => Navigator.pop(context),
                  style: ButtonStyle(
                    backgroundColor:
                        WidgetStatePropertyAll(AppColors.mainColor),
                    shape: WidgetStatePropertyAll(CircleBorder()),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            _langTile(
              context,
              icon: AppIcons.kz,
              title: context.l10n.kazakh,
              isSelected: value.locale == const Locale('kk'),
              onTap: () => value.changeLocale(const Locale('kk')),
            ),
            SizedBox(height: 8),
            _langTile(
              context,
              icon: AppIcons.ru,
              title: context.l10n.russian,
              isSelected: value.locale == const Locale('ru'),
              onTap: () => value.changeLocale(const Locale('ru')),
            ),
            SizedBox(height: 8),
            _langTile(
              context,
              icon: AppIcons.usa,
              title: context.l10n.english,
              isSelected: value.locale == const Locale('en'),
              onTap: () => value.changeLocale(const Locale('en')),
            ),
          ],
        ),
      ),
    );
  }

  Widget _langTile(
    BuildContext context, {
    required String icon,
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 12.sp),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFF7E4FB) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppColors.mainColor : Colors.black12,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Image.asset(icon, width: 24, height: 24),
            SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: Styles.poppins500.copyWith(
                  fontSize: 14.sp,
                  color: Colors.black,
                ),
              ),
            ),
            if (isSelected)
              const Icon(Icons.check, color: AppColors.mainColor, size: 18),
          ],
        ),
      ),
    );
  }
}
