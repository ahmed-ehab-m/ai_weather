import 'package:ai_weather/core/helper/functions/get_next_days.dart';
import 'package:ai_weather/core/helper/screen_size_helper.dart';
import 'package:ai_weather/core/utils/constants.dart';
import 'package:ai_weather/features/home/presentation/views/widgets/forcast_day_item.dart';
import 'package:flutter/material.dart';

class ForcastDaysList extends StatefulWidget {
  const ForcastDaysList(
      {super.key, required this.onTap, this.selectedIndex = 0});
  final Function(int index)? onTap;
  final int? selectedIndex;

  @override
  State<ForcastDaysList> createState() => _ForcastDaysListState();
}

class _ForcastDaysListState extends State<ForcastDaysList> {
  int isSelected = 0;
  List<String> daysNames = getNextDays(type: 'name');
  List<String> daysDate = getNextDays(type: 'date');

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenSizeHelper(context).screenHeight * 0.13,
      child: Center(
        child: ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (context, index) => const SizedBox(
            width: 20,
          ),
          scrollDirection: Axis.horizontal,
          itemCount: daysNames.length,
          itemBuilder: (context, index) => InkWell(
            onTap: () async {
              isSelected = index;
              setState(() {});
              await widget.onTap!(index);
            },
            child: ForcastDayItem(
                dayName: daysNames[index],
                date: daysDate[index],
                color: widget.selectedIndex == index
                    ? Colors.white.withAlpha(100)
                    : kPrimaryColor.withAlpha(100)),
          ),
        ),
      ),
    );
  }
}
