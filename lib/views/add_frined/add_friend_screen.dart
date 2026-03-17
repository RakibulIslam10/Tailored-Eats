import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tailored_eats/views/add_frined/add_friend_controller.dart';
import '../../../core/utils/basic_import.dart';
import 'model.dart';

class AddFriendScreen extends StatelessWidget {
  const AddFriendScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddFriendController());

    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: crossStart,
          children: [
            _buildHeader(),
            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(color: CustomColors.primary),
                  );
                }
                if (controller.suggestions.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisSize: mainMin,
                      children: [
                        Icon(Icons.group_off_outlined, size: 52.sp, color: const Color(0xFF2A2A2A)),
                        Space.height.v10,
                        TextWidget(
                          'No suggestions found',
                          color: const Color(0xFF555555),
                          fontSize: Dimensions.bodyMedium,
                        ),
                      ],
                    ),
                  );
                }
                return RefreshIndicator(
                  color: CustomColors.primary,
                  backgroundColor: const Color(0xFF1A1A1A),
                  onRefresh: controller.fetchSuggestions,
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.horizontalSize * 0.8,
                      vertical: Dimensions.verticalSize * 0.5,
                    ),
                    itemCount: controller.suggestions.length,
                    itemBuilder: (context, index) {
                      final user = controller.suggestions[index];
                      return Padding(
                        padding: EdgeInsets.only(bottom: 12.h),
                        child: _SuggestionCard(controller: controller, user: user),
                      );
                    },
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 20.h),
      decoration: const BoxDecoration(
        color: Color(0xFF0D0D0D),
      ),
      child: Column(
        crossAxisAlignment: crossStart,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () => Get.back(),
                child: Container(
                  width: 38.w,
                  height: 38.w,
                  decoration: BoxDecoration(
                    color: const Color(0xFF1C1C1C),
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(color: const Color(0xFF2A2A2A), width: 1),
                  ),
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 16.sp,
                    color: const Color(0xFFCCCCCC),
                  ),
                ),
              ),

            ],
          ),
          Space.height.v20,
          TextWidget(
            'Add Friends',
            fontSize: 28.sp,
            fontWeight: FontWeight.w700,
            color: const Color(0xFFF0F0F0),
          ),
          Space.height.v5,
          TextWidget(
            'Connect with people who share your goals',
            fontSize: Dimensions.bodySmall,
            color: const Color(0xFF666666),
            fontWeight: FontWeight.w400,
          ),
          Space.height.v20,
          // Divider
          Container(
            height: 1,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  CustomColors.primary.withOpacity(0.5),
                  const Color(0xFF0D0D0D),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SuggestionCard extends StatelessWidget {
  final AddFriendController controller;
  final Suggests user;

  const _SuggestionCard({required this.controller, required this.user});

  Color _avatarColor(String name) {
    final colors = [
      const Color(0xFF17C5B5),
      const Color(0xFF7C6EF5),
      const Color(0xFFFF6B6B),
      const Color(0xFFFFB347),
      const Color(0xFF48D1CC),
    ];
    return colors[name.codeUnitAt(0) % colors.length];
  }

  @override
  Widget build(BuildContext context) {
    final avatarColor = _avatarColor(user.name);

    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: const Color(0xFF141414),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: const Color(0xFF222222), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: crossCenter,
        children: [
          // Avatar
          Stack(
            children: [
              Container(
                width: 50.w,
                height: 50.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      avatarColor,
                      avatarColor.withOpacity(0.5),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: avatarColor.withOpacity(0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Center(
                  child: TextWidget(
                    user.name.isNotEmpty ? user.name[0].toUpperCase() : '?',
                    color: CustomColors.whiteColor,
                    fontSize: Dimensions.titleMedium,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Positioned(
                bottom: 1,
                right: 1,
                child: Container(
                  width: 11.w,
                  height: 11.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: CustomColors.success,
                    border: Border.all(color: const Color(0xFF141414), width: 2),
                  ),
                ),
              ),
            ],
          ),
          Space.width.v15,
          // Info
          Expanded(
            child: Column(
              crossAxisAlignment: crossStart,
              children: [
                TextWidget(
                  user.name,
                  fontSize: Dimensions.titleSmall,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFFEEEEEE),
                ),
                Space.height.v5,
                Wrap(
                  spacing: 6.w,
                  runSpacing: 4.h,
                  children: [
                    _DarkChip(
                      icon: Icons.track_changes_rounded,
                      label: user.mainGoal,
                      color: CustomColors.primary,
                    ),
                    _DarkChip(
                      icon: Icons.person_outline_rounded,
                      label: '${user.age}y · ${user.gender}',
                      color: const Color(0xFF7C6EF5),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Space.width.v10,
          // Add Button
          Obx(() {
            final isSent = controller.sentRequests.contains(user.id);
            final isSending = controller.sendingId.value == user.id;

            return GestureDetector(
              onTap: isSent || isSending
                  ? null
                  : () => controller.sendFriendRequest(user.id),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 350),
                width: 40.w,
                height: 40.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSent
                      ?  CustomColors.primary
                      : CustomColors.primary,
                  border: Border.all(
                    color: isSent
                        ? const Color(0xFF333333)
                        : CustomColors.primary,
                    width: 1.5,
                  ),
                  boxShadow: isSent
                      ? []
                      : [
                    BoxShadow(
                      color: CustomColors.primary.withOpacity(0.35),
                      blurRadius: 12,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Center(
                  child: isSending
                      ? SizedBox(
                    width: 16.w,
                    height: 16.w,
                    child: const CircularProgressIndicator(
                      strokeWidth: 2,
                      color: CustomColors.whiteColor,
                    ),
                  )
                      : Icon(
                    isSent ? Icons.check_rounded : Icons.person_add_alt_1_rounded,
                    size: 18.sp,
                    color: isSent
                        ? const Color(0xFF444444)
                        : CustomColors.whiteColor,
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}

class _DarkChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const _DarkChip({
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 3.h),
      decoration: BoxDecoration(
        color: color.withOpacity(0.08),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: color.withOpacity(0.2), width: 1),
      ),
      child: Row(
        mainAxisSize: mainMin,
        children: [
          Icon(icon, size: 10.sp, color: color.withOpacity(0.8)),
          SizedBox(width: 4.w),
          TextWidget(
            label,
            fontSize: Dimensions.labelSmall * 0.95,
            color: color.withOpacity(0.85),
            fontWeight: FontWeight.w500,
            maxLines: 1,
            textOverflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}