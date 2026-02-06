import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:workout_planner/constants/colors.dart';
import 'package:workout_planner/constants/responsive.dart';
import 'package:workout_planner/data/equipment_data.dart';
import 'package:workout_planner/data/exercise_data.dart';
import 'package:workout_planner/data/user_data.dart';
import 'package:workout_planner/pages/equipments_page.dart';
import 'package:workout_planner/pages/exercise_details_page.dart';
import 'package:workout_planner/widgets/exercise_card.dart';
import 'package:workout_planner/widgets/progress_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Date and Time formatters
  final DateFormat formetter = DateFormat('EEEE , MMMM');
  final DateFormat dayFormat = DateFormat('dd');

  //User data
  final userData = user;

  //Exercise and equipment data
  final exerciselist = ExerciseData().exerciseList;
  final equipmentlist = EquipmentData().equipmentList;

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = formetter.format(now);
    String formatterDay = dayFormat.format(now);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(kdefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$formattedDate $formatterDay",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: kSubtitleColor,
                  ),
                ),
                Text(
                  "${userData.fullName}",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                    color: kMainBlackColor,
                  ),
                ),
                SizedBox(height: 15),
                ProgressCard(
                  progressValue: userData.calculateTotalCaloriesBurned(),
                  total: 100,
                ),
                SizedBox(height: 15),
                Text(
                  "Today's Activity",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ExerciseDetailsPage(
                              exerciseTitle: "WarmUp",
                              exerciseDescription:
                                  "Running is a method of terrestrial locomotion allowing humans and other animals to move rapidly on foot. It is simply defined in athletics terms as a gait in which at regular points during the running cycle both feet are off the ground",
                              exerciseList: exerciselist,
                            ),
                          ),
                        );
                      },
                      child: ExerciseCard(
                        title: "Warm up",
                        imageUrl: "assets/images/exercises/downward-facing.png",
                        description: "see more",
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EquipmentsPage(
                              equipmentTitle: "Equipments",
                              equipmentDescription:
                                  "Running is a method of terrestrial locomotion allowing humans and other animals to move rapidly on foot. It is simply defined in athletics terms as a gait in which at regular points during the running cycle both feet are off the ground",
                              equipmentList: equipmentlist,
                            ),
                          ),
                        );
                      },
                      child: ExerciseCard(
                        title: "Equipment",
                        imageUrl: "assets/images/equipments/dumbbells2.png",
                        description: "see more",
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 13),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ExerciseDetailsPage(
                              exerciseTitle: "Exercise",
                              exerciseDescription:
                                  "Running is a method of terrestrial locomotion allowing humans and other animals to move rapidly on foot. It is simply defined in athletics terms as a gait in which at regular points during the running cycle both feet are off the ground",
                              exerciseList: exerciselist,
                            ),
                          ),
                        );
                      },
                      child: ExerciseCard(
                        title: "Exercise",
                        imageUrl: "assets/images/exercises/dragging.png",
                        description: "see more",
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ExerciseDetailsPage(
                              exerciseTitle: "Streching",
                              exerciseDescription:
                                  "Running is a method of terrestrial locomotion allowing humans and other animals to move rapidly on foot. It is simply defined in athletics terms as a gait in which at regular points during the running cycle both feet are off the ground",
                              exerciseList: exerciselist,
                            ),
                          ),
                        );
                      },
                      child: ExerciseCard(
                        title: "Streching",
                        imageUrl: "assets/images/exercises/triangle.png",
                        description: "see more",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
