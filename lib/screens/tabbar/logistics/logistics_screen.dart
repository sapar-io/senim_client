library logistics;

import 'package:client/config/themes/app_custom_theme.dart';
import 'package:client/constants/sm_colors.dart';
import 'package:client/shared/utils/responsive.dart';
import 'package:client/screens/tabbar/logistics/models/subscriber_model.dart';
import 'package:client/screens/tabbar/shared/popup_avatar.dart';
import 'package:client/shared/widgets/sm_button.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter_new/flutter.dart' as charts;

part 'widgets/desktop_scaffold.dart';
part 'widgets/mobile_scaffold.dart';
part 'widgets/cargo_row.dart';

class LogisticsScreen extends StatefulWidget {
  const LogisticsScreen({Key? key}) : super(key: key);

  @override
  State<LogisticsScreen> createState() => _LogisticsScreenState();
}

class _LogisticsScreenState extends State<LogisticsScreen> {
  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: _MobileScaffold(
        title: "Логистика",
        tabBarView: _mobile(context),
      ),
      desktop: _DesktopScaffold(
        title: "Логистика",
        tabBarView: _desktop(context),
      ),
    );
  }

  TabBarView _desktop(BuildContext context) {
    return const TabBarView(children: [
      _CargoKazakhstan(),
      Icon(Icons.ads_click),
      Icon(Icons.ads_click),
      Icon(Icons.ads_click),
    ]);
  }

  TabBarView _mobile(BuildContext context) {
    return const TabBarView(children: [
      _CargoKazakhstan(),
      Icon(Icons.ads_click),
      Icon(Icons.ads_click),
      Icon(Icons.ads_click),
    ]);
  }
}

class _CargoKazakhstan extends StatelessWidget {
  const _CargoKazakhstan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive(mobile: mobile(context), desktop: desktop(context));
  }

  Widget desktop(BuildContext context) {
    return ListView(
      primary: true,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 32, left: 32, right: 32),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(
                        top: 12, left: 32, right: 32, bottom: 24),
                    decoration: BoxDecoration(
                      color: Theme.of(context).own().dashboardSidebarBackground,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(16.0),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            child: charts.BarChart(SubscriberSeries.series,
                                animate: true)),
                        const SizedBox(height: 16),
                        const Text(
                            "Грузоперевозки Казахстан. Статистика цен за тент 20 тонн"),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 32.0),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(32),
                    decoration: BoxDecoration(
                      color: Theme.of(context).own().dashboardSidebarBackground,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(16.0),
                      ),
                    ),
                    child: Column(children: [
                      SMButton(
                          style: SMButtonStyle.secondary,
                          title: 'Добавить груз',
                          onPressed: () {}),
                      const SizedBox(height: 16),
                      SMButton(
                          style: SMButtonStyle.secondary,
                          title: 'Добавить транспорт',
                          onPressed: () {}),
                      const SizedBox(height: 16),
                      SMButton(
                          style: SMButtonStyle.secondary,
                          title: 'Поиск грузов и транспорта',
                          onPressed: () {}),
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: Theme.of(context).own().dashboardSidebarBackground,
            borderRadius: const BorderRadius.all(
              Radius.circular(16.0),
            ),
          ),
          child: ListView.builder(
            itemCount: 100,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return const _CargoRow();
            },
          ),
        ),
      ],
    );
  }

  Widget mobile(BuildContext context) {
    return ListView(
      primary: true,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 16, left: 16, right: 16),
          padding:
              const EdgeInsets.only(top: 12, left: 16, right: 16, bottom: 16),
          decoration: BoxDecoration(
            color: Theme.of(context).own().dashboardSidebarBackground,
            borderRadius: const BorderRadius.all(
              Radius.circular(16.0),
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                  width: double.infinity,
                  height: 150,
                  child:
                      charts.BarChart(SubscriberSeries.series, animate: true)),
              const SizedBox(height: 16),
              const Text(
                  "Грузоперевозки Казахстан. Статистика цен за тент 20 тонн"),
            ],
          ),
        ),
        const SizedBox(width: 32.0),
        Container(
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Theme.of(context).own().dashboardSidebarBackground,
            borderRadius: const BorderRadius.all(
              Radius.circular(16.0),
            ),
          ),
          child: ListView.builder(
            itemCount: 100,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return const _CargoRow();
            },
          ),
        ),
      ],
    );
  }
}
