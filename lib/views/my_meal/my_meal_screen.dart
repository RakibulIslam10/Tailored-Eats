import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tailored_eats/widgets/auth_app_bar.dart';
import 'package:tailored_eats/widgets/loading_widget.dart';
import '../../core/utils/basic_import.dart';
import '../../routes/routes.dart';
import '../home/screen/home_screen.dart';
import '../nutrition/screen/nutrition_screen.dart';
import 'model/my_custom_meal_model.dart';
import 'my_meal_controller.dart';

class MyMealScreen extends GetView<MyMealController> {
  const MyMealScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: CommonAppBar(title: 'My Meals'),
      body: Obx(
        () => controller.isLoading.value
            ? LoadingWidget()
            : controller.myMealsList.isEmpty
            ? _buildEmptyState()
            : ListView.builder(
                padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.defaultHorizontalSize,
                  vertical: Dimensions.heightSize,
                ),
                itemCount: controller.myMealsList.length,
                itemBuilder: (context, index) {
                  var meal = controller.myMealsList[index];
                  return _MyMealCard(meal: meal);
                },
              ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.restaurant_menu, size: 70.h, color: CustomColors.grey700),
          Space.height.v20,
          TextWidget(
            'No custom meals yet',
            fontSize: Dimensions.titleMedium,
            fontWeight: FontWeight.w600,
            color: CustomColors.grey600,
          ),
          Space.height.v10,
          TextWidget(
            'Tap + to add your first custom meal',
            fontSize: Dimensions.bodySmall,
            color: CustomColors.grey700,
          ),
        ],
      ),
    );
  }
}

class _MyMealCard extends GetView<MyMealController> {
  final Datum meal;

  const _MyMealCard({required this.meal});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: InkWell(
        borderRadius: BorderRadius.circular(Dimensions.radius * 0.85),
        // onTap: () => Get.toNamed(Routes.detailsScreen, arguments: meal.name),
        child: Container(
          margin: EdgeInsets.only(bottom: Dimensions.heightSize * 1.5),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(Dimensions.radius * 0.85),
          ),
          child: Row(
            crossAxisAlignment: crossStart,
            children: [
              // ── Image + delete badge ──
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(
                      Dimensions.radius * 0.8,
                    ),
                    child: CachedNetworkImage(
                      imageUrl:
                          Uri.tryParse(meal.image)?.hasAbsolutePath == true &&
                              meal.image.startsWith('http')
                          ? meal.image
                          : controller.getRandomImage(),
                      width: 100.w,
                      height: 85.h,
                      fit: BoxFit.cover,
                      placeholder: (_, __) => Shimmer.fromColors(
                        baseColor: CustomColors.grey800,
                        highlightColor: CustomColors.grey700,
                        child: Container(
                          width: 100.w,
                          height: 85.h,
                          decoration: BoxDecoration(
                            color: CustomColors.grey800,
                            borderRadius: BorderRadius.circular(
                              Dimensions.radius * 0.8,
                            ),
                          ),
                        ),
                      ),
                      errorWidget: (_, __, ___) => Container(
                        width: 100.w,
                        height: 85.h,
                        decoration: BoxDecoration(
                          color: CustomColors.grey800,
                          borderRadius: BorderRadius.circular(
                            Dimensions.radius * 0.8,
                          ),
                        ),
                        child: Icon(
                          Icons.broken_image_outlined,
                          color: CustomColors.grey600,
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                  // time badge on image
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.widthSize * 0.6,
                        vertical: 3.h,
                      ),
                      decoration: BoxDecoration(
                        color: CustomColors.primary.withOpacity(0.85),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(Dimensions.radius * 0.8),
                          bottomRight: Radius.circular(Dimensions.radius * 0.8),
                        ),
                      ),
                      child: TextWidget(
                        meal.time,
                        fontSize: Dimensions.labelSmall * 0.8,
                        fontWeight: FontWeight.w600,
                        color: CustomColors.whiteColor,
                      ),
                    ),
                  ),
                ],
              ),

              // ── Details ──
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.defaultHorizontalSize * 0.6,
                    vertical: Dimensions.verticalSize * 0.2,
                  ),
                  child: Column(
                    crossAxisAlignment: crossStart,
                    children: [
                      // Title
                      TextWidget(
                        meal.name,
                        fontWeight: FontWeight.bold,
                        fontSize: Dimensions.titleSmall,
                        maxLines: 1,
                        textOverflow: TextOverflow.ellipsis,
                        color: CustomColors.whiteColor,
                      ),

                      Space.height.v5,

                      // Description
                      TextWidget(
                        meal.description,
                        fontSize: Dimensions.titleSmall * 0.85,
                        maxLines: 2,
                        textOverflow: TextOverflow.ellipsis,
                        color: CustomColors.grey600,
                      ),

                      Space.height.v10,

                      // Calories + PrepTime
                      Row(
                        children: [
                          Icon(
                            Icons.local_fire_department,
                            size: Dimensions.iconSizeDefault,
                            color: Colors.orange,
                          ),
                          SizedBox(width: 3.w),
                          TextWidget(
                            "${meal.details.calories} kcal",
                            fontSize: Dimensions.titleSmall * 0.8,
                            color: CustomColors.grey400,
                          ),
                          Space.width.v10,
                          Icon(
                            Icons.access_time_rounded,
                            size: Dimensions.iconSizeDefault,
                            color: CustomColors.grey600,
                          ),
                          SizedBox(width: 3.w),
                          TextWidget(
                            "${meal.details.prepTime} min",
                            fontSize: Dimensions.titleSmall * 0.8,
                            color: CustomColors.grey400,
                          ),
                        ],
                      ),

                      Space.height.v10,

                      // Macros
                      Row(
                        children: [
                          _MacroTag(
                            label: "C",
                            value: meal.macros.carbs,
                            color: Colors.blue,
                          ),
                          Space.width.v5,
                          _MacroTag(
                            label: "P",
                            value: meal.macros.protein,
                            color: Colors.red,
                          ),
                          Space.width.v5,
                          _MacroTag(
                            label: "F",
                            value: meal.macros.fat,
                            color: Colors.amber,
                          ),
                          const Spacer(),
                          TextWidget(
                            "\$${meal.details.price}",
                            fontSize: Dimensions.titleSmall * 0.85,
                            fontWeight: FontWeight.w600,
                            color: CustomColors.success,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MacroTag extends StatelessWidget {
  final String label;
  final int value;
  final Color color;

  const _MacroTag({
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(Dimensions.radius * 0.5),
      ),
      child: TextWidget(
        "$label: ${value}g",
        fontSize: Dimensions.labelSmall * 0.85,
        fontWeight: FontWeight.w600,
        color: color,
      ),
    );
  }
}
