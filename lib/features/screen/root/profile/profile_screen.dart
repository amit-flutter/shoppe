import 'package:shoppe/export.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: p24,
          child: ListTile(
            tileColor: ColorConst.kGrey300.withValues(alpha: 0.2),
            onTap: () {
              AuthController.instance.logout();
            },
            title: CustomText(text: StringConst.logout),
            trailing: Icon(Icons.login_outlined),
          ),
        ),
      ),
    );
  }
}
