import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:tailored_eats/core/api/end_point/api_end_points.dart';
import 'package:tailored_eats/core/api/model/basic_success_model.dart';
import 'package:tailored_eats/core/api/services/api_request.dart';
import 'package:intl/intl.dart';
import 'package:tailored_eats/views/home/controller/home_controller.dart';
import '../../../core/utils/basic_import.dart';
import '../model/user_progress_image_model.dart';
import '../model/weight_controler_model.dart';

class WeightData {
  final double x;
  final double y;
  final String label;
  final String change;

  WeightData(this.x, this.y, this.label, this.change);
}

class ConsistencyController extends GetxController {
  RxList<WeightData> weightList = <WeightData>[].obs;
  RxList<WeightDatas> weightDataList = <WeightDatas>[].obs;
  RxBool isLoadingWeight = false.obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadInitialData();
  }

  Future<void> loadInitialData() async {
    try {
      isLoading.value = true;
      await Future.wait([
        getWeightControlData(),
        getUsersImageProgress(),
        Get.find<HomeController>().loadInitialData(),
      ]);
    } finally {
      isLoading.value = false;
    }
  }

  Future<WeightControlModel> getWeightControlData() async {
    weightDataList.clear();

    return await ApiRequest.get(
      fromJson: WeightControlModel.fromJson,
      endPoint: ApiEndPoints.getWeightControl,
      isLoading: isLoadingWeight,
      onSuccess: (result) {
        weightDataList.addAll(result.data);
        _processWeightData();
      },
    );
  }

  void _processWeightData() {
    if (weightDataList.isEmpty) {
      weightList.clear();
      return;
    }

    final sortedData = weightDataList.toList()
      ..sort((a, b) => a.createdAt.compareTo(b.createdAt));

    List<WeightData> processedData = [];

    for (int i = 0; i < sortedData.length; i++) {
      final current = sortedData[i];

      final label = DateFormat('dd-MM').format(current.createdAt);

      String change = '+0kg';
      if (i > 0) {
        final previous = sortedData[i - 1];
        final diff = current.weightKg - previous.weightKg;

        if (diff > 0) {
          change = '+${diff}kg';
        } else if (diff < 0) {
          change = '${diff}kg';
        } else {
          change = '0kg';
        }
      }

      processedData.add(
        WeightData(i.toDouble(), current.weightKg.toDouble(), label, change),
      );
    }

    weightList.value = processedData;
  }

  double get minWeight {
    if (weightList.isEmpty) return 50;
    final min = weightList.map((e) => e.y).reduce((a, b) => a < b ? a : b);
    return (min - 5).floorToDouble();
  }

  double get maxWeight {
    if (weightList.isEmpty) return 80;
    final max = weightList.map((e) => e.y).reduce((a, b) => a > b ? a : b);
    return (max + 5).ceilToDouble();
  }

  // Latest weight info
  String get currentWeight {
    if (weightList.isEmpty) return '0 kg';
    return '${weightList.last.y.toInt()} kg';
  }

  String get weightTrend {
    if (weightList.length < 2) return 'No change';
    final first = weightList.first.y;
    final last = weightList.last.y;
    final diff = last - first;

    if (diff > 0) return '+${diff.toInt()} kg overall';
    if (diff < 0) return '${diff.toInt()} kg overall';
    return 'Stable';
  }

  // Refresh data
  Future<void> refreshWeightData() async {
    await getWeightControlData();
  }

  final List<String> items = [
    'https://picsum.photos/id/1011/600/800',
    'https://picsum.photos/id/1012/600/800',
    'https://picsum.photos/id/1013/600/800',
    'https://picsum.photos/id/1014/600/800',
    'https://picsum.photos/id/1015/600/800',
  ];

  RxBool isGetImageLoading = false.obs;
  RxList<DatumData> imageProgressList = <DatumData>[].obs;

  Future<UserProgressImageModel> getUsersImageProgress() async {
    imageProgressList.clear();
    return await ApiRequest.get(
      fromJson: UserProgressImageModel.fromJson,
      endPoint: ApiEndPoints.userImagesProgress,
      isLoading: isGetImageLoading,
      onSuccess: (result) => imageProgressList.addAll(result.data),
    );
  }
}
