import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget{
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPage = 1;
  final PageController pageController = new PageController( initialPage: 1);

  @override
  Widget build (BuildContext context ) {
    return  Scaffold(     // lienzo blanco grande y tan grande cómo la pantalla
        appBar:  AppBar(     // título de arriba, no es necesario
          title: Text("Material App Bar $currentPage"),
          elevation: 2,  // la sombra del título
        ),

//        body: CustomScreen ( color: Colors.blue ),
/*
         body: currentPage == 0 
               ? CustomScreen( color: Colors.lime)
               : CustomScreen( color: Colors.pink)
               ,

*/

  
        //cambiar la pantalla -- solucion buena
        body: PageView(
          controller:pageController,
  //        physics:NeverScrollableScrollPhysics()   ,   //no dejo tocar el scroll
          children: [
            CustomScreen(color: Colors.lightGreen),
             CustomScreen(color: Colors.blue),
             CustomScreen(color: Colors.red) 
          ],
          ),



        /*
        body: Center (
          child: Container(
            child: Text('Hola mundo') ,
          ),          
        ),

        */
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentPage,
          onTap: (index) { 

              currentPage = index;  
              

              print( 'index : $index');
              pageController.animateToPage( 
                  currentPage, 
                  duration: Duration(seconds: 1 ), 
                  curve: Curves.bounceOut );

              setState(() {   });    // hay un cambio en el state, redibujate
           },    // cuando cambie de tab , se ejecuta esta función
          backgroundColor: Colors.green,
          selectedItemColor: Colors.white ,
          unselectedItemColor: Colors.white.withOpacity(0.5),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.unfold_more_outlined),
              label: 'User $currentPage',
              ),
            BottomNavigationBarItem(
              icon: Icon(Icons.umbrella)           ,
              label : 'User4'
              )              
          ], 
          ),
      );

  }
}




class CustomScreen extends StatelessWidget {

//final Color? color;  // es un parametro opcional
final Color color;  // es un parametro opciona

  const CustomScreen( { required this.color }) ;


  @override
  Widget build (BuildContext context){  
    return Container(
      color:color,
      child: Center(
        child: Text('CustomScreen3'),
        ),
    );
  }
}
/*

class  $1 extends StatelessWidget {
  const  $2 ({Key? key}) : super(key:  key);

  @override
  Widget build (BuildContext context){  
    return Container(
      child: null,
      );
  }
}


*/

