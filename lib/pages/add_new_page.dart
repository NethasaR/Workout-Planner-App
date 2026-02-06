import 'package:flutter/material.dart';
import 'package:workout_planner/constants/colors.dart';
import 'package:workout_planner/constants/responsive.dart';
import 'package:workout_planner/data/equipment_data.dart';
import 'package:workout_planner/data/exercise_data.dart';
import 'package:workout_planner/data/user_data.dart';
import 'package:workout_planner/models/equipment_model.dart';
import 'package:workout_planner/models/exercise_model.dart';
import 'package:workout_planner/widgets/add_equipment_card.dart';
import 'package:workout_planner/widgets/add_exercise_card.dart';

class AddNewPage extends StatefulWidget {
  const AddNewPage({super.key});

  @override
  State<AddNewPage> createState() => _AddNewPageState();
}

class _AddNewPageState extends State<AddNewPage> {
  //import the user from user data
  final userData = user;

  //exerciseList
  final exerciseList = ExerciseData().exerciseList;
  final equipmentList = EquipmentData().equipmentList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(kdefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello, ${userData.fullName} !",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: kMainBlackColor,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  "Lets Add some workouts and Equipment for today!",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: kMainDarkBlueColor,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  "All Exercises",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: kMainBlackColor,
                  ),
                ),
                SizedBox(height: 10),
                //listview to scroll horizontally
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.332,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: exerciseList.length,
                    itemBuilder: (context, index) {
                      Exercise exercise = exerciseList[index];
                      return AddExerciseCard(
                        exerciseTitle: exercise.exerciseName,
                        imageUrl: exercise.exerciseImageUrl,
                        noOfMinutes: exercise.noOfMinutes,
                        isAdded: userData.exerciseList.contains(exercise),
                        isFavorite: userData.favExerciseList.contains(exercise),
                        toggleAddExercise: () {
                          setState(() {
                            if (userData.exerciseList.contains(exercise)) {
                              userData.removeExercise(exercise);
                              print(userData.exerciseList.length);
                            } else {
                              userData.addExercise(exercise);
                              print(userData.exerciseList.length);
                            }
                          });
                        },
                        toggleAddFavExercise: () {
                          setState(() {
                            if (userData.favExerciseList.contains(exercise)) {
                              userData.removeFavExercise(exercise);
                              print(userData.favExerciseList.length);
                            } else {
                              userData.addFavExercise(exercise);
                              print(userData.favExerciseList.length);
                            }
                          });
                        },
                      );
                    },
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  "All Equipments",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: kMainBlackColor,
                  ),
                ),
                SizedBox(height: 10),

                //list view the scrolls vertically
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      Equipment equipment = equipmentList[index];
                      return AddEquipmentCard(
                        equipmentName: equipment.equipmentName,
                        equipmentImageUrl: equipment.equipmentImageUrl,
                        noOfMinutes: equipment.noOfMinutes,
                        noOfCalories: equipment.noOfCalories,
                        equipmentDescription: equipment.equipmentDescription,
                        isAddEquipment: userData.equipmentList.contains(
                          equipment,
                        ),
                        isAddFavEquipment: userData.favEquipmentList.contains(
                          equipment,
                        ),
                        toggleAddEquipment: () {
                          setState(() {
                            if (userData.equipmentList.contains(equipment)) {
                              userData.removeEquipment(equipment);
                            } else {
                              userData.addEquipment(equipment);
                            }
                          });
                        },
                        toggleAddFavEquipment: () {
                          setState(() {
                            if (userData.favEquipmentList.contains(equipment)) {
                              userData.removeFavEquipment(equipment);
                            } else {
                              userData.addFavEquipment(equipment);
                            }
                          });
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
