import 'package:flutter/material.dart';
// import 'package:mphc_app/pages/home.dart';
// import 'package:mphc/pages/virtualCourt/virtural_court_user_form.dart';
import 'package:intl/intl.dart';
import 'package:mphc_app/pages/home/home.dart';
import 'package:mphc_app/pages/virtualCourt/vcLawyer/vc_lawyer_data.dart';

class VCLawyerForm extends StatefulWidget {
  const VCLawyerForm({super.key});

  @override
  State<VCLawyerForm> createState() => _VCLawyerFormState();
}

class _VCLawyerFormState extends State<VCLawyerForm> {
  // String ? mobileNo;
  // String ? establishInput;
  // String ? selectInput;
  // String ? pickedDate;
  
     String ? formattedDate;
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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title:const Text('Virtual Court'),
        // backgroundColor: Color.fromARGB(190, 38, 30, 91),
        leading: IconButton(onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (context)=>const Home()));}, icon: const Icon(Icons.arrow_back)),
        flexibleSpace: Container(
              decoration: const BoxDecoration(gradient:LinearGradient(colors: [
                Color.fromARGB(174, 172, 192, 220),
                Color.fromARGB(221, 255, 255, 255),
              ])),
            ),
      ),

      body:SafeArea(
        child: Container(
          height: double.infinity,
          // height: 770,
         decoration:const BoxDecoration(
        color:Colors.white,
        image: DecorationImage(
        image:AssetImage('images/mphc02.jpg'),fit:BoxFit.contain,
        alignment: Alignment.bottomCenter,
        opacity: 1,        
         colorFilter: ColorFilter.mode(Color.fromARGB(255, 2, 21, 71), BlendMode.screen),
          ),
         ),
          padding:const EdgeInsets.fromLTRB(40, 5, 40, 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                    
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children:[
                  TextButton(onPressed: (){
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => const VCLawyerForm()));
                    }, child:Container(decoration:BoxDecoration(color:const Color.fromARGB(255, 68, 74, 108),borderRadius: BorderRadius.circular(10)), padding:const EdgeInsets.symmetric(horizontal: 10,vertical: 10),child: const Text('Lawyer',style: TextStyle(color:Colors.white),))),
                    TextButton(onPressed: (){
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => const VCUserForm()));
                      Navigator.of(context).pop();
                    }, child:Container(decoration:BoxDecoration(color:const Color.fromARGB(255, 68, 74, 108),borderRadius: BorderRadius.circular(10)), padding:const EdgeInsets.symmetric(horizontal: 10,vertical: 10),child: const Text('Other Users',style: TextStyle(color:Colors.white),))),
                    
                  ]
                ),
                    
                const SizedBox(
                  height: 20,
                ),
                    
                const Text('Note: Causelist details will be displayed bassed upon mobile number (given at login of mobile app) and (at the time of registraion ) of Advocate in MPHC Portal.)',style:TextStyle(fontWeight: FontWeight.bold,color:Color.fromARGB(255, 167, 40, 31))),
                    
                const SizedBox(
                  height: 20,
                    
                ),
                 const Row(
                  children: [
                    Text('  Select Establishment',style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.start,),
                  ],
                ),
                 Container(
                  padding:const EdgeInsets.symmetric(vertical:4,horizontal: 10),
                  decoration: BoxDecoration(border:Border.all(width: 1,color:Colors.black54),borderRadius: BorderRadius.circular(18)),
                   child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                      const Icon(Icons.location_city,color:Color.fromARGB(221, 34, 34, 34)),
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
                    
                 const Row(
                  children: [
                    Text('   Mobile No.',style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.start,),
                  ],
                ),
                TextField(
                  maxLength: 10,
                  decoration: InputDecoration(
                    
                    border:OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    prefixIcon:const Icon(Icons.calendar_month),
                    hintText: 'Mobile No.',
                    
                  
                  ),
                  onChanged: (value){
                    setState(() {
                      mobileNo = value;
                    });
                  },
                ),
                    
                    
                // ------------------------------Select---------------------------
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Select',style:TextStyle(fontWeight: FontWeight.bold) ),
                                    Row(
                        children: [
                             Row(
                        children: [
                          //  const Text('Select\n'),
                            Radio(
                              value: 'M',
                               visualDensity: const VisualDensity(
                         horizontal: VisualDensity.maximumDensity,
                          vertical: VisualDensity.minimumDensity),
                              // visualDensity: VisualDensity(vertical:20.0),
                            groupValue: selectInput, onChanged: (value){setState(() {
                            selectInput = value;
                                    });}),
                                    const Text('Motion'),
                        ],
                                    ),
                         Row(
                        children: [
                           
                          //  const Text('Select\n'),
                            Radio(
                            visualDensity: const VisualDensity(
                               horizontal: VisualDensity.maximumDensity,
                               vertical: VisualDensity.minimumDensity),
                              value: 'F', 
                              groupValue: selectInput, 
                              onChanged: (value){setState(() {
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
                            Radio(
                                 visualDensity: const VisualDensity(
                                 horizontal: VisualDensity.maximumDensity,
                                 vertical: VisualDensity.minimumDensity),
                                value: 'L',
                                groupValue: selectInput,
                                onChanged: (value){setState(() {
                            selectInput = value;
                                    });}),
                                    const Text('Lok Adalat'),
                        ],
                                    ),
                    
                   
                        
                        ],
                                    ),
                      ],
                    ),
                  ),
                    
                
                const Row(
                  children: [
                    Text(' Cause List Date',style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.start,),
                  ],
                ),
                Container(
                width: double.infinity,
                           
                  decoration: BoxDecoration(border:Border.all(width: 1,color:Colors.black54),borderRadius: BorderRadius.circular(18)),
                     
                child: TextField( 
                  onTap: (){
                    _selectDate();
                  },
                  
                  decoration: InputDecoration(
                  
                    
                    hintText: pickedDate!=null?pickedDate:'DATE',
                    
                    // filled:true,
                    // fillColor: const Color.fromARGB(188, 255, 255, 255),
                    prefixIcon:const Icon(Icons.calendar_today,size: 20,),
                    enabledBorder:const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      
                    ),
                    focusedBorder: const OutlineInputBorder(
                      // borderRadius: BorderRadius.all(Radius.circular(50)),
                      borderSide: BorderSide.none,
                    ),
               
                  ),
                  readOnly: true,
                )
            ),
                    
                    
                
                
                const SizedBox(
                  height: 20,
                ),
                
                
                TextButton(
                  onPressed: (){
                    
                      debugPrint( mobileNo);
                      debugPrint( establishInput);
                      debugPrint( selectInput);
                      debugPrint( pickedDate);

                    if(mobileNo!=null && establishInput!=null && selectInput!=null && pickedDate!=null){

                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const VCLawerData()) );
                    }
                    
                  },
                  child: Container(
                  width:double.infinity,
                  padding:const EdgeInsets.symmetric(horizontal:50,vertical:14),
                  decoration: BoxDecoration(
                    color:const Color.fromARGB(255, 62, 68, 107), 
                    borderRadius: BorderRadius.circular(14),
                
                    ),
                    child: const Text('Show',textAlign: TextAlign.center,style:TextStyle(fontSize: 16,color:Colors.white),
                    ),
                  ),
                ),
                    
              ],
            ),
          ),
        ),
      )
    );
  
  }
}