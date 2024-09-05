import 'dart:math';

import 'package:dst_helper/farm_page/farm_list/farm_plant/farm_plant.dart';
import 'package:dst_helper/farm_page/farm_list/farm_plant_card/farm_plant_card.dart';
import 'package:dst_helper/farm_page/farm_list/farm_plant_set/farm_plant_set.dart';
import 'package:dst_helper/models/v2/item/items.dart';
import 'package:flutter/material.dart';

// For examples
void main() {
  runApp(
    MaterialApp(
      home: StreamExample(),
    ),
  );
}

class StreamExample extends StatelessWidget {
  StreamExample({super.key});

  final stream = Stream.periodic(const Duration(seconds: 1), (x) => x).take(10);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: stream,
      initialData: -1,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return Text('none: ${snapshot.requireData}');
          case ConnectionState.waiting:
            return Text('waiting: ${snapshot.requireData}');
          case ConnectionState.active:
            return Text('active: ${snapshot.requireData}');
          case ConnectionState.done:
            return Text('done: ${snapshot.requireData}');
        }
      },
    );
  }
}

class FutureTestingContainer extends StatefulWidget {
  const FutureTestingContainer({super.key});

  @override
  State<FutureTestingContainer> createState() => _FutureTestingContainerState();
}

class _FutureTestingContainerState extends State<FutureTestingContainer> {
  Future<String>? textData;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      children: [
        FutureBuilder<String>(
          future: textData,
          initialData: 'Initial data.',
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                if (snapshot.hasData) {
                  return Text(snapshot.data!);
                } else {
                  return const Text('None.');
                }
              case ConnectionState.waiting:
                return const Text('Waiting...');
              case ConnectionState.active:
                return const Text('Active.');
              case ConnectionState.done:
                return const Text('Done.');
            }
          },
        ),
        ElevatedButton(
          child: const Text('Update'),
          onPressed: () {
            setState(() {
              textData = Future.delayed(const Duration(seconds: 1), () => 'New');
            });
          },
        )
      ],
    );
  }
}

class TestingContainer extends StatelessWidget {
  const TestingContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final farmPlantSetModel = FarmPlantSetModel.double(
      left: FarmPlantModel.basic(
        Crops.potato,
        Crops.potato,
        Crops.potato,
        Crops.potato,
        Crops.potato,
        Crops.potato,
        Crops.potato,
        Crops.potato,
        Crops.potato,
      ),
      right: FarmPlantModel.basic(
        Crops.potato,
        Crops.potato,
        Crops.potato,
        Crops.potato,
        Crops.potato,
        Crops.potato,
        Crops.potato,
        Crops.potato,
        Crops.potato,
      ).copyWith(darkTheme: true),
    );
    final farmPlantSet = FarmPlantSet(
      farmPlantSetModel: farmPlantSetModel,
      onPressed: (farmPlantIndex) => (plantIndex) => () => Crops.crops[Random().nextInt(Crops.crops.length)],
    );

    final FarmPlantCard farmPlantCard = FarmPlantCard(
      model: FarmPlantCardModel(
        title: 'Example',
        farmPlantSetModel: farmPlantSetModel,
      ),
    );

    return Container(
      color: Colors.white54,
      child: Center(
        child: IntrinsicWidth(child: farmPlantCard),
      ),
    );
  }
}
