import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kioxkefinal/components/drawer.dart';
import 'package:kioxkefinal/models/functions.dart';
import 'package:kioxkefinal/models/viewStyles.dart';
import 'package:kioxkefinal/views/detalhes.dart';


class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
  final String nome,email;
  HomeView(this.nome,this.email);
}

class _HomeViewState extends State<HomeView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: primaryColor,
       title: Text("Kiosxke"),
       leading:  IconButton(icon: Icon(Icons.sort), onPressed: () => _scaffoldKey.currentState.openDrawer(),),
        actions: [
           IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
        ]
      ),
      body: SingleChildScrollView(
        child:Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
           pageTitle("Detaques",context),
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
                      return _blovk(snapshot.data[index]['titulo'].toString(),snapshot.data[index]['capa'],snapshot.data[index]['autor'],snapshot.data[index]['likes'],snapshot.data[index]['src'],snapshot.data[index]['preco'],snapshot.data[index]['descricao'],snapshot.data[index]['id']);
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

          pageTitle("Mais Acessados",context),
            FutureBuilder<List<dynamic>>(
            future: fetchBooks(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: List<Widget>.generate(snapshot.data.length, (index){
                      return _horiBox(snapshot.data[index]['titulo'].toString(),snapshot.data[index]['capa'],snapshot.data[index]['autor'],snapshot.data[index]['likes'],snapshot.data[index]['src'],snapshot.data[index]['preco'],snapshot.data[index]['descricao'],snapshot.data[index]['id']);
                  },
                )
              );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return  ListView(
                  shrinkWrap: true,
                   physics: NeverScrollableScrollPhysics(),
                  children: List<Widget>.generate(10, (index){
                      return Card(child:shimerEfect(context));
                     },
                )
              );
            
            },
          )
             
       ],
        )
      )
    ),


     bottomNavigationBar: BottomNavigationBar(
       type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Inicio'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.book),
          title: Text('Livros'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.library_books),
          title: Text('Revistas'),
        ),
         BottomNavigationBarItem(
          icon: Icon(Icons.bookmark_border),
          title: Text('Jornais'),
        ),
         BottomNavigationBarItem(
          icon: Icon(Icons.chrome_reader_mode),
          title: Text('BD'),
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: primaryColor,
      onTap: _onItemTapped,
    ),
     drawer: DrawerPage(),
    );
  }


 Widget _blovk(String titulo,String imageUrl,String autor,String likes,String urlBook,String preco,String descricao,String id){
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
 
 Widget _horiBox(String titulo,String imageUrl,String autor,String likes,String urlBook,String preco,String descricao,String id){
  return  GestureDetector(
    onTap:(){
      print("clicando");
     Navigator.push(context,MaterialPageRoute(builder: (context) => Datalhes(urlBook,titulo,imageUrl,autor,likes,preco,descricao,id)));
    },
    child:
  Card( 
  color: Colors.white,
  borderOnForeground:true,
  shadowColor:Colors.grey[100],
  child:CachedNetworkImage(
    imageUrl: "$imageUrl",
    imageBuilder: (context, imageProvider) => Container(
    width: MediaQuery.of(context).size.width,
    height: 180,
    child: Row(
      children: [
        Container(
          width: 130,
          height: 180,
         decoration: BoxDecoration(
           borderRadius:BorderRadius.all(Radius.circular(10)),
           image: DecorationImage(image: imageProvider,fit: BoxFit.cover,),
        ),
        ),
        
        Expanded(
          child:Container(
          width: 200,
          height: 200,
          padding:EdgeInsets.all(15),
          child:Column(
            children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child:RichText(
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                        style:subtitle,
                        text: "$titulo"),
                  ),
                ),

                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(top:10,bottom:10),
                  child:RichText(
                    overflow: TextOverflow.fade,
                    text: TextSpan(
                        style: TextStyle(fontSize:15,color: primaryColor),
                        text: "by $autor"),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child:Text("$descricao",maxLines:3)
                ),
              
                 Row(
                   mainAxisAlignment: MainAxisAlignment.end,
                   crossAxisAlignment: CrossAxisAlignment.end,
                   children: [

                Container(
                  height: 30,
                  padding: EdgeInsets.all(5),
                  alignment: Alignment.centerRight,
                  child: IconButton(icon:Icon(Icons.comment,size: 25, color: primaryColor,), onPressed: (){})
                ),
                Container(
                  height: 30,
                  padding: EdgeInsets.all(5),
                  alignment: Alignment.centerRight,
                  child: IconButton(icon:Icon(Icons.favorite_border,size: 25, color:primaryColor,), onPressed: (){})
                )
                   ],
                 )

            ],
          ),
        )

        )
      ],
    ),
  ),
  placeholder: (context, url) => shimerEfect(context),
    errorWidget: (context, url, error) => Icon(Icons.error),
  )));
 }


void _onItemTapped(int index) {
  setState(() {
    _selectedIndex = index;
  });
}

}