import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:line_icons/line_icons.dart';
import 'package:myanimex/constants.dart';
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
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              clipBehavior: Clip.antiAlias,
              child: Image.asset(widget.currMerch.image,
                  fit: BoxFit.fill, width: 1000.0),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: defPad),
              child: Text(
                widget.currMerch.name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                  color: colPrimaryDark,
                ),
              ),
            ),
            Text(
              widget.currMerch.desc,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
                decoration: TextDecoration.none,
                color: colPrimaryDark,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Spacer(),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: colSecondaryBase),
                  child: Text(
                    widget.currMerch.price,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none,
                      color: colPrimaryDark,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
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
