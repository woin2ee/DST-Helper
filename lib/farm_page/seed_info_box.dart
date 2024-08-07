import 'package:dst_helper/models/items.dart';
import 'package:dst_helper/models/plants.dart';
import 'package:flutter/material.dart';

class SeedInfoBox extends StatefulWidget {
  const SeedInfoBox({super.key});

  @override
  State<StatefulWidget> createState() => _SeedInfoBoxState();
}

class _SeedInfoBoxState extends State<SeedInfoBox> {
  bool folded = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SeedInfoBoxIcon(onPressed: () {
          setState(() {
            folded = !folded;
          });
        }),
        if (!folded)
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.brown.shade400,
              boxShadow: kElevationToShadow[2],
            ),
            child: FittedBox(
              child: Column(
                children: [
                  const Text(
                    "Seeds",
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
                  Column(
                    children: Plants.crops
                        .map((crop) => SizedBox(
                              height: 46,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'items/${crop.assetName}_seeds.png',
                                  ),
                                  const Text(
                                    "=",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      letterSpacing: 10,
                                    ),
                                  ),
                                  Image.asset('items/${crop.assetName}.png'),
                                ],
                              ),
                            ))
                        .toList(),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

class SeedInfoBoxIcon extends StatelessWidget {
  const SeedInfoBoxIcon({super.key, required this.onPressed});

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      decoration: BoxDecoration(
        color: Colors.brown.shade400,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
        boxShadow: kElevationToShadow[2],
      ),
      child: IconButton(
        padding: const EdgeInsets.only(left: 8, right: 8, bottom: 3),
        iconSize: 20,
        onPressed: onPressed,
        icon: Image.asset(
          "items/${const Seeds().assetName}.png",
          width: 50,
        ),
      ),
    );
  }
}
