import 'package:shop_app/src/core/tools/file_importers.dart';

class UserInfoScreen extends StatelessWidget {
  const UserInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: const Text(
          "Профиль",
          style: TextStyle(color: AppColors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Consumer<AuthProvider>(
            builder: (
              BuildContext context,
              AuthProvider provider,
              Widget? child,
            ) =>
                Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: AppColors.mainColor,
                      child: CircleAvatar(
                        radius: 45,
                        backgroundImage: NetworkImage(
                          'https://cdn-icons-png.flaticon.com/512/7382/7382094.png',
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                  ],
                ),
                const SizedBox(height: 20),

                Text(
                  provider.user?.fullName ?? 'null',
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),

                TextField(
                  controller: TextEditingController(text: provider.lastName),
                  decoration: const InputDecoration(
                    labelText: "Имя",
                    hintText: "Имя",
                  ),
                ),
                const SizedBox(height: 10),

                TextField(
                  controller: TextEditingController(text: provider.firstName),
                  decoration: const InputDecoration(
                    labelText: "Фамилия",
                    hintText: "Фамилия",
                  ),
                ),
                const SizedBox(height: 10),
                const TextField(
                  decoration: InputDecoration(
                    labelText: "Отчество",
                    hintText: "Отчество",
                  ),
                ),
                const SizedBox(height: 10),

                const TextField(
                  decoration: InputDecoration(
                    labelText: "E-mail",
                    hintText: "example@mail.com",
                  ),
                ),
                const SizedBox(height: 10),

                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: "Пол",
                  ),
                  value: "Мужской",
                  items: const [
                    DropdownMenuItem(
                      value: "Мужской",
                      child: Text("Мужской"),
                    ),
                    DropdownMenuItem(
                      value: "Женский",
                      child: Text("Женский"),
                    ),
                  ],
                  onChanged: (value) {},
                ),
                const SizedBox(height: 10),

                // Телефон
                const TextField(
                  decoration: InputDecoration(
                    labelText: "Телефон",
                  ),
                ),
                const SizedBox(height: 30),

                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 15,
                      ),
                      backgroundColor: AppColors.mainColor,
                      minimumSize: const Size(double.infinity, 30),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      // Save button pressed
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(fontSize: 18, color: AppColors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// import 'package:shop_app/src/core/tools/file_importers.dart';

// class UserInfoScreen extends StatefulWidget {
//   const UserInfoScreen({super.key});

//   @override
//   State<UserInfoScreen> createState() => _UserInfoScreenState();
// }

// String firstName = "";
// String lastName = "";

// class _UserInfoScreenState extends State<UserInfoScreen> {
//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<AuthProvider>(context);
//     final profileProvider = Provider.of<ProfileProvider>(context);

//     TextEditingController firstNameController = TextEditingController(
//         text: provider.user?.fullName.split(' ')[0] ?? "");

//     final TextEditingController lastNameController = TextEditingController(
//         text: provider.user?.fullName.split(' ')[1] ?? "");

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("My Info"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         child: Consumer<AuthProvider>(
//           builder: (context, provider, child) => Column(
//             children: [
//               SizedBox(height: 20.h),
//               CustomTextField(
//                 controller: firstNameController,
//                 labelText: "First Name",
//                 onChanged: (value) => profileProvider.firstName = value,
//               ),
//               CustomTextField(
//                 controller: lastNameController,
//                 labelText: "Last Name",
//                 onChanged: (value) => profileProvider.lastName = value,
//               ),
//               CustomTextField(
//                 enabled: false,
//                 controller:
//                     TextEditingController(text: provider.user!.phoneNumber),
//                 labelText: "Phone Number",
//                 onChanged: (value) {},
//               ),
//               SizedBox(height: 20.h),
//               CustomButton(
//                 text: "Save",
//                 onPressed: () {
//                   // profileProvider.updateUser(context);
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class CustomTextField extends StatelessWidget {
//   const CustomTextField({
//     required this.controller,
//     required this.labelText,
//     required this.onChanged,
//     this.enabled = true,
//     super.key,
//   });

//   final TextEditingController controller;
//   final String labelText;
//   final Function(String) onChanged;
//   final bool enabled;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 10.h),
//       child: TextField(
//         enabled: enabled,
//         controller: controller,
//         onChanged: onChanged,
//         inputFormatters: [
//           FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
//           FilteringTextInputFormatter.singleLineFormatter,
//           FilteringTextInputFormatter.deny(RegExp(r'\s')),
//         ],
//         keyboardType: TextInputType.text,
//         decoration: InputDecoration(
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.all(
//               Radius.circular(10.sp),
//             ),
//           ),
//           fillColor: AppColors.white10,
//           filled: true,
//           labelText: labelText,
//         ),
//       ),
//     );
//   }
// }
