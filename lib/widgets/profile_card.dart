import 'package:flutter/material.dart';
import 'package:workout_planner/constants/colors.dart';
import 'package:workout_planner/constants/responsive.dart';

class ProfileCard extends StatefulWidget {
  final String taskName;
  final String taskImageUrl;
  final void Function() markAsDone;
  const ProfileCard({
    super.key,
    required this.taskName,
    required this.taskImageUrl,
    required this.markAsDone,
  });

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: kCardBgColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(kdefaultPadding),
        child: Row(
          children: [
            Image.asset(widget.taskImageUrl, width: 50, fit: BoxFit.cover),
            SizedBox(width: 10),
            Text(
              widget.taskName,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            IconButton(
              onPressed: () {
                widget.markAsDone();
              },
              icon: Icon(Icons.check, color: kMainColor),
            ),
          ],
        ),
      ),
    );
  }
}
