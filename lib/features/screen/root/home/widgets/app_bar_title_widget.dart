import 'package:shoppe/export.dart';
import 'package:shoppe/features/screen/root/home/widgets/circle_image_widget.dart';

class AppBarTitleWidget extends StatelessWidget {
  const AppBarTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleImageWidget(),
        gap10,
        ContainerButton(title: StringConst.myActivity, onTap: () {}, height: s(34), padding: padX(18)),
      ],
    );
  }
}
