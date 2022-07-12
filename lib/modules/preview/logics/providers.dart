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

    const _kCertificate = Certificate.judge(
      id: 4,
      discipline: 'Games',
      event: 'Double Half Snatch',
      kettlebell: '2x16kg',
      weightGroup: 'Open',
      ageGroup: '-75kg',
      firstName: 'Yann',
      lastName: 'Mancel',
    );

    return logic.createPreview(_kCertificate);
  },
  name: 'asyncPreviewRef',
);
