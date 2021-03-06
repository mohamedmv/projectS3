import 'package:cloud_firestore/cloud_firestore.dart';

class Tache{
  
 String id;
  String titre;
  int duree;
  bool occupation;

  Tache({required this.duree,required this.titre, this.id = '',this.occupation= false});

  Map<String ,dynamic> asMap(){
    return {
    'titre': titre,
    "duree" : duree ,
    };
  }

   static Tache fromMap(Map<String,dynamic > data , String idP){
    return  Tache(
      id : idP,
        duree : data['duree'],
        titre: data['titre'] ?? '',
        occupation : data['occupation'] ?? false
        );
  }


   static Tache  fromDocumentSnapshot(DocumentSnapshot doc){
    return fromMap(doc.data() as Map<String,dynamic> , doc.id);
  }

   

  

   static Tache  fromQueryDocumentSnapshot(QueryDocumentSnapshot doc){
    return fromMap(doc.data() as Map<String,dynamic> , doc.id);
  }

}