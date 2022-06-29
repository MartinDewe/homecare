import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;


final Stream<QuerySnapshot> nurse =  FirebaseFirestore.instance.collection('nurse').snapshots();
final firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;

class ListPerawat extends StatefulWidget {
  const ListPerawat({Key? key}) : super(key: key);

  @override
  State<ListPerawat> createState() => _ListPerawatState();
}

class _ListPerawatState extends State<ListPerawat> {

   Future<firebase_storage.ListResult> listfiles() async{
        firebase_storage.ListResult results = await storage.ref('+6281217115704/Foto').listAll();
        return results;
      } 
      
   Future<String> getImage(String imagename) async{
        String getImage = await storage.ref('+6281217115704/Foto/$imagename').getDownloadURL();
        return getImage;
      } 

  @override
  Widget build(BuildContext context) {

  final mediawidth = MediaQuery.of(context).size.width;
  final mediaheight = MediaQuery.of(context).size.height;

    return MaterialApp(
      home: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => 
            Navigator.of(context).pop(),
            ), 
          title: const Text('Daftar Perawat'),
          titleTextStyle: GoogleFonts.poppins(
              color: Colors.black54,
              fontSize: 20,
          ), 
          backgroundColor: Colors.yellow[100],
          elevation: 0.5,
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: nurse,
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> nickname ){
              if (nickname.hasError){
                return const Text('HasError');
              }
              else if(nickname.connectionState == ConnectionState.waiting){
                return const Text('');
              }

                final data = nickname.requireData;

                return ListView.builder(
                  itemCount: data.size,
                  itemBuilder: (context, index){
                    final status = data.docs[index]['online'] as bool;
                    return GestureDetector(
                      onTap: (){},
                      child: Container(
                        margin: EdgeInsets.only( top: mediaheight*0.02, left: mediawidth*0.05, right: mediawidth*0.05),
                        width: mediawidth,
                        height: mediaheight*0.15,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: const Color(0xfff3f3f3)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                           Container(
                            width: mediawidth*0.22,
                            height: mediaheight*0.22,
                            margin: const EdgeInsets.all(8),
                             decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.yellow[50]
                              ),
                             child: FutureBuilder(
                              future: listfiles(),
                              builder: (BuildContext context, AsyncSnapshot<firebase_storage.ListResult> snapshot) {
                                
                                 if (snapshot.hasError){
                                    return const Text('HasError');
                                  }
                                  else if(snapshot.connectionState == ConnectionState.waiting){
                                    return const Text('');
                                  }

                              return FutureBuilder(
                                 future: getImage(snapshot.data!.items[0].name),
                                 builder: (BuildContext context, AsyncSnapshot<String> image){
                                    if (image.hasError){
                                      return const Text('HasError');
                                    }
                                    else if(image.connectionState == ConnectionState.waiting){
                                      return const Text('');
                                    }

                                    return Padding(
                                      padding: const EdgeInsets.only(top:5.0),
                                      child: Image.network(
                                        image.data!,
                                      ),
                                    );

                                 }

                                );
                              }
                              
                              ),
                           ),

                           Padding(
                             padding: const EdgeInsets.only(left: 8.0),
                             child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                 '${data.docs[index]['name']}',
                                   style: GoogleFonts.lato(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                    ), 
                                ),
                               status?Text(
                                  'Online',
                                   style: GoogleFonts.lato(
                                      color: Colors.teal[300],
                                      fontSize: 16,
                                  ), 
                                ):Text(
                                  'Offline',
                                   style: GoogleFonts.lato(
                                      color: Colors.red[300],
                                      fontSize: 16,
                                  ), 
                                )
                              ],
                             ),
                           )
                           
                          ],
                        ),
                      ),
                    );
                }
                
                );
            },
          ),
      ),
    );


  }
     
}
