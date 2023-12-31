import 'package:flutter/material.dart';
 import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:news_app4/web_view_screen.dart';

Widget buildArticleItem(articles,context) =>InkWell(
  onTap: () {
    navigateTo(context, WebViewScreen(articles['url']));
  },
  child:   Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              width: 120.0,
              height: 120.0,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0),
              image:DecorationImage(image: NetworkImage('${articles['urlToImage']}'),
              fit: BoxFit.cover)
              ),
              
            ),
            SizedBox(height: 20.0,),
            Expanded(
              child: Container(
                height: 120.0,
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                     Expanded(
                        child: Text('${articles['title']}',
                        style: TextStyle(
                             color: Colors.black,
                             fontSize: 20.0,
                             fontWeight: FontWeight.bold,
                           ),
                      
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,),
                      ),
                    Text(
            '${articles['publishedAt']}',
            style: TextStyle(
            color: Colors.grey,))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
);
    Widget myDivider() =>Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
                width: double.infinity,
                height: 1,
                color: Colors.grey[300],
              ),);

Widget articleBuild(list, context,{isSearch=false})=> ConditionalBuilder(
        condition:list.length > 0 ,
        fallback: (BuildContext context) => isSearch ? Container():
            Center(child: CircularProgressIndicator()),
        builder: (BuildContext context) => ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) => buildArticleItem(list[index], context),
            separatorBuilder: (context, index) => myDivider(),
            itemCount: list.length ));
  void navigateTo(context,Widget)=>Navigator.push(context,
  MaterialPageRoute(
    builder:(context)=>Widget,
  ),);   