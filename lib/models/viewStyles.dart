import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const TextStyle optionStyle = TextStyle(fontSize: 19, fontWeight: FontWeight.bold);
const TextStyle subtitle = TextStyle(fontSize: 19,color: Colors.black);
const Color primaryColor = Color.fromRGBO(246, 165, 46,1);

Widget shimerEfect(BuildContext context){
    return Container(
    decoration: BoxDecoration(color: Colors.grey[200],borderRadius: BorderRadius.all(Radius.circular(10))),
     width: MediaQuery.of(context).size.width,alignment: Alignment.center,height: 180, child: SpinKitCubeGrid(color: primaryColor,size: 40.0,));
  }
Widget shimerVertical(BuildContext context){
  return Container(
        width: 140,
        height: 250,
        alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.grey[100],
              borderRadius: BorderRadius.all(Radius.circular(10))
          )
        ,
        child: SpinKitCubeGrid(
        color: primaryColor,
        size: 40.0,
      ),
    );
}


 Widget pageTitle (String title,BuildContext context){
   return Container(
      width: MediaQuery.of(context).size.width,
      height: 40,
      padding: EdgeInsets.only(left:10),
      alignment: Alignment.centerLeft,
      child: Text(title,style: optionStyle,),
   );
 }


Widget cardComments(){
  return Card(
      child:CachedNetworkImage(
        imageUrl: "https://image.cnbcfm.com/api/v1/image/106069136-1565284193572gettyimages-1142580869.jpeg?v=1576531407&w=1400&h=950",
        imageBuilder: (context, imageProvider) => ListTile(
        contentPadding: EdgeInsets.all(10),
        leading: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
          image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
             ),
          ),
        ),
        title: Text('Marcelo Maquina'),
        subtitle: Text(
          'achei muito interesante mas acredito que darei o meu comentario depois de ler o book'
        ),
        trailing: Icon(Icons.more_vert),
        isThreeLine: true,
      ),
        placeholder: (context, url) => SpinKitCubeGrid(color: primaryColor,size: 40.0,),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
}