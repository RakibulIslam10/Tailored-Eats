import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../core/themes/token.dart';

class ProfileAvatarWidget extends StatelessWidget {
  final String imageUrl;
  final double size;

  /// Border control
  final bool hasBorder;
  final Color borderColor;
  final double borderWidth;

  const ProfileAvatarWidget({
    super.key,
    required this.imageUrl,
    this.size = 50,
    this.hasBorder = false,
    this.borderColor = CustomColors.primary,
    this.borderWidth = 2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      padding: hasBorder ? EdgeInsets.all(borderWidth) : EdgeInsets.zero,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: hasBorder
            ? Border.all(color: borderColor, width: borderWidth)
            : null,
      ),
      child: ClipOval(
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          width: size,
          height: size,
          fit: BoxFit.cover,

          /// Placeholder while loading
          placeholder: (context, url) => Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey.shade200,
            ),
          ),

          /// Error widget (if image fails)
          errorWidget: (context, url, error) => Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey.shade300,
            ),
            child: const Icon(Icons.error, color: Colors.red, size: 20),
          ),
        ),
      ),
    );
  }
}
