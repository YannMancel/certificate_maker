import 'package:certificate_maker/_features.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart' show GoRouter;
import 'package:hooks_riverpod/hooks_riverpod.dart'
    show ConsumerWidget, WidgetRef;

class MediumLayout extends StatelessWidget {
  const MediumLayout({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Row(
        children: <Widget>[
          const _RailDrawer(),
          Expanded(
            child: SmallLayout(child: child),
          ),
        ],
      ),
    );
  }
}

class _RailDrawer extends ConsumerWidget {
  const _RailDrawer();

  Size get _size => const Size.square(2.0 * 16.0 + 24.0);

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
                    padding: const EdgeInsets.all(16.0),
                    child: Assets.images.ikmfKettlebell.image(),
                  ),
                ),
                const Divider(indent: 16.0, endIndent: 16.0),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, index) => _RailItem(index: index),
              childCount: 3,
            ),
          ),
        ],
      ),
    );
  }
}

class _RailItem extends StatelessWidget {
  const _RailItem({required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    final router = GoRouter.of(context);

    return ListTile(
      key: Key('medium_layout_$index'),
      onTap: () => PreviewView.go(context),
      title: AnimatedBuilder(
        animation: router,
        builder: (_, __) => Icon(
          Icons.add,
          color: router.isPreview ? Colors.blue : null,
        ),
      ),
    );
  }
}
