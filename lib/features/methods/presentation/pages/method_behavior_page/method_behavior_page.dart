import 'package:corporate_threat_detection/core/common/custom_app_bar.dart';
import 'package:corporate_threat_detection/features/methods/presentation/bloc/methods_cubit.dart';
import 'package:corporate_threat_detection/features/methods/presentation/bloc/methods_state.dart';
import 'package:corporate_threat_detection/features/methods/presentation/widgets/methods_list_body.dart';
import 'package:corporate_threat_detection/injector_container_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MethodBehaviorPage extends StatefulWidget {
  const MethodBehaviorPage({super.key});

  @override
  State<MethodBehaviorPage> createState() => _MethodBehaviorPageState();
}

class _MethodBehaviorPageState extends State<MethodBehaviorPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<MethodsCubit>(
      create: (_) =>
          sl<MethodsCubit>()..startRealtime(type: 'behavior'),
      child: BlocListener<MethodsCubit, MethodsState>(
        listenWhen: (prev, next) =>
            prev.errorMessage != next.errorMessage &&
            next.errorMessage != null,
        listener: (context, state) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage!)),
          );
        },
        child: const Scaffold(
          appBar: CustomAppBar(title: 'Behavior Analysis'),
          body: MethodsListBody(),
        ),
      ),
    );
  }
}
