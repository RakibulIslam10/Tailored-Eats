import 'package:image_picker/image_picker.dart';

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



  final ImagePicker _imagePicker = ImagePicker();

  // Reactive selected image
  Rx<XFile?> selectedImg = Rx<XFile?>(null);

  /// Pick image from camera
  Future<void> uploadImage() async {
    try {
      final XFile? pickedImage = await _imagePicker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
      );

      if (pickedImage != null) {
        selectedImg.value = pickedImage;
      }
    } catch (e) {
      print("Error picking image: $e");
    }
  }

}
