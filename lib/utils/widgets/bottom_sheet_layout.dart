import 'package:flutter/material.dart';

import 'custom_card.dart';

class BottomSheetLayout extends StatefulWidget {
  const BottomSheetLayout({
    Key? key,
    required this.child,
    this.padding,
    this.closeIcon = false,
  }) : super(key: key);
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final bool closeIcon;

  @override
  State<BottomSheetLayout> createState() => _BottomSheetLayoutState();
}

class _BottomSheetLayoutState extends State<BottomSheetLayout> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: widget.padding ??
            EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: MediaQuery.of(context).viewInsets.bottom + 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  const Spacer(),
                  SizedBox(
                    width: 80,
                    child: Divider(
                      color: Colors.grey.withOpacity(0.6),
                      height: 50,
                      thickness: 3,
                    ),
                  ),
                  widget.closeIcon
                      ? Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: CustomCard(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              borderRadius: 30,
                              padding: const EdgeInsets.all(5),
                              margin: const EdgeInsets.only(top: 16),
                              backgroundColor: Colors.grey.withOpacity(.1),
                              child: const Icon(Icons.close,
                                  color: Colors.black, size: 30),
                            ),
                          ),
                        )
                      : const Spacer(),
                ],
              ),
              widget.child,
            ],
          ),
        ));
  }
}
