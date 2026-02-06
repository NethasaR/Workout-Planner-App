import 'package:workout_planner/models/equipment_model.dart';
import 'package:workout_planner/models/exercise_model.dart';

class User {
  final String userId;
  final String fullName;
  final String gender;
  final String address;
  final int age;
  final String description;
  int totalExerciseCompleted = 0;
  int totalequipmentHandOvered = 0;

  final List<Exercise> exerciseList;
  final List<Equipment> equipmentList;

  final List<Exercise> favExerciseList;
  final List<Equipment> favEquipmentList;

  User({
    required this.userId,
    required this.fullName,
    required this.gender,
    required this.address,
    required this.age,
    required this.description,
    required this.exerciseList,
    required this.equipmentList,
    required this.favExerciseList,
    required this.favEquipmentList,
  });

  //methods

  //method to add new exercies to the exercisList

  void addExercise(Exercise exercise) {
    exerciseList.add(exercise);
  }

  //method to remove a exercise form the exerciseList
  void removeExercise(Exercise exercise) {
    exerciseList.remove(exercise);
  }

  //method to add new fav exercise to the favexerciselist
  void addFavExercise(Exercise exercise) {
    favExerciseList.add(exercise);
  }

  //method to remove from favourite exercise list
  void removeFavExercise(Exercise exercise) {
    favExerciseList.remove(exercise);
  }

  //method to add a new equipment to equipmentList
  void addEquipment(Equipment equipment) {
    equipmentList.add(equipment);
  }

  //method to remove a equipment from the list
  void removeEquipment(Equipment equipment) {
    equipmentList.remove(equipment);
  }

  //method to add equipment to favlist
  void addFavEquipment(Equipment equipment) {
    equipmentList.add(equipment);
  }

  //method to remove equipments from equipments favorite list
  void removeFavEquipment(Equipment equipment) {
    equipmentList.remove(equipment);
  }

  //method to calculate the total minutes spend
  int calculateTotalMinutesSpent() {
    int totalMinutesSpend = 0;

    //loop through the exercisesList and calculate no of minutes
    for (var exercise in exerciseList) {
      totalMinutesSpend += exercise.noOfMinutes;
    }

    //loop through the equipment and calculate the no of minutes
    for (var equipment in equipmentList) {
      totalMinutesSpend += equipment.noOfMinutes;
    }

    return totalMinutesSpend;
  }

  //method to mark an exercise as completed
  void markExerciseAsCompleted(int exerciseId) {
    final exercise = exerciseList.firstWhere(
      (exercise) => exercise.id == exerciseId,
    );

    exercise.completed = true;
    //remove from the exercise list
    removeExercise(exercise);

    totalExerciseCompleted++;
  }

  //method to mark equipment as handovered
  void markAsHandovered(int equipmentId) {
    final equipment = equipmentList.firstWhere(
      (equipment) => equipment.id == equipmentId,
    );

    equipment.handOvered == true;

    //remove from the equipment list
    removeEquipment(equipment);

    totalequipmentHandOvered++;
  }

  //method to calculate the total number of calories burned by the user
  double calculateTotalCaloriesBurned() {
    double totalCaloriesBurned = 0;

    for (var equipment in equipmentList) {
      totalCaloriesBurned += equipment.noOfCalories;
    }

    //convert totalnoofCalories in to value between 0 and 1
    if (totalCaloriesBurned > 0 && totalCaloriesBurned <= 10) {
      totalCaloriesBurned = totalCaloriesBurned / 10;
    }
    if (totalCaloriesBurned > 10 && totalCaloriesBurned <= 100) {
      totalCaloriesBurned = totalCaloriesBurned / 100;
    }
    if (totalCaloriesBurned > 100 && totalCaloriesBurned <= 1000) {
      totalCaloriesBurned = totalCaloriesBurned / 1000;
    }
    return totalCaloriesBurned;
  }
}
