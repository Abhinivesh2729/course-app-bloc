import 'package:elearn/features/listing/view/widgets/course/bottom_sheet.dart';
import 'package:flutter/material.dart';

class FilterButton extends StatefulWidget {
  const FilterButton({super.key});

  @override
  State<FilterButton> createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 20),
      child: OutlinedButton.icon(
        
        onPressed: () {
            showModalBottomSheet(
              barrierColor: Colors.black.withOpacity(0.7),
              context: context, 
              builder: (context) => FilterBottomSheet());
       
        },
        icon: const Icon(Icons.filter_list),
        label: const Text('Filter'),
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          foregroundColor: Colors.grey,
          side: const BorderSide(color: Colors.grey),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
      ),
    );
  }
}
