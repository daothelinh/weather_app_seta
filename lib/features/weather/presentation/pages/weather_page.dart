import 'package:auto_route/auto_route.dart';
import 'package:base_bloc_3/common/index.dart';
import 'package:base_bloc_3/gen/assets.gen.dart';
import 'package:base_bloc_3/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../../../base/base_widget.dart';
import '../bloc/weather_bloc.dart';
import '../widgets/area_widget.dart';
import '../widgets/text_field_custom.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState
    extends BaseState<WeatherPage, WeatherEvent, WeatherState, WeatherBloc> {
  @override
  void initState() {
    super.initState();
    bloc.add(const WeatherEvent.init());
  }

  @override
  Widget renderUI(BuildContext context) {
    return BaseScaffold(
      backgroundColor: Colors.black,
      appBar: BaseAppBar(
        backgroundColor: Colors.black,
        hasBack: false,
        leadingColor: Colors.black,
        actions: [
          Assets.svg.actionsWeather.svg(),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Weather",
              style: AppStyles.t16p.copyWith(
                fontSize: 40.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.h),
            TextFieldCustom(
              controller: bloc.controller,
              onTap: () {
                context.router.push(
                  WeatherPageDialogRoute(bloc: bloc),
                );
              },
            ),
            SizedBox(height: 8.h),
            Expanded(
              child: blocBuilder(
                (c, p1) => ListView.separated(
                  itemCount: p1.area?.length ?? 1,
                  itemBuilder: (context, index) => Slidable(
                    endActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          flex: 1,
                          spacing: 3,
                          onPressed: (c) =>
                              bloc.add(WeatherEvent.deleteArea(index)),
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: 'Delete',
                        ),
                      ],
                    ),
                    child: GestureDetector(
                      onTap: () {
                        context.router.pop();
                      },
                      child: AreaWidget(area: p1.area?[index]),
                    ),
                  ),
                  separatorBuilder: (context, index) => SizedBox(
                    height: 5.h,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
