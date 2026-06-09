import 'package:shop_app/src/core/tools/file_importers.dart';

class BottomNavigationDemo extends StatefulWidget {
  const BottomNavigationDemo({super.key});

  @override
  State<BottomNavigationDemo> createState() => _BottomNavigationDemoState();
}

class _BottomNavigationDemoState extends State<BottomNavigationDemo> {
  final ValueNotifier<int> _selectedIndex = ValueNotifier(0);
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex.value);
  }

  @override
  void dispose() {
    _pageController.dispose();
    _selectedIndex.dispose();
    super.dispose();
  }

  void _onItemTapped(int index, BuildContext context) {
    if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const CartScreen(),
        ),
      );
      _selectedIndex.value = 0;
    } else {
      _selectedIndex.value = index;
    }
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: ValueListenableBuilder<int>(
          valueListenable: _selectedIndex,
          builder: (context, selectedIndex, child) {
            if (selectedIndex == 0) {
              return Text(context.l10n.home);
            } else if (selectedIndex == 1) {
              return Text(context.l10n.order);
            } else {
              return Text(context.l10n.home);
            }
          },
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: const Icon(
                Icons.menu,
                size: 24,
              ),
            );
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: IconButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  backgroundColor: AppColors.white,
                  builder: (context) {
                    return const LanguageBottomSheet();
                  },
                );
              },
              icon: const Icon(
                Icons.language_outlined,
                size: 24,
              ),
            ),
          )
        ],
      ),
      drawer: const ProfileDrawer(),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: const <Widget>[
          HomeScreen(),
          OrderScreen(),
          HomeScreen(),
        ],
        onPageChanged: (index) {
          _selectedIndex.value = index;
          if (index == 1) {
            final orderProvider =
                Provider.of<OrderProvider>(context, listen: false);
            orderProvider.initialize(context);
          }

          if (index == 2) {
            _selectedIndex.value = 0;
          }
        },
      ),
      bottomNavigationBar: Consumer<CartProvider>(
        builder:
            (BuildContext context, CartProvider cartProvider, Widget? child) =>
                ValueListenableBuilder<int>(
          valueListenable: _selectedIndex,
          builder: (BuildContext context, int value, Widget? child) =>
              BottomNavigationBar(
            backgroundColor: AppColors.white,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: const Icon(Icons.home),
                label: context.l10n.home,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.list_alt_sharp),
                label: context.l10n.order,
              ),
              BottomNavigationBarItem(
                icon: Badge(
                  backgroundColor: cartProvider.cart.isEmpty
                      ? Colors.transparent
                      : AppColors.red,
                  label: cartProvider.cart.isEmpty
                      ? null
                      : Text(cartProvider.cart.length.toString()),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CartScreen(),
                        ),
                      );
                    },
                    child: const Icon(Icons.shopping_cart),
                  ),
                ),
                label: context.l10n.cart,
              ),
            ],
            currentIndex: _selectedIndex.value,
            selectedItemColor: AppColors.mainColor,
            onTap: (value) {
              _onItemTapped(value, context);
            },
          ),
        ),
      ),
    );
  }
}
