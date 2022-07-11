import 'package:certificate_maker/_features.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart'
    show AsyncValueX, ConsumerWidget, WidgetRef;

class PreviewPage extends ConsumerWidget {
  const PreviewPage({Key? key}) : super(key: key);

  static Route<T> route<T>() {
    return MaterialPageRoute<T>(
      builder: (_) => const PreviewPage(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncPreview = ref.watch(asyncPreviewRef);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Preview'),
      ),
      body: asyncPreview.when<Widget>(
        data: (child) => child,
        error: (_, __) => const ErrorView(),
        loading: LoadingView.new,
      ),
    );
  }
}
