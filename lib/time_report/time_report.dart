import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';

import 'models.dart';
import 'repository.dart';

export 'models.dart';
export 'repository.dart';

class TimeReportController extends GetxController {
  final TimeReportRepository _timeReportRepository = Get.find<TimeReportRepository>();

  final RxBool _loading = false.obs;

  final RxList<TimeCategory> _timeCategories = <TimeCategory>[].obs;

  List<TimeCategory> get timeCategories => _timeCategories;

  bool get loading => _loading.value;

  onInit() {
    super.onInit();
    loadUsers();
  }

  loadUsers() async {
    _loading.value = true;

    try {
      _timeCategories(await _timeReportRepository.fetchTimeCategories());
    } catch (e) {
      _timeCategories(<TimeCategory>[]);
    } finally {
      _loading.value = false;
    }
  }
}

class TimeReportView extends GetView<TimeReportController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      return VxBox(
        child: (controller.loading)
            ? SizedBox(
                height: 16,
                width: 16,
                child: const CircularProgressIndicator(strokeWidth: 4, color: Color(0xff0060df)),
              ).centered()
            : _LineChart(timeCategories: controller.timeCategories),
      )
          .width(MediaQuery.of(context).size.width)
          .height(MediaQuery.of(context).size.height * 0.33)
          .make()
          .py(92)
          .pOnly(right: 16);
    }));
  }
}

class _LineChart extends StatelessWidget {
  const _LineChart({Key? key, required this.timeCategories}) : super(key: key);

  final List<TimeCategory> timeCategories;

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        lineTouchData: LineTouchData(
          touchCallback: (LineTouchResponse touchResponse) {},
          handleBuiltInTouches: true,
          touchTooltipData: LineTouchTooltipData(
            tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
          ),
        ),
        gridData: gridData,
        titlesData: titlesData1,
        borderData: borderData,
        lineBarsData:
            // timeCategories.map((t) => getLineChartBarData(t.durations, t.color)).toList(),
            <LineChartBarData>[
          getLineChartBarData(timeCategories[3].durations, timeCategories[3].color),
          getLineChartBarData(timeCategories[4].durations, timeCategories[4].color),
          getLineChartBarData(timeCategories[6].durations, timeCategories[6].color),
          // lineChartBarData1_1,
          // lineChartBarData1_2,
          // lineChartBarData1_3,
        ],
        minX: 0,
        maxX: 30,
        maxY: 9,
        minY: 0,
      ),
    );
  }

  LineChartBarData getLineChartBarData(List<DateDuration> durations, Color color) {
    return LineChartBarData(
      isCurved: true,
      colors: [color],
      barWidth: 6,
      isStrokeCapRound: true,
      dotData: FlDotData(show: false),
      belowBarData: BarAreaData(show: false),
      spots: durations
          .asMap()
          .entries
          .map((d) => FlSpot(
                // DateTime.parse(d.date).day.toDouble(),
                d.key.toDouble(),
                double.parse((d.value.duration / 60 / 60).toStringAsFixed(1)),
              ))
          .toList(),
    );
  }

  FlTitlesData get titlesData1 => FlTitlesData(
        bottomTitles: bottomTitles,
        leftTitles: leftTitles(
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '1h';
              // case 2:
              //   return '2h';
              case 3:
                return '3h';
              case 5:
                return '5h';
              case 8:
                return '8h';
            }
            return '';
          },
        ),
      );

  SideTitles leftTitles({required GetTitleFunction getTitles}) => SideTitles(
        getTitles: getTitles,
        showTitles: true,
        margin: 8,
        reservedSize: 30,
        getTextStyles: (value) => const TextStyle(
          color: Color(0xff75729e),
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      );

  SideTitles get bottomTitles => SideTitles(
        showTitles: true,
        reservedSize: 22,
        margin: 10,
        getTextStyles: (value) => const TextStyle(
          color: Color(0xff72719b),
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        getTitles: (value) {
          if (value % 3 == 0) {
            final date = DateTime.parse(timeCategories[3].durations[value.toInt()].date);
            return '${date.day}/${date.month}';
          }
          return '';
          // switch (value.toInt()) {
          //   case 1:
          //     return 'SEPT';
          //   case 7:
          //     return 'OCT';
          //   case 12:
          //     return 'DEC';
          // }
          // return '';
        },
      );

  FlGridData get gridData => FlGridData(show: false);

  FlBorderData get borderData => FlBorderData(
        show: true,
        border: const Border(
          bottom: BorderSide(color: Color(0xff4e4965), width: 4),
          left: BorderSide(color: Colors.transparent),
          right: BorderSide(color: Colors.transparent),
          top: BorderSide(color: Colors.transparent),
        ),
      );

  LineChartBarData get lineChartBarData1_1 => LineChartBarData(
        isCurved: true,
        colors: [const Color(0xff4af699)],
        barWidth: 8,
        isStrokeCapRound: true,
        dotData: FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: [
          FlSpot(1, 1),
          FlSpot(3, 1.5),
          FlSpot(5, 1.4),
          FlSpot(7, 3.4),
          FlSpot(10, 2),
          FlSpot(12, 2.2),
          FlSpot(13, 1.8),
        ],
      );

  LineChartBarData get lineChartBarData1_2 => LineChartBarData(
        isCurved: true,
        colors: [const Color(0xffaa4cfc)],
        barWidth: 8,
        isStrokeCapRound: true,
        dotData: FlDotData(show: false),
        belowBarData: BarAreaData(show: false, colors: [
          const Color(0x00aa4cfc),
        ]),
        spots: [
          FlSpot(1, 1),
          FlSpot(3, 2.8),
          FlSpot(7, 1.2),
          FlSpot(10, 2.8),
          FlSpot(12, 2.6),
          FlSpot(13, 3.9),
        ],
      );

  LineChartBarData get lineChartBarData1_3 => LineChartBarData(
        isCurved: true,
        colors: const [Color(0xff27b6fc)],
        barWidth: 8,
        isStrokeCapRound: true,
        dotData: FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: [
          FlSpot(1, 2.8),
          FlSpot(3, 1.9),
          FlSpot(6, 3),
          FlSpot(10, 1.3),
          FlSpot(13, 2.5),
        ],
      );
}

// class LineChartSample1 extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => LineChartSample1State();
// }

// class LineChartSample1State extends State<LineChartSample1> {
//   late bool isShowingMainData;

//   @override
//   void initState() {
//     super.initState();
//     isShowingMainData = true;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AspectRatio(
//       aspectRatio: 1.23,
//       child: Container(
//         decoration: const BoxDecoration(
//           borderRadius: BorderRadius.all(Radius.circular(18)),
//           gradient: LinearGradient(
//             colors: [
//               Color(0xff2c274c),
//               Color(0xff46426c),
//             ],
//             begin: Alignment.bottomCenter,
//             end: Alignment.topCenter,
//           ),
//         ),
//         child: Stack(
//           children: <Widget>[
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: <Widget>[
//                 const SizedBox(
//                   height: 37,
//                 ),
//                 const Text(
//                   'Unfold Shop 2018',
//                   style: TextStyle(
//                     color: Color(0xff827daa),
//                     fontSize: 16,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//                 const SizedBox(
//                   height: 4,
//                 ),
//                 const Text(
//                   'Monthly Sales',
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 32,
//                       fontWeight: FontWeight.bold,
//                       letterSpacing: 2),
//                   textAlign: TextAlign.center,
//                 ),
//                 const SizedBox(
//                   height: 37,
//                 ),
//                 Expanded(
//                   child: Padding(
//                     padding: const EdgeInsets.only(right: 16.0, left: 6.0),
//                     child: null,
//                     // child: _LineChart(isShowingMainData: isShowingMainData),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//               ],
//             ),
//             IconButton(
//               icon: Icon(
//                 Icons.refresh,
//                 color: Colors.white.withOpacity(isShowingMainData ? 1.0 : 0.5),
//               ),
//               onPressed: () {
//                 setState(() {
//                   isShowingMainData = !isShowingMainData;
//                 });
//               },
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
