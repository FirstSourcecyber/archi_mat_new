import 'package:Archimat/Services/categoryService.dart';
import 'package:Archimat/util/list/categorylist.dart';
import 'package:Archimat/util/list/photolistgrid.dart';
import 'package:Archimat/util/list/productgrid.dart';
import 'package:Archimat/util/widgets/divider.dart';
import 'package:flutter/material.dart';
import '../theme.dart';

class CategoryPage extends StatefulWidget {
  final dynamic dat;
  final bool dat1;
  const CategoryPage({Key key, this.dat, this.dat1}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  List product = [], category = [];
  bool loader = true, subcategory = false;
  getprobysub() {
    setState(() {
      loader = true;
      subcategory = true;
    });

    CategoryService().getprodbycate(widget.dat.toString()).then((value) {
      print(value);
      setState(() {
        if (value != null) {
          var data = value;
          print(data['arks']);
          category = data['arks'];
          product = data['product'];

          loader = false;
        }
      });
    });
  }

  getprobysub1() {
    setState(() {
      loader = true;
    });

    CategoryService().getallprobysub(widget.dat.toString()).then((value) {
      print(value);
      setState(() {
        if (value != null) {
          var data = value;
          print(data['arks']);
          category = data['arks'];
          product = data['product'];
          loader = false;
        }
      });
    });
  }

  getallpro() {
    setState(() {
      loader = true;
    });

    CategoryService().getallprodcat().then((value) {
      print(value);
      setState(() {
        if (value != null) {
          var data = value;
          print(data['arks']);
          category = data['arks'];
          product = data['product'];
          loader = false;
        }
      });
    });
  }

  @override
  void initState() {
    print(widget.dat.toString());
    if (!widget.dat1) {
      if (widget.dat == null) {
        getallpro();
      } else {
        getprobysub();
      }
    } else {
      getprobysub1();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme().white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: AppTheme().black,
          ),
        ),
        title: Image(
          image: AssetImage('assets/images/archimat.png'),
          width: 150,
          height: 100,
        ),
        centerTitle: true,
      ),
      body: loader
          ? Center(
              child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(AppTheme().purple)))
          : SingleChildScrollView(
              child: Column(
                children: [
                  category.length == 0
                      ? Container()
                      : Column(
                          children: [
                            CategoryList(
                              category: category,
                              subcategory: subcategory,
                            ),
                            Divider_Widgets()
                          ],
                        ),
                  product.length == 0
                      ? Container(
                          padding: EdgeInsets.only(top: 15),
                          alignment: Alignment.center,
                          child: Text(
                            'No Product Available',
                            style: TextStyle(
                              fontFamily: 'Roxborough CF',
                            ),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(15),
                          child: ProductListGride(
                            data: product,
                            i: 1,
                          ),
                        ),
                ],
              ),
            ),
    );
  }
}
