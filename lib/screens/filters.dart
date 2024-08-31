import 'package:flutter/material.dart';

enum Filter { glutenfree, lactosefree, vegetarian, vegan }

class FiletersScreen extends StatefulWidget {
  const FiletersScreen({super.key});

  @override
  State<FiletersScreen> createState() => _FiletersScreenState();
}

class _FiletersScreenState extends State<FiletersScreen> {
  var _glutenfreefilterset = false;
  var _lactosefreeefilterset = false;
  var _vegetarianfilterset = false;
  var _veganfilterset = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Filters"),
      ),
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (bool didpop, dynamic result) async {
          if (didpop) return;
          Navigator.of(context).pop({
            Filter.glutenfree: _glutenfreefilterset,
            Filter.lactosefree: _lactosefreeefilterset,
            Filter.vegetarian: _veganfilterset,
            Filter.vegan: _veganfilterset,
          });
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _glutenfreefilterset,
              onChanged: (newval) {
                setState(() {
                  _glutenfreefilterset = newval;
                });
              },
              title: Text(
                "Gluten-Free",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              subtitle: Text(
                "Only include Gluten-Free meals",
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(
                left: 34,
                right: 22,
              ),
            ),
            SwitchListTile(
              value: _lactosefreeefilterset,
              onChanged: (newval) {
                setState(() {
                  _lactosefreeefilterset = newval;
                });
              },
              title: Text(
                "Lactose-Free",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              subtitle: Text(
                "Only include Lactose-Free meals",
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(
                left: 34,
                right: 22,
              ),
            ),
            SwitchListTile(
              value: _vegetarianfilterset,
              onChanged: (newval) {
                setState(() {
                  _vegetarianfilterset = newval;
                });
              },
              title: Text(
                "vegetarian-Free",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              subtitle: Text(
                "Only include vegetarian-Free meals",
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(
                left: 34,
                right: 22,
              ),
            ),
            SwitchListTile(
              value: _veganfilterset,
              onChanged: (newval) {
                setState(() {
                  _veganfilterset = newval;
                });
              },
              title: Text(
                "Lactose-Free",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              subtitle: Text(
                "Only include Lactose-Free meals",
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(
                left: 34,
                right: 22,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
