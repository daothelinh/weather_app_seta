import 'package:auto_route/auto_route.dart';
import 'package:base_bloc_3/base/bloc/index.dart';
import 'package:base_bloc_3/common/widgets/textfields/app_textfield.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../base/base_widget.dart';
import '../../../../common/debounce/debounce.dart';
import '../../../../common/index.dart';
import '../bloc/weather_bloc.dart';

class WeatherPageDialog extends StatefulWidget {
  const WeatherPageDialog({super.key, required this.bloc});
  final WeatherBloc bloc;

  @override
  State<WeatherPageDialog> createState() => _WeatherPageDialogState();
}

class _WeatherPageDialogState extends BaseShareState<WeatherPageDialog,
    WeatherEvent, WeatherState, WeatherBloc> {
  late Debouncer _debouncer;
  @override
  void initState() {
    super.initState();
    _debouncer = Debouncer(milliseconds: 500);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  provideBloc(context) => widget.bloc;
  @override
  Widget renderUI(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.black.withOpacity(0.5),
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Material(
              color: Colors.black.withOpacity(0.5),
              child: AppTextField(
                controller: bloc.controller,
                textStyle:
                    AppStyles.t16p.copyWith(color: Colors.white, fontSize: 20),
                hintText: 'title_search'.tr(),
                // backgroundColor: Colors.white.withOpacity(0.5),
                autofocus: true,
                onChanged: (text) => _debouncer
                    .run(() => bloc.add(WeatherEvent.getSearchText(text))),
                clearFn: () {
                  bloc.controller.text = '';
                  bloc.add(WeatherEvent.getSearchText(bloc.controller.text));
                },
              ),
            ),
            const Expanded(
              child: _ListArea(),
            ),
            GestureDetector(
              onTap: () => context.router.pop(),
              child: Container(
                height: 50.h,
                width: 50.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50.r)),
                  color: Colors.white.withOpacity(0.5),
                ),
                child: Center(
                  child: Icon(
                    Icons.close,
                    color: Colors.black,
                    size: 30.sp,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _ListArea extends StatelessWidget {
  const _ListArea({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.select((WeatherBloc bloc) => bloc);
    final state = context.select((WeatherBloc bloc) => bloc.state);
    final status = context.select((WeatherBloc bloc) => bloc.state.status);
    switch (status) {
      case BaseStateStatus.loading:
        return const Center(child: CircularProgressIndicator());
      case BaseStateStatus.success:
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.separated(
              itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      bloc.add(WeatherEvent.chooseCity(state.city?[index]));
                      context.router.pop();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: DefaultTextStyle(
                          style: AppStyles.t16p
                              .copyWith(color: Colors.white, fontSize: 20),
                          child: Text(
                            '${state.city?[index].englishName} - ${state.city?[index].key}',
                          )),
                    ),
                  ),
              separatorBuilder: (context, index) => const Divider(
                    height: 1,
                    color: AppColors.white,
                  ),
              itemCount: state.city!.length),
        );
      case BaseStateStatus.idle:
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.separated(
              itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      bloc.add(WeatherEvent.chooseCity(state.city?[index]));
                      context.router.pop();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: DefaultTextStyle(
                          style: AppStyles.t16p
                              .copyWith(color: Colors.white, fontSize: 20),
                          child: Text(
                            '${state.city?[index].englishName} - ${state.city?[index].key}',
                          )),
                    ),
                  ),
              separatorBuilder: (context, index) => const Divider(
                    height: 1,
                    color: AppColors.white,
                  ),
              itemCount: state.city!.length),
        );
      default:
        return Container();
    }
  }
}
