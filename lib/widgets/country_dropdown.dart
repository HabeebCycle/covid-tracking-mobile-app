import 'package:flutter/material.dart';

class CountryDropdown extends StatelessWidget {
  final List<String> countries;
  final String country;
  final Function(String?) onChanged;

  const CountryDropdown({
    Key? key,
    required this.countries,
    required this.country,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      height: 40.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          value: country,
          items: countries
              .map((e) => DropdownMenuItem(
                    value: e,
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 12.0,
                          child: Image.asset(
                            'assets/images/${e.toLowerCase()}_flag.png',
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        Text(
                          e,
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ))
              .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
