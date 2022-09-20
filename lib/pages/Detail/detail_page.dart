import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:line_icons/line_icons.dart';
import 'package:myanimex/constants.dart';
import 'package:myanimex/pages/Detail/components/item_display.dart';
import 'package:myanimex/pages/Items/items_page.dart';
import 'package:tab_container/tab_container.dart';

class DetailPage extends StatefulWidget {
  final Merch currMerch;
  const DetailPage({super.key, required this.currMerch});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late final TabContainerController _controller;

  @override
  void initState() {
    _controller = TabContainerController(length: 3);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TabContainer(
      radius: 20,
      tabEdge: TabEdge.left,
      tabCurve: Curves.easeIn,
      transitionBuilder: (child, animation) {
        animation = CurvedAnimation(curve: Curves.easeIn, parent: animation);
        return SlideTransition(
          position: Tween(
            begin: const Offset(0.2, 0.0),
            end: const Offset(0.0, 0.0),
          ).animate(animation),
          child: FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
      },
      colors: const <Color>[
        colPrimaryBase,
        colSecondaryBase,
      ],
      tabs: const [
        Icon(LineIcons.bookOpen),
        Icon(LineIcons.paperPlane),
      ],
      isStringTabs: false,
      childPadding: const EdgeInsets.all(defPad),
      children: [
        ItemDisplay(merch: widget.currMerch),
        Container(),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
