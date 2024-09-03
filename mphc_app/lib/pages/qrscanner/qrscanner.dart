
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:qr_flutter/qr_flutter.dart';
// import 'package:torch_light/torch_light.dart';
// import 'package:camera/camera.dart';
// import 'package:torch_light/torch_light.dart';

class QrScanner extends StatefulWidget {
  const QrScanner({super.key});

  @override
  State<QrScanner> createState() => _QrScannerState();
}

class _QrScannerState extends State<QrScanner> {

final scanController  = MobileScannerController(detectionSpeed: DetectionSpeed.noDuplicates);
int scanCount = 1;
Color bgCamera =  const Color.fromARGB(255, 0, 0, 0);
 bool isTorchOn = false;

  void toggleTorch() {
    setState(() {
      isTorchOn = !isTorchOn;
    });
    scanController.toggleTorch();
  }


  @override
  void initState() {
    // TODO: implement initState
    scanCount=1;
    super.initState();
  }

  @override
  void dispose(){
    scanController.dispose();
    scanCount=1;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title:const Text("Scanner"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        foregroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),

      body:Column(
        children:[
          
          
          
          
          
          Container(
          height: 500,
          width: 500,
          padding:const EdgeInsets.all(10),
          margin:const EdgeInsets.all(0),
          decoration: BoxDecoration(
              // borderRadius: const BorderRadius.all(Radius.circular(20)),
              color:bgCamera,
          ),
          
          child: MobileScanner(
                controller: scanController,
                
                onDetect: (barcode) {
                  final String code = barcode.barcodes.first.rawValue ?? '';
                  if (code.isNotEmpty) {
                    debugPrint(code);
                    if(scanCount == 1){
                    //  launchUrl(Uri.parse(code),);
                    //  Navigator.pushReplacement();
                      // Navigator.pushReplacement(   launchUrl(Uri.parse(code),));
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>onCodeFound(code:code,)));
                      setState(() {
                        scanCount++;
                      });
                    }
                  }
                },
                overlayBuilder: (context, constraints) => Container(
                  child:Center(
                    child:Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        border:Border.all(width: 2.0,color:const Color.fromARGB(255, 129, 255, 51)),
                        borderRadius: BorderRadius.circular(6),
                        ),
                      
                    )
                  )
                 
                ),
              )
           ),


           Expanded(
             child: Container(
              margin: const EdgeInsets.all(0),
              decoration: BoxDecoration(
                color:bgCamera,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[

               Padding(
                
                 padding: const EdgeInsets.all(18.0),
                 child: GestureDetector(
                  onTap: () {
                  //  _toggleFlashlight();
                  // TorchLight.enableTorch();
                  // _cameraController!.setFlashMode(FlashMode.torch);
                    setState(() {
                      scanController.toggleTorch();
                      isTorchOn = !isTorchOn;
                    });
                  },
                  child: Container( 
                    padding:const EdgeInsets.all(20),
                    decoration:BoxDecoration(
                    border: Border.all(width: 0.5,color:Colors.white),
                    borderRadius: BorderRadius.circular(50),
                    color:const Color.fromARGB(60, 255, 203, 81),
                    
                  ),child: Icon(isTorchOn?Icons.flash_on:Icons.flash_off,color:Colors.amber)),
                  ),
               ),


                  
                ]
              )
             ),
           )

          
        ]
      )
    
    );
  }
}


// class BarCodeUrl extends StatelessWidget {
//   const BarCodeUrl({super.key});



//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // body: ,

//     );
//   }
// }


class onCodeFound extends StatefulWidget {
  final String code;
  // final Function reset;
  const onCodeFound({super.key,required this.code});

  @override
  State<onCodeFound> createState() => _onCodeFoundState();
}

class _onCodeFoundState extends State<onCodeFound> {

@override
void initState() {
   launchUrl(Uri.parse(widget.code.toString()),);
  super.initState();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            // QrImage(
            // data: hashedQr(),
            // errorCorrectionLevel: QrErrorCorrectLevel.H,
            // version: QrVersions.auto,
            // backgroundColor: Colors.white,
            // foregroundColor: Colors.black,
            // gapless: true,
            // padding: EdgeInsets.all(7),
            // ),

            Container(
              width:230,
              padding:EdgeInsets.all(10),
              child: QrImageView(
                data: widget.code.toString(),
                eyeStyle: const QrEyeStyle(
                  color: Color.fromARGB(255, 215, 69, 6),
                  // eyeShape: QrEyeShape.square,
                ) ,
                dataModuleStyle: const QrDataModuleStyle(
                  color:Color.fromARGB(255, 16, 152, 201),
                  // dataModuleShape: QrDataModuleShape.square,

                ),

                )
              ),




            Text(widget.code.toString(),style: const TextStyle(fontSize: 18),textAlign: TextAlign.center,),

            const SizedBox(
              height: 20,
            ),
        
            GestureDetector(
              onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const QrScanner())),
              child:Container(
                decoration: BoxDecoration(
                  color:const Color.fromARGB(255, 0, 28, 129),
                  borderRadius: BorderRadius.circular(10),
                ),
                width: 200,
                height: 50,
                // color:const Color.fromARGB(255, 7, 28, 57),
              child:const Center(child: const Text("Scan Again",textAlign: TextAlign.center,style:TextStyle(color:Colors.white,fontSize: 18))),
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            GestureDetector(
              onTap: () =>  launchUrl(Uri.parse(widget.code)),
              child:Container(
                decoration: BoxDecoration(
                  color:const Color.fromARGB(255, 21, 76, 194),
                  borderRadius: BorderRadius.circular(10),
                ),
                width: 200,
                height: 50,
                // color:const Color.fromARGB(255, 7, 28, 57),
              child:const Center(child: const Text("Navigate Link",textAlign: TextAlign.center,style:TextStyle(color:Colors.white,fontSize: 18))),
              ),
            )
          ],
        ),
      )
    );
  }
}


