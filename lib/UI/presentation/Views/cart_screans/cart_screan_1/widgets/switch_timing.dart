import 'package:flutter/material.dart';
import 'package:hezma/UI/presentation/Views/cart_screans/cart_screan_1/widgets/time_service.dart';
import 'package:hezma/utils/constants.dart';
import 'package:intl/intl.dart';

class DeliveryTimeWidget extends StatefulWidget {
  final Function(DateTime, int?) onDateSelected;

  const DeliveryTimeWidget({Key? key, required this.onDateSelected})
      : super(key: key);

  @override
  _DeliveryTimeWidgetState createState() => _DeliveryTimeWidgetState();
}

class _DeliveryTimeWidgetState extends State<DeliveryTimeWidget> {
  DateTime? selectedDate;
  int? selectedButtonIndex;
  int? selectedTimeId;
  List<Map<String, dynamic>> availableTimes = [];

  final TimeService timeService = TimeService();

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
    selectedButtonIndex = null;
  }

  Future<void> _onDateButtonPressed(int daysToAdd, int buttonIndex) async {
    setState(() {
      if (selectedButtonIndex == buttonIndex) {
        selectedButtonIndex = null;
        availableTimes = [];
        selectedTimeId = null;
      } else {
        selectedButtonIndex = buttonIndex;
      }
    });

    selectedDate = DateTime.now().add(Duration(days: daysToAdd));
    final String formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate!);

    final times = await timeService.fetchTime(formattedDate);

    setState(() {
      availableTimes = List<Map<String, dynamic>>.from(times);
      selectedTimeId = null;
    });

    // Pass selectedDate and null as selectedTimeId
    widget.onDateSelected(selectedDate!, null);
  }

  Widget _buildDateButton(String dayLabel, int daysToAdd, int buttonIndex) {
    bool isSelected = selectedButtonIndex == buttonIndex;
    DateTime displayedDate = DateTime.now().add(Duration(days: daysToAdd));

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: ElevatedButton(
        onPressed: () {
          _onDateButtonPressed(daysToAdd, buttonIndex);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor:
              isSelected ? const Color(backgroundcustomgreen2) : Colors.white,
          side: const BorderSide(
            color: Color(backgroundcustomgreen),
            width: 1,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                DateFormat('dd').format(displayedDate),
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                  fontFamily: karabicFont3,
                ),
              ),
            ),
            Text(
              dayLabel,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontFamily: karabicFont3,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeSlotSection() {
    if (availableTimes.isEmpty) {
      return const Center(
        child: Text(
          'لا توجد أوقات متاحة للتاريخ المختار.',
          style: TextStyle(
            fontSize: 16,
            color: Colors.red,
            fontFamily: 'STVBold',
          ),
        ),
      );
    }
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (int i = 0; i < availableTimes.length; i++)
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedTimeId = availableTimes[i]['id'];
                });
                widget.onDateSelected(selectedDate!, selectedTimeId);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 4.0),
                  padding: const EdgeInsets.all(12.0),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: selectedTimeId == availableTimes[i]['id']
                        ? const Color(backgroundcustomgreen)
                        : Colors.grey[300],
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      '${availableTimes[i]['time_start']} - ${availableTimes[i]['time_end']}',
                      style: TextStyle(
                        color: selectedTimeId == availableTimes[i]['id']
                            ? Colors.white
                            : Colors.black,
                        fontFamily: 'STVBold',
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildDateButton('اليوم', 0, 0),
                _buildDateButton('غداً', 1, 1),
                _buildDateButton('الأحد', 2, 2),
                _buildDateButton('الاثنين', 3, 3),
                _buildDateButton('الثلاثاء', 4, 4),
                _buildDateButton('الأربعاء', 5, 5),
                _buildDateButton('الخميس', 6, 6),
                _buildDateButton('الجمعة', 7, 7),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        if (selectedButtonIndex != null) _buildTimeSlotSection(),
      ],
    );
  }
}
