import 'package:day_4/constants/colors.dart';

import 'package:day_4/models/product.dart';
import 'package:day_4/providers/products_provider.dart';
import 'package:day_4/providers/themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);
  static const routeName = '/FormPage';

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  final _imageUrlController = TextEditingController();
  final _imageUrlfocusNode = FocusNode();

  String? categoryValue = 'Electronics';
  String? subcategoryValue;
  List<String> variations = [];
  List<String> othImages = [];
  var varcontroller = TextEditingController();
  var otImageController = TextEditingController();

  var _editedProduct = Product(
    id: '',
    category: [],
    subcategory: '',
    title: '',
    shortName: '',
    seller: '',
    image: '',
    price: 0,
    shippingFee: 0,
    oldPrice: null,
    description: '',
    specification: '',
    keyFeatures: '',
    colorImages: [],
    otherImages: [],
  );

  List<DropdownMenuItem<String>> get DDItems {
    List<DropdownMenuItem<String>> menuItems = const [
      DropdownMenuItem<String>(
        child: Text('Electronics'),
        value: 'Electronics',
      ),
      DropdownMenuItem<String>(
        child: Text('Auto-Mobile'),
        value: 'Auto-Mobile',
      ),
    ];
    return menuItems;
  }

  List<DropdownMenuItem<String>> get subDDItems {
    List<DropdownMenuItem<String>> menuItems = const [
      DropdownMenuItem<String>(
        child: Text('Portable speakers'),
        value: 'Portable speakers',
      ),
      DropdownMenuItem<String>(
        child: Text('LED Television'),
        value: 'LED Television',
      ),
      DropdownMenuItem<String>(
        child: Text('Home Theater System'),
        value: 'Home Theater System',
      ),
      DropdownMenuItem<String>(
        child: Text('Smart Asseccories'),
        value: 'Smart Asseccories',
      ),
      DropdownMenuItem<String>(
        child: Text('Batteries'),
        value: 'Batteries',
      ),
      DropdownMenuItem<String>(
        child: Text('Generators'),
        value: 'Generators',
      ),
      DropdownMenuItem<String>(
        child: Text('Combination Speakers'),
        value: 'Combination Speakers',
      ),
      DropdownMenuItem<String>(
        child: Text('Portable TV'),
        value: 'Portable TV',
      ),
      DropdownMenuItem<String>(
        child: Text('Smart Watch'),
        value: 'Smart Watch',
      ),
      DropdownMenuItem<String>(
        child: Text('Solar'),
        value: 'Solar',
      ),
      DropdownMenuItem<String>(
        child: Text('Decorative Lamp'),
        value: 'Decorative Lamp',
      ),
      DropdownMenuItem<String>(
        child: Text('Signal Lamp'),
        value: 'Signal Lamp',
      ),
      DropdownMenuItem<String>(
        child: Text('Car Body Repair Tool'),
        value: 'Car Body Repair Tool',
      ),
      DropdownMenuItem<String>(
        child: Text('Jump Starter'),
        value: 'Jump Starter',
      ),
      DropdownMenuItem<String>(
        child: Text('Car Video Surveillance'),
        value: 'Car Video Surveillance',
      ),
      DropdownMenuItem<String>(
        child: Text('Battery Jump Cable'),
        value: 'Battery Jump Cable',
      ),
      DropdownMenuItem<String>(
        child: Text('Polishing Machine'),
        value: 'Polishing Machine',
      ),
      DropdownMenuItem<String>(
        child: Text('Interior Care'),
        value: 'Interior Care',
      ),
      DropdownMenuItem<String>(
        child: Text('Car Covers'),
        value: 'Car Covers',
      ),
      DropdownMenuItem<String>(
        child: Text('SunShades'),
        value: 'SunShades',
      ),
      DropdownMenuItem<String>(
        child: Text('Neck Pillow'),
        value: 'Neck Pillow',
      ),
      DropdownMenuItem<String>(
        child: Text('Interior Mirror'),
        value: 'Interior Mirror',
      ),
      DropdownMenuItem<String>(
        child: Text('Fuel Supply System'),
        value: 'Fuel Supply System',
      ),
    ];
    return menuItems;
  }

  @override
  void dispose() {
    varcontroller.dispose();
    otImageController.dispose();
    _formKey.currentState!.dispose();
    _imageUrlController.dispose();
    _imageUrlfocusNode.dispose();
    _imageUrlfocusNode.removeListener(_updateImageUrl);
    super.dispose();
  }

  void _updateImageUrl() {}

  @override
  void initState() {
    _imageUrlfocusNode.addListener(_updateImageUrl);
    super.initState();
  }

  void showCustomDialogue(Product _editedProduct) {
    showGeneralDialog(
        context: context,
        barrierLabel: 'Product Details',
        barrierDismissible: true,
        barrierColor: Colors.black.withOpacity(0.5),
        pageBuilder: (_, __, ___) {
          return SizedBox(
            height: 300,
            width: 300,
            child: Card(
              child: SizedBox(
                height: 300,
                width: 300,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 10, right: 10),
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Colors.grey,
                        ),
                      ),
                      child: _imageUrlController.text.isEmpty
                          ? const Center(
                              child: Text(
                                'Enter an imageUrl',
                                textAlign: TextAlign.center,
                              ),
                            )
                          : FittedBox(
                              child: Container(
                                color: Colors.white,
                                child: Image.network(
                                  _imageUrlController.text,
                                ),
                              ),
                            ),
                    ),
                    Text(
                      'Title :${_editedProduct.title}',
                      style: const TextStyle(fontSize: 15),
                    ),
                    Text(
                      'Price :${_editedProduct.price}',
                      style: const TextStyle(fontSize: 15),
                    ),
                    Text(
                      'ShippingFee :${_editedProduct.shippingFee}',
                      style: const TextStyle(fontSize: 15),
                    ),
                    Text(
                      'ShortName :${_editedProduct.shortName}',
                      style: const TextStyle(fontSize: 15),
                    ),
                    Text(
                      'SubCategory :${_editedProduct.subcategory}',
                      style: const TextStyle(fontSize: 15),
                    ),
                    Text(
                      'Description :${_editedProduct.description}',
                      style: const TextStyle(fontSize: 15),
                    ),
                    Text(
                      'Specification :${_editedProduct.specification}',
                      style: const TextStyle(fontSize: 15),
                    ),
                    Text(
                      'KeyFeatures :${_editedProduct.keyFeatures}',
                      style: const TextStyle(fontSize: 15),
                    ),
                    Column(
                      children: [
                        const Text(
                          'Variations :',
                          style: const TextStyle(fontSize: 15),
                        ),
                        ...variations
                            .map(
                              (e) => Text(e),
                            )
                            .toList(),
                      ],
                    ),
                    const Spacer(),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Done'),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        transitionBuilder: (_, anim, ___, child) {
          Tween<Offset> tween;
          if (anim.status == AnimationStatus.reverse) {
            tween = Tween(begin: Offset(-1, 0), end: Offset.zero);
          } else {
            tween = Tween(begin: Offset(1, 0), end: Offset.zero);
          }
          return SlideTransition(
            position: tween.animate(anim),
            child: FadeTransition(
              opacity: anim,
              child: child,
            ),
          );
        });
  }

  Future<void> _saveForm() async {
    _formKey.currentState!.validate();
    _formKey.currentState!.save();

    Provider.of<Products>(
      context,
      listen: false,
    ).addProduct(_editedProduct);
  }

  @override
  Widget build(BuildContext context) {
    final dark = Provider.of<ThemeProvider>(
      context,
      listen: false,
    ).isDarkMode;
    return Scaffold(
      backgroundColor: dark ? kDarkBackground : Colors.white,
      appBar: AppBar(
        title: const Text(
          'Add Product',
        ),
        actions: [
          IconButton(
            onPressed: () => _saveForm(),
            icon: const Icon(
              Icons.save,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    label: Text(
                      'Title',
                    ),
                    border: OutlineInputBorder(),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                    ),
                  ),
                  textInputAction: TextInputAction.next,
                  onSaved: (newValue) {
                    _editedProduct = Product(
                      id: _editedProduct.id,
                      title: newValue as String,
                      shortName: _editedProduct.shortName,
                      price: _editedProduct.price,
                      shippingFee: _editedProduct.shippingFee,
                      oldPrice: _editedProduct.oldPrice,
                      image: _editedProduct.image,
                      seller: _editedProduct.seller,
                      category: _editedProduct.category,
                      subcategory: _editedProduct.subcategory,
                      description: _editedProduct.description,
                      specification: _editedProduct.specification,
                      colorImages: _editedProduct.colorImages,
                      keyFeatures: _editedProduct.keyFeatures,
                      totalrating: _editedProduct.totalrating,
                    );
                  },
                  validator: (newValue) {
                    if (newValue == null || newValue.isEmpty) {
                      return 'Please Enter product name';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    label: Text(
                      'ShortName',
                    ),
                    border: OutlineInputBorder(),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                    ),
                  ),
                  textInputAction: TextInputAction.next,
                  onSaved: (newValue) {
                    _editedProduct = Product(
                      id: _editedProduct.id,
                      title: _editedProduct.title,
                      shortName: newValue as String,
                      price: _editedProduct.price,
                      shippingFee: _editedProduct.shippingFee,
                      oldPrice: _editedProduct.oldPrice,
                      image: _editedProduct.image,
                      seller: _editedProduct.seller,
                      category: _editedProduct.category,
                      subcategory: _editedProduct.subcategory,
                      description: _editedProduct.description,
                      specification: _editedProduct.specification,
                      colorImages: _editedProduct.colorImages,
                      keyFeatures: _editedProduct.keyFeatures,
                      totalrating: _editedProduct.totalrating,
                    );
                  },
                  validator: (newValue) {
                    if (newValue == null || newValue.isEmpty) {
                      return 'Please enter summarised name';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    label: Text(
                      'Price',
                    ),
                    border: OutlineInputBorder(),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  onSaved: (newValue) {
                    _editedProduct = Product(
                      id: _editedProduct.id,
                      title: _editedProduct.title,
                      shortName: _editedProduct.shortName,
                      price: int.parse(newValue as String),
                      shippingFee: _editedProduct.shippingFee,
                      oldPrice: _editedProduct.oldPrice,
                      image: _editedProduct.image,
                      seller: _editedProduct.seller,
                      category: _editedProduct.category,
                      subcategory: _editedProduct.subcategory,
                      description: _editedProduct.description,
                      specification: _editedProduct.specification,
                      colorImages: _editedProduct.colorImages,
                      keyFeatures: _editedProduct.keyFeatures,
                      totalrating: _editedProduct.totalrating,
                    );
                  },
                  validator: (newValue) {
                    if (newValue == null || newValue.isEmpty) {
                      return 'Please enter product price';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    label: Text(
                      'Shipping Fee',
                    ),
                    border: OutlineInputBorder(),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  onSaved: (newValue) {
                    _editedProduct = Product(
                      id: _editedProduct.id,
                      title: _editedProduct.title,
                      shortName: _editedProduct.shortName,
                      price: _editedProduct.price,
                      shippingFee: int.parse(newValue as String),
                      oldPrice: _editedProduct.oldPrice,
                      image: _editedProduct.image,
                      seller: _editedProduct.seller,
                      category: _editedProduct.category,
                      subcategory: _editedProduct.subcategory,
                      description: _editedProduct.description,
                      specification: _editedProduct.specification,
                      colorImages: _editedProduct.colorImages,
                      keyFeatures: _editedProduct.keyFeatures,
                      totalrating: _editedProduct.totalrating,
                    );
                  },
                  validator: (newValue) {
                    if (newValue == null || newValue.isEmpty) {
                      return 'Please enter shipping fee';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: TextFormField(
              //     decoration: const InputDecoration(
              //       label: Text(
              //         'Old Price',
              //       ),
              //       border: OutlineInputBorder(),
              //       errorBorder: OutlineInputBorder(
              //         borderSide: BorderSide(
              //           color: Colors.red,
              //         ),
              //       ),
              //     ),
              //     keyboardType: TextInputType.number,
              //     textInputAction: TextInputAction.next,
              //     onSaved: (newValue) {
              //       _editedProduct = Product(
              //         id: _editedProduct.id,
              //         title: _editedProduct.title,
              //         shortName: _editedProduct.shortName,
              //         price: _editedProduct.price,
              //         shippingFee: _editedProduct.shippingFee,
              //         oldPrice: int.parse(newValue as String),
              //         image: _editedProduct.image,
              //         seller: _editedProduct.seller,
              //         category: _editedProduct.category,
              //         subcategory: _editedProduct.subcategory,
              //         description: _editedProduct.description,
              //         specification: _editedProduct.specification,
              //         colorImages: _editedProduct.colorImages,
              //         keyFeatures: _editedProduct.keyFeatures,
              //         totalrating: _editedProduct.totalrating,
              //       );
              //     },
              //     validator: (newValue) {
              //       if (newValue == null || newValue.isEmpty) {
              //         return 'Please enter old price';
              //       } else {
              //         return null;
              //       }
              //     },
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 10, right: 10),
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Colors.grey,
                        ),
                      ),
                      child: _imageUrlController.text.isEmpty
                          ? const Center(
                              child: Text(
                                'Enter a imageUrl',
                                textAlign: TextAlign.center,
                              ),
                            )
                          : FittedBox(
                              child: Container(
                                color: Colors.white,
                                child: Image.network(
                                  _imageUrlController.text,
                                ),
                              ),
                            ),
                    ),
                    Expanded(
                      flex: 3,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          label: Text(
                            'Image Url',
                          ),
                          border: OutlineInputBorder(),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red,
                            ),
                          ),
                        ),
                        focusNode: _imageUrlfocusNode,
                        controller: _imageUrlController,
                        keyboardType: TextInputType.url,
                        textInputAction: TextInputAction.next,
                        onSaved: (newValue) {
                          _editedProduct = Product(
                            id: _editedProduct.id,
                            title: _editedProduct.title,
                            shortName: _editedProduct.shortName,
                            price: _editedProduct.price,
                            shippingFee: _editedProduct.shippingFee,
                            oldPrice: _editedProduct.oldPrice,
                            image: newValue as String,
                            seller: _editedProduct.seller,
                            category: _editedProduct.category,
                            subcategory: _editedProduct.subcategory,
                            description: _editedProduct.description,
                            specification: _editedProduct.specification,
                            colorImages: _editedProduct.colorImages,
                            keyFeatures: _editedProduct.keyFeatures,
                            totalrating: _editedProduct.totalrating,
                          );
                        },
                        validator: (newValue) {
                          if (newValue == null || newValue.isEmpty) {
                            return 'Please enter Image Url';
                          }
                          if (!newValue.startsWith('http') &&
                              !newValue.startsWith('https')) {
                            return 'Please enter a correct url';
                          }
                          if (!newValue.contains('.jpeg') &&
                              !newValue.contains('.jpg') &&
                              !newValue.contains('.png') &&
                              !newValue.contains('.svg') &&
                              !newValue.contains('.webp') &&
                              !newValue.contains('.apng') &&
                              !newValue.contains('.avif')) {
                            return 'Please enter a valid url';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 100,
                      child: TextFormField(
                        controller: otImageController,
                        decoration: const InputDecoration(
                          label: Text(
                            'OtherImages',
                          ),
                          border: OutlineInputBorder(),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red,
                            ),
                          ),
                        ),
                        textInputAction: TextInputAction.next,
                        onSaved: (newValue) {
                          _editedProduct = Product(
                            id: _editedProduct.id,
                            title: _editedProduct.title,
                            shortName: _editedProduct.shortName,
                            price: _editedProduct.price,
                            shippingFee: _editedProduct.shippingFee,
                            oldPrice: _editedProduct.oldPrice,
                            image: _editedProduct.image,
                            seller: _editedProduct.seller,
                            category: _editedProduct.category,
                            subcategory: _editedProduct.subcategory,
                            description: _editedProduct.description,
                            colorImages: _editedProduct.colorImages,
                            specification: _editedProduct.specification,
                            totalrating: _editedProduct.totalrating,
                            keyFeatures: _editedProduct.keyFeatures,
                            otherImages: [newValue as String],
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            vertical: 15,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            othImages.add(otImageController.text);
                            otImageController.clear();
                          });
                        },
                        child: const Text('Add'),
                      ),
                    )
                  ],
                ),
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (ctx, i) => ListTile(
                  leading: Image.network(
                    othImages[i],
                  ),
                  title: Text(
                    othImages[i],
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      setState(() {
                        othImages.removeWhere(
                          (value) => value == othImages[i],
                        );
                      });
                    },
                    icon: const Icon(Icons.remove),
                  ),
                ),
                itemCount: othImages.length,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    label: Text(
                      'Seller',
                    ),
                    border: OutlineInputBorder(),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                    ),
                  ),
                  textInputAction: TextInputAction.next,
                  onSaved: (newValue) {
                    _editedProduct = Product(
                      id: _editedProduct.id,
                      title: _editedProduct.title,
                      shortName: _editedProduct.shortName,
                      price: _editedProduct.price,
                      shippingFee: _editedProduct.shippingFee,
                      oldPrice: _editedProduct.oldPrice,
                      image: _editedProduct.image,
                      seller: newValue as String,
                      category: _editedProduct.category,
                      subcategory: _editedProduct.subcategory,
                      description: _editedProduct.description,
                      specification: _editedProduct.specification,
                      colorImages: _editedProduct.colorImages,
                      keyFeatures: _editedProduct.keyFeatures,
                      totalrating: _editedProduct.totalrating,
                    );
                  },
                  validator: (newValue) {
                    if (newValue == null || newValue.isEmpty) {
                      return 'Please enter Seller name';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField<String>(
                  items: DDItems,
                  value: categoryValue,
                  onChanged: (newvalue) {
                    setState(() {
                      categoryValue = newvalue!;
                    });
                  },
                  onSaved: (value) {
                    _editedProduct = Product(
                      id: _editedProduct.id,
                      title: _editedProduct.title,
                      shortName: _editedProduct.shortName,
                      price: _editedProduct.price,
                      shippingFee: _editedProduct.shippingFee,
                      oldPrice: _editedProduct.oldPrice,
                      image: _editedProduct.image,
                      seller: _editedProduct.seller,
                      category: [value as String],
                      subcategory: _editedProduct.subcategory,
                      description: _editedProduct.description,
                      specification: _editedProduct.specification,
                      colorImages: _editedProduct.colorImages,
                      keyFeatures: _editedProduct.keyFeatures,
                      totalrating: _editedProduct.totalrating,
                    );
                  },
                  decoration: const InputDecoration(
                    label: Text(
                      'Category',
                    ),
                    border: OutlineInputBorder(),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                    ),
                  ),
                  validator: (newValue) {
                    if (newValue == null || newValue.isEmpty) {
                      return 'Please enter category';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField<String>(
                  items: subDDItems,
                  value: subcategoryValue,
                  onChanged: (newvalue) {
                    setState(() {
                      subcategoryValue = newvalue!;
                    });
                  },
                  onSaved: (value) {
                    _editedProduct = Product(
                      id: _editedProduct.id,
                      title: _editedProduct.title,
                      shortName: _editedProduct.shortName,
                      price: _editedProduct.price,
                      shippingFee: _editedProduct.shippingFee,
                      oldPrice: _editedProduct.oldPrice,
                      image: _editedProduct.image,
                      seller: _editedProduct.seller,
                      category: _editedProduct.category,
                      subcategory: value as String,
                      description: _editedProduct.description,
                      specification: _editedProduct.specification,
                      colorImages: _editedProduct.colorImages,
                      keyFeatures: _editedProduct.keyFeatures,
                      totalrating: _editedProduct.totalrating,
                    );
                  },
                  decoration: const InputDecoration(
                    label: Text(
                      'Subcategory',
                    ),
                    border: OutlineInputBorder(),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                    ),
                  ),
                  validator: (newValue) {
                    if (newValue == null || newValue.isEmpty) {
                      return 'Please enter subcategory';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 100,
                      child: TextFormField(
                        controller: varcontroller,
                        decoration: const InputDecoration(
                          label: Text(
                            'Variations',
                          ),
                          border: OutlineInputBorder(),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red,
                            ),
                          ),
                        ),
                        textInputAction: TextInputAction.next,
                        onSaved: (newValue) {
                          _editedProduct = Product(
                            id: _editedProduct.id,
                            title: _editedProduct.title,
                            shortName: _editedProduct.shortName,
                            price: _editedProduct.price,
                            shippingFee: _editedProduct.shippingFee,
                            oldPrice: _editedProduct.oldPrice,
                            image: _editedProduct.image,
                            seller: _editedProduct.seller,
                            category: _editedProduct.category,
                            subcategory: _editedProduct.subcategory,
                            description: _editedProduct.description,
                            colorImages: [newValue as String],
                            specification: _editedProduct.specification,
                            totalrating: _editedProduct.totalrating,
                            keyFeatures: _editedProduct.keyFeatures,
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            vertical: 15,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            variations.insert(0, varcontroller.text);
                            varcontroller.clear();
                          });
                        },
                        child: const Text('Add'),
                      ),
                    )
                  ],
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemBuilder: (ctx, i) => ListTile(
                  title: Text(
                    variations[i],
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      setState(() {
                        variations.removeWhere(
                          (value) => value == variations[i],
                        );
                      });
                    },
                    icon: Icon(Icons.remove),
                  ),
                ),
                itemCount: variations.length,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    label: Text(
                      'Description',
                    ),
                    border: OutlineInputBorder(),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                    ),
                  ),
                  maxLines: 3,
                  textInputAction: TextInputAction.newline,
                  keyboardType: TextInputType.multiline,
                  onSaved: (newValue) {
                    _editedProduct = Product(
                      id: _editedProduct.id,
                      title: _editedProduct.title,
                      shortName: _editedProduct.shortName,
                      price: _editedProduct.price,
                      shippingFee: _editedProduct.shippingFee,
                      oldPrice: _editedProduct.oldPrice,
                      image: _editedProduct.image,
                      seller: _editedProduct.seller,
                      category: _editedProduct.category,
                      subcategory: _editedProduct.subcategory,
                      description: newValue as String,
                      specification: _editedProduct.specification,
                      colorImages: _editedProduct.colorImages,
                      keyFeatures: _editedProduct.keyFeatures,
                      totalrating: _editedProduct.totalrating,
                    );
                  },
                  validator: (newValue) {
                    if (newValue == null || newValue.isEmpty) {
                      return 'Please enter Description';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    label: Text(
                      'Specifications',
                    ),
                    border: OutlineInputBorder(),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: 3,
                  textInputAction: TextInputAction.newline,
                  onSaved: (newValue) {
                    _editedProduct = Product(
                      id: _editedProduct.id,
                      title: _editedProduct.title,
                      shortName: _editedProduct.shortName,
                      price: _editedProduct.price,
                      shippingFee: _editedProduct.shippingFee,
                      oldPrice: _editedProduct.oldPrice,
                      image: _editedProduct.image,
                      seller: _editedProduct.seller,
                      category: _editedProduct.category,
                      subcategory: _editedProduct.subcategory,
                      description: _editedProduct.description,
                      specification: newValue as String,
                      colorImages: _editedProduct.colorImages,
                      keyFeatures: _editedProduct.keyFeatures,
                      totalrating: _editedProduct.totalrating,
                    );
                  },
                  validator: (newValue) {
                    if (newValue == null || newValue.isEmpty) {
                      return 'Please enter specifications';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    label: Text(
                      'Key features',
                    ),
                    border: OutlineInputBorder(),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: 3,
                  textInputAction: TextInputAction.done,
                  onSaved: (newValue) {
                    _editedProduct = Product(
                      id: _editedProduct.id,
                      title: _editedProduct.title,
                      shortName: _editedProduct.shortName,
                      price: _editedProduct.price,
                      shippingFee: _editedProduct.shippingFee,
                      oldPrice: _editedProduct.oldPrice,
                      image: _editedProduct.image,
                      seller: _editedProduct.seller,
                      category: _editedProduct.category,
                      subcategory: _editedProduct.subcategory,
                      description: _editedProduct.description,
                      specification: _editedProduct.specification,
                      colorImages: variations,
                      keyFeatures: newValue as String,
                      totalrating: _editedProduct.totalrating,
                      otherImages: othImages,
                      isFavourite: _editedProduct.isFavourite,
                      isFlashSale: _editedProduct.isFlashSale,
                      isFreeDelivery: _editedProduct.isFreeDelivery,
                      isRecommended: _editedProduct.isRecommended,
                      isTrending: _editedProduct.isTrending,
                    );
                  },
                  validator: (newValue) {
                    if (newValue == null || newValue.isEmpty) {
                      return 'Please enter key features';
                    } else {
                      return null;
                    }
                  },
                  onFieldSubmitted: (_) => _saveForm(),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 100,
                          vertical: 15,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: _saveForm,
                      child: const Text(
                        'Save product',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        showCustomDialogue(_editedProduct);
                      },
                      child: const Text('Preview'),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
