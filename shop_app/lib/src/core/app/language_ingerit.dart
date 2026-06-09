import 'package:shop_app/src/core/tools/file_importers.dart';

class LanguageController extends ChangeNotifier {
  LanguageController();

  Locale get locale => Locale(DBService.languageCode);

  void changeLocale(Locale newLocale) async {
    DBService.languageCode = newLocale.languageCode;
    notifyListeners();
  }
}

class LanguageInherit extends InheritedNotifier<LanguageController> {
  const LanguageInherit({
    required super.child,
    required super.notifier,
    super.key,
  });

  static LanguageInherit? maybeOf(BuildContext context,
          {bool listen = false}) =>
      listen
          ? context.dependOnInheritedWidgetOfExactType<LanguageInherit>()
          : context
              .getElementForInheritedWidgetOfExactType<LanguageInherit>()
              ?.widget as LanguageInherit?;

  static Never _notFoundStateOfType() => throw ArgumentError(
        'Out of scope, not found state of type LanguageInherit',
        'out_of_scope',
      );

  static LanguageController controllerOf(BuildContext context,
          {bool listen = false}) =>
      maybeOf(context, listen: listen)?.notifier ?? _notFoundStateOfType();
}
