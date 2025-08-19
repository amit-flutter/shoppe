import 'package:shoppe/core/utils/constants/string_constants.dart';

class OnBoardInfoModel {
  String image;
  String title;
  String description;
  OnBoardInfoModel({required this.image, required this.title, required this.description});

  static List<OnBoardInfoModel> onBoardInfoList = [
    OnBoardInfoModel(
      image:
          'https://www.shutterstock.com/image-photo/vertical-photo-three-multiethnic-girlfriends-600nw-2293936345.jpg',
      title: StringConst.hello,
      description: StringConst.onBoard1,
    ),
    OnBoardInfoModel(
      image: 'https://www.shutterstock.com/image-photo/shot-three-attractive-girlfriends-smiling-600w-2393693541.jpg',
      title: StringConst.ready,
      description: StringConst.onBoard2,
    ),
  ];
}
