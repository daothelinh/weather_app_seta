import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../base/base_widget.dart';
import '../../../common/index.dart';
import '../../../gen/assets.gen.dart';
import '../../component/appbar_custom.dart';
import 'bloc/start_bloc.dart';
import 'list_movie/list_movie_page.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState
    extends BaseState<StartPage, StartEvent, StartState, StartBloc>
    with TickerProviderStateMixin {
  late TabController? controller;
  @override
  void initState() {
    super.initState();
    controller = TabController(initialIndex: 0, vsync: this, length: 2);
  }

  @override
  Widget renderUI(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        // isSearch: true,
        middle: blocBuilder(
            (c, p1) => p1.isSearch == true ? Text('true') : Text('false')),
        trailing: GestureDetector(
          onTap: () => bloc.add(StartEvent.changeSearch()),
          child: blocBuilder((c, p1) =>
              p1.isSearch == true ? Icon(Icons.delete) : Icon(Icons.search)),
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(40),
              ),
              border: Border.all(
                width: 1,
                color: AppColors.color0f1b2b.withOpacity(0.3),
              ),
            ),
            // height: 50,
            child: TabBar(
              controller: controller,
              padding: const EdgeInsets.all(5),
              labelColor: AppColors.white,
              unselectedLabelColor: AppColors.color0f1b2b,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  25.0,
                ),
                color: AppColors.colore51937,
              ),
              labelStyle: AppStyles.t14b.copyWith(
                fontSize: 17,
                // color: color0f1b2b,
              ),
              unselectedLabelStyle: AppStyles.t14b.copyWith(
                fontSize: 17,
              ),
              tabs: const [
                Tab(text: 'Now Showing'),
                Tab(text: 'Coming Soon'),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: controller,
              children: [
                ListMoviePage(index: 0, bloc: bloc),
                ListMoviePage(index: 1, bloc: bloc),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
