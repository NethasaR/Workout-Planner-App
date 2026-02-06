import 'package:workout_planner/models/equipment_model.dart';
import 'package:workout_planner/models/exercise_model.dart';
import 'package:workout_planner/models/user_model.dart';

User user = User(
  userId: "123",
  fullName: "Nethasa",
  gender: "Female",
  address: "123 Main St, City, Country",
  age: 23,
  description: "Fitness enthusiast",
  exerciseList: [
    Exercise(
      id: 0,
      exerciseName: "Push-Ups",
      exerciseImageUrl: "assets/images/exercises/downward-facing.png",
      noOfMinutes: 10,
      completed: false,
    ),
    Exercise(
      id: 1,
      exerciseName: "Squats",
      exerciseImageUrl: "assets/images/exercises/dragging.png",
      noOfMinutes: 20,
      completed: false,
    ),
  ],
  equipmentList: [
    Equipment(
      id: 0,
      equipmentName: "Dumbbells",
      equipmentDescription:
          "A pair of dumbbells for strength training exercises.",
      equipmentImageUrl: "assets/images/equipments/dumbbell.png",
      noOfMinutes: 5,
      noOfCalories: 2,
      handOvered: false,
    ),
    Equipment(
      id: 1,
      equipmentName: "Resistance Bands",
      equipmentDescription: "Elastic bands used for resistance exercies",
      equipmentImageUrl: "assets/images/equipments/checklist.png",
      noOfMinutes: 15,
      noOfCalories: 10,
      handOvered: false,
    ),
  ],
  favExerciseList: [
    Exercise(
      id: 1,
      exerciseName: "Squats",
      exerciseImageUrl: "assets/images/exercises/dragging.png",
      noOfMinutes: 20,
      completed: false,
    ),
  ],
  favEquipmentList: [
    Equipment(
      id: 1,
      equipmentName: "Resistance Bands",
      equipmentDescription: "Elastic bands used for resistance exercies",
      equipmentImageUrl: "assets/images/equipments/checklist.png",
      noOfMinutes: 15,
      noOfCalories: 10,
      handOvered: false,
    ),
  ],
);
