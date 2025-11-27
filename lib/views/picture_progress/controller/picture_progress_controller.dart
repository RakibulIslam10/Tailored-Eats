import 'dart:io';

import 'package:image_picker/image_picker.dart';

import '../../../core/api/end_point/api_end_points.dart';
import '../../../core/api/model/basic_success_model.dart';
import '../../../core/api/services/api_request.dart';
import '../../../core/utils/basic_import.dart';

class PictureProgressController extends GetxController {
  final RxBool beforeToggle = true.obs;
  final RxBool afterToggle = false.obs;

  final List<Map<String, String>> storyImages = [
    {
      "url":
          "https://images.pexels.com/photos/2294361/pexels-photo-2294361.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260",
      "date": "25 Jul 2025",
    },
    {
      "url":
          "https://images.pexels.com/photos/4753897/pexels-photo-4753897.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260",
      "date": "20 Jul 2025",
    },
    {
      "url":
          "https://images.pexels.com/photos/414029/pexels-photo-414029.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260",
      "date": "18 Jul 2025",
    },
    {
      "url":
          "https://images.pexels.com/photos/841130/pexels-photo-841130.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260",
      "date": "15 Jul 2025",
    },
    {
      "url":
          "https://images.pexels.com/photos/1954524/pexels-photo-1954524.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260",
      "date": "10 Jul 2025",
    },
    {
      "url":
          "https://images.pexels.com/photos/1552249/pexels-photo-1552249.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260",
      "date": "05 Jul 2025",
    },
    {
      "url":
          "https://images.pexels.com/photos/1552100/pexels-photo-1552100.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260",
      "date": "01 Jul 2025",
    },
    {
      "url":
          "https://images.pexels.com/photos/416778/pexels-photo-416778.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260",
      "date": "28 Jun 2025",
    },
  ];

  File? selectedImg;
  final _imagePicker = ImagePicker();

  Future<void> pickImg() async {
    final pickedImg = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImg != null) {
      selectedImg = File(pickedImg.path);
      addImageProgressProcess();
    } else {
      CustomSnackBar.error('Image not selected');
    }
  }

  late Map<String, File?> selectedFile = {'profile-image': selectedImg};
  RxBool isLoadingAddImag = false.obs;

  Future<BasicSuccessModel> addImageProgressProcess() async {
    return await ApiRequest.multiMultipartRequest(
      endPoint: ApiEndPoints.addImagesProgress,
      isLoading: isLoadingAddImag,
      reqType: 'POST',
      body: {},
      files: selectedFile,
      fromJson: BasicSuccessModel.fromJson,
    );
  }
}
