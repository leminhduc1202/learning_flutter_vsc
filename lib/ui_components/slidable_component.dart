import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SlidableView extends StatefulWidget {
  const SlidableView({
    Key? key,
  }) : super(key: key);

  @override
  State<SlidableView> createState() => _SlidableViewState();
}

class _SlidableViewState extends State<SlidableView>
    with SingleTickerProviderStateMixin {
  late final controller = SlidableController(this);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Slidable View',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text(
            "Learning Flutter",
            textAlign: TextAlign.start,
          ),
        ),
        body: ListView(
          children: [
            Slidable(
              // Specify a key if the Slidable is dismissible.
              key: const ValueKey(0),

              // The start action pane is the one at the left or the top side.
              startActionPane: ActionPane(
                // A motion is a widget used to control how the pane animates.
                motion: const ScrollMotion(),

                // A pane can dismiss the Slidable.
                dismissible: DismissiblePane(onDismissed: () {}),

                // All actions are defined in the children parameter.
                children: const [
                  // A SlidableAction can have an icon and/or a label.
                  SlidableAction(
                    onPressed: doNothing,
                    backgroundColor: Color(0xFFFE4A49),
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: 'Delete',
                  ),
                  SlidableAction(
                    onPressed: doNothing,
                    backgroundColor: Color(0xFF21B7CA),
                    foregroundColor: Colors.white,
                    icon: Icons.share,
                    label: 'Share',
                  ),
                ],
              ),

              // The end action pane is the one at the right or the bottom side.
              endActionPane: ActionPane(
                motion: const ScrollMotion(),
                children: [
                  SlidableAction(
                    // An action can be bigger than the others.
                    flex: 2,
                    onPressed: (_) => controller.openEndActionPane(),
                    backgroundColor: const Color(0xFF7BC043),
                    foregroundColor: Colors.white,
                    icon: Icons.archive,
                    label: 'Archive',
                  ),
                  SlidableAction(
                    onPressed: (_) => controller.close(),
                    backgroundColor: const Color(0xFF0392CF),
                    foregroundColor: Colors.white,
                    icon: Icons.save,
                    label: 'Save',
                  ),
                ],
              ),

              // The child of the Slidable is what the user sees when the
              // component is not dragged.
              child: const ListTile(title: Text('Slide me 01')),
            ),
            const Divider(
              thickness: 1.0,
              height: 1.0,
            ),
            Slidable(
              controller: controller,
              // Specify a key if the Slidable is dismissible.
              key: const ValueKey(1),

              // The start action pane is the one at the left or the top side.
              startActionPane: const ActionPane(
                // A motion is a widget used to control how the pane animates.
                motion: ScrollMotion(),

                // All actions are defined in the children parameter.
                children: [
                  // A SlidableAction can have an icon and/or a label.
                  SlidableAction(
                    onPressed: doNothing,
                    backgroundColor: Color(0xFFFE4A49),
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: 'Delete',
                  ),
                  SlidableAction(
                    onPressed: doNothing,
                    backgroundColor: Color(0xFF21B7CA),
                    foregroundColor: Colors.white,
                    icon: Icons.share,
                    label: 'Share',
                  ),
                ],
              ),

              // The end action pane is the one at the right or the bottom side.
              endActionPane: ActionPane(
                motion: const ScrollMotion(),
                dismissible: DismissiblePane(onDismissed: () {}),
                children: const [
                  SlidableAction(
                    // An action can be bigger than the others.
                    flex: 2,
                    onPressed: doNothing,
                    backgroundColor: Color(0xFF7BC043),
                    foregroundColor: Colors.white,
                    icon: Icons.archive,
                    label: 'Archive',
                  ),
                  SlidableAction(
                    onPressed: doNothing,
                    backgroundColor: Color(0xFF0392CF),
                    foregroundColor: Colors.white,
                    icon: Icons.save,
                    label: 'Save',
                  ),
                ],
              ),

              // The child of the Slidable is what the user sees when the
              // component is not dragged.
              child: const ListTile(title: Text('Slide me 02',
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.red,
                fontWeight: FontWeight.bold
              ),)),
            ),
            const Divider(
              thickness: 1.0,
              height: 1.0,
            ),
          ],
        ),
      ),
    );
  }
}

void doNothing(BuildContext context) {}
