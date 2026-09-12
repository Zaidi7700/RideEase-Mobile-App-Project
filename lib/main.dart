import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const RideEaseApp());
}

class RideEaseApp extends StatelessWidget {
  const RideEaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "RideEase",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
        ),
        useMaterial3: true,
      ),
      home: const WelcomeScreen(),
    );
  }
}


// Welcome Screen

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            const Icon(
              Icons.local_taxi,
              size: 120,
              color: Colors.green,
            ),

            const SizedBox(height:30),

            const Text(
              "Welcome to RideEase",
              style: TextStyle(
                fontSize:30,
                fontWeight:FontWeight.bold,
              ),
            ),

            const SizedBox(height:15),

            const Text(
              "Smart ride-hailing across Australia",
              style: TextStyle(
                fontSize:18,
              ),
            ),

            const SizedBox(height:50),

            SizedBox(
              width:double.infinity,
              height:55,

              child: ElevatedButton(

                onPressed:(){

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:(context)=>
                      const LoginScreen(),
                    ),
                  );

                },

                child:const Text(
                  "Get Started",
                  style:TextStyle(
                    fontSize:18,
                  ),
                ),

              ),
            ),

          ],
        ),
      ),
    );
  }
}


// Login Screen

class LoginScreen extends StatelessWidget {

  const LoginScreen({super.key});


  @override
  Widget build(BuildContext context){

    return Scaffold(

      appBar:AppBar(
        title:const Text("Login"),
      ),


      body:Padding(
        padding:const EdgeInsets.all(20),

        child:Column(

          mainAxisAlignment:MainAxisAlignment.center,

          children:[

            const Icon(
              Icons.account_circle,
              size:100,
              color:Colors.green,
            ),


            const SizedBox(height:25),


            TextField(
              decoration:InputDecoration(
                labelText:"Email",
                prefixIcon:const Icon(Icons.email),
                border:OutlineInputBorder(
                  borderRadius:BorderRadius.circular(15),
                ),
              ),
            ),


            const SizedBox(height:15),


            TextField(
              obscureText:true,

              decoration:InputDecoration(
                labelText:"Password",
                prefixIcon:const Icon(Icons.lock),
                border:OutlineInputBorder(
                  borderRadius:BorderRadius.circular(15),
                ),
              ),
            ),


            const SizedBox(height:30),


            SizedBox(
              width:double.infinity,
              height:55,

              child:ElevatedButton(

                onPressed:(){

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:(context)=>
                      const RideEaseHome(),
                    ),
                  );

                },


                child:const Text(
                  "Login",
                  style:TextStyle(
                    fontSize:18,
                  ),
                ),

              ),
            ),

          ],
        ),
      ),
    );
  }
}


// Home Screen

class RideEaseHome extends StatelessWidget {

  const RideEaseHome({super.key});


  @override
  Widget build(BuildContext context){

    return Scaffold(

      appBar:AppBar(
        title:const Text(
          "RideEase Australia",
          style:TextStyle(
            fontWeight:FontWeight.bold,
          ),
        ),
        centerTitle:true,
      ),


      body:Padding(
        padding:const EdgeInsets.all(20),

        child:Column(

          crossAxisAlignment:CrossAxisAlignment.start,

          children:[

            const Text(
              "Where are you going?",
              style:TextStyle(
                fontSize:28,
                fontWeight:FontWeight.bold,
              ),
            ),


            const SizedBox(height:20),


            GestureDetector(
              onTap: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MapScreen(),
                  ),
                );

              },

              child: AbsorbPointer(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "Pickup location",
                    prefixIcon: const Icon(Icons.my_location),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
            ),


            const SizedBox(height:15),


            GestureDetector(
              onTap: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MapScreen(),
                  ),
                );

              },

              child: AbsorbPointer(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "Destination",
                    prefixIcon: const Icon(Icons.location_on),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
            ),


            const SizedBox(height:25),


            const Text(
              "Choose Ride",
              style:TextStyle(
                fontSize:22,
                fontWeight:FontWeight.bold,
              ),
            ),


            rideCard(
              Icons.directions_car,
              "Standard Ride",
              "\$25 AUD",
              "10 minutes away",
            ),


            rideCard(
              Icons.local_taxi,
              "Premium Ride",
              "\$45 AUD",
              "5 minutes away",
            ),


            const Spacer(),


            SizedBox(
              width:double.infinity,
              height:55,

              child:ElevatedButton(

                onPressed:(){

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:(context)=>
                      const DriverScreen(),
                    ),
                  );

                },


                child:const Text(
                  "Book Ride",
                  style:TextStyle(
                    fontSize:18,
                  ),
                ),

              ),
            ),

          ],
        ),
      ),
    );
  }


  Widget rideCard(
      IconData icon,
      String name,
      String price,
      String time,
      ){

    return Card(

      child:ListTile(

        leading:Icon(
          icon,
          color:Colors.green,
          size:35,
        ),

        title:Text(name),

        subtitle:Text(time),

        trailing:Text(
          price,
          style:const TextStyle(
            fontWeight:FontWeight.bold,
          ),
        ),

      ),
    );
  }
}
// Driver Tracking Screen

class DriverScreen extends StatelessWidget {

  const DriverScreen({super.key});


  @override
  Widget build(BuildContext context){

    return Scaffold(

      appBar: AppBar(
        title: const Text("Driver Tracking"),
      ),


      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(

          children: [

            const Icon(
              Icons.person_pin_circle,
              size:100,
              color:Colors.green,
            ),


            const SizedBox(height:20),


            const Text(
              "Your driver is coming",
              style:TextStyle(
                fontSize:24,
                fontWeight:FontWeight.bold,
              ),
            ),


            const SizedBox(height:20),


            const Card(
              child:ListTile(
                leading:Icon(Icons.person),
                title:Text("Ubaid"),
                subtitle:Text(
                  "Toyota Corolla • NSW-123",
                ),
              ),
            ),


            const Card(
              child:ListTile(
                leading:Icon(Icons.timer),
                title:Text("Arrival Time"),
                subtitle:Text(
                  "5 minutes",
                ),
              ),
            ),


            const Spacer(),


            SizedBox(
              width:double.infinity,
              height:55,

              child:ElevatedButton(

                onPressed:(){

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:(context)=>
                      const PaymentScreen(),
                    ),
                  );

                },


                child:const Text(
                  "Continue to Payment",
                  style:TextStyle(
                    fontSize:18,
                  ),
                ),

              ),
            ),

          ],
        ),
      ),
    );
  }
}



// Payment Screen

class PaymentScreen extends StatelessWidget {

  const PaymentScreen({super.key});


  @override
  Widget build(BuildContext context){

    return Scaffold(

      appBar:AppBar(
        title:const Text("Payment"),
        centerTitle:true,
      ),


      body:Padding(
        padding:const EdgeInsets.all(20),

        child:Column(

          children:[

            const Icon(
              Icons.payment,
              size:100,
              color:Colors.green,
            ),


            const SizedBox(height:20),


            const Text(
              "Choose Payment Method",
              style:TextStyle(
                fontSize:24,
                fontWeight:FontWeight.bold,
              ),
            ),


            const SizedBox(height:20),


            const Card(
              child:ListTile(
                leading:Icon(Icons.credit_card),
                title:Text("Card Payment"),
                subtitle:Text("Visa / Mastercard"),
              ),
            ),


            const Card(
              child:ListTile(
                leading:Icon(Icons.money),
                title:Text("Cash"),
                subtitle:Text("Pay after ride"),
              ),
            ),


            const SizedBox(height:20),


            const Text(
              "Total Fare: \$25 AUD",
              style:TextStyle(
                fontSize:22,
                fontWeight:FontWeight.bold,
              ),
            ),


            const Spacer(),


            SizedBox(
              width:double.infinity,
              height:55,

              child:ElevatedButton(

                onPressed:(){

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:(context)=>
                      const TripHistoryScreen(),
                    ),
                  );

                },


                child:const Text(
                  "Confirm Ride",
                  style:TextStyle(
                    fontSize:18,
                  ),
                ),

              ),
            ),

          ],
        ),
      ),
    );
  }
}



// Trip History Screen

class TripHistoryScreen extends StatelessWidget {

  const TripHistoryScreen({super.key});


  @override
  Widget build(BuildContext context){

    return Scaffold(

      appBar:AppBar(
        title:const Text("Trip History"),
      ),


      body:ListView(

        padding:const EdgeInsets.all(20),

        children:[


          const Card(
            child:ListTile(
              leading:Icon(
                Icons.flight,
                color:Colors.green,
              ),
              title:Text("Sydney Airport to CBD"),
              subtitle:Text(
                "Toyota Corolla • Yesterday",
              ),
              trailing:Text("\$35"),
            ),
          ),



          const Card(
            child:ListTile(
              leading:Icon(
                Icons.directions_car,
                color:Colors.green,
              ),
              title:Text("Sydney to Parramatta"),
              subtitle:Text(
                "Premium Ride • Last week",
              ),
              trailing:Text("\$45"),
            ),
          ),


          const Card(
            child:ListTile(
              leading:Icon(
                Icons.local_taxi,
                color:Colors.green,
              ),
              title:Text("City Ride"),
              subtitle:Text(
                "Standard Ride • 2 weeks ago",
              ),
              trailing:Text("\$25"),
            ),
          ),


          const SizedBox(height:20),


          ElevatedButton(

            onPressed:(){

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:(context)=>
                  const ProfileScreen(),
                ),
              );

            },

            child:const Text(
              "Open Profile",
            ),

          ),

        ],
      ),
    );
  }
}



// Profile Screen

class ProfileScreen extends StatelessWidget {

  const ProfileScreen({super.key});


  @override
  Widget build(BuildContext context){

    return Scaffold(

      appBar:AppBar(
        title:const Text("Profile"),
      ),


      body:Padding(
        padding:const EdgeInsets.all(20),

        child:Column(

          children:[

            const CircleAvatar(
              radius:50,
              child:Icon(
                Icons.person,
                size:60,
              ),
            ),


            const SizedBox(height:20),


            const Text(
              "Ubaid",
              style:TextStyle(
                fontSize:26,
                fontWeight:FontWeight.bold,
              ),
            ),


            const SizedBox(height:10),


            const Text(
              "ubaid@email.com",
              style:TextStyle(
                fontSize:16,
              ),
            ),


            const Card(
              child:ListTile(
                leading:Icon(Icons.phone),
                title:Text("Phone"),
                subtitle:Text("+61 400 123 456"),
              ),
            ),


            const Card(
              child:ListTile(
                leading:Icon(Icons.location_on),
                title:Text("Location"),
                subtitle:Text(
                  "Sydney, NSW, Australia",
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}


class _MapScreenState extends State<MapScreen> {

  GoogleMapController? mapController;

  final TextEditingController searchController =
  TextEditingController();


  static const LatLng sydney =
  LatLng(-33.8688, 151.2093);


  LatLng selectedLocation = sydney;


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Select Location"),
      ),


      body: Stack(

        children: [

          GoogleMap(

            initialCameraPosition: const CameraPosition(
              target: sydney,
              zoom: 14,
            ),


            onMapCreated: (controller) {
              mapController = controller;
            },


            onTap: (location) {

              setState(() {
                selectedLocation = location;
              });

            },


            markers: {

              Marker(
                markerId: const MarkerId("selected"),
                position: selectedLocation,
                infoWindow: const InfoWindow(
                  title: "Selected Location",
                ),
              ),

            },

          ),



          // Search box

          Positioned(

            top: 20,
            left: 20,
            right: 20,

            child: Card(

              child: TextField(

                controller: searchController,

                decoration: InputDecoration(

                  hintText: "Search pickup or destination",

                  prefixIcon: const Icon(
                    Icons.search,
                  ),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),

                  filled: true,

                  fillColor: Colors.white,

                ),

              ),

            ),

          ),



          // Confirm button

          Positioned(

            bottom: 30,
            left: 20,
            right: 20,

            child: SizedBox(

              height: 55,

              child: ElevatedButton(

                onPressed: () {

                  Navigator.pop(
                    context,
                    selectedLocation,
                  );

                },


                child: const Text(
                  "Confirm Location",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),

              ),

            ),

          ),

        ],

      ),

    );

  }

}