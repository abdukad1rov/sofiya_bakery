import 'package:shop_app/src/core/tools/file_importers.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.contact,
          style: Styles.poppins500.copyWith(fontSize: 16.sp),
        ),
      ),
      body: homeProvider.branches.isEmpty
          ? Center(
              child: Text(
                'No branches available',
                style: Styles.poppins400.copyWith(fontSize: 16.sp),
              ),
            )
          : ListView.separated(
              separatorBuilder: (context, index) =>
                  Divider(thickness: 1, color: Colors.grey.shade300),
              itemCount: homeProvider.branches.length,
              itemBuilder: (context, index) {
                final branch = homeProvider.branches[index];
                return Card(
                  elevation: 2,
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    title: Text(branch.name,
                        style: Styles.poppins500.copyWith(fontSize: 18.sp)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),
                        Text(branch.address,
                            style: Styles.poppins400.copyWith(fontSize: 14.sp)),
                        const SizedBox(height: 4),
                        Text('Phone: ${branch.phoneNumber}',
                            style: Styles.poppins400.copyWith(fontSize: 14.sp)),
                        const SizedBox(height: 4),
                        Text('Email: ${branch.email}',
                            style: Styles.poppins400.copyWith(fontSize: 14.sp)),
                        const SizedBox(height: 4),
                        Text('Hours: ${branch.openingHours}',
                            style: Styles.poppins400.copyWith(fontSize: 14.sp)),
                      ],
                    ),
                    leading: const CircleAvatar(
                      backgroundColor: AppColors.mainColor,
                      child: Icon(Icons.location_on, color: Colors.white),
                    ),
                    onTap: () {},
                  ),
                );
              },
            ),
    );
  }
}
