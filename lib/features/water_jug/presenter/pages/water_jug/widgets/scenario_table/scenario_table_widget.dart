import 'package:flutter/material.dart';
import 'package:samo/features/water_jug/domain/entities/entities.dart';

class ScenarioTableWidget extends StatelessWidget {
  const ScenarioTableWidget({
    required List<StepEntity> stepEntity,
    required this.tableTitle,
    super.key,
  }) : _stepList = stepEntity;

  final List<StepEntity> _stepList;
  final String tableTitle;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              '$tableTitle (${_stepList.length} steps)',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            Table(
              border: TableBorder.all(),
              children: [
                const TableRow(
                  children: [
                    Text(
                      'Jug 1:',
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Jug 2:',
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Description:',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                ..._stepList
                    .map((step) => TableRow(
                          children: [
                            TableCell(
                              verticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              child: Text(
                                '${step.jugOne}',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            TableCell(
                              verticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              child: Text(
                                '${step.jugTwo}',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            TableCell(
                              verticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              child: Text(
                                step.description,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ))
                    .toList(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
