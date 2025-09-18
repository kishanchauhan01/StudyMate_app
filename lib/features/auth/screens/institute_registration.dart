// import 'package:flutter/material.dart';
// import 'package:easy_stepper/easy_stepper.dart';

// class InstituteProgressScreen extends StatefulWidget {
//   const InstituteProgressScreen({super.key});

//   @override
//   State<InstituteProgressScreen> createState() =>
//       _InstituteProgressScreenState();
// }

// // The State class holds all the changing variables
// class _InstituteProgressScreenState extends State<InstituteProgressScreen> {
  
//   // --- DEFINE THE VARIABLE HERE ---
//   int activeStep = 0; 

//   @override
//   Widget build(BuildContext context) {
//     // Don't define 'activeStep' here
    
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Institute Registration'),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(top: 40, bottom: 40),
//             child: EasyStepper(
//               activeStep: activeStep, // Now it can find and use the variable
//               // ... other properties
//               steps: const [
//                 EasyStep(
//                   icon: Icon(Icons.circle),
//                   title: 'Institute Info',
//                 ),
//                 EasyStep(
//                   icon: Icon(Icons.circle),
//                   title: 'Admin Info',
//                 ),
//                 EasyStep(
//                   icon: Icon(Icons.check_circle),
//                   title: 'Done',
//                 ),
//               ],
//               onStepReached: (index) => setState(() => activeStep = index),
//             ),
//           ),
          
//           const Spacer(),

//           Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 ElevatedButton(
//                   onPressed: activeStep > 0
//                       ? () => setState(() => activeStep--)
//                       : null,
//                   child: const Text('Back'),
//                 ),
//                 ElevatedButton(
//                   onPressed: activeStep < 2
//                       ? () => setState(() => activeStep++)
//                       : null,
//                   child: const Text('Next'),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }