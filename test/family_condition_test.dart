import 'package:dst_helper/farm_page/edit_farm_set/components/analysis_view/family_condition.dart';
import 'package:dst_helper/farm_page/farm_grid/farm_group/farm_group_model.dart';
import 'package:dst_helper/farm_page/farm_grid/farm_view/farm_view_model.dart';
import 'package:dst_helper/models/v2/item/items.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Success cases', () {
    test('Test for sample data', () {
      for (final model in SampleFarmGroupModel.preDefinedList) {
        final subject = FamilyCondition.withModel(model);
        expect(subject.isSatisfied, true);
      }
    });

    group('Testing on the basic farm type', () {
      test('Test for 1 kind of plants and [`basic`, `single`]', () {
        final farmGroupModel = FarmGroupModel.single(
          farmViewModel: FarmViewModel.basicWithTable(
            [Items.potato, Items.potato, null],
            [Items.potato, null, null],
            [Items.potato, null, null],
          ),
        );
        final subject = FamilyCondition.withModel(farmGroupModel);

        expect(subject.isSatisfied, true);
      });

      test('Test for 2 kinds of plants and [`basic`, `single`]', () {
        final farmGroupModel = FarmGroupModel.single(
          farmViewModel: FarmViewModel.basicWithTable(
            [Items.potato, Items.potato, Items.tomaRoot],
            [Items.potato, null, Items.tomaRoot],
            [Items.potato, Items.tomaRoot, Items.tomaRoot],
          ),
        );
        final subject = FamilyCondition.withModel(farmGroupModel);

        expect(subject.isSatisfied, true);
      });

      test('Test for 1 kind plant and [`basic`, `double`]', () {
        final farmGroupModel = FarmGroupModel.double(
            left: FarmViewModel.basicWithTable(
              [Items.potato, Items.potato, null],
              [Items.potato, null, null],
              [Items.potato, null, null],
            ),
            right: FarmViewModel.basicWithTable(
              [null, null, Items.potato],
              [null, null, Items.potato],
              [null, Items.potato, Items.potato],
            ));
        final subject = FamilyCondition.withModel(farmGroupModel);

        expect(subject.isSatisfied, true);
      });

      test('Test for 2 kinds of plants and [`basic`, `double`]', () {
        final farmGroupModel = FarmGroupModel.double(
            left: FarmViewModel.basicWithTable(
              [Items.potato, Items.potato, Items.tomaRoot],
              [Items.potato, null, Items.tomaRoot],
              [Items.potato, Items.tomaRoot, Items.tomaRoot],
            ),
            right: FarmViewModel.basicWithTable(
              [Items.potato, Items.potato, Items.tomaRoot],
              [Items.potato, null, Items.tomaRoot],
              [Items.potato, Items.tomaRoot, Items.tomaRoot],
            ));
        final subject = FamilyCondition.withModel(farmGroupModel);

        expect(subject.isSatisfied, true);
      });

      test('Test for 3 kinds of plants and [`basic`, `square`]', () {
        final crp1 = Items.potato;
        final crp2 = Items.tomaRoot;
        final crp3 = Items.carrot;
        final crp4 = Items.carrot;

        final farmGroupModel = FarmGroupModel.square(
          topLeft: FarmViewModel.basicWithTable(
            [crp4, crp4, crp4],
            [null, crp2, crp2],
            [null, null, crp1],
          ),
          topRight: FarmViewModel.basicWithTable(
            [crp4, null, null],
            [crp2, crp2, null],
            [crp1, null, null],
          ),
          bottomLeft: FarmViewModel.basicWithTable(
            [null, null, crp1],
            [null, crp3, crp3],
            [null, null, crp4],
          ),
          bottomRight: FarmViewModel.basicWithTable(
            [crp1, null, null],
            [crp3, crp3, null],
            [crp4, crp4, crp4],
          ),
        );
        final subject = FamilyCondition.withModel(farmGroupModel);

        expect(subject.isSatisfied, true);
      });
    });

    group('Testing on the dense farm type', () {
      test('Test for 1 kind of plants and [`dense`, `single`]', () {
        final farmGroupModel = FarmGroupModel.single(
          farmViewModel: FarmViewModel.denseWithTable(
            [Items.potato, Items.potato],
            [null, Items.potato, null],
            [Items.potato, null],
            [null, null, null],
          ),
        );
        final subject = FamilyCondition.withModel(farmGroupModel);

        expect(subject.isSatisfied, true);
      });

      test('Test for 2 kinds of plants and [`dense`, `single`]', () {
        final farmGroupModel = FarmGroupModel.single(
          farmViewModel: FarmViewModel.denseWithTable(
            [Items.potato, Items.potato],
            [null, Items.potato, null],
            [Items.potato, Items.tomaRoot],
            [Items.tomaRoot, Items.tomaRoot, Items.tomaRoot],
          ),
        );
        final subject = FamilyCondition.withModel(farmGroupModel);

        expect(subject.isSatisfied, true);
      });

      test('Test for 1 kind of plants and [`dense`, `double`]', () {
        final farmGroupModel = FarmGroupModel.double(
            left: FarmViewModel.denseWithTable(
              [null, Items.potato],
              [null, null, Items.potato],
              [null, null],
              [null, null, null],
            ),
            right: FarmViewModel.reverseDenseWithTable(
              [Items.potato, null, null],
              [Items.potato, null],
              [null, null, null],
              [null, null],
            ));
        final subject = FamilyCondition.withModel(farmGroupModel);

        expect(subject.isSatisfied, true);
      });
    });
  });

  group('Failure cases', () {
    group('Testing on the basic farm type', () {
      test('Test for empty farm', () {
        final farmGroupModel = FarmGroupModel.single(
          farmViewModel: FarmViewModel.empty(FarmType.basic),
        );
        final subject = FamilyCondition.withModel(farmGroupModel);

        expect(subject.isSatisfied, false);
      });

      test('Test for 1 kind of plants and [`basic`, `single`]', () {
        final farmGroupModel = FarmGroupModel.single(
          farmViewModel: FarmViewModel.basicWithTable(
            [Items.potato, null, null],
            [Items.potato, null, null],
            [Items.potato, null, null],
          ),
        );
        final subject = FamilyCondition.withModel(farmGroupModel);

        expect(subject.isSatisfied, false);
      });

      test('Test for 2 kinds of plants and [`basic`, `single`]', () {
        final farmGroupModel = FarmGroupModel.single(
          farmViewModel: FarmViewModel.basicWithTable(
            [Items.potato, Items.potato, null],
            [Items.potato, null, Items.tomaRoot],
            [Items.potato, Items.tomaRoot, Items.tomaRoot],
          ),
        );
        final subject = FamilyCondition.withModel(farmGroupModel);

        expect(subject.isSatisfied, false);
      });
    });

    group('Testing on the dense farm type', () {
      test('Test for empty farm', () {
        final farmGroupModel = FarmGroupModel.single(
          farmViewModel: FarmViewModel.empty(FarmType.dense),
        );
        final subject = FamilyCondition.withModel(farmGroupModel);

        expect(subject.isSatisfied, false);
      });
    });
  });
}
