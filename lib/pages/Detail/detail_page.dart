import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_icons/line_icons.dart';
import 'package:myanimex/commentBloc/comment_bloc.dart';
import 'package:myanimex/constants.dart';
import 'package:myanimex/main.dart';
import 'package:myanimex/models/comment_model.dart';
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
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => CommentBloc()..add(LoadComment()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        color: Colors.transparent,
        home: DetailPageTab(currMerch: widget.currMerch),
      ),
    );
  }
}

class DetailPageTab extends StatefulWidget {
  final Merch currMerch;

  const DetailPageTab({super.key, required this.currMerch});

  @override
  State<DetailPageTab> createState() => _DetailPageTabState();
}

class _DetailPageTabState extends State<DetailPageTab> {
  late final TabContainerController _controller;
  late final String _uname;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _commentController = TextEditingController();

  @override
  void initState() {
    _controller = TabContainerController(length: 2);
    _uname = prefs!.getString('email')!;
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
        BlocProvider.value(
          value: BlocProvider.of<CommentBloc>(context),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              children: [
                ItemDisplay(merch: widget.currMerch),
                const SizedBox(height: defPad),
                Container(
                  decoration: BoxDecoration(),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const Text(
                          'Comment',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.none,
                            color: colPrimaryDark,
                          ),
                        ),
                        const SizedBox(height: defPad),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Can\'t enter empty comment'),
                                ),
                              );
                            }
                            return null;
                          },
                          controller: _commentController,
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          cursorColor: colPrimaryBase,
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            hintText: "Comment...",
                            hintStyle: TextStyle(color: Colors.white),
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(defPad),
                              child: Icon(Icons.chat),
                            ),
                          ),
                        ),
                        const SizedBox(height: defPad),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // on success
                              context.read<CommentBloc>().add(
                                    AddComment(
                                      Comment(
                                        sender: _uname,
                                        content: _commentController.text,
                                      ),
                                    ),
                                  );
                            }
                          },
                          child: Text(
                            "Submit".toUpperCase(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        BlocProvider.value(
          value: BlocProvider.of<CommentBloc>(context),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Center(
                child: BlocBuilder<CommentBloc, CommentState>(
                  builder: (context, state) {
                    if (state is CommentInitial) {
                      return const CircularProgressIndicator(
                        color: colPrimaryDark,
                      );
                    }
                    if (state is CommentLoaded) {
                      return Column(
                        children: [
                          for (int i = 0; i < state.comments.length; i++)
                            Column(
                              children: [
                                Text(
                                  state.comments[i].sender,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.none,
                                    color: colPrimaryDark,
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(),
                                  child: Text(
                                    state.comments[i].content,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.none,
                                      color: colPrimaryDark,
                                    ),
                                  ),
                                )
                              ],
                            ),
                        ],
                      );
                    } else {
                      return const Text(
                        'Something went wrong',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.none,
                          color: colPrimaryDark,
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
