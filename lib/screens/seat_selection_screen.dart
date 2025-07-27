// import 'package:flutter/material.dart';

// class SeatSelectionScreen extends StatefulWidget {
//   @override
//   _SeatSelectionScreenState createState() => _SeatSelectionScreenState();
// }

//   // Seat status enum
//   enum SeatStatus { 
//     driver,
//     available, 
//     booked, 
//     femaleOnly, 
//     femaleBooked, 
//     maleOnly, 
//     maleBooked 
//   }

// class _SeatSelectionScreenState extends State<SeatSelectionScreen> {
//   Set<int> selectedSeats = {};
  
//   // Sample seat data - you can modify this based on your bus layout
//   List<List<SeatStatus?>> seatLayout = [
//     [null, null, null, null, SeatStatus.driver],
//     [SeatStatus.available,SeatStatus.available, null, SeatStatus.available, SeatStatus.available],
//     [SeatStatus.available, SeatStatus.available,null, SeatStatus.available, SeatStatus.available],
//     [SeatStatus.available, SeatStatus.available,null, SeatStatus.available, SeatStatus.booked],
//     [SeatStatus.available, SeatStatus.available,null, SeatStatus.available, SeatStatus.booked],
//     [SeatStatus.femaleOnly, SeatStatus.femaleOnly,null, SeatStatus.available, SeatStatus.booked],
//     [SeatStatus.femaleOnly, SeatStatus.femaleOnly,null, SeatStatus.available, SeatStatus.booked],
//     [SeatStatus.femaleOnly, SeatStatus.booked,null, SeatStatus.available, SeatStatus.available],
//     [SeatStatus.available, SeatStatus.available,null, SeatStatus.available, SeatStatus.available],
//     [SeatStatus.available, SeatStatus.available,SeatStatus.available, SeatStatus.available, SeatStatus.available],
//   ];

//   Color getSeatColor(SeatStatus status) {
//     switch (status) {
//       case SeatStatus.driver:
//         return Colors.grey.shade800;
//       case SeatStatus.available:
//         return Colors.green;
//       case SeatStatus.booked:
//         return Colors.grey;
//       case SeatStatus.femaleOnly:
//         return Colors.pink;
//       case SeatStatus.femaleBooked:
//         return Colors.pink.withOpacity(0.3);
//       case SeatStatus.maleOnly:
//         return Colors.blue;
//       case SeatStatus.maleBooked:
//         return Colors.blue.withOpacity(0.3);
//     }
//   }

//   IconData getSeatIcon(SeatStatus status) {
//     switch (status) {
//       case SeatStatus.femaleOnly:
//       case SeatStatus.femaleBooked:
//         return Icons.female;
//       case SeatStatus.maleOnly:
//       case SeatStatus.maleBooked:
//         return Icons.male;
//       case SeatStatus.driver:
//         return Icons.drive_eta;
//       default:
//         return Icons.event_seat;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[100],
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 1,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Select Seats',
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             Text(
//               'Dewas → Bhopal',
//               style: TextStyle(
//                 color: Colors.grey[600],
//                 fontSize: 14,
//                 fontWeight: FontWeight.normal,
//               ),
//             ),
//           ],
//         ),
//         actions: [
//           Container(
//             margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//             padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//             decoration: BoxDecoration(
//               color: Colors.orange[100],
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Text(
//                   'Exclusive',
//                   style: TextStyle(
//                     color: Colors.orange[800],
//                     fontSize: 10,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Text(
//                   '5% OFF',
//                   style: TextStyle(
//                     color: Colors.orange[800],
//                     fontSize: 10,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           // Seat layout
//           Expanded(
//             child: SingleChildScrollView(
//               padding: EdgeInsets.symmetric(horizontal: 16),
//               child: Column(
//                 children: [
//                   // Seats grid
//                   Container(
//                     padding: EdgeInsets.all(16),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: Column(
//                       children: seatLayout.asMap().entries.map((rowEntry) {
//                         int rowIndex = rowEntry.key;
//                         List<SeatStatus?> row = rowEntry.value;
                        
//                         return Padding(
//                           padding: EdgeInsets.symmetric(vertical: 4),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: row.asMap().entries.map((seatEntry) {
//                               int seatIndex = seatEntry.key;
//                               SeatStatus? seatStatus = seatEntry.value;
//                               int globalSeatIndex = rowIndex * 5 + seatIndex;
                              
//                               if (seatStatus == null) {
//                                 return Expanded(
//                                   child: SizedBox(height: 40),
//                                 );
//                               }
                              
//                               return Expanded(
//                                 child: GestureDetector(
//                                   onTap: () {
//                                     if (seatStatus == SeatStatus.available ||
//                                         seatStatus == SeatStatus.femaleOnly ||
//                                         seatStatus == SeatStatus.maleOnly) {
//                                       setState(() {
//                                         if (selectedSeats.contains(globalSeatIndex)) {
//                                           selectedSeats.remove(globalSeatIndex);
//                                         } else {
//                                           selectedSeats.add(globalSeatIndex);
//                                         }
//                                       });
//                                     }
//                                   },
//                                   child: Container(
//                                     margin: EdgeInsets.all(2),
//                                     height: 40,
//                                     decoration: BoxDecoration(
//                                       color: selectedSeats.contains(globalSeatIndex)
//                                           ? Colors.orange
//                                           : getSeatColor(seatStatus),
//                                       borderRadius: BorderRadius.circular(6),
//                                       border: Border.all(
//                                         color: getSeatColor(seatStatus).withOpacity(0.3),
//                                         width: 1,
//                                       ),
//                                     ),
//                                     child: Column(
//                                       mainAxisAlignment: MainAxisAlignment.center,
//                                       children: [
//                                         Icon(
//                                           getSeatIcon(seatStatus),
//                                           color: Colors.white,
//                                           size: 16,
//                                         ),
//                                         if (seatStatus == SeatStatus.available ||
//                                             seatStatus == SeatStatus.femaleOnly ||
//                                             seatStatus == SeatStatus.maleOnly)
//                                           Text(
//                                             '₹400',
//                                             style: TextStyle(
//                                               color: Colors.white,
//                                               fontSize: 8,
//                                               fontWeight: FontWeight.bold,
//                                             ),
//                                           ),
//                                         if (seatStatus == SeatStatus.booked ||
//                                             seatStatus == SeatStatus.femaleBooked ||
//                                             seatStatus == SeatStatus.maleBooked)
//                                           Text(
//                                             'Sold',
//                                             style: TextStyle(
//                                               color: Colors.white,
//                                               fontSize: 8,
//                                             ),
//                                           ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               );
//                             }).toList(),
//                           ),
//                         );
//                       }).toList(),
//                     ),
//                   ),
                  
//                   SizedBox(height: 20),
                  
//                   // Seat type legend
//                   Container(
//                     padding: EdgeInsets.all(16),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Know your seat types',
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black87,
//                           ),
//                         ),
//                         SizedBox(height: 16),
//                         _buildLegendItem('Available', Colors.green, Icons.event_seat),
//                         _buildLegendItem('Already booked', Colors.grey, Icons.event_seat),
//                         _buildLegendItem('Available only for female passenger', Colors.pink, Icons.female),
//                         _buildLegendItem('Booked by female passenger', Colors.pink.withOpacity(0.3), Icons.female),
//                         _buildLegendItem('Available for male passenger', Colors.blue, Icons.male),
//                         _buildLegendItem('Booked by male passenger', Colors.blue.withOpacity(0.3), Icons.male),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
          
//           // Bus info section
//           Container(
//             padding: EdgeInsets.all(16),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.1),
//                   blurRadius: 10,
//                   offset: Offset(0, -2),
//                 ),
//               ],
//             ),
//             child: Column(
//               children: [
//                 Row(
//                   children: [
//                     ClipRRect(
//                       borderRadius: BorderRadius.circular(8),
//                       child: Container(
//                         width: 60,
//                         height: 60,
//                         color: Colors.grey[300],
//                         child: Icon(Icons.directions_bus, size: 30),
//                       ),
//                     ),
//                     SizedBox(width: 12),
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'Electric Bus',
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           Text(
//                             'Saving 18 kg CO2E',
//                             style: TextStyle(
//                               color: Colors.grey[600],
//                               fontSize: 12,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 16),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'NueGo (Partnered by Verma Travels)',
//                             style: TextStyle(
//                               fontSize: 14,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                           Text(
//                             '07:25 - 10:05 • Wed, 23 Jul',
//                             style: TextStyle(
//                               color: Colors.grey[600],
//                               fontSize: 12,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                       decoration: BoxDecoration(
//                         color: Colors.green,
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Icon(Icons.star, color: Colors.white, size: 12),
//                           SizedBox(width: 2),
//                           Text(
//                             '4.7',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 12,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 16),
//                 Row(
//                   children: [
//                     _buildTabItem('Highlights', true),
//                     _buildTabItem('Bus route', false),
//                     _buildTabItem('Boarding points', false),
//                     _buildTabItem('Dropping', false),
//                   ],
//                 ),
//               ],
//             ),
//           ),
        
//         ],
//       ),
//     );
//   }

//   Widget _buildLegendItem(String text, Color color, IconData icon) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 8),
//       child: Row(
//         children: [
//           Expanded(
//             flex: 3,
//             child: Text(
//               text,
//               style: TextStyle(
//                 fontSize: 14,
//                 color: Colors.grey[700],
//               ),
//             ),
//           ),
//           Container(
//             width: 32,
//             height: 32,
//             decoration: BoxDecoration(
//               color: color,
//               borderRadius: BorderRadius.circular(6),
//               border: Border.all(
//                 color: color.withOpacity(0.3),
//                 width: 1,
//               ),
//             ),
//             child: Icon(
//               icon,
//               color: Colors.white,
//               size: 16,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildTabItem(String text, bool isActive) {
//     return Expanded(
//       child: Container(
//         padding: EdgeInsets.symmetric(vertical: 8),
//         decoration: BoxDecoration(
//           border: Border(
//             bottom: BorderSide(
//               color: isActive ? Colors.red : Colors.transparent,
//               width: 2,
//             ),
//           ),
//         ),
//         child: Text(
//           text,
//           textAlign: TextAlign.center,
//           style: TextStyle(
//             fontSize: 12,
//             color: isActive ? Colors.red : Colors.grey[600],
//             fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// // Enums
// enum SeatStatus { 
//   driver,
//   available, 
//   booked, 
//   femaleOnly, 
//   femaleBooked, 
//   maleOnly, 
//   maleBooked 
// }

// enum BusType { seater, sleeper }
// enum BerthType { upper, lower }

// // Models
// class SeatData {
//   final int id;
//   final SeatStatus status;
//   final BerthType? berthType;
//   final double price;
//   final String? seatNumber;

//   SeatData({
//     required this.id,
//     required this.status,
//     this.berthType,
//     required this.price,
//     this.seatNumber,
//   });
// }

// class BusInfo {
//   final String name;
//   final String operator;
//   final String route;
//   final String time;
//   final String date;
//   final double rating;
//   final String busType;
//   final String coSaving;

//   BusInfo({
//     required this.name,
//     required this.operator,
//     required this.route,
//     required this.time,
//     required this.date,
//     required this.rating,
//     required this.busType,
//     required this.coSaving,
//   });
// }

// // Custom Seat Selection Widget
// class CustomSeatSelectionWidget extends StatefulWidget {
//   final BusType busType;
//   final List<List<SeatData?>> seatLayout;
//   final BusInfo busInfo;
//   final Function(Set<int>) onSeatSelectionChanged;
//   final Set<int> initialSelectedSeats;

//   const CustomSeatSelectionWidget({
//     Key? key,
//     required this.busType,
//     required this.seatLayout,
//     required this.busInfo,
//     required this.onSeatSelectionChanged,
//     this.initialSelectedSeats = const {},
//   }) : super(key: key);

//   @override
//   _CustomSeatSelectionWidgetState createState() => _CustomSeatSelectionWidgetState();
// }

// class _CustomSeatSelectionWidgetState extends State<CustomSeatSelectionWidget> {
//   Set<int> selectedSeats = {};

//   @override
//   void initState() {
//     super.initState();
//     selectedSeats = Set.from(widget.initialSelectedSeats);
//   }

//   Color getSeatColor(SeatStatus status) {
//     switch (status) {
//       case SeatStatus.driver:
//         return Colors.grey.shade800;
//       case SeatStatus.available:
//         return Colors.green;
//       case SeatStatus.booked:
//         return Colors.grey;
//       case SeatStatus.femaleOnly:
//         return Colors.pink;
//       case SeatStatus.femaleBooked:
//         return Colors.pink.withOpacity(0.3);
//       case SeatStatus.maleOnly:
//         return Colors.blue;
//       case SeatStatus.maleBooked:
//         return Colors.blue.withOpacity(0.3);
//     }
//   }

//   IconData getSeatIcon(SeatStatus status) {
//     switch (status) {
//       case SeatStatus.femaleOnly:
//       case SeatStatus.femaleBooked:
//         return Icons.female;
//       case SeatStatus.maleOnly:
//       case SeatStatus.maleBooked:
//         return Icons.male;
//       case SeatStatus.driver:
//         return Icons.drive_eta;
//       default:
//         return widget.busType == BusType.sleeper ? Icons.bed : Icons.event_seat;
//     }
//   }

//   Widget _buildSeat(SeatData seatData, int globalIndex) {
//     bool isSelected = selectedSeats.contains(globalIndex);
//     bool isSelectable = seatData.status == SeatStatus.available ||
//         seatData.status == SeatStatus.femaleOnly ||
//         seatData.status == SeatStatus.maleOnly;

//     return GestureDetector(
//       onTap: isSelectable ? () {
//         setState(() {
//           if (isSelected) {
//             selectedSeats.remove(globalIndex);
//           } else {
//             selectedSeats.add(globalIndex);
//           }
//           widget.onSeatSelectionChanged(selectedSeats);
//         });
//       } : null,
//       child: Container(
//         margin: EdgeInsets.all(2),
//         height: widget.busType == BusType.sleeper ? 60 : 40,
//         width: widget.busType == BusType.sleeper ? 80 : null,
//         decoration: BoxDecoration(
//           color: isSelected ? Colors.orange : getSeatColor(seatData.status),
//           borderRadius: BorderRadius.circular(8),
//           border: Border.all(
//             color: getSeatColor(seatData.status).withOpacity(0.3),
//             width: 1,
//           ),
//         ),
//         child: widget.busType == BusType.sleeper 
//           ? _buildSleeperSeat(seatData)
//           : _buildSeaterSeat(seatData),
//       ),
//     );
//   }

//   Widget _buildSeaterSeat(SeatData seatData) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Icon(
//           getSeatIcon(seatData.status),
//           color: Colors.white,
//           size: 16,
//         ),
//         if (seatData.status == SeatStatus.available ||
//             seatData.status == SeatStatus.femaleOnly ||
//             seatData.status == SeatStatus.maleOnly)
//           Text(
//             '₹${seatData.price.toInt()}',
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 8,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         if (seatData.status == SeatStatus.booked ||
//             seatData.status == SeatStatus.femaleBooked ||
//             seatData.status == SeatStatus.maleBooked)
//           Text(
//             'Sold',
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 8,
//             ),
//           ),
//       ],
//     );
//   }

//   Widget _buildSleeperSeat(SeatData seatData) {
//     return Column(
//       children: [
//         // Upper berth
//         Expanded(
//           child: Container(
//             width: double.infinity,
//             decoration: BoxDecoration(
//               border: Border(bottom: BorderSide(color: Colors.white, width: 1)),
//             ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Icon(Icons.bed, color: Colors.white, size: 12),
//                 Text('U', style: TextStyle(color: Colors.white, fontSize: 8)),
//                 Text('₹${seatData.price.toInt()}', 
//                   style: TextStyle(color: Colors.white, fontSize: 6)),
//               ],
//             ),
//           ),
//         ),
//         // Lower berth
//         Expanded(
//           child: Container(
//             width: double.infinity,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Icon(Icons.bed, color: Colors.white, size: 12),
//                 Text('L', style: TextStyle(color: Colors.white, fontSize: 8)),
//                 Text('₹${(seatData.price * 0.9).toInt()}', 
//                   style: TextStyle(color: Colors.white, fontSize: 6)),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Column(
//         children: [
//           // Bus layout indicator
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 widget.busType == BusType.sleeper ? 'Sleeper Layout' : 'Seater Layout',
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               if (widget.busType == BusType.sleeper)
//                 Row(
//                   children: [
//                     Container(
//                       padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                       decoration: BoxDecoration(
//                         color: Colors.blue[100],
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: Text('Upper', style: TextStyle(fontSize: 10, color: Colors.blue[800])),
//                     ),
//                     SizedBox(width: 8),
//                     Container(
//                       padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                       decoration: BoxDecoration(
//                         color: Colors.green[100],
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: Text('Lower', style: TextStyle(fontSize: 10, color: Colors.green[800])),
//                     ),
//                   ],
//                 ),
//             ],
//           ),
//           SizedBox(height: 16),
          
//           // Seats grid
//           Column(
//             children: widget.seatLayout.asMap().entries.map((rowEntry) {
//               int rowIndex = rowEntry.key;
//               List<SeatData?> row = rowEntry.value;
              
//               return Padding(
//                 padding: EdgeInsets.symmetric(vertical: 4),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: row.asMap().entries.map((seatEntry) {
//                     int seatIndex = seatEntry.key;
//                     SeatData? seatData = seatEntry.value;
//                     int globalSeatIndex = rowIndex * row.length + seatIndex;
                    
//                     if (seatData == null) {
//                       return Expanded(
//                         child: SizedBox(height: widget.busType == BusType.sleeper ? 60 : 40),
//                       );
//                     }
                    
//                     return Expanded(
//                       child: _buildSeat(seatData, globalSeatIndex),
//                     );
//                   }).toList(),
//                 ),
//               );
//             }).toList(),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // Enhanced Bottom Sheet Widget
// class EnhancedBusInfoBottomSheet extends StatefulWidget {
//   final BusInfo busInfo;
//   final VoidCallback? onContinue;

//   const EnhancedBusInfoBottomSheet({
//     Key? key,
//     required this.busInfo,
//     this.onContinue,
//   }) : super(key: key);

//   @override
//   _EnhancedBusInfoBottomSheetState createState() => _EnhancedBusInfoBottomSheetState();
// }

// class _EnhancedBusInfoBottomSheetState extends State<EnhancedBusInfoBottomSheet> {
//   int selectedTabIndex = 0;
//   final List<String> tabs = ['Highlights', 'Bus route', 'Boarding', 'Dropping', 'Passengers'];

//   @override
//   Widget build(BuildContext context) {
//     return DraggableScrollableSheet(
//       initialChildSize: 0.3,
//       minChildSize: 0.3,
//       maxChildSize: 0.7,
//       builder: (context, scrollController) {
//         return Container(
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.1),
//                 blurRadius: 10,
//                 offset: Offset(0, -2),
//               ),
//             ],
//           ),
//           child: Column(
//             children: [
//               // Drag handle
//               Container(
//                 margin: EdgeInsets.symmetric(vertical: 8),
//                 width: 40,
//                 height: 4,
//                 decoration: BoxDecoration(
//                   color: Colors.grey[300],
//                   borderRadius: BorderRadius.circular(2),
//                 ),
//               ),
              
//               Expanded(
//                 child: SingleChildScrollView(
//                   controller: scrollController,
//                   padding: EdgeInsets.all(16),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       // Bus info header
//                       Row(
//                         children: [
//                           ClipRRect(
//                             borderRadius: BorderRadius.circular(8),
//                             child: Container(
//                               width: 60,
//                               height: 60,
//                               color: Colors.grey[300],
//                               child: Icon(Icons.directions_bus, size: 30),
//                             ),
//                           ),
//                           SizedBox(width: 12),
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   widget.busInfo.busType,
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 Text(
//                                   widget.busInfo.coSaving,
//                                   style: TextStyle(
//                                     color: Colors.grey[600],
//                                     fontSize: 12,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
                      
//                       SizedBox(height: 16),
                      
//                       // Operator info
//                       Row(
//                         children: [
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   widget.busInfo.operator,
//                                   style: TextStyle(
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                                 Text(
//                                   '${widget.busInfo.time} • ${widget.busInfo.date}',
//                                   style: TextStyle(
//                                     color: Colors.grey[600],
//                                     fontSize: 12,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Container(
//                             padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                             decoration: BoxDecoration(
//                               color: Colors.green,
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                             child: Row(
//                               mainAxisSize: MainAxisSize.min,
//                               children: [
//                                 Icon(Icons.star, color: Colors.white, size: 12),
//                                 SizedBox(width: 2),
//                                 Text(
//                                   widget.busInfo.rating.toString(),
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 12,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
                      
//                       SizedBox(height: 24),
                      
//                       // Tab navigation
//                       Container(
//                         height: 40,
//                         child: ListView.builder(
//                           scrollDirection: Axis.horizontal,
//                           itemCount: tabs.length,
//                           itemBuilder: (context, index) {
//                             bool isSelected = selectedTabIndex == index;
//                             return GestureDetector(
//                               onTap: () {
//                                 setState(() {
//                                   selectedTabIndex = index;
//                                 });
//                               },
//                               child: Container(
//                                 margin: EdgeInsets.only(right: 16),
//                                 padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                                 decoration: BoxDecoration(
//                                   color: isSelected ? Colors.red[50] : Colors.transparent,
//                                   borderRadius: BorderRadius.circular(20),
//                                   border: Border.all(
//                                     color: isSelected ? Colors.red : Colors.grey[300]!,
//                                   ),
//                                 ),
//                                 child: Text(
//                                   tabs[index],
//                                   style: TextStyle(
//                                     color: isSelected ? Colors.red : Colors.grey[600],
//                                     fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
//                                     fontSize: 14,
//                                   ),
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                       ),
                      
//                       SizedBox(height: 20),
                      
//                       // Tab content
//                       _buildTabContent(),
                      
//                       SizedBox(height: 100), // Space for continue button
//                     ],
//                   ),
//                 ),
//               ),
              
//               // Continue button
//               Container(
//                 padding: EdgeInsets.all(16),
//                 child: SizedBox(
//                   width: double.infinity,
//                   height: 50,
//                   child: ElevatedButton(
//                     onPressed: widget.onContinue,
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.red,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(25),
//                       ),
//                     ),
//                     child: Text(
//                       'Continue',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildTabContent() {
//     switch (selectedTabIndex) {
//       case 0: // Highlights
//         return _buildHighlightsTab();
//       case 1: // Bus route
//         return _buildBusRouteTab();
//       case 2: // Boarding
//         return _buildBoardingTab();
//       case 3: // Dropping
//         return _buildDroppingTab();
//       case 4: // Passengers
//         return _buildPassengersTab();
//       default:
//         return Container();
//     }
//   }

//   Widget _buildHighlightsTab() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         _buildHighlightItem(Icons.wifi, 'Free WiFi'),
//         _buildHighlightItem(Icons.ac_unit, 'AC'),
//         _buildHighlightItem(Icons.charging_station, 'Charging Point'),
//         _buildHighlightItem(Icons.water_drop, 'Water Bottle'),
//         _buildHighlightItem(Icons.local_movies, 'Entertainment'),
//       ],
//     );
//   }

//   Widget _buildBusRouteTab() {
//     return Column(
//       children: [
//         _buildRouteItem('Dewas', '07:25', true),
//         _buildRouteConnector(),
//         _buildRouteItem('Indore Junction', '08:15', false),
//         _buildRouteConnector(),
//         _buildRouteItem('Ujjain', '09:00', false),
//         _buildRouteConnector(),
//         _buildRouteItem('Bhopal', '10:05', true),
//       ],
//     );
//   }

//   Widget _buildBoardingTab() {
//     return Column(
//       children: [
//         _buildBoardingPoint('Dewas Bus Stand', '07:25', 'Main pickup point'),
//         _buildBoardingPoint('Dewas Railway Station', '07:30', 'Alternative pickup'),
//       ],
//     );
//   }

//   Widget _buildDroppingTab() {
//     return Column(
//       children: [
//         _buildDroppingPoint('Bhopal Railway Station', '10:00', 'Main drop point'),
//         _buildDroppingPoint('Bhopal Bus Stand', '10:05', 'Final destination'),
//       ],
//     );
//   }

//   Widget _buildPassengersTab() {
//     return Column(
//       children: [
//         _buildPassengerInfo('Total Seats', '40'),
//         _buildPassengerInfo('Available', '15'),
//         _buildPassengerInfo('Booked', '25'),
//         _buildPassengerInfo('Female Only', '8'),
//         _buildPassengerInfo('Male Only', '2'),
//       ],
//     );
//   }

//   Widget _buildHighlightItem(IconData icon, String text) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 8),
//       child: Row(
//         children: [
//           Icon(icon, color: Colors.green, size: 20),
//           SizedBox(width: 16),
//           Text(
//             text,
//             style: TextStyle(fontSize: 14, color: Colors.grey[700]),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildRouteItem(String location, String time, bool isEndPoint) {
//     return Row(
//       children: [
//         Container(
//           width: 12,
//           height: 12,
//           decoration: BoxDecoration(
//             color: isEndPoint ? Colors.red : Colors.grey,
//             shape: BoxShape.circle,
//           ),
//         ),
//         SizedBox(width: 16),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 location,
//                 style: TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//               Text(
//                 time,
//                 style: TextStyle(
//                   fontSize: 12,
//                   color: Colors.grey[600],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildRouteConnector() {
//     return Container(
//       margin: EdgeInsets.only(left: 6, top: 8, bottom: 8),
//       width: 2,
//       height: 30,
//       color: Colors.grey[300],
//     );
//   }

//   Widget _buildBoardingPoint(String location, String time, String description) {
//     return Container(
//       margin: EdgeInsets.only(bottom: 16),
//       padding: EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.grey[300]!),
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             location,
//             style: TextStyle(
//               fontSize: 14,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//           Text(
//             time,
//             style: TextStyle(
//               fontSize: 12,
//               color: Colors.red,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           Text(
//             description,
//             style: TextStyle(
//               fontSize: 12,
//               color: Colors.grey[600],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildDroppingPoint(String location, String time, String description) {
//     return Container(
//       margin: EdgeInsets.only(bottom: 16),
//       padding: EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.grey[300]!),
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             location,
//             style: TextStyle(
//               fontSize: 14,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//           Text(
//             time,
//             style: TextStyle(
//               fontSize: 12,
//               color: Colors.red,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           Text(
//             description,
//             style: TextStyle(
//               fontSize: 12,
//               color: Colors.grey[600],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildPassengerInfo(String label, String value) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 8),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             label,
//             style: TextStyle(fontSize: 14, color: Colors.grey[700]),
//           ),
//           Text(
//             value,
//             style: TextStyle(
//               fontSize: 14,
//               fontWeight: FontWeight.bold,
//               color: Colors.black87,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // Main Screen Implementation
// class SeatSelectionScreen extends StatefulWidget {
//   @override
//   _SeatSelectionScreenState createState() => _SeatSelectionScreenState();
// }

// class _SeatSelectionScreenState extends State<SeatSelectionScreen> {
//   Set<int> selectedSeats = {};
//   BusType currentBusType = BusType.seater;

//   // Sample data for seater bus
//   List<List<SeatData?>> getSeaterLayout() {
//     return [
//       [null, null, null, null, SeatData(id: 0, status: SeatStatus.driver, price: 0)],
//       [
//         SeatData(id: 1, status: SeatStatus.available, price: 400),
//         SeatData(id: 2, status: SeatStatus.available, price: 400),
//         null,
//         SeatData(id: 3, status: SeatStatus.available, price: 400),
//         SeatData(id: 4, status: SeatStatus.available, price: 400)
//       ],
//       [
//         SeatData(id: 5, status: SeatStatus.available, price: 400),
//         SeatData(id: 6, status: SeatStatus.booked, price: 400),
//         null,
//         SeatData(id: 7, status: SeatStatus.femaleOnly, price: 400),
//         SeatData(id: 8, status: SeatStatus.available, price: 400)
//       ],
//       [
//         SeatData(id: 9, status: SeatStatus.maleOnly, price: 400),
//         SeatData(id: 10, status: SeatStatus.available, price: 400),
//         null,
//         SeatData(id: 11, status: SeatStatus.available, price: 400),
//         SeatData(id: 12, status: SeatStatus.booked, price: 400)
//       ],
//     ];
//   }

//   // Sample data for sleeper bus
//   List<List<SeatData?>> getSleeperLayout() {
//     return [
//       [null, null, SeatData(id: 0, status: SeatStatus.driver, price: 0)],
//       [
//         SeatData(id: 1, status: SeatStatus.available, price: 600, berthType: BerthType.upper),
//         null,
//         SeatData(id: 2, status: SeatStatus.available, price: 600, berthType: BerthType.upper)
//       ],
//       [
//         SeatData(id: 3, status: SeatStatus.booked, price: 600, berthType: BerthType.upper),
//         null,
//         SeatData(id: 4, status: SeatStatus.femaleOnly, price: 600, berthType: BerthType.upper)
//       ],
//       [
//         SeatData(id: 5, status: SeatStatus.available, price: 600, berthType: BerthType.upper),
//         null,
//         SeatData(id: 6, status: SeatStatus.maleOnly, price: 600, berthType: BerthType.upper)
//       ],
//     ];
//   }

//   BusInfo getBusInfo() {
//     return BusInfo(
//       name: 'Express Bus',
//       operator: 'NueGo (Partnered by Verma Travels)',
//       route: 'Dewas → Bhopal',
//       time: '07:25 - 10:05',
//       date: 'Wed, 23 Jul',
//       rating: 4.7,
//       busType: currentBusType == BusType.seater ? 'Electric Bus' : 'Sleeper Bus',
//       coSaving: 'Saving 18 kg CO2E',
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[100],
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 1,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Select Seats',
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             Text(
//               'Dewas → Bhopal',
//               style: TextStyle(
//                 color: Colors.grey[600],
//                 fontSize: 14,
//                 fontWeight: FontWeight.normal,
//               ),
//             ),
//           ],
//         ),
//         actions: [
//           // Bus type toggle
//           Container(
//             margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
//             child: ToggleButtons(
//               children: [
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 12),
//                   child: Text('Seater', style: TextStyle(fontSize: 12)),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 12),
//                   child: Text('Sleeper', style: TextStyle(fontSize: 12)),
//                 ),
//               ],
//               isSelected: [
//                 currentBusType == BusType.seater,
//                 currentBusType == BusType.sleeper,
//               ],
//               onPressed: (index) {
//                 setState(() {
//                   currentBusType = index == 0 ? BusType.seater : BusType.sleeper;
//                   selectedSeats.clear();
//                 });
//               },
//               borderRadius: BorderRadius.circular(8),
//               selectedColor: Colors.white,
//               fillColor: Colors.orange,
//               color: Colors.grey[600],
//               constraints: BoxConstraints(minHeight: 32, minWidth: 60),
//             ),
//           ),
//           Container(
//             margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//             padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//             decoration: BoxDecoration(
//               color: Colors.orange[100],
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Text(
//                   'Exclusive',
//                   style: TextStyle(
//                     color: Colors.orange[800],
//                     fontSize: 10,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Text(
//                   '5% OFF',
//                   style: TextStyle(
//                     color: Colors.orange[800],
//                     fontSize: 10,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: SingleChildScrollView(
//               padding: EdgeInsets.symmetric(horizontal: 16),
//               child: Column(
//                 children: [
//                   SizedBox(height: 16),
                  
//                   // Custom Seat Selection Widget
//                   CustomSeatSelectionWidget(
//                     busType: currentBusType,
//                     seatLayout: currentBusType == BusType.seater 
//                       ? getSeaterLayout() 
//                       : getSleeperLayout(),
//                     busInfo: getBusInfo(),
//                     onSeatSelectionChanged: (seats) {
//                       setState(() {
//                         selectedSeats = seats;
//                       });
//                     },
//                     initialSelectedSeats: selectedSeats,
//                   ),
                  
//                   SizedBox(height: 20),
                  
//                   // Seat type legend
//                   Container(
//                     padding: EdgeInsets.all(16),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Know your seat types',
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black87,
//                           ),
//                         ),
//                         SizedBox(height: 16),
//                         _buildLegendItem('Available', Colors.green, 
//                           currentBusType == BusType.sleeper ? Icons.bed : Icons.event_seat),
//                         _buildLegendItem('Already booked', Colors.grey, 
//                           currentBusType == BusType.sleeper ? Icons.bed : Icons.event_seat),
//                         _buildLegendItem('Available only for female passenger', Colors.pink, Icons.female),
//                         _buildLegendItem('Booked by female passenger', Colors.pink.withOpacity(0.3), Icons.female),
//                         _buildLegendItem('Available for male passenger', Colors.blue, Icons.male),
//                         _buildLegendItem('Booked by male passenger', Colors.blue.withOpacity(0.3), Icons.male),
//                         if (currentBusType == BusType.sleeper) ...[
//                           SizedBox(height: 8),
//                           Divider(),
//                           SizedBox(height: 8),
//                           Row(
//                             children: [
//                               Icon(Icons.keyboard_arrow_up, color: Colors.blue[800], size: 16),
//                               SizedBox(width: 8),
//                               Text('Upper Berth', style: TextStyle(fontSize: 14, color: Colors.grey[700])),
//                             ],
//                           ),
//                           SizedBox(height: 4),
//                           Row(
//                             children: [
//                               Icon(Icons.keyboard_arrow_down, color: Colors.green[800], size: 16),
//                               SizedBox(width: 8),
//                               Text('Lower Berth (10% discount)', style: TextStyle(fontSize: 14, color: Colors.grey[700])),
//                             ],
//                           ),
//                         ],
//                       ],
//                     ),
//                   ),
                  
//                   SizedBox(height: 100), // Space for bottom sheet
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//       bottomSheet: EnhancedBusInfoBottomSheet(
//         busInfo: getBusInfo(),
//         onContinue: () {
//           if (selectedSeats.isNotEmpty) {
//             // Handle continue action
//             showDialog(
//               context: context,
//               builder: (context) => AlertDialog(
//                 title: Text('Seats Selected'),
//                 content: Text('You have selected ${selectedSeats.length} seat(s)'),
//                 actions: [
//                   TextButton(
//                     onPressed: () => Navigator.pop(context),
//                     child: Text('OK'),
//                   ),
//                 ],
//               ),
//             );
//           } else {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(
//                 content: Text('Please select at least one seat'),
//                 backgroundColor: Colors.orange,
//               ),
//             );
//           }
//         },
//       ),
//     );
//   }

//   Widget _buildLegendItem(String text, Color color, IconData icon) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 8),
//       child: Row(
//         children: [
//           Expanded(
//             flex: 3,
//             child: Text(
//               text,
//               style: TextStyle(
//                 fontSize: 14,
//                 color: Colors.grey[700],
//               ),
//             ),
//           ),
//           Container(
//             width: 32,
//             height: 32,
//             decoration: BoxDecoration(
//               color: color,
//               borderRadius: BorderRadius.circular(6),
//               border: Border.all(
//                 color: color.withOpacity(0.3),
//                 width: 1,
//               ),
//             ),
//             child: Icon(
//               icon,
//               color: Colors.white,
//               size: 16,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


// // Enhanced Bottom Sheet Widget
// class EnhancedBusInfoBottomSheet extends StatefulWidget {
//   final BusInfo busInfo;
//   final VoidCallback? onContinue;

//   const EnhancedBusInfoBottomSheet({
//     Key? key,
//     required this.busInfo,
//     this.onContinue,
//   }) : super(key: key);

//   @override
//   _EnhancedBusInfoBottomSheetState createState() => _EnhancedBusInfoBottomSheetState();
// }

// class _EnhancedBusInfoBottomSheetState extends State<EnhancedBusInfoBottomSheet> {
//   int selectedTabIndex = 0;
//   final List<String> tabs = ['Highlights', 'Bus route', 'Boarding', 'Dropping', 'Passengers'];

//   @override
//   Widget build(BuildContext context) {
//     return DraggableScrollableSheet(
//       initialChildSize: 0.3,
//       minChildSize: 0.3,
//       maxChildSize: 0.7,
//       builder: (context, scrollController) {
//         return Container(
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.1),
//                 blurRadius: 10,
//                 offset: Offset(0, -2),
//               ),
//             ],
//           ),
//           child: Column(
//             children: [
//               // Drag handle
//               Container(
//                 margin: EdgeInsets.symmetric(vertical: 8),
//                 width: 40,
//                 height: 4,
//                 decoration: BoxDecoration(
//                   color: Colors.grey[300],
//                   borderRadius: BorderRadius.circular(2),
//                 ),
//               ),
              
//               Expanded(
//                 child: SingleChildScrollView(
//                   controller: scrollController,
//                   padding: EdgeInsets.all(16),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       // Bus info header
//                       Row(
//                         children: [
//                           ClipRRect(
//                             borderRadius: BorderRadius.circular(8),
//                             child: Container(
//                               width: 60,
//                               height: 60,
//                               color: Colors.grey[300],
//                               child: Icon(Icons.directions_bus, size: 30),
//                             ),
//                           ),
//                           SizedBox(width: 12),
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   widget.busInfo.busType,
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 Text(
//                                   widget.busInfo.coSaving,
//                                   style: TextStyle(
//                                     color: Colors.grey[600],
//                                     fontSize: 12,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
                      
//                       SizedBox(height: 16),
                      
//                       // Operator info
//                       Row(
//                         children: [
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   widget.busInfo.operator,
//                                   style: TextStyle(
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                                 Text(
//                                   '${widget.busInfo.time} • ${widget.busInfo.date}',
//                                   style: TextStyle(
//                                     color: Colors.grey[600],
//                                     fontSize: 12,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Container(
//                             padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                             decoration: BoxDecoration(
//                               color: Colors.green,
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                             child: Row(
//                               mainAxisSize: MainAxisSize.min,
//                               children: [
//                                 Icon(Icons.star, color: Colors.white, size: 12),
//                                 SizedBox(width: 2),
//                                 Text(
//                                   widget.busInfo.rating.toString(),
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 12,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
                      
//                       SizedBox(height: 24),
                      
//                       // Tab navigation
//                       Container(
//                         height: 40,
//                         child: ListView.builder(
//                           scrollDirection: Axis.horizontal,
//                           itemCount: tabs.length,
//                           itemBuilder: (context, index) {
//                             bool isSelected = selectedTabIndex == index;
//                             return GestureDetector(
//                               onTap: () {
//                                 setState(() {
//                                   selectedTabIndex = index;
//                                 });
//                               },
//                               child: Container(
//                                 margin: EdgeInsets.only(right: 16),
//                                 padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                                 decoration: BoxDecoration(
//                                   color: isSelected ? Colors.red[50] : Colors.transparent,
//                                   borderRadius: BorderRadius.circular(20),
//                                   border: Border.all(
//                                     color: isSelected ? Colors.red : Colors.grey[300]!,
//                                   ),
//                                 ),
//                                 child: Text(
//                                   tabs[index],
//                                   style: TextStyle(
//                                     color: isSelected ? Colors.red : Colors.grey[600],
//                                     fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
//                                     fontSize: 14,
//                                   ),
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                       ),
                      
//                       SizedBox(height: 20),
                      
//                       // Tab content
//                       _buildTabContent(),
                      
//                       SizedBox(height: 100), // Space for continue button
//                     ],
//                   ),
//                 ),
//               ),
              
//               // Continue button
//               Container(
//                 padding: EdgeInsets.all(16),
//                 child: SizedBox(
//                   width: double.infinity,
//                   height: 50,
//                   child: ElevatedButton(
//                     onPressed: widget.onContinue,
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.red,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(25),
//                       ),
//                     ),
//                     child: Text(
//                       'Continue',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildTabContent() {
//     switch (selectedTabIndex) {
//       case 0: // Highlights
//         return _buildHighlightsTab();
//       case 1: // Bus route
//         return _buildBusRouteTab();
//       case 2: // Boarding
//         return _buildBoardingTab();
//       case 3: // Dropping
//         return _buildDroppingTab();
//       case 4: // Passengers
//         return _buildPassengersTab();
//       default:
//         return Container();
//     }
//   }

//   Widget _buildHighlightsTab() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         _buildHighlightItem(Icons.wifi, 'Free WiFi'),
//         _buildHighlightItem(Icons.ac_unit, 'AC'),
//         _buildHighlightItem(Icons.charging_station, 'Charging Point'),
//         _buildHighlightItem(Icons.water_drop, 'Water Bottle'),
//         _buildHighlightItem(Icons.local_movies, 'Entertainment'),
//       ],
//     );
//   }

//   Widget _buildBusRouteTab() {
//     return Column(
//       children: [
//         _buildRouteItem('Dewas', '07:25', true),
//         _buildRouteConnector(),
//         _buildRouteItem('Indore Junction', '08:15', false),
//         _buildRouteConnector(),
//         _buildRouteItem('Ujjain', '09:00', false),
//         _buildRouteConnector(),
//         _buildRouteItem('Bhopal', '10:05', true),
//       ],
//     );
//   }

//   Widget _buildBoardingTab() {
//     return Column(
//       children: [
//         _buildBoardingPoint('Dewas Bus Stand', '07:25', 'Main pickup point'),
//         _buildBoardingPoint('Dewas Railway Station', '07:30', 'Alternative pickup'),
//       ],
//     );
//   }

//   Widget _buildDroppingTab() {
//     return Column(
//       children: [
//         _buildDroppingPoint('Bhopal Railway Station', '10:00', 'Main drop point'),
//         _buildDroppingPoint('Bhopal Bus Stand', '10:05', 'Final destination'),
//       ],
//     );
//   }

//   Widget _buildPassengersTab() {
//     return Column(
//       children: [
//         _buildPassengerInfo('Total Seats', '40'),
//         _buildPassengerInfo('Available', '15'),
//         _buildPassengerInfo('Booked', '25'),
//         _buildPassengerInfo('Female Only', '8'),
//         _buildPassengerInfo('Male Only', '2'),
//       ],
//     );
//   }

//   Widget _buildHighlightItem(IconData icon, String text) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 8),
//       child: Row(
//         children: [
//           Icon(icon, color: Colors.green, size: 20),
//           SizedBox(width: 16),
//           Text(
//             text,
//             style: TextStyle(fontSize: 14, color: Colors.grey[700]),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildRouteItem(String location, String time, bool isEndPoint) {
//     return Row(
//       children: [
//         Container(
//           width: 12,
//           height: 12,
//           decoration: BoxDecoration(
//             color: isEndPoint ? Colors.red : Colors.grey,
//             shape: BoxShape.circle,
//           ),
//         ),
//         SizedBox(width: 16),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 location,
//                 style: TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//               Text(
//                 time,
//                 style: TextStyle(
//                   fontSize: 12,
//                   color: Colors.grey[600],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildRouteConnector() {
//     return Container(
//       margin: EdgeInsets.only(left: 6, top: 8, bottom: 8),
//       width: 2,
//       height: 30,
//       color: Colors.grey[300],
//     );
//   }

//   Widget _buildBoardingPoint(String location, String time, String description) {
//     return Container(
//       margin: EdgeInsets.only(bottom: 16),
//       padding: EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.grey[300]!),
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             location,
//             style: TextStyle(
//               fontSize: 14,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//           Text(
//             time,
//             style: TextStyle(
//               fontSize: 12,
//               color: Colors.red,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           Text(
//             description,
//             style: TextStyle(
//               fontSize: 12,
//               color: Colors.grey[600],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildDroppingPoint(String location, String time, String description) {
//     return Container(
//       margin: EdgeInsets.only(bottom: 16),
//       padding: EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.grey[300]!),
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             location,
//             style: TextStyle(
//               fontSize: 14,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//           Text(
//             time,
//             style: TextStyle(
//               fontSize: 12,
//               color: Colors.red,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           Text(
//             description,
//             style: TextStyle(
//               fontSize: 12,
//               color: Colors.grey[600],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildPassengerInfo(String label, String value) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 8),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             label,
//             style: TextStyle(fontSize: 14, color: Colors.grey[700]),
//           ),
//           Text(
//             value,
//             style: TextStyle(
//               fontSize: 14,
//               fontWeight: FontWeight.bold,
//               color: Colors.black87,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
