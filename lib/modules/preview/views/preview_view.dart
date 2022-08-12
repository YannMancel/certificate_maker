import 'package:certificate_maker/_features.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart'
    show AsyncValueX, ConsumerWidget, WidgetRef;

class PreviewView extends ConsumerWidget {
  const PreviewView({super.key});

  static void go(BuildContext context) {
    GoRouter.of(context).goNamed(RouteNames.kPreview);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncPreview = ref.watch(asyncPreviewRef);

    return asyncPreview.when<Widget>(
      data: (child) => child,
      error: (_, __) => const ErrorView(),
      loading: LoadingView.new,
    );
  }
}
