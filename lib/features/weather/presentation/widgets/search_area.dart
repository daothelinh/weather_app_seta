import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../base/base_widget.dart';
import '../bloc/weather_bloc.dart';
import '../pages/weather_page.dart';
import 'search_widget.dart';

class SearchArea extends StatefulWidget {
  SearchArea(
      {super.key,
      this.showOverlay,
      this.hideOverlay,
      this.show = false,
      required this.bloc});
  Function()? showOverlay;
  Function()? hideOverlay;
  bool? show;
  WeatherBloc bloc;

  @override
  State<SearchArea> createState() => SearchAreaState();
}

class SearchAreaState extends BaseShareState<SearchArea, WeatherEvent,
    WeatherState, WeatherBloc> {
  OverlayEntry? entry;

  @override
  void dispose() {
    super.dispose();
    hideOverlay();
    // bloc.add(const WeatherEvent.hideOverlay());
  }

  @override
  provideBloc(context) => widget.bloc;

  @override
  void listener(context, WeatherState state) {
    if (state.isSearching == false) {
      entry?.remove();
    }
  }

  @override
  listenWhen(WeatherState prev, WeatherState curr) =>
      prev.isSearching != curr.isSearching;

  void showOverlay(BuildContext context) {
    final overlay = Overlay.of(context);
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);
    entry?.remove();
    entry = OverlayEntry(
      // opaque: true,
      // maintainState: true,
      builder: (_) {
        return Positioned(
          left: offset.dx,
          top: offset.dy + size.height,
          width: size.width,
          // child: BuildOverlay(fn: hideOverlay, list: bloc.l),
          child: _BuildOverlay(
              fn: () {
                hideOverlay();
                bloc.add(WeatherEvent.hideOverlay());
              },
              bloc: bloc),
        );
      },
    );
    overlay.insert(entry!);
  }

  void hideOverlay() {
    bloc.add(WeatherEvent.hideOverlay());
    entry?.remove();
    entry = null;
  }

  @override
  Widget renderUI(BuildContext context) {
    final bloc = context.select((WeatherBloc bloc) => bloc);
    final controller = context.select((WeatherBloc bloc) => bloc.controller);
    final state = context.select((WeatherBloc bloc) => bloc.state);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SearchWidget(
        controller: controller,
        hintText: 'Search for a city or airport'.tr(),
        onChange: (text) {
          if (controller.text.isEmpty) {
            hideOverlay();
          } else {
            showOverlay(context);
            bloc.add(WeatherEvent.searching(text));
          }
        },
        onTap: () {
          // print('show');

          // widget.show = !widget.show!;
          // // bloc.isShowOverlay = !bloc.isShowOverlay;
          // if (widget.show == true && controller.text.isEmpty) {
          //   bloc.add(const WeatherEvent.showOverlay());
          //   widget.showOverlay?.call();
          // } else {
          //   widget.hideOverlay?.call();
          // }

          // Overlay.of(context)
          if (controller.text.isEmpty) {
            if (state.isSearching == true) {
              // bloc.add(WeatherEvent.hideOverlay());
              hideOverlay();
            } else {
              showOverlay(context);
              bloc.add(const WeatherEvent.showOverlay());
            }
          } else {
            showOverlay(context);
            // bloc.add(const WeatherEvent.showOverlay());
            bloc.add(WeatherEvent.searching(controller.text));
          }
          //   // show = !show!;
        },
      ),
    );
  }
}

class _BuildOverlay extends StatefulWidget {
  _BuildOverlay({super.key, this.fn, required this.bloc});
  final WeatherBloc bloc;
  final Function()? fn;

  @override
  State<_BuildOverlay> createState() => _BuildOverlayState();
}

class _BuildOverlayState extends BaseShareState<_BuildOverlay, WeatherEvent,
    WeatherState, WeatherBloc> {
  @override
  provideBloc(context) => widget.bloc;

  @override
  Widget renderUI(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Material(
        elevation: 4,
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: ElevatedButton(
                onPressed: widget.fn,
                child: const Icon(Icons.close),
              ),
            ),
            // blocBuilder((c, p1) => Text('${p1.listSearch?.length}')),
            ListSearchArea(fn: widget.fn),
          ],
        ),
      ),
    );
  }
}
