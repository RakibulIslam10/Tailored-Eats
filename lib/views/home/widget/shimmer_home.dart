import 'package:flutter/cupertino.dart';
import 'package:shadify/shadify.dart';

class ShimmerHome extends StatelessWidget {
  const ShimmerHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.10,

    ).withShadifyLoading(loading: true);
  }
}
