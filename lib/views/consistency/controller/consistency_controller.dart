import '../../../core/utils/basic_import.dart';

class WeightData {
  final double x;
  final double y;
  final String label;
  final String change;

  WeightData(this.x, this.y, this.label, this.change);
}

class ConsistencyController extends GetxController {




  var weightList = <WeightData>[
    WeightData(0, 60, '05-10', '+0kg'),
    WeightData(1, 62, '10-17', '+2kg'),
    WeightData(2, 59, '17-20', '-3kg'),
    WeightData(3, 70, '20-25', '+10kg'),
    WeightData(4, 65, '25-27', '-5kg'),
    WeightData(5, 72, '27-31', '+7kg'),
    WeightData(6, 69, '01-10', '-3kg'),
    WeightData(7, 71, '10-20', '+2kg'),
  ].obs;









  final List<String> items = [
    'https://picsum.photos/id/1011/600/800',
    'https://picsum.photos/id/1012/600/800',
    'https://picsum.photos/id/1013/600/800',
    'https://picsum.photos/id/1014/600/800',
    'https://picsum.photos/id/1015/600/800',
  ];
}
