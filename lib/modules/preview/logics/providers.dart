import 'package:certificate_maker/_features.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart'
    show FutureProvider, Provider;

final printingLogicRef = Provider.autoDispose<PrintingLogicInterface>(
  (_) => const PrintingLogic(),
  name: PrintingLogicInterface.kName,
);

final asyncPreviewRef = FutureProvider.autoDispose<Widget>(
  (ref) async {
    final logic = ref.watch(printingLogicRef);

    const certificate = Certificate.judge(
      id: 4,
      firstName: 'Yann',
      lastName: 'Mancel',
      country: 'France',
    );

    return logic.createPreview(certificate);
  },
  name: 'asyncPreviewRef',
);
