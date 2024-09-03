import 'package:flutter/material.dart';
import 'cause_list_advocate.dart';
import 'package:intl/intl.dart';




class CauseListAdvForm extends StatefulWidget {
  const CauseListAdvForm({super.key});

  @override
  State<CauseListAdvForm> createState() => _CauseListAdvFormState();
}

class _CauseListAdvFormState extends State<CauseListAdvForm> {



     String ? formattedDate ;
     DateTime ? dateController;
   


Future <void> _selectDate() async{
  DateTime ? picked = await showDatePicker(
      useRootNavigator: true,
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1976),
      lastDate: DateTime(2100), 
  );
  if(picked !=null){
    setState(() {
      
     formattedDate = DateFormat('dd-MM-yyyy').format(picked);
      // dateController?.text = formattedDate.toString();
     
      // pickedDate = picked.toString();
      pickedDate = formattedDate.toString();
    });
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cause List - Advocate'),
      ),
      body:SingleChildScrollView(
        child: Column(
          children:[
            
         // ---------------------------------------Establishment----------------------------------------------
               Container(margin: const EdgeInsets.fromLTRB(20, 10,0, 0),child: const Text('Establishment',style:TextStyle(fontWeight: FontWeight.bold))),
               Container(
                width: 210,
                margin: const EdgeInsets.fromLTRB(40, 10, 40, 20),
                child: DropdownButton<String>(
                  value: establishInput,
                  hint: const Text('Select Establishment'),
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
                      value: '01',
                      child: Text('Principle Seat Jabalpur'),
                    ),
                    DropdownMenuItem<String>(
                      value: '02',
                      child: Text('Bench Indore'),
                    ),
                    DropdownMenuItem<String>(
                      value: '03',
                      child: Text('Bench Gwalior'),
                    ),
                  ],
                ),
              ),
        
              // --------------------------------------------Lawer Name / Enrollment No.----------------------
               Container(
               margin: const EdgeInsets.fromLTRB(20, 10,0, 0),child: const Text('Lawer Name / Enrollment No.',style:TextStyle(fontWeight: FontWeight.bold))),
               Container(
               margin: const EdgeInsets.fromLTRB(40,20,40,20),
                  child: TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  style:const TextStyle(backgroundColor: Colors.amber),
                  onChanged: (value){
                    setState(() {
                      lawerId = value;
                    });
                 
                  },
                 ),
               ),
        
        
        
               // ------------------------------Select---------------------------
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Select',style:TextStyle(fontWeight: FontWeight.bold) ),
                                  Row(
                      children: [
                           Row(
                      children: [
                        //  const Text('Select\n'),
                          Radio(value: 'M', groupValue: selectInput, onChanged: (value){setState(() {
                          selectInput = value;
                                  });}),
                                  const Text('Motion'),
                      ],
                                  ),
                       Row(
                      children: [
                         
                        //  const Text('Select\n'),
                          Radio(value: 'F', groupValue: selectInput, onChanged: (value){setState(() {
                          selectInput = value;
                                  });}),
                                  const Text('Final'),
                      ],
                                  ),
                      
                      ],
                                  ),
                      
                      Row(
                      children: [
                           Row(
                      children: [
                         
                        //  const Text('Select\n'),
                          Radio(value: 'L', groupValue: selectInput, onChanged: (value){setState(() {
                          selectInput = value;
                                  });}),
                                  const Text('Lok Adalat'),
                      ],
                                  ),
        
                      //  Row(
                      // children: [
                      //   //  const Text('Select\n'),
                      //     Radio(value: 'S', groupValue: selectInput, onChanged: (value){setState(() {
                      //     selectInput = value;
                      //             });}),
                      //             const Text('Medition'),
                      // ],
                      //             ),
                      
                      ],
                                  ),
                    ],
                  ),
                ),
        
        
        
                 //---------------------Cause List Date-----------------
        
               Container(margin: const EdgeInsets.fromLTRB(20, 10,0, 0),child: const Text('Select Cause List Dates',style:TextStyle(fontWeight: FontWeight.bold))),
             
              Container(
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(40, 20, 40, 20),
              child: TextField( 
                onTap: (){
                  _selectDate();
                },
                
                decoration: InputDecoration(
                  labelText: 'DATE',
                  hintText: pickedDate.toString().split(" ")[0],
                  filled:true,
                  prefixIcon:const Icon(Icons.calendar_today),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide:BorderSide(
                      color:Colors.blue,
                    ),
                  ),
                ),
                readOnly: true,
              )
          ),



          TextButton(
            onPressed: (){
             debugPrint(pickedDate?.toString());
             debugPrint(establishInput);
            //  debugPrint(selectInput);
             debugPrint(lawerId.toString());
             debugPrint(selectInput.toString());
            //  debugPrint(judgeInput);
            //  debugPrint(benchInput);
            //  debugPrint(pickedDate.toString().split(' ')[0]);
             debugPrint(formattedDate.toString());
            //  debugPrint(place);

            if(pickedDate!=null && establishInput!=null && lawerId!=null && selectInput!=null){
            
             Navigator.push(context, MaterialPageRoute(builder: (context) => const CauseListAdv() ));
             }
             else{
                invalidInfo(context);
             }
            
            }, child: Center(child: Container( padding:const EdgeInsets.symmetric(horizontal: 60, vertical: 13), decoration:const BoxDecoration(color:Color.fromRGBO(40, 109, 146, 1),borderRadius: BorderRadius.all(Radius.circular(8)) ) ,child:const Text('Submit',style:TextStyle(color:Colors.white,fontSize: 16))))
          ),

        
        
          ]
        ),
      ),


      
    );
    
    //  Center(child:Text('Advocate Cause List'));
  }
}

void invalidInfo(BuildContext context){
  showDialog(context: context, builder: (BuildContext context){
    return const AlertDialog(
      shape:RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
      title:Text(' Error '),
      content:Text('Required all the fields!'),
    );
  });
}
