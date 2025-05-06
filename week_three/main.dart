import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    
    return MaterialApp(
    
       debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}


class HomePage extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {

    
    return  Scaffold(
        appBar: AppBar(
              centerTitle: true ,
          title: Text("\nWelcome!",style: TextStyle(fontFamily: "Nunito",fontSize: 35,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 255, 255, 255)),),
          leading: IconButton(onPressed: (){}, icon: Icon(Icons.refresh,color: Colors.white,)),
          backgroundColor: Color(0xFF05325C),
          toolbarHeight: 90,


        ),
       
       floatingActionButton: FloatingActionButton( 
      
        
        onPressed: (){
        ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text("Sign Up, Please", style: TextStyle(fontFamily: "Nunito", fontWeight: FontWeight.bold, fontSize: 16),),
        action: SnackBarAction(label: "OK", textColor: Color(0xFFDE2558), onPressed: (){}),
        duration: Duration(seconds: 3),
        

        
        
        )
        
        
        
        );



       },
       
       child: Icon(Icons.notifications , color: Colors.white, ),
       backgroundColor: Color(0xFF05325C),
       
       
       ),



        body: Stack(children: [


             Image.asset("images/w3.png",width: double.infinity,),


           

 Column(
          
          
          children: [
          

           Center(child: Text("\nWe are glad to have you here, please sign up to continue." , style: TextStyle(fontFamily: "Nunito", fontSize: 16,color: Color.fromARGB(255, 195, 197, 200)), textAlign: TextAlign.center,)),

           Center(
             child: Container(
              
              margin: EdgeInsets.only(top: 110),
              
              child: ElevatedButton(onPressed: (){Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FormPage()),
                    );},
                       
              child: Text("Sign Up!",style: TextStyle(color: Colors.white, fontSize: 18),),
              style: ElevatedButton.styleFrom(
             
                backgroundColor:Color(0xFFDE2558),
                fixedSize: Size(200, 50)
             
              )  ,
              
              
              
              )
             
             
             ,),
           )



        ],

       

        ),

        ],)
        
       
      );
  }

}
  


class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}


class _FormPageState extends State<FormPage>  {


   GlobalKey<FormState> formstate = new GlobalKey<FormState>();


   static TextEditingController firstname = new TextEditingController();
   static TextEditingController lastname = new TextEditingController();
   static String? gender;
   static String? Female;
   static String? Male ;
   static bool? agree = false;
   bool theme = false;
   
  @override
  Widget build(BuildContext context) {


    send(){
      var formdata = formstate.currentState;
      if(formdata != null && formdata.validate()){
        return true;
      }else return false;
    }
    

    return Scaffold(
      backgroundColor:  const Color(0xFFFBFBFB),
      
      appBar: AppBar(
         backgroundColor: Colors.white,
         centerTitle: true,
         title: Text("\n\nLet's Start!" , style: TextStyle( color: Color(0xFF05325C), fontSize: 35,fontFamily: "Nunito",fontWeight: FontWeight.bold) ),
          leading: IconButton(onPressed: (){Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );},
          
          
           icon: Icon(Icons.arrow_back,color: Color(0xFFDE2558),)),
          toolbarHeight: 120,
         actions: [
          Container(
            margin: EdgeInsets.only(right:  10,top: 10),
            child: Column( children: [
            
              Text("Switch Theme", style: TextStyle(fontFamily: "Nunito",fontWeight: FontWeight.bold,color:Color(0xFF05325C),fontSize: 14 ),),
              Switch(
                
                inactiveThumbImage: AssetImage("images/sun2.png"),
                inactiveThumbColor: Colors.white,
                activeThumbImage: AssetImage("images/moon.png"),
                activeTrackColor: Color(0xFF05325C),
                
                
                value: theme, onChanged: (val){
                setState(() {
                  theme = val;
                });
              })
            ],
            
            
            ),
          )
         ],

      ),
      
      
      body: Form(
        
        key: formstate,
        
        child: Column(children: [

        Center(
          child: Container(
            margin: EdgeInsets.only(top: 100,left: 5),
            alignment: Alignment.center,
            width: 330,
               
            child:
           TextFormField( 
        autovalidateMode: AutovalidateMode.onUserInteraction,

            validator: (text) {

              if(  text == null || text.length < 3 )
              {

                return "letters can't be less than 3";
              } else return null;
              
            },

            
            controller: firstname,
          
            decoration: InputDecoration(
              label: Text("First Name"),
              
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Color(0xFFDE2558),
                  width: 2,
   
                )

                
              ),

              focusedBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Color(0xFFDE2558),
                  width: 2,
   
                )
                
                )

            ),
            
            
            
           ),
              
           ),
        ),



         Center(
          child: Container(
            margin: EdgeInsets.only(top: 20 , left: 5),
            alignment: Alignment.center,
            width: 330,
               
            child:
           TextFormField( 
           autovalidateMode: AutovalidateMode.onUserInteraction,
             validator: (text) {

              if(  text == null || text.length < 3 )
              {

                return "letters can't be less than 3";
              } else return null;
              
            },

            
            controller: lastname,

          
            decoration: InputDecoration(
              label: Text("Last Name"),
              
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Color(0xFFDE2558),
                  width: 2,
   
                )

                
              ),

              focusedBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Color(0xFFDE2558),
                  width: 2,
   
                )
                
                )

          
            ),
            
            
           ),
              
           ),
        ),

         Column(children: [

            
            Container(
              
              margin:EdgeInsets.only(top: 30,left: 20,right: 5),
              
              child:

              
         
               RadioListTile(

                controlAffinity: ListTileControlAffinity.trailing,
                selected: gender == "Male" ? true : false,
                activeColor:Color(0xFFDE2558) ,
                title: Text("Male" , style: TextStyle(fontSize: 18,fontFamily: "Nunito",fontWeight: FontWeight.bold),),
                secondary: Icon(Icons.man, color: Color(0xFFDE2558), size: 35,) ,
                
                value: "Male", groupValue: gender, onChanged: (val){

          
                setState(() {
                   gender = val;
                });
              }),



            ),


            Container( 
              
              margin:EdgeInsets.only(top: 10,left: 20,right: 5),
              
              child: 
              
                  RadioListTile(

                controlAffinity: ListTileControlAffinity.trailing,
                selected: gender == "Female" ? true : false,
                activeColor:Color(0xFFDE2558) ,
                title: Text("Female" , style: TextStyle(fontSize: 18,fontFamily: "Nunito",fontWeight: FontWeight.bold),),
                secondary: Icon(Icons.woman, color: Color(0xFFDE2558), size: 35,) ,
                
                value: "Female", groupValue: gender, onChanged: (val){

          
                setState(() {
                   gender = val;
                });
              }),
            
            ),
        
        
            Container(
              margin: EdgeInsets.only(top: 30, left: 20),
              child: CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                title: Text("I agree to the Terms and Conditions and Privacy Policy.",
                style: TextStyle(color: Colors.black,fontSize: 14, ),),
                activeColor: Color(0xFFDE2558),
                
                value: agree, onChanged: (val){
                setState(() {
                  agree = val;
                });
              }),
            )



          ],),
         
        Container(
          
          margin: EdgeInsets.only(top: 50),
          
          child: ElevatedButton(
            
            style:  ElevatedButton.styleFrom(

              backgroundColor:Color(0xFFDE2558),
              fixedSize: Size(200, 50)

            )  ,
          

            onPressed: (){

              if(send()){
                Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) => dataPage()),);
              }
            }
            
            
            , child: Text("Sign Up",style: TextStyle(color: Colors.white, fontSize: 18),)


            ),
            
         
          
          ),
          
          

      


      ],)
)




    );

  }
  }



class dataPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
          toolbarHeight: 90,
         centerTitle: true,
         title: Text("\nYour Profile" , style: TextStyle( color: Color(0xFF05325C), fontSize: 35,fontFamily: "Nunito",fontWeight: FontWeight.bold) ),
         
        

      ),
      


        body:
           Column(children: [ 


            Container(

              margin: EdgeInsets.only(top: 70, left: 0),
              child: CircleAvatar(
                backgroundColor: Color(0xFFDE2558) ,
                child: Text(_FormPageState.firstname.text[0], style: TextStyle(color:  Color.fromARGB(255, 255, 255, 255), fontSize: 40 ),),
                radius: 50,
              ),
            ),
            
            
            Container(
              margin: EdgeInsets.only(top: 50,left: 20),
              child: Column(children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Text("User Name", style: TextStyle(fontSize: 20,fontFamily: "Nunito",fontWeight: FontWeight.bold, color: Color(0xFF05325C)),)),

                Row(
                  children: [
                     Container( margin: EdgeInsets.only(top: 25,),
                               
                               height: 40,
                               width: 250,
                               decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color(0xFFDE2558),
                                  width: 1.5
                                ),
                    
                                borderRadius: BorderRadius.circular(12)
                               ),
                              
                       child: Row(children: [ 
                        SizedBox(width: 5,),
                         Text(_FormPageState.firstname.text, style: TextStyle(fontSize: 20,fontFamily: "Nunito",),),
                                     SizedBox(width: 10),
                                     Text(_FormPageState.lastname.text, style: TextStyle(fontSize: 20,fontFamily: "Nunito",),),],),
                     ),
                  
                  ],
                ),
               
            
                        ],),
            ),
          
            
            Container(

              margin: EdgeInsets.only(top: 20, ),
              
              child:  
               Column(children: [
                
                  Container( margin: EdgeInsets.only(left: 20),
                    alignment: Alignment.centerLeft,
                    child: Text("Gender", style: TextStyle(fontSize: 20,fontFamily: "Nunito",fontWeight: FontWeight.bold,color: Color(0xFF05325C)))),
                  SizedBox(width: 15),
                  
                  
                  
                  Row(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(top: 20,left: 20), 
                        height: 40,
                        width: 250,
                        decoration: BoxDecoration(
                        border: Border.all(    
                           color: Color(0xFFDE2558),
                           width: 1.5
                                    ),
                        
                                    borderRadius: BorderRadius.circular(12)
                                   ),
                        
                        
                        child: Row(children: [
                        SizedBox(width: 5,),
                        Text(_FormPageState.gender ?? "", style: TextStyle(fontSize: 20,fontFamily: "Nunito",),),
                      
                        ],)
                        
                        
                        
                        
                        
                        ),
                    ],
                  ),
                
                
                ],),
              
              
            
            ),
          
          
          
          
          ],),
        );



    
  }
}

