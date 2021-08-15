import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/foundation.dart';

import '../common.dart' show NotionColors;
import 'models.dart';
import 'repository.dart';

export 'models.dart';
export 'repository.dart';

class GoalTrackerController extends GetxController {
  final GoalTrackerRepository _goalTrackerRepository = Get.find<GoalTrackerRepository>();

  final RxBool _loading = false.obs;

  final RxList<Goal> _goals = <Goal>[].obs;

  /// The users in memory. The controller is responsible of keeping these
  /// in sync with the users in [repository].
  List<Goal> get goals => _goals;

  bool get loading => _loading.value;

  onInit() {
    super.onInit();
    loadUsers();
  }

  loadUsers() async {
    _loading.value = true;

    try {
      _goals(await _goalTrackerRepository.fetchGoals());
    } catch (e) {
      // TODO: It is almost always important the user knows about failures like these.
      // For simplicity, we're not doing it here, but in a real app, the
      // controller would deal with this.
      _goals(<Goal>[]);
    } finally {
      _loading.value = false;
    }
  }
}

class GoalTrackerView extends GetView<GoalTrackerController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (controller.loading) {
          // return Center(child: CircularProgressIndicator());
          return SizedBox(
            height: 16,
            width: 16,
            child: const CircularProgressIndicator(strokeWidth: 4, color: Color(0xff0060df)),
          ).centered();
        }

        return ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(vertical: 8),
          itemCount: controller.goals.length,
          itemBuilder: (BuildContext context, int index) {
            return [
              GoalProgress(
                  percent: controller.goals[index].progress,
                  category: controller.goals[index].category),
              Flexible(
                child: [
                  GoalInfo(goal: controller.goals[index]),
                  SizedBox(height: 20),
                  [
                    TargetItem(target: controller.goals[index].targets[0]),
                    SizedBox(height: 4),
                    TargetItem(target: controller.goals[index].targets[1]),
                  ].column(crossAlignment: CrossAxisAlignment.start),
                ].column(crossAlignment: CrossAxisAlignment.start).px(10),
              ),
              [
                DueDate(date: controller.goals[index].date),
                SizedBox(height: 8),
                GoalCategory(category: controller.goals[index].category),
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

        // TODO: Handle error
        // else if (snapshot.hasError) return Text('${snapshot.error}');

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
      }),
    );
  }
}

// TODO: Goal Progress
// TODO: Different progres color according to their state
class GoalProgress extends StatelessWidget {
  const GoalProgress({Key? key, required this.percent, required this.category}) : super(key: key);

  final double percent;
  final String category;

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 75,
      lineWidth: 7.5,
      percent: percent,
      center: '${(double.parse(percent.toStringAsFixed(2)) * 100).round()}%'.text.xl.make(),
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
    return category.text.make().pSymmetric(v: 1, h: 4).box.orange500.rounded.make();
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
              child:
                  const CircularProgressIndicator(strokeWidth: 2.5, color: NotionColors.fgYellow))
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