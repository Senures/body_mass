import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseView<T extends ChangeNotifier> extends StatefulWidget {
  final T? viewModel;
  final Function(T model)? onModelReady;
  final Function(T model)? onDispose;
  final Widget Function(BuildContext context, T value, Widget? child)?
      onPageBuilder;
  const BaseView(
      {super.key,
      this.onPageBuilder,
      this.viewModel,
      this.onModelReady,
      this.onDispose});

  @override
  State<BaseView<T>> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends ChangeNotifier> extends State<BaseView<T>> {
  @override
  void initState() {
    if (widget.onModelReady != null) {
      widget.onModelReady!(widget.viewModel!);
    }
    super.initState();
  }

  @override
  void dispose() {
    if (widget.onDispose != null) {
      widget.onDispose!(widget.viewModel!);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (_) => widget.viewModel!,
      child: Consumer<T>(
        builder: widget.onPageBuilder!,
      ),
    );
  }
}
