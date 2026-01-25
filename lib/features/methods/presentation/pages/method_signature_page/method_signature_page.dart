import 'package:corporate_threat_detection/core/common/custom_app_bar.dart';
import 'package:corporate_threat_detection/features/methods/presentation/pages/method_signature_page/method_signature_mixin.dart';
import 'package:flutter/material.dart';

class MethodSignaturePage extends StatefulWidget {
  const MethodSignaturePage({super.key});

  @override
  State<MethodSignaturePage> createState() => _MethodSignaturePageState();
}

class _MethodSignaturePageState extends State<MethodSignaturePage>
    with MethodSignatureMixin {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: const CustomAppBar(title: 'Signature-Based Detection'),
    body: const Center(
      child: Text('Welcome to the Signature-Based Detection Page!'),
    ),
  );
}
