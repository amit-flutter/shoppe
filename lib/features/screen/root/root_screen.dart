import 'package:get/get.dart';
import 'package:shoppe/export.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  RootController controller = RootController.to;
  final List _screens = [HomeScreen(), ProfileScreen(), ProfileScreen(), ProfileScreen(), ProfileScreen()];

  void _onItemTapped(int index) {
    if (controller.selectedIndex.value != index) controller.selectedIndex.value = index;
  }

  //to-do check otp response model
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(Global.customOverLay(color: ColorConst.kWhiteColor));
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (controller.selectedIndex.value != 0) {
          controller.selectedIndex.value = 0;
        } else {
          exit(0); // Force exit the app (not recommended for production)
        }
      },
      child: Obx(() {
        return Scaffold(
          body: _screens[controller.selectedIndex.value],
          bottomNavigationBar: CustomBottomNav(currentIndex: controller.selectedIndex.value, onTap: _onItemTapped),
        );
      }),
    );
  }
}

class CustomBottomNav extends StatelessWidget {
  const CustomBottomNav({required this.currentIndex, required this.onTap, super.key});
  final int currentIndex;
  final void Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(border: Border(top: BorderSide(color: ColorConst.kBlackColor, width: 0))),
      child: BottomNavigationBar(
        selectedFontSize: 12,
        elevation: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: currentIndex,
        onTap: onTap,
        backgroundColor: ColorConst.kWhiteColor,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: ColorConst.kBlackColor,
        unselectedItemColor: ColorConst.kPrimaryColor,
        items: [
          buildBottomNavigationBarItem(index: 0, label: 'Home'),
          buildBottomNavigationBarItem(index: 1, label: 'WishList'),
          buildBottomNavigationBarItem(index: 2, label: 'New'),
          buildBottomNavigationBarItem(index: 3, label: 'Cart'),
          buildBottomNavigationBarItem(index: 4, label: 'Profile'),
        ],
      ),
    );
  }

  BottomNavigationBarItem buildBottomNavigationBarItem({required String label, required int index}) {
    return BottomNavigationBarItem(
      label: label,
      tooltip: label,
      icon: Column(
        children: [
          CustomSvgImage(
            logo: '${ImageConst.homePath}/home${index + 1}.svg',
            color: currentIndex == index ? ColorConst.kBlackColor : ColorConst.kPrimaryColor,
          ),
          gap4,
          Container(
            height: 3,
            width: s16,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              color: currentIndex == index ? ColorConst.kBlackColor : Colors.transparent,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ],
      ),
    );
  }
}
