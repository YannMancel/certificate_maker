import 'package:certificate_maker/_features.dart';
import 'package:flutter/material.dart';

class LargeLayout extends StatelessWidget {
  const LargeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Row(
        children: <Widget>[
          const _PersistentDrawer(),
          Expanded(
            child: Scaffold(
              appBar: AppBar(
                title: const Text(kAppName),
              ),
              body: const HomeView(title: kAppName),
              floatingActionButton: FloatingActionButton(
                onPressed: () => Navigator.push(
                  context,
                  PreviewPage.route<void>(),
                ),
                child: const Icon(Icons.favorite),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PersistentDrawer extends StatelessWidget {
  const _PersistentDrawer({Key? key}) : super(key: key);

  Size get _size => const Size.square(250.0);

  @override
  Widget build(BuildContext context) {
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
              (_, index) => const ListTile(
                title: Text('text'),
              ),
              childCount: 3,
            ),
          ),
        ],
      ),
    );
  }
}
