import 'package:flutter/material.dart';
import 'package:live_score/utils/network/response_status.dart';
import 'custom_app_bar.dart';

class BaseLayout extends StatefulWidget {
  const BaseLayout({
    super.key,
    this.state,
    required this.title,
    required this.child,
    this.actions,
    this.showMenu = true,
    this.centerTitle = true,
  });

  final ResponseState? state;
  final Widget child;
  final String title;
  final List<Widget>? actions;
  final bool showMenu;
  final bool centerTitle;

  @override
  State<BaseLayout> createState() => _BaseLayoutState();
}

class _BaseLayoutState extends State<BaseLayout> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: widget.showMenu ? Container() : null,
      appBar: CustomAppBar(
        centerTitle: widget.centerTitle,
        title: widget.title,
        actions: [
          ...?widget.actions,
          if (widget.showMenu)
            IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: () {
                _scaffoldKey.currentState!.openEndDrawer();
              },
            ),
        ],
      ),
      body: widget.state == null
          ? widget.child
          : widget.state!.isLoading
              ? const Center(
                  child: CircularProgressIndicator(color: Colors.red),
                )
              : widget.state!.isInitial
                  ? const Center(
                      child: CircularProgressIndicator(color: Colors.red),
                    )
                  : widget.state!.isError
                      ? const Center(
                          child: Text("No data found!"),
                        )
                      : widget.child,
    );
  }
}
