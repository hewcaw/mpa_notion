import 'package:flutter/foundation.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/parser.dart' as htmlparser;
import 'package:html/dom.dart' as dom;
import 'package:percent_indicator/percent_indicator.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';

import 'common.dart' show NotionColors;
import 'models.dart';
import 'service.dart';

String htmlData = """
  <div id="my-component"></div>
""";
//dom.Document document = htmlparser.parse(htmlData);
// sanitize or query document here

Widget html = Html(
  data: htmlData,
  // document: document,
);

String viewID = "your-view-id";

class Goals extends StatefulWidget {
  const Goals({Key? key}) : super(key: key);

  @override
  _GoalsState createState() => _GoalsState();
}

class _GoalsState extends State<Goals> {
  late Future<List<Goal>> futureGoals;

  @override
  void initState() {
    super.initState();
    futureGoals = Service.fetchGoals();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<List<Goal>>(
          future: futureGoals,
          builder: (context, snapshot) {
            if (snapshot.hasData)
              return ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(vertical: 8),
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return [
                    GoalProgress(
                        percent: snapshot.data![index].progress,
                        category: snapshot.data![index].category),
                    Flexible(
                      child: [
                        GoalInfo(goal: snapshot.data![index]),
                        SizedBox(height: 20),
                        [
                          TargetItem(target: snapshot.data![index].targets[0]),
                          SizedBox(height: 4),
                          TargetItem(target: snapshot.data![index].targets[1]),
                        ].column(crossAlignment: CrossAxisAlignment.start),
                      ].column(crossAlignment: CrossAxisAlignment.start).px(10),
                    ),
                    [
                      DueDate(date: snapshot.data![index].date),
                      SizedBox(height: 8),
                      GoalCategory(category: snapshot.data![index].category),
                    ].column(),
                  ]
                      .row(crossAlignment: CrossAxisAlignment.start)
                      .p8()
                      .card
                      .rounded
                      .color(Color(0xff040505))
                      .make();
                },
              );

            // return [
            //   [
            //     GoalProgress(
            //         percent: snapshot.data![0].goalPercent,
            //         category: snapshot.data![0].category),
            //     // GoalCategory(category: snapshot.data![0].category),
            //   ].column(),
            //   SizedBox(width: 16),
            //   [
            //     GoalInfo(goal: snapshot.data![0]),
            //     TargetBlock(targets: snapshot.data![0].targets),
            //   ].column(crossAlignment: CrossAxisAlignment.start),
            //   SizedBox(width: 32),
            //   html,
            // ]
            //.column().p8().card.make();
            else if (snapshot.hasError) return Text('${snapshot.error}');

            return SizedBox(
              height: 16,
              width: 16,
              child: const CircularProgressIndicator(
                  strokeWidth: 4, color: Color(0xff0060df)),
            );
          },
        ),
      ),
    );
  }
}

// TODO: Goal Progress
// TODO: Different progres color according to their state
class GoalProgress extends StatelessWidget {
  const GoalProgress({Key? key, required this.percent, required this.category})
      : super(key: key);

  final double percent;
  final String category;

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 75,
      lineWidth: 7.5,
      percent: percent,
      center: '${(double.parse(percent.toStringAsFixed(2)) * 100).round()}%'
          .text
          .xl
          .make(),
      progressColor: Colors.green[500],
      circularStrokeCap: CircularStrokeCap.round,
    );
  }
}

class GoalInfo extends StatelessWidget {
  const GoalInfo({Key? key, required this.goal}) : super(key: key);

  final Goal goal;

  @override
  Widget build(BuildContext context) {
    print('"${goal.name}"');

    // TODO: [OLD CODE] Why without Flexible the Goal's name align to the right???
    // https://stackoverflow.com/questions/54634093/flutter-wrap-text-instead-of-overflow
    return [
      goal.name.text.ellipsis.headline6(context).make(),
      SizedBox(height: 8),
      goal.description.text.subtitle2(context).make(),
    ].column(
      alignment: MainAxisAlignment.spaceEvenly,
      crossAlignment: CrossAxisAlignment.start,
    );
  }
}

class DueDate extends StatelessWidget {
  const DueDate({Key? key, required this.date}) : super(key: key);

  final String date;

  String get deadline {
    DateTime dateTimeCreatedAt = DateTime.tryParse(date) ?? DateTime.now();
    DateTime dateTimeNow = DateTime.now();
    final differenceInDays = dateTimeNow.difference(dateTimeCreatedAt).inDays;
    return (int.parse(differenceInDays.toString()) * -1).toString();
  }

  @override
  Widget build(BuildContext context) {
    return '🔥 ${deadline} days'.text.make();
  }
}

class GoalCategory extends StatelessWidget {
  const GoalCategory({Key? key, required this.category}) : super(key: key);

  final String category;

  @override
  Widget build(BuildContext context) {
    return category.text
        .make()
        .pSymmetric(v: 1, h: 4)
        .box
        .orange500
        .rounded
        .make();
  }
}

class TargetBlock extends StatelessWidget {
  const TargetBlock({Key? key, required this.targets}) : super(key: key);

  final List<Target> targets;

  @override
  Widget build(BuildContext context) {
    return targets
        .map((target) => TargetItem(target: target))
        .toList()
        .column(crossAlignment: CrossAxisAlignment.start);
  }
}

class TargetItem extends StatelessWidget {
  const TargetItem({Key? key, required this.target}) : super(key: key);

  final Target target;

  @override
  Widget build(BuildContext context) {
    return [
      target.name.text.subtitle1(context).make(),
      SizedBox(width: 8),
      _buildStatusDot(),
      SizedBox(width: 50),
      TaskCount(target: target),
    ].row(alignment: MainAxisAlignment.start);
  }

  Widget _buildStatusDot() {
    Color getStatusColor() {
      if (target.status == "In progress") return NotionColors.fgYellow;
      if (target.status == "Completed") return NotionColors.fgGreen;
      return NotionColors.fgBlue;
    }

    return ZStack([
      VxBox().width(5).height(5).rounded.color(getStatusColor()).make(),
      (target.status == "In progress")
          ? SizedBox(
              width: 12,
              height: 12,
              child: const CircularProgressIndicator(
                  strokeWidth: 2.5, color: NotionColors.fgYellow))
          : SizedBox(),
    ], alignment: Alignment.center);
  }
}

// TODO: This will go under TargetItem?
class TaskCount extends StatelessWidget {
  const TaskCount({Key? key, required this.target}) : super(key: key);

  final Target target;

  @override
  Widget build(BuildContext context) {
    return '${target.checks}/${target.total}'.text.make();
    // return [
    //   [
    //     ''.text.make(),
    //   ].row(alignment: MainAxisAlignment.spaceBetween),
    //   RotatedBox(
    //     quarterTurns: 2,
    //     child: LinearPercentIndicator(
    //       width: 100,
    //       animation: true,
    //       lineHeight: 5.0,
    //       animationDuration: 2500,
    //       percent: 0.6,
    //       linearStrokeCap: LinearStrokeCap.roundAll,
    //       progressColor: Colors.green,
    //     ),
    //   ),
    // ].column();
  }
}

// TODO: Goal Text
// TODO: Task Progress
// TODO: Target Block