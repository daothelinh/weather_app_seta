import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../../base/base_widget.dart';
import '../../../../base/bloc/base_bloc.dart';
import '../bloc/start_bloc.dart';

class ListMoviePage extends StatefulWidget {
  ListMoviePage({super.key, required this.bloc, required this.index});
  final int index;
  final StartBloc bloc;

  @override
  State<ListMoviePage> createState() => _ListMoviePageState();
}

class _ListMoviePageState
    extends BaseShareState<ListMoviePage, StartEvent, StartState, StartBloc> {
  @override
  void initState() {
    super.initState();
    bloc.add(StartEvent.init(widget.index));
  }

  @override
  provideBloc(context) => widget.bloc;

  @override
  Widget renderUI(BuildContext context) {
    return SafeArea(child: widget.index == 1 ? Text('page 2') : Text('page 1'));
  }
}
