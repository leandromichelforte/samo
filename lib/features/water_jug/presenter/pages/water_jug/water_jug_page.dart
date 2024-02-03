import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samo/features/water_jug/presenter/cubits/cubits.dart';
import 'package:samo/features/water_jug/presenter/pages/water_jug/widgets/widgets.dart';

class WaterJugPage extends StatefulWidget {
  const WaterJugPage({super.key});

  @override
  State<WaterJugPage> createState() => _WaterJugPageState();
}

class _WaterJugPageState extends State<WaterJugPage> {
  late final WaterJugCubit _waterJugCubit;
  late final TextEditingController _jugOneTextController;
  late final TextEditingController _jugTwoTextController;
  late final TextEditingController _wantedAmountTextController;

  @override
  void initState() {
    super.initState();
    _waterJugCubit = context.read<WaterJugCubit>();
    _jugOneTextController = TextEditingController();
    _jugTwoTextController = TextEditingController();
    _wantedAmountTextController = TextEditingController();
  }

  @override
  void dispose() {
    _jugOneTextController.dispose();
    _jugTwoTextController.dispose();
    _wantedAmountTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WaterJugCubit, WaterJugState>(
      bloc: _waterJugCubit,
      listener: (context, state) {
        if (state is WaterJugErrorState) {
          showDialog(
            context: context,
            builder: (_) {
              return AlertDialog.adaptive(
                icon: const Icon(Icons.close_rounded),
                content: ErrorDialogWidget(
                  errorMessage: state.errorMessage,
                ),
              );
            },
          );
        }
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Water Jug Challenge'),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                children: [
                  const WaterJugFormWidget(),
                  if (state is WaterJugSuccessState) ...[
                    ScenarioTableWidget(
                      tableTitle: 'Best Scenario',
                      stepEntity: state.allScenarios.bestScenarioStepList,
                    ),
                    const Divider(),
                    ScenarioTableWidget(
                      tableTitle: 'worst Scenario',
                      stepEntity: state.allScenarios.worstScenarioStepList,
                    ),
                  ]
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
