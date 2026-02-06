import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:workout_planner/constants/colors.dart';
import 'package:workout_planner/constants/responsive.dart';
import 'package:workout_planner/data/user_data.dart';
import 'package:workout_planner/models/equipment_model.dart';
import 'package:workout_planner/models/exercise_model.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  //Date and Time formatters
  final DateFormat formetter = DateFormat('EEEE , MMMM');
  final DateFormat dayFormat = DateFormat('dd');

  //User data
  final userData = user;
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
                SizedBox(height: 10),
                Text(
                  "Here are all your favorite workouts",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                    color: kMainColor,
                  ),
                ),
                SizedBox(height: 20),
                //Exercise Grid View
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: kdefaultPadding,
                    mainAxisSpacing: kdefaultPadding,
                    childAspectRatio: 16 / 17,
                  ),
                  itemCount: userData.favExerciseList.length,
                  itemBuilder: (context, index) {
                    Exercise favExercise = userData.favExerciseList[index];
                    return Card(
                      color: const Color.fromARGB(255, 216, 213, 213),
                      child: Padding(
                        padding: const EdgeInsets.all(kdefaultPadding),
                        child: Column(
                          children: [
                            Text(
                              favExercise.exerciseName,
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            Image.asset(
                              favExercise.exerciseImageUrl,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                            Text(
                              "${favExercise.noOfMinutes.toString()} Min Wokout",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.normal,
                                color: kMainPinkColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                Text(
                  "Here are all your favorite Equipments",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                    color: kMainColor,
                  ),
                ),
                SizedBox(height: 20),
                //Exercise Grid View
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: kdefaultPadding,
                    mainAxisSpacing: kdefaultPadding,
                    childAspectRatio: 16 / 23,
                  ),
                  itemCount: userData.favEquipmentList.length,
                  itemBuilder: (context, index) {
                    Equipment favExercise = userData.favEquipmentList[index];
                    return Card(
                      color: const Color.fromARGB(255, 216, 213, 213),
                      child: Padding(
                        padding: const EdgeInsets.all(kdefaultPadding),
                        child: Column(
                          children: [
                            Text(
                              favExercise.equipmentName,
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            Image.asset(
                              favExercise.equipmentName,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(height: 10),
                            Text(
                              "${favExercise.noOfMinutes.toString()} Min Wokout",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.normal,
                                color: kMainPinkColor,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "${favExercise.equipmentDescription}",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.normal,
                                color: kMainPinkColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
