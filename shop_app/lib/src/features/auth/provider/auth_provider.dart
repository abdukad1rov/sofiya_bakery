import 'package:shop_app/src/core/tools/file_importers.dart';

class AuthProvider extends ChangeNotifier {
  UserModel? _user;
  String? phoneNumber;
  String? firstName;
  String? lastName;
  String? smsCode;
  String? currentSmsCode;

  UserModel? get user => _user;

  void initialize(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 0));

    if (DBService.isLogin) {
      _user = await AuthService.getUser(DBService.userId);

      if (context.mounted) {
        final homeProvider = Provider.of<HomeProvider>(context, listen: false);
        homeProvider.initialize();

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const BottomNavigationDemo(),
          ),
        );
      }
    } else {
      if (context.mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        );
      }
    }
  }

  void sendSMS() async {
    if (phoneNumber != null) {
      generateRandomNumber();
      await AuthService.sendSMS(phoneNumber!, smsCode!);
      print('SMS sent to $phoneNumber with code: $smsCode');
    }
  }

  void checkSmscode(BuildContext context) async {
    if (smsCode == currentSmsCode) {
      String? id = await AuthService.getUserWithPhoneNumber(phoneNumber!);

      if (id != null) {
        getUserWithId(id);
        if (context.mounted) {
          final homeProvider =
              Provider.of<HomeProvider>(context, listen: false);
          homeProvider.initialize();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const BottomNavigationDemo(),
            ),
          );
        }
        phoneNumber = _user?.phoneNumber;
        firstName = _user?.fullName.split(' ')[0];
        lastName = _user?.fullName.split(' ')[1];
      } else {
        if (context.mounted) {
          final homeProvider =
              Provider.of<HomeProvider>(context, listen: false);
          homeProvider.initialize();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const GetUserInfo(),
            ),
          );
        }
      }
    } else {
      showSnackBar(context, context.l10n.incorrectSMS);
    }
  }

  void getUserWithPhoneNumber(BuildContext context) async {
    if (phoneNumber != null) {
      String? id = await AuthService.getUserWithPhoneNumber(phoneNumber!);
      if (id != null) {
        getUserWithId(id);
        if (context.mounted) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const BottomNavigationDemo(),
            ),
          );
        }
        phoneNumber = _user?.phoneNumber;
        firstName = _user?.fullName.split(' ')[0];
        firstName = _user?.fullName.split(' ')[1];
      } else {
        if (context.mounted) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ),
          );
        }
      }
    }
  }

  void getUserWithId(String userId) async {
    UserModel? fetchedUser = await AuthService.getUser(userId);

    if (fetchedUser != null) {
      _user = fetchedUser;
      DBService.userId = '${user!.id}';
      DBService.isLogin = true;
    } else {
      DBService.userId = '';
      DBService.isLogin = false;
    }
  }

  void postUser(BuildContext context) async {
    if (firstName != null && lastName != null) {
      UserModel userModel = UserModel(
        id: -1,
        fullName: '$firstName $lastName',
        phoneNumber: '+7$phoneNumber',
        password: 'admin',
        favoriteProducts: [],
        orders: [],
      );

      try {
        if (context.mounted) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const BottomNavigationDemo(),
            ),
          );
        }

        String userId = await AuthService.postUser(userModel);
        _user = await AuthService.getUser(userId);

        DBService.userId = userId;
        DBService.isLogin = true;

        notifyListeners();
      } catch (e) {
        fatal('Error creating user: $e');
        if (context.mounted) {
          showSnackBar(context, context.l10n.errorCreatingUser);
        }
      }
    } else {
      showSnackBar(context, context.l10n.pleaseEnter);
    }
  }

  // void updateUser() async {
  //   await AuthService.updateUserFavoriteProducts(user!);
  //   getUserWithId(DBService.userId);
  // }

  void updateUser2() async {
    await AuthService.updateUserFavoriteProducts(user!);
    getUserWithId(DBService.userId);
  }

  void generateRandomNumber() {
    Random random = Random();
    int min = 100000;
    int max = 999999;
    smsCode = '${min + random.nextInt(max - min)}';
  }

  void logout(BuildContext context) {
    _user = null;
    phoneNumber = null;
    firstName = null;
    lastName = null;
    DBService.userId = '';
    DBService.isLogin = false;
    notifyListeners();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
      (route) => false,
    );
  }

  void showSnackBar(BuildContext context, String message, {Color? color}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color ?? AppColors.red,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        margin: const EdgeInsets.all(16.0),
        elevation: 6.0,
        duration: const Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
