import '../../../core/utils/basic_import.dart';

class ReportController extends GetxController {

  RxString selectedIssue = ''.obs;

  List<String> problemList = [
    'Technical Issue (e.g., app crash, login problem)',
    ' Meal/Nutrition Issue (e.g., wrong macros, missing meal)',
    'Payment & Billing',
    ' Account & Profile',
    " Other problem",
  ];
}
