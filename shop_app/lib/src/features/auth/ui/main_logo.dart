import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app/src/core/tools/file_importers.dart';

class MainLogo extends StatelessWidget {
  const MainLogo({
    required this.text,
    super.key,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          child: DecoratedBox(
            decoration: const BoxDecoration(
              color: Color(0xFFC4A484),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 80),
                Center(
                  child: CircleAvatar(
                    radius: 100,
                    backgroundColor: AppColors.mainColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Safia",
                          style: GoogleFonts.pacifico(
                              fontSize: 80, color: AppColors.white10),
                        ),
                        Text(
                          "café & bakery",
                          style: GoogleFonts.lato(
                            fontSize: 20,
                            color: AppColors.white10,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            text,
                            style: Styles.poppins900.copyWith(fontSize: 15),
                          ),
                        ),
                        const SizedBox(
                          width: 70,
                          height: 4,
                          child: ColoredBox(color: AppColors.mainColor),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
