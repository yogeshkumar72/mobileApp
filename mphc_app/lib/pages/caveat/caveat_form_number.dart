import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:mphc_app/pages/caveat/caveat.dart';




int lenYr = (DateTime.now().year)-2023;
class CaveatFormNumber extends StatefulWidget {
  const CaveatFormNumber({super.key});

  @override
  State<CaveatFormNumber> createState() => _CaveatFormNumberState();
}

class _CaveatFormNumberState extends State<CaveatFormNumber> {

//  String ? establishInput;
//  String ? yearInput;
//  String ? caveatInput;
  

 int currentYear = DateTime.now().year;
 List years = (List.generate(37+lenYr, (currentYear) => currentYear +1987).reversed.toList());


 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Caveat'),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body:Container(
         height: double.infinity,
        padding:const EdgeInsets.all(40),
        decoration:const BoxDecoration(
        color:Colors.white,
        image: DecorationImage(
        image:AssetImage('images/mphc02.jpg'),fit:BoxFit.contain,
        alignment: Alignment.bottomCenter,
        opacity: 1,        
         colorFilter: ColorFilter.mode(Color.fromARGB(255, 2, 21, 71), BlendMode.screen),
          ),
         ),
        child:Column(
          children:[
             Row(mainAxisAlignment: MainAxisAlignment.end,
                children:[
                  TextButton(onPressed: (){
                    Navigator.of(context).pop();
                    }, child:Container(
                      padding: const EdgeInsets.symmetric(vertical:10, horizontal: 20),
                      decoration: BoxDecoration(color:const Color.fromARGB(255, 62, 68, 107), borderRadius: BorderRadius.circular(25)),
                      child: const Row(
                      children: [
                        Icon(Icons.search,size: 16,weight: 800,color:Color.fromARGB(221, 255, 255, 255)),
                        Text('   By Case Number',style:TextStyle(color:Color.fromARGB(221, 255, 255, 255),fontSize: 16,fontWeight: FontWeight.bold)),
                      ],
                                        ),
                    )),
                ]
              ),

              const SizedBox(height: 20,),


              const Row(
                  children: [
                    Text('  Select Establishment',style: TextStyle(color: Color.fromARGB(255, 62, 68, 107), fontWeight: FontWeight.bold),textAlign: TextAlign.start,),
                  ],
                ),
                 Container(
                  padding:const EdgeInsets.symmetric(vertical:4,horizontal: 10),
                  decoration: BoxDecoration(border:Border.all(width: 1,color:Colors.black54),borderRadius: BorderRadius.circular(18)),
                   child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                      const Icon(Icons.location_city,color: Color.fromARGB(255, 62, 68, 107), ),
                       DropdownButton<String>(
                            underline: Container(),
                            value: establishInput,
                            hint: const Text('Select Bench'),
                            onChanged: (String? newValue) {
                              if (newValue != null) {
                                setState(() {
                                    establishInput = newValue;
                                  debugPrint(establishInput);
                                });
                              }
                            },
                            items: const [
                              DropdownMenuItem<String>(
                                value: '1',
                                child: Text('Principle Seat Jabalpur'),
                              ),
                              DropdownMenuItem<String>(
                                value: '2',
                                child: Text('Bench Indore'),
                              ),
                              DropdownMenuItem<String>(
                                value: '3',
                                child: Text('Bench Gwalior'),
                              ),
                            ],
                          ),
                     ],
                   ),
                 ),
                  const SizedBox(
                    height: 20,
                  ),

                   //---------------------------------------------------- Case Year----------------------------------------------------------------------
              const Row(
                  children: [
                    Text('  Case Year',style: TextStyle(color: Color.fromARGB(255, 62, 68, 107), fontWeight: FontWeight.bold),textAlign: TextAlign.start,),
                  ],
                ),
           
            Container(
            width: double.infinity,
            // height: 200,
            // margin: const EdgeInsets.fromLTRB(40, 0, 40, 40),
            // decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20))),

            child:DropdownSearch<String>(
            
              popupProps:const  PopupProps.menu(
                searchDelay: Duration.zero,
                
                showSearchBox: true,
                showSelectedItems: true,
                searchFieldProps: TextFieldProps(
                
                  keyboardType: TextInputType.number,
                  maxLength: 4,

                  // padding:EdgeInsets.all(40),
                
                 ),
              ),
              items: years.map((value)=>value.toString()).toList(),
              dropdownDecoratorProps: const DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(

                    border:OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                      // labelText: "Year",
                      hintText: "select Case Year",
                      prefixIcon: Icon(Icons.calendar_today,color:const Color.fromARGB(255, 62, 68, 107), ),
                  ),
              ),
              onChanged: (value){
                yearInput = value.toString();
              },
            )
          ),



            const SizedBox(
                    height: 20,
                  ),

            const Row(
                  children: [
                    Text('   Caveat Number',style: TextStyle(color: Color.fromARGB(255, 62, 68, 107), fontWeight: FontWeight.bold),textAlign: TextAlign.start,),
                  ],
                ),
                
              TextField(
                    keyboardType:TextInputType.number,
                    maxLength: 4,
                    decoration:InputDecoration( 
                      border:OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                      prefixIcon:const Icon(Icons.numbers_outlined,color: Color.fromARGB(255, 62, 68, 107), ),
                      hintText: 'Caveat Number ',
                    ),
                    
                    onChanged: (value){
                      setState(() {
                        caveatInput = value;
                      });
                    },
                  ),
                  
                  
                  
                  const SizedBox(
                    height: 20,
                  ),
                  
                  
                  TextButton(onPressed: (){

                    Navigator.push(context,MaterialPageRoute(builder: (context)=>const CaveatNumber()));
                  },
                   child: Container(
                    width:double.infinity,
                    padding:const EdgeInsets.symmetric(vertical:15),
                    decoration: BoxDecoration(
                      color:const Color.fromARGB(255, 62, 68, 107), 
                      borderRadius: BorderRadius.circular(15),
                  
                      ),
                      child: const Text('Show',textAlign: TextAlign.center,style:TextStyle(fontSize: 16,color:Colors.white)
                      ),
                    ),
                  ),
      


          ]
        )
      )
      
    );
  }
}