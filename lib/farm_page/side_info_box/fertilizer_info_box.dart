import 'package:dst_helper/models/dst_object.dart';
import 'package:flutter/material.dart';

enum _Nutrient {
  /// 퇴비
  compost,

  /// 성장 촉진제
  growthFormula,

  /// 거름
  manure,

  /// 복합
  mix;

  Widget get image {
    switch (this) {
      case _Nutrient.compost:
        return Image.asset(
          'assets/images/compost_overlay_full.png',
        );
      case _Nutrient.growthFormula:
        return Image.asset(
          'assets/images/growth_formula_overlay_full.png',
        );
      case _Nutrient.manure:
        return Image.asset(
          'assets/images/manure_overlay_full.png',
        );
      case _Nutrient.mix:
        return const SizedBox.shrink();
    }
  }
}

class FertilizerInfoBox extends StatelessWidget {
  const FertilizerInfoBox({
    super.key,
    required this.color,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color,
        boxShadow: kElevationToShadow[2],
      ),
      child: Column(
        children: [
          ..._Nutrient.values.map((nutrient) => SizedBox(
                height: 60,
                child: Row(
                  children: [
                    nutrient.image,
                  ],
                ),
              )),
        ],
      ),
    );
  }
}

class FertilizerInfoBoxTag extends StatelessWidget {
  const FertilizerInfoBoxTag({
    super.key,
    this.onPressed,
    required this.size,
    required this.color,
  });

  final Color color;
  final Size size;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
        boxShadow: kElevationToShadow[2],
      ),
      child: IconButton(
        padding: const EdgeInsets.only(top: 4, bottom: 2),
        onPressed: onPressed,
        icon: Image.asset("assets/images/items/${const Fertilizer().assetName}.png"),
      ),
    );
  }
}
