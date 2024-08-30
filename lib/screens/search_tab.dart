import 'package:flutter/material.dart';
import '../models/destination.dart';
import '../widgets/destination_card.dart';

class SearchTab extends StatefulWidget {
  final List<Destination> destinations;
  final Function(Destination) onFavorite;

  SearchTab({required this.destinations, required this.onFavorite});

  @override
  _SearchTabState createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  String searchQuery = '';
  DateTime? startDate;
  DateTime? endDate;
  int adults = 1;
  int children = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Destinations'),
      ),
      body: Column(
        children: [
          // Campos de búsqueda
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(labelText: 'Search'),
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
            ),
          ),
          // DatePicker y Selectores
          Row(
            children: [
              TextButton(
                onPressed: () async {
                  startDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2030),
                  );
                  setState(() {});
                },
                child: Text('Select Start Date'),
              ),
              TextButton(
                onPressed: () async {
                  endDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2030),
                  );
                  setState(() {});
                },
                child: Text('Select End Date'),
              ),
            ],
          ),
          Row(
            children: [
              DropdownButton<int>(
                value: adults,
                onChanged: (value) {
                  setState(() {
                    adults = value!;
                  });
                },
                items: List.generate(10, (index) {
                  return DropdownMenuItem(
                    value: index + 1,
                    child: Text('Adults: ${index + 1}'),
                  );
                }),
              ),
              DropdownButton<int>(
                value: children,
                onChanged: (value) {
                  setState(() {
                    children = value!;
                  });
                },
                items: List.generate(10, (index) {
                  return DropdownMenuItem(
                    value: index,
                    child: Text('Children: $index'),
                  );
                }),
              ),
            ],
          ),
          // Resultados de búsqueda
          Expanded(
            child: ListView.builder(
              itemCount: widget.destinations.length,
              itemBuilder: (context, index) {
                final destination = widget.destinations[index];
                if (destination.name.toLowerCase().contains(searchQuery.toLowerCase())) {
                  return DestinationCard(
                    destination: destination,
                    onFavorite: widget.onFavorite,
                  );
                }
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}
