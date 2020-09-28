import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kioxkefinal/models/functions.dart';
import 'package:kioxkefinal/models/viewStyles.dart';
import 'package:kioxkefinal/views/detalhes.dart';

class Tabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
  length: 3,
  child: Scaffold(
    appBar:  PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child:TabBar(
          labelColor: Colors.black,
          indicatorColor:primaryColor,
        tabs: [
          Tab(text: "Todos",),
          Tab(text: "Populares",),
          Tab(text: "Categorias",),
        ],
      ),
    ),
  
  body: TabBarView(
  children: [
    _boxView(context),
    _boxView(context),
    Icon(Icons.warning),
  ],    
    ),
  ),
  
); 


  }


Widget _boxView(BuildContext context){
  return SingleChildScrollView(
        child:Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
           pageTitle("Coleção",context),
           Container(
            width: MediaQuery.of(context).size.width,
            height: 240,
             child:FutureBuilder<List<dynamic>>(
            future: fetchBooks(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: List<Widget>.generate(snapshot.data.length, (index){
                      return _blovk(context,snapshot.data[index]['titulo'].toString(),snapshot.data[index]['capa'],snapshot.data[index]['autor'],snapshot.data[index]['likes'],snapshot.data[index]['src'],snapshot.data[index]['preco'],snapshot.data[index]['descricao'],snapshot.data[index]['id']);
                  },
                )
              );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return  ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: List<Widget>.generate(6, (index){
                      return Card(child:shimerVertical(context));
                     },
                )
              );
            
            },
          )
             ),

         pageTitle("Populares",context),
           Container(
            width: MediaQuery.of(context).size.width,
            height: 240,
             child:FutureBuilder<List<dynamic>>(
            future: fetchBooks(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: List<Widget>.generate(snapshot.data.length, (index){
                      return _blovk(context,snapshot.data[index]['titulo'].toString(),snapshot.data[index]['capa'],snapshot.data[index]['autor'],snapshot.data[index]['likes'],snapshot.data[index]['src'],snapshot.data[index]['preco'],snapshot.data[index]['descricao'],snapshot.data[index]['id']);
                  },
                )
              );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return  ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: List<Widget>.generate(6, (index){
                      return Card(child:shimerVertical(context));
                     },
                )
              );
            
            },
          )
        ),
        pageTitle("Mais Lidos",context),
           Container(
            width: MediaQuery.of(context).size.width,
            height: 240,
             child:FutureBuilder<List<dynamic>>(
            future: fetchBooks(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: List<Widget>.generate(snapshot.data.length, (index){
                      return _blovk(context,snapshot.data[index]['titulo'].toString(),snapshot.data[index]['capa'],snapshot.data[index]['autor'],snapshot.data[index]['likes'],snapshot.data[index]['src'],snapshot.data[index]['preco'],snapshot.data[index]['descricao'],snapshot.data[index]['id']);
                  },
                )
              );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return  ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: List<Widget>.generate(6, (index){
                      return Card(child:shimerVertical(context));
                     },
                )
              );
            
            },
          )
        ),
         
             
       ],
        )
      )
    );
}


 Widget _blovk(BuildContext context,String titulo,String imageUrl,String autor,String likes,String urlBook,String preco,String descricao,String id){
  return  GestureDetector(
    onTap:(){
      print("clicando");
     Navigator.push(context,MaterialPageRoute(builder: (context) => Datalhes(urlBook,titulo,imageUrl,autor,likes,preco,descricao,id)));
    },
    child:Container(
     width: 150,
     height: 250,
     padding: EdgeInsets.all(5),
      child: CachedNetworkImage(
  imageUrl: "$imageUrl",
  imageBuilder: (context, imageProvider) => 
       Container(
        width: 200,
        decoration: BoxDecoration(
          color:Colors.grey[200],
          borderRadius: BorderRadius.all(Radius.circular(15))
        ),
        child:Column(
          mainAxisSize: MainAxisSize.max,
         children: [
            Container(
              width: 200,
              height: 200,
             decoration: BoxDecoration(
               borderRadius: BorderRadius.all(Radius.circular(10)),
                image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
              ),),
               Expanded(
                child:Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(5),
                  child: RichText(
                    overflow: TextOverflow.fade,
                    text: TextSpan(
                        style: TextStyle(color: Colors.grey[700],fontSize: 12,fontWeight: FontWeight.bold),
                        text: "$titulo"),
                  ),
                ),
              ),


         ],
        ),
      ),
     placeholder: (context, url) => shimerVertical(context),
     errorWidget: (context, url, error) => Icon(Icons.error),
   ),
  )
 );
}
 

}