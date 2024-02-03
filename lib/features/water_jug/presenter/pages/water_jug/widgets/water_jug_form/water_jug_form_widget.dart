import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samo/features/water_jug/presenter/cubits/cubits.dart';
import 'package:samo/features/water_jug/presenter/pages/water_jug/widgets/widgets.dart';

class WaterJugFormWidget extends StatefulWidget {
  const WaterJugFormWidget({super.key});

  @override
  State<WaterJugFormWidget> createState() => _WaterJugFormWidgetState();
}

class _WaterJugFormWidgetState extends State<WaterJugFormWidget> {
  late final WaterJugCubit _waterJugCubit;
  late final TextEditingController _jugOneTextController;
  late final TextEditingController _jugTwoTextController;
  late final TextEditingController _wantedAmountTextController;
  final SizedBox _sizedBoxSpacing = const SizedBox(height: 16);

  @override
  void initState() {
    super.initState();

    _waterJugCubit = context.read<WaterJugCubit>();
    _jugOneTextController = TextEditingController();
    _jugTwoTextController = TextEditingController();
    _wantedAmountTextController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WaterJugTextFormFieldWidget(
          controller: _jugOneTextController,
          onChanged: _waterJugCubit.onChangedJugOne,
          hintText: 'Ex: 3',
          labelText: 'Jug 1',
        ),
        _sizedBoxSpacing,
        WaterJugTextFormFieldWidget(
          controller: _jugTwoTextController,
          onChanged: _waterJugCubit.onChangedJugTwo,
          hintText: 'Ex: 5',
          labelText: 'Jug 2',
        ),
        _sizedBoxSpacing,
        WaterJugTextFormFieldWidget(
          controller: _wantedAmountTextController,
          onChanged: _waterJugCubit.onChangedWantedAmount,
          hintText: 'Ex: 4',
          labelText: 'Wanted Amount',
        ),
        _sizedBoxSpacing,
        ElevatedButton(
          onPressed: () {
            FocusScope.of(context).unfocus();
            _waterJugCubit.getScenarios();
          },
          child: const Text('Get Scenarios'),
        ),
        _sizedBoxSpacing,
      ],
    );
  }
}
