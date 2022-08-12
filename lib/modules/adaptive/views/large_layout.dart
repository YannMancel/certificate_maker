import 'package:certificate_maker/_features.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart' show GoRouter;
import 'package:hooks_riverpod/hooks_riverpod.dart'
    show ConsumerWidget, WidgetRef;

class LargeLayout extends StatelessWidget {
  const LargeLayout({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Row(
        children: <Widget>[
          const _PersistentDrawer(),
          Expanded(
            child: SmallLayout(child: child),
          ),
        ],
      ),
    );
  }
}

class _PersistentDrawer extends ConsumerWidget {
  const _PersistentDrawer();

  Size get _size => const Size.square(250.0);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    assert(debugCheckHasMaterial(context));

    return Ink(
      width: _size.width,
      height: double.infinity,
      decoration: const BoxDecoration(
        border: Border(
          right: BorderSide(color: Colors.grey),
        ),
      ),
      child: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox.fromSize(
                  size: _size,
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Assets.images.ikmfKettlebell.image(),
                  ),
                ),
                const Divider(indent: 16.0, endIndent: 16.0),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, index) => _PersistentItem(index: index),
              childCount: 3,
            ),
          ),
        ],
      ),
    );
  }
}

class _PersistentItem extends StatelessWidget {
  const _PersistentItem({required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    final router = GoRouter.of(context);

    return AnimatedBuilder(
      animation: router,
      builder: (_, __) => ListTile(
        key: Key('large_layout_$index'),
        onTap: () => PreviewView.go(context),
        title: const Text('preview'),
        textColor: router.isPreview ? Colors.blue : null,
      ),
    );
  }
}
