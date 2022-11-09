import 'package:auto_route/auto_route.dart';
import 'package:base_bloc_3/common/app_theme/app_styles.dart';
import 'package:base_bloc_3/common/index.dart';
import 'package:base_bloc_3/common/widgets/base_appbar.dart';
import 'package:base_bloc_3/common/widgets/base_scaffold.dart';
import 'package:base_bloc_3/common/widgets/textfields/app_textfield.dart';
import 'package:base_bloc_3/features/core/presentation/pages/core_page.dart';
import 'package:base_bloc_3/features/weather/presentation/pages/weather_page_dialog.dart';
import 'package:base_bloc_3/gen/assets.gen.dart';
import 'package:base_bloc_3/routes/app_pages.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../base/base_widget.dart';
import '../../../../routes/app_routes.dart';
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
          hasBack: true,
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
              Builder(builder: (context) {
                return TextFieldCustom(
                    controller: bloc.controller,
                    onTap: () {
                      context.router.push(
                        WeatherPageDialogRoute(bloc: bloc),
                      );
                      bloc.add(const WeatherEvent.getFormSearch());
                    });
              }),
              SizedBox(height: 8.h),
              Expanded(
                child: ListView.separated(
                  itemCount: 2,
                  itemBuilder: (context, index) => const AreaWidget(),
                  separatorBuilder: (context, index) => SizedBox(
                    height: 5.h,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
