import 'package:shop_app/src/core/tools/file_importers.dart';

class SelectLocationScreen extends StatefulWidget {
  const SelectLocationScreen({super.key});

  @override
  State<SelectLocationScreen> createState() => _SelectLocationScreenState();
}

class _SelectLocationScreenState extends State<SelectLocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<GeoLocationProvider>(
      builder:
          (BuildContext context, GeoLocationProvider provider, Widget? child) =>
              Scaffold(
        appBar: AppBar(
          title: Text(
            'Location Info',
            style: Styles.poppins500.copyWith(fontSize: 18.sp),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () => provider.save(context),
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              CustomTextField(
                label: 'Name',
                onChanged: (value) {
                  provider.setLocationName(value);
                },
                hintText: 'Enter your location name',
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      label: 'Home №',
                      onChanged: (value) => provider.homeNumber = value,
                      hintText: 'Home №',
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: CustomTextField(
                      label: 'Flat №',
                      onChanged: (value) => provider.flatNumber,
                      hintText: 'Flat №',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      label: 'Intercom code',
                      onChanged: (value) => provider.intercomCode = value,
                      hintText: 'Intercom code',
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: CustomTextField(
                      label: 'Add..phone number',
                      onChanged: (value) => provider.addPhoneNumber = value,
                      hintText: 'Add..phone number',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              CustomButton(
                text: context.l10n.save,
                onPressed: () => provider.save(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.label,
    required this.onChanged,
    required this.hintText,
    this.controller,
    super.key,
  });

  final TextEditingController? controller;
  final ValueChanged<String> onChanged;
  final String hintText;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        border: const OutlineInputBorder(),
        labelText: label,
        labelStyle: const TextStyle(color: AppColors.mainColor),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.mainColor,
          ),
        ),
      ),
    );
  }
}
