import 'package:flutter/material.dart';

import '../models/category.dart';
import '../models/sub_categories.dart';

class Category with ChangeNotifier {
  final List<CategoryModel> CATEGORIES = [
    CategoryModel(
      id: 'c1',
      title: 'Electronics',
      image:
          'https://thumbs.dreamstime.com/b/electronics-store-rgb-color-icon-household-equipment-online-shop-category-small-major-domestic-appliance-cooking-devices-187269649.jpg',
      subcategory: [
        SubCategory(
          id: 'sc1',
          title: 'Speakers',
          parentCategory: 'c1',
          image: 'assets/images/woman.jpg',
          subsubcat: [
            SubSubCategory(
              id: 'ssc1',
              title: 'Portable speakers',
              parentCategory: 'Television and Video',
              image:
                  'https://www-konga-com-res.cloudinary.com/w_850,f_auto,fl_lossy,dpr_auto,q_auto/media/catalog/product/L/G/174465_1604077179.jpg',
            ),
            SubSubCategory(
              id: 'ssc3',
              title: 'Bookshelf Speakers',
              parentCategory: 'Television and Video',
              image:
                  'https://m.media-amazon.com/images/I/51N0VF1L7uL._AC_SY355_.jpg',
            ),
            SubSubCategory(
              id: 'ssc4',
              title: 'Computer Speakers',
              parentCategory: 'Home Audio',
              image:
                  'https://m.media-amazon.com/images/I/51FIHrfR6tL._AC_SY355_.jpg',
            ),
            SubSubCategory(
              id: 'ssc3',
              title: 'Combination Speakers',
              parentCategory: 'Television and Video',
              image:
                  'https://m.media-amazon.com/images/I/51KyHLtu0+L._AC_UY218_.jpg',
            ),
            SubSubCategory(
              id: 'ssc3',
              title: 'Subwoofer',
              parentCategory: 'Television and Video',
              image:
                  'https://m.media-amazon.com/images/I/71-ANtltMLL._AC_UY218_.jpg',
            ),
            SubSubCategory(
              id: 'ssc3',
              title: 'Outdoor Speakers',
              parentCategory: 'Television and Video',
              image:
                  'https://m.media-amazon.com/images/I/81cIOsAELHL._AC_UY218_.jpg',
            ),
            SubSubCategory(
              id: 'ssc3',
              title: 'In_ceiling Speakers',
              parentCategory: 'Television and Video',
              image:
                  'https://m.media-amazon.com/images/I/810GMcAtlbL._AC_UY218_.jpg',
            ),
          ],
        ),
        SubCategory(
          id: 'sc2',
          title: 'Home Audio & Video',
          parentCategory: 'c2',
          image: 'assets/images/woman.jpg',
          subsubcat: [
            SubSubCategory(
              id: 'ssc1',
              title: 'DVD & VCD Player',
              parentCategory: 'Television and Video',
              image:
                  'https://m.media-amazon.com/images/I/51q1i-cgVWL._AC_UY218_.jpg',
            ),
            SubSubCategory(
              id: 'ssc3',
              title: 'LED Television',
              parentCategory: 'Television and Video',
              image:
                  'https://m.media-amazon.com/images/I/812wiz16nlL._AC_UY218_.jpg',
            ),
            SubSubCategory(
              id: 'ssc3',
              title: 'Home Theater System',
              parentCategory: 'Television and Video',
              image:
                  'https://m.media-amazon.com/images/I/51y6a-flEgL._AC_UY218_.jpg',
            ),
            SubSubCategory(
              id: 'ssc4',
              title: 'HDD player',
              parentCategory: 'Home Audio',
              image:
                  'https://m.media-amazon.com/images/I/61bDVszrMVL._AC_UY218_.jpg',
            ),
            SubSubCategory(
              id: 'ssc4',
              title: 'Portable TV',
              parentCategory: 'Home Audio',
              image:
                  'https://m.media-amazon.com/images/I/61c9FWkmeHS._AC_UY218_.jpg',
            ),
            SubSubCategory(
              id: 'ssc4',
              title: 'Projectors',
              parentCategory: 'Home Audio',
              image:
                  'https://m.media-amazon.com/images/I/61+CDKTXYgL._AC_UY218_.jpg',
            ),
          ],
        ),
        SubCategory(
          id: 'sc3',
          title: 'Wearable Devices',
          parentCategory: 'c1',
          image: 'assets/images/woman.jpg',
          subsubcat: [
            SubSubCategory(
              id: 'ssc1',
              title: 'Smart Watch',
              parentCategory: 'Television and Video',
              image:
                  'https://m.media-amazon.com/images/I/61efXD7PWzL._AC_UY218_.jpg',
            ),
            SubSubCategory(
              id: 'ssc3',
              title: 'Smart Asseccories',
              parentCategory: 'Television and Video',
              image:
                  'https://m.media-amazon.com/images/I/61wgN8XSLOL._AC_UL320_.jpg',
            ),
            SubSubCategory(
              id: 'ssc4',
              title: 'Smart Wristbands',
              parentCategory: 'Home Audio',
              image:
                  'https://m.media-amazon.com/images/I/61UZ41QdbCL._AC_UY218_.jpg',
            ),
            SubSubCategory(
              id: 'ssc4',
              title: 'Smart Activity Tracker',
              parentCategory: 'Home Audio',
              image:
                  'https://m.media-amazon.com/images/I/41WpqIvJWRL._AC_UY218_.jpg',
            ),
          ],
        ),
        SubCategory(
          id: 'sc4',
          title: 'Generator and Portable Power',
          parentCategory: 'c2',
          image: 'assets/images/woman.jpg',
          subsubcat: [
            SubSubCategory(
              id: 'ssc1',
              title: 'Generators',
              parentCategory: 'Generators',
              image:
                  'https://m.media-amazon.com/images/I/81WO1jafMpL._AC_UY218_.jpg',
            ),
            SubSubCategory(
              id: 'ssc3',
              title: 'Batteries',
              parentCategory: 'Television and Video',
              image:
                  'https://m.media-amazon.com/images/I/81e3IkSQU3L._AC_UL320_.jpg',
            ),
            SubSubCategory(
              id: 'ssc4',
              title: 'Solar',
              parentCategory: 'Home Audio',
              image:
                  'https://m.media-amazon.com/images/I/61TunE+k0sL._AC_UL320_.jpg',
            ),
          ],
        ),
      ],
    ),
    CategoryModel(
      id: 'c2',
      title: 'Musical Instruments',
      image:
          'https://thumbs.dreamstime.com/b/tambourine-vector-illustration-isolated-white-background-eps-file-36498627.jpg',
      subcategory: [],
    ),
    CategoryModel(
      id: 'c3',
      title: 'Computing',
      image:
          'https://png.pngtree.com/png-vector/20190629/ourlarge/pngtree-personal-computer-icon-for-your-project-png-image_1521864.jpg',
      subcategory: [],
    ),
    CategoryModel(
      id: 'c4',
      title: 'Home & Office',
      image:
          'https://cdn3.iconfinder.com/data/icons/home-decoration-flat-outline-house-interior/512/Home_Office-512.png',
      subcategory: [],
    ),
    CategoryModel(
      id: 'c5',
      title: 'Auto-Mobile',
      image:
          'https://cdn0.iconfinder.com/data/icons/shopping-category-vol-1/64/SHOPPING_CAT-EXPANDED-MBE-64_car-512.png',
      subcategory: [
        SubCategory(
          id: 'sc1',
          title: 'Car Lights',
          parentCategory: 'c1',
          image: 'assets/images/woman.jpg',
          subsubcat: [
            SubSubCategory(
              id: 'ssc1',
              title: 'Decorative Lamp',
              parentCategory: 'Television and Video',
              image:
                  'https://media.takealot.com/covers_images/8f0eb195f3314a86b6808fd344cc1dd1/s-pdpxl.file',
            ),
            SubSubCategory(
              id: 'ssc3',
              title: 'Car Light Accessories',
              parentCategory: 'Television and Video',
              image:
                  'https://www.autoguide.com/blog/wp-content/uploads/2018/05/61zkzxDuR8L._SY355_.jpg',
            ),
            SubSubCategory(
              id: 'ssc4',
              title: 'Car Headlight Bulbs(LED)',
              parentCategory: 'Home Audio',
              image:
                  'https://image.made-in-china.com/2f0j00yapRDqvPqfbY/T8-Automotive-LED-Headlight-H7-Auto-Bulb-6500K-LED-Lighting-8000lm-Car-Lamp-60W-LED-Headlight-Bulbs.jpg',
            ),
            SubSubCategory(
              id: 'ssc3',
              title: 'Wire',
              parentCategory: '',
              image:
                  'https://m.media-amazon.com/images/I/41ecV3ok6jL._AC_SX450_.jpg',
            ),
            SubSubCategory(
              id: 'ssc3',
              title: 'Shell',
              parentCategory: '',
              image:
                  'https://static-01.daraz.com.bd/p/1a52c33deb8cdd2d83a48faa535ad53b.jpg',
            ),
            SubSubCategory(
              id: 'ssc3',
              title: 'Base',
              parentCategory: 'Television and Video',
              image:
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_r404ktpLx-ABdmScdNB_3yVUDrGAzCmWSZNEO3NZ9ph25jQkPuEDvElPc8GANbB1-Og&usqp=CAU',
            ),
            SubSubCategory(
              id: 'ssc3',
              title: 'Signal Lamp',
              parentCategory: '',
              image:
                  'https://w7.pngwing.com/pngs/824/48/png-transparent-car-headlight-assembly-headlight-car-light-free-stock-png.png',
            ),
          ],
        ),
        SubCategory(
          id: 'sc2',
          title: 'Car Repair Tools',
          parentCategory: 'c2',
          image: 'assets/images/woman.jpg',
          subsubcat: [
            SubSubCategory(
              id: 'ssc1',
              title: 'Car Body Repair Tool',
              parentCategory: 'Television and Video',
              image:
                  'https://cdn.ready-market.com/106/2f12601a//Templates/pic/Auto_Body_Repair_Tool.jpg?v=26b9a532',
            ),
            SubSubCategory(
              id: 'ssc3',
              title: 'Sheer Metal Tools',
              parentCategory: '',
              image:
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIPCtLHlZ6O6E-YIgNXk27rB303OxdJOUZoAbJKRKeFhMb5yMuRCLNOUNqTtHzgktZDYw&usqp=CAU',
            ),
            SubSubCategory(
              id: 'ssc3',
              title: 'Tire Repair And Installation Tools',
              parentCategory: 'Television and Video',
              image:
                  'https://carfromjapan.com/wp-content/uploads/2017/03/tire-repair-tools-1.jpg',
            ),
            SubSubCategory(
              id: 'ssc4',
              title: 'Car Inspection tools',
              parentCategory: 'Home Audio',
              image:
                  'https://garagedreams.net/wp-content/uploads/2020/12/Best-OBD2-scanner-for-car-inspection.jpg',
            ),
            SubSubCategory(
              id: 'ssc4',
              title: 'Diagnosis Tools',
              parentCategory: 'Home Audio',
              image:
                  'https://obddiagnostic.co.uk/wp-content/uploads/2020/01/ia_2200001559.jpg',
            ),
            SubSubCategory(
              id: 'ssc4',
              title: 'Car Engine and Transmission',
              parentCategory: 'Home Audio',
              image:
                  'https://img1.cgtrader.com/items/1830324/7abbd49ca1/large/car-engine-with-transmission-3d-model-max.jpg',
            ),
            SubSubCategory(
              id: 'ssc5',
              title: 'Filling Equipment',
              parentCategory: 'Television and Video',
              image:
                  'https://image.made-in-china.com/202f0j00TKSWYsHRCLcO/R1234yf-AC-Gas-Recovery-and-Filling-Machine-for-Car-AC-Recovery-Machine.jpg',
            ),
            SubSubCategory(
              id: 'ssc6',
              title: 'Car Battery, Tester, Charging',
              parentCategory: 'Television and Video',
              image: 'https://m.media-amazon.com/images/I/411xbOOAEGL.jpg',
            ),
          ],
        ),
        SubCategory(
          id: 'sc3',
          title: 'Car Electronics',
          parentCategory: 'c1',
          image: 'assets/images/woman.jpg',
          subsubcat: [
            SubSubCategory(
              id: 'ssc1',
              title: 'Alarm Systems & Security',
              parentCategory: 'Television and Video',
              image:
                  'https://ae01.alicdn.com/kf/HTB1wZiaNFXXXXXfXpXXq6xXFXXXz/Universal-Car-Alarm-System-Auto-Central-Locking-Security-Remote-System-Keyless-Entry-Remote-Control-PKE-Car.jpg',
            ),
            SubSubCategory(
              id: 'ssc3',
              title: 'Jump Starter',
              parentCategory: 'Television and Video',
              image:
                  'https://www.u-buy.com.ng/productimg/?image=aHR0cHM6Ly9tLm1lZGlhLWFtYXpvbi5jb20vaW1hZ2VzL0kvNjE2NmlaNU1jK0wuX0FDX1NMMTUwMF8uanBn.jpg',
            ),
            SubSubCategory(
              id: 'ssc4',
              title: 'Battery Jump Cable',
              parentCategory: 'Home Audio',
              image:
                  'https://5.imimg.com/data5/BR/TS/MY-18770462/battery-jumper-cable-set-500x500.jpg',
            ),
            SubSubCategory(
              id: 'ssc4',
              title: 'Car Video Surveillance',
              parentCategory: 'Home Audio',
              image:
                  'https://ae01.alicdn.com/kf/HTB1KXy1fyCYBuNkHFCcq6AHtVXaM/SQ9-Mini-Camera-1080P-HD-Portable-Motion-Sensor-Recording-Camcorder-IR-Night-Vision-Car-DVR-Home.jpg',
            ),
            SubSubCategory(
              id: 'ssc5',
              title: 'GPS & Accessories',
              parentCategory: 'Television and Video',
              image:
                  'https://ae01.alicdn.com/kf/H136666677dca429b913a5df9489eb550g/Vehicle-GPS-GSM-Module-Tracking-Car-Sharing-System-Tracker.jpg_Q90.jpg_.webp',
            ),
            SubSubCategory(
              id: 'ssc6',
              title: 'Subwoofers',
              parentCategory: 'Television and Video',
              image:
                  'https://www.u-buy.com.ng/productimg/?image=aHR0cHM6Ly9pbWFnZXMtbmEuc3NsLWltYWdlcy1hbWF6b24uY29tL2ltYWdlcy9JLzcxNHZWNHB3OUpMLl9TUzQwMF8uanBn.jpg',
            ),
            SubSubCategory(
              id: 'ssc7',
              title: 'Car Radio',
              parentCategory: 'Home Audio',
              image:
                  'https://www.hificorp.co.za/media/catalog/product/cache/7ce9addd40d23ee411c2cc726ad5e7ed/1/0/10112673_hfc_d34a.jpg',
            ),
            SubSubCategory(
              id: 'ssc8',
              title: 'Amplifiers',
              parentCategory: 'Home Audio',
              image:
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZ4vEFNRUuod-w-ciKL9OhfpC3O8QmKrySgQ&usqp=CAU',
            ),
            SubSubCategory(
              id: 'ssc9',
              title: 'Speakers',
              parentCategory: 'Television and Video',
              image:
                  'https://m.media-amazon.com/images/I/910KpRA7TkL._AC_SL1500_.jpg',
            ),
            SubSubCategory(
              id: 'ssc10',
              title: 'Equalizers',
              parentCategory: 'Television and Video',
              image:
                  'https://www.u-buy.com.ng/productimg/?image=aHR0cHM6Ly9tLm1lZGlhLWFtYXpvbi5jb20vaW1hZ2VzL0kvNDFnbjVzT2h4OEwuX1NTNDAwXy5qcGc.jpg',
            ),
            SubSubCategory(
              id: 'ssc11',
              title: 'Car Audio',
              parentCategory: 'Home Audio',
              image:
                  'https://5.imimg.com/data5/VY/NE/MY-49853734/car-audio-system-500x500.jpg',
            ),
            SubSubCategory(
              id: 'ssc12',
              title: 'Car Video Player',
              parentCategory: 'Home Audio',
              image:
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQllCDRbNul5GLEDnvqfSLEg7LcpylHuMfkKWFHM6f9WQjaAXbVOvt8IsKFaADOtv2nKN8&usqp=CAU',
            ),
          ],
        ),
        SubCategory(
          id: 'sc4',
          title: 'Car Wash & Maintainance',
          parentCategory: 'c2',
          image: 'assets/images/woman.jpg',
          subsubcat: [
            SubSubCategory(
              id: 'ssc1',
              title: 'Polishing Machine',
              parentCategory: 'Generators',
              image:
                  'https://ae01.alicdn.com/kf/U61d95d9af2474f19b3299da5ddaa6965W/1200W-1580W-220V-Electric-Polishing-Machine-Car-Polisher-Polish-Grinder-Polisher-Nail-Power-ToolsAutomobile-Furniture-Polishing.jpg_Q90.jpg_.webp',
            ),
            SubSubCategory(
              id: 'ssc3',
              title: 'Paint & Window Repair Tools',
              parentCategory: 'Television and Video',
              image:
                  'https://imgaz1.staticbg.com/thumb/large/oaupload/ser1/banggood/images/71/36/01280db3-38e5-4873-8fe4-643713daf7f8.jpg',
            ),
            SubSubCategory(
              id: 'ssc4',
              title: 'Interior care',
              parentCategory: 'Home Audio',
              image:
                  'https://www-konga-com-res.cloudinary.com/w_auto,f_auto,fl_lossy,dpr_auto,q_auto/media/catalog/product/F/Z/188421_1649072880.jpg',
            ),
            SubSubCategory(
              id: '',
              title: 'Car Wash Accesories',
              parentCategory: 'Television and Video',
              image:
                  'https://www.detailxperts.net/wp-content/uploads/2017/01/HOL121-2-300x300.jpg',
            ),
            SubSubCategory(
              id: '',
              title: 'Clean & Care Fluid',
              parentCategory: 'Television and Video',
              image:
                  'https://www.supercheapauto.com.au/dw/image/v2/BBRV_PRD/on/demandware.static/-/Sites-srg-internal-master-catalog/default/dw9aa1c8a4/images/104054/SCA_104054_hi-res.jpg?sw=558&sh=558&sm=fit',
            ),
            SubSubCategory(
              id: '',
              title: 'Chassis & Tire Care',
              parentCategory: 'Home Audio',
              image:
                  'http://atlas-content-cdn.pixelsquid.com/stock-images/car-chassis-QJGa4x1-600.jpg',
            ),
            SubSubCategory(
              id: '',
              title: 'Window Repair',
              parentCategory: 'Home Audio',
              image:
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSlHrLQlXZ2gOyy3NpFW2n2DEezlmsOYZ9frQ&usqp=CAU',
            ),
            SubSubCategory(
              id: '',
              title: 'Paint Care',
              parentCategory: 'Television and Video',
              image:
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBy_Xb4NWif3qnqk3WhKqX0kz8_NFDxLe0Vv5heG4byeizWhufb40tV0GtNgFy4Qhsn4o&usqp=CAU',
            ),
            SubSubCategory(
              id: '',
              title: 'Engine care',
              parentCategory: 'Television and Video',
              image:
                  'https://www.briggsandstratton.com/content/dam/briggsandstratton/eu/en_gb/Images/Products/Care%20Products/EngineCareKits/Engine-Care-450Series.jpg',
            ),
            SubSubCategory(
              id: '',
              title: 'Rust Remover',
              parentCategory: 'Home Audio',
              image:
                  'https://www-konga-com-res.cloudinary.com/w_auto,f_auto,fl_lossy,dpr_auto,q_auto/media/catalog/product/N/F/155247_1635917356.jpg',
            ),
            SubSubCategory(
              id: '',
              title: 'Car Washer',
              parentCategory: 'Home Audio',
              image:
                  'https://images.yaoota.com/cl2TNL9XN3DTQ9gzX6qlZ-ekwVw=/trim/yaootaweb-production-ke/media/crawledproductimages/25a158850b2653d6936df4ccaf80fab29fb989ed.jpg',
            ),
          ],
        ),
        SubCategory(
          id: 'sc4',
          title: 'Exterior Accessories',
          parentCategory: 'c2',
          image: 'assets/images/woman.jpg',
          subsubcat: [
            SubSubCategory(
              id: 'ssc1',
              title: 'Sunshades',
              parentCategory: 'Generators',
              image:
                  'https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1624550721-sun-shade-gallery-5-1624550714.jpg',
            ),
            SubSubCategory(
              id: 'ssc3',
              title: 'Side Mirrow Folding Kit',
              parentCategory: 'Television and Video',
              image:
                  'https://sc04.alicdn.com/kf/UTB8SwHov22JXKJkSanrq6y3lVXaG.jpg',
            ),
            SubSubCategory(
              id: 'ssc4',
              title: 'Awnings & Shelters',
              parentCategory: 'Home Audio',
              image:
                  'https://image.made-in-china.com/202f0j00GTFRSAEzIgrY/Garage-Car-Awnings-Shelter-Tent-Covers-Chinese-Supply.jpg',
            ),
            SubSubCategory(
              id: '',
              title: 'Car Stickers',
              parentCategory: 'Television and Video',
              image:
                  'https://st.depositphotos.com/2468871/2827/v/600/depositphotos_28277693-stock-illustration-car-stickers-flame.jpg',
            ),
            SubSubCategory(
              id: 'ssc3',
              title: 'Solar Protection Foils',
              parentCategory: 'Television and Video',
              image:
                  'https://kevcce.com/wp-content/uploads/2022/03/Solar-Protection-Foils1-1.jpg',
            ),
            SubSubCategory(
              id: 'ssc4',
              title: 'License Plates',
              parentCategory: 'Home Audio',
              image:
                  'https://sep.yimg.com/ay/licenseplateframes/mercedes-license-plates-18.gif',
            ),
            SubSubCategory(
              id: 'ssc4',
              title: 'Car Covers',
              parentCategory: 'Home Audio',
              image:
                  'https://www.u-buy.com.ng/productimg/?image=aHR0cHM6Ly9tLm1lZGlhLWFtYXpvbi5jb20vaW1hZ2VzL0kvNjFzUzdQaXA1VkwuX0FDX1NMMTAwMV8uanBn.jpg',
            ),
            SubSubCategory(
              id: 'ssc4',
              title: 'Reflective Strips',
              parentCategory: 'Home Audio',
              image:
                  'https://www.u-buy.com.ng/productimg/?image=aHR0cHM6Ly9tLm1lZGlhLWFtYXpvbi5jb20vaW1hZ2VzL0kvODFKZVByMnYwNVMuX1NMMTUwMF8uanBn.jpg',
            ),
          ],
        ),
        SubCategory(
          id: 'sc4',
          title: 'Interior Accessories',
          parentCategory: 'c2',
          image: 'assets/images/woman.jpg',
          subsubcat: [
            SubSubCategory(
              id: 'ssc1',
              title: 'Neck Pillow',
              parentCategory: 'Generators',
              image:
                  'https://media.istockphoto.com/photos/blue-neck-pillows-isolated-on-white-background-picture-id819481854?k=20&m=819481854&s=612x612&w=0&h=_GWHOzTXJUsOPEYwmgihlzdHq3bC7jTrujYuy58i-gY=',
            ),
            SubSubCategory(
              id: 'ssc4',
              title: 'Waterproof Umbrella Set',
              parentCategory: 'Home Audio',
              image:
                  'https://lzd-img-global.slatic.net/g/p/7be06cf0299d76e4f499cb334aefa587.jpg_2200x2200q80.jpg_.webp',
            ),
            SubSubCategory(
              id: 'ssc4',
              title: 'Car Anti_dirty Pad',
              parentCategory: 'Home Audio',
              image:
                  'https://i5.walmartimages.com/asr/58ae744b-c9f1-43f2-a2a0-de212d2dbeca.c271916dc1ae77aa15d778593ec75a3d.jpeg',
            ),
            SubSubCategory(
              id: 'ssc4',
              title: 'Driver Googles',
              parentCategory: 'Home Audio',
              image:
                  'https://images.yaoota.com/s-c4pArGQIRMGDiLn55o73VKegs=/trim/yaootaweb-production-ng/media/crawledproductimages/50afbd2b7f554235fa28158aa798b86cd3a42bd9.jpg',
            ),
            SubSubCategory(
              id: 'ssc4',
              title: 'Tissue Boxes',
              parentCategory: 'Home Audio',
              image:
                  'https://hq2.recyclist.co/wp-content/uploads/sites/2/2015/02/tissuebox-300x300.jpg',
            ),
            SubSubCategory(
              id: 'ssc4',
              title: 'Automotive Interior Stickers',
              parentCategory: 'Home Audio',
              image:
                  'https://i5.walmartimages.com/asr/6a2de09d-3b4f-46e2-96a4-fad21df75a7b_1.cfe2ea80339c7e4b545c4cc28761fe61.jpeg?odnHeight=450&odnWidth=450&odnBg=ffffff',
            ),
            SubSubCategory(
              id: 'ssc4',
              title: 'Car Ashtray',
              parentCategory: 'Home Audio',
              image:
                  'https://5.imimg.com/data5/EB/XH/MY-12342495/car-ashtray-car-cup-holder-ash-tray-with-blue-led-light-500x500.jpg',
            ),
            SubSubCategory(
              id: 'ssc4',
              title: 'Interior Mirror',
              parentCategory: 'Home Audio',
              image:
                  'https://www.u-buy.com.ng/productimg/?image=aHR0cHM6Ly9pNS53YWxtYXJ0aW1hZ2VzLmNvbS9hc3IvMzZlZDUxZjAtOGM1Mi00N2Y1LTg3NWItZjZiODJhYTY2M2NjLjYyNDM4ODM0NTgxZWY2MzY5MGJhMjVhOWFjNmNkYjZlLmpwZWc.jpg',
            ),
            SubSubCategory(
              id: 'ssc4',
              title: 'handBreak Grips',
              parentCategory: 'Home Audio',
              image:
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS9626GPil8XFksBurNPRePH2b2w4WW94TltD8lUoDDNa3odzoZBAreseDT0aBz8-1UxXI&usqp=CAU',
            ),
            SubSubCategory(
              id: 'ssc4',
              title: 'Seat Belts & Paddings',
              parentCategory: 'Home Audio',
              image:
                  'https://m.media-amazon.com/images/I/41WpqIvJWRL._AC_UY218_.jpg',
            ),
            SubSubCategory(
              id: 'ssc4',
              title: 'Sterring Cover',
              parentCategory: 'Home Audio',
              image:
                  'https://4.imimg.com/data4/FY/VF/MY-12251084/steering-covers--500x500.jpg',
            ),
            SubSubCategory(
              id: 'ssc4',
              title: 'Seat Support',
              parentCategory: 'Home Audio',
              image:
                  'https://m.media-amazon.com/images/I/51jlg6xxfOL._AC_SS450_.jpg',
            ),
          ],
        ),
        SubCategory(
          id: 'sc4',
          title: 'Auto Replacement Parts',
          parentCategory: 'c2',
          image: 'assets/images/woman.jpg',
          subsubcat: [
            SubSubCategory(
              id: 'ssc1',
              title: 'Fuel Supply System',
              parentCategory: 'Generators',
              image:
                  'https://5.imimg.com/data5/AC/CC/MY-8205701/diesel-injector-cleaner-500x500.jpg',
            ),
            SubSubCategory(
              id: 'ssc3',
              title: 'Charginig and Starting systems',
              parentCategory: 'Television and Video',
              image:
                  'https://ae01.alicdn.com/kf/Sae7691145361492790664208668d5de6I/39800mAh-Car-Jump-Starter-Power-Bank-Portable-Car-Battery-Booster-Charger-12V-Starting-Device-Auto-Emergency.jpg_220x220xz.jpg_.webp',
            ),
            SubSubCategory(
              id: 'ssc4',
              title: 'Suspension & Steering',
              parentCategory: 'Home Audio',
              image:
                  'https://www.exaltdautomotive.com.au/wp-content/uploads/2018/07/steering-and-suspension.jpg',
            ),
            SubSubCategory(
              id: 'ssc4',
              title: 'Glasses & Windows',
              parentCategory: 'Home Audio',
              image:
                  'https://image.made-in-china.com/202f0j00OgefRLIqhbok/Customized-Wholesale-Windshield-Auto-Glass-Car-Window-Glass.jpg',
            ),
            SubSubCategory(
              id: 'ssc4',
              title: 'Air Intake System',
              parentCategory: 'Home Audio',
              image:
                  'https://ng.jumia.is/unsafe/fit-in/680x680/filters:fill(white)/product/66/487248/1.jpg?9182',
            ),
            SubSubCategory(
              id: 'ssc4',
              title: 'Lubrication System',
              parentCategory: 'Home Audio',
              image:
                  'https://s.alicdn.com/@sc04/kf/Hb883fe604a844496bd422811db4cb0c9a.jpg_300x300.jpg',
            ),
            SubSubCategory(
              id: 'ssc4',
              title: 'Wheels Tire & Parts',
              parentCategory: 'Home Audio',
              image:
                  'https://www.u-buy.com.ng/productimg/?image=aHR0cHM6Ly9tLm1lZGlhLWFtYXpvbi5jb20vaW1hZ2VzL0kvNjFNeVFzZm5ncUwuX0FDX1NMMTUwMF8uanBn.jpg',
            ),
            SubSubCategory(
              id: 'ssc4',
              title: 'Ignition System',
              parentCategory: 'Home Audio',
              image:
                  'https://e7.pngegg.com/pngimages/812/279/png-clipart-electronic-component-car-ignition-coil-ignition-system-electromagnetic-coil-car-electronics-car.png',
            ),
            SubSubCategory(
              id: 'ssc4',
              title: 'Gaskets',
              parentCategory: 'Home Audio',
              image:
                  'http://www.autorepairkey.com/wp-content/uploads/2011/01/head-gasket.jpg',
            ),
            SubSubCategory(
              id: 'ssc4',
              title: 'Nuts & Bolts',
              parentCategory: 'Home Audio',
              image:
                  'https://trustmygarage.files.wordpress.com/2013/05/nuts-and-bolts.jpg',
            ),
            SubSubCategory(
              id: 'ssc4',
              title: 'Engine',
              parentCategory: 'Home Audio',
              image:
                  'https://media.istockphoto.com/photos/system-of-internal-combustion-engine-isolated-on-white-background-3d-picture-id1050236216?k=20&m=1050236216&s=612x612&w=0&h=cVF7uqJkClc0HGyqrC5VEzvx4ilQhHpEAtpd1QruUn8=',
            ),
            SubSubCategory(
              id: 'ssc4',
              title: 'Fuses',
              parentCategory: 'Home Audio',
              image:
                  'https://evea-kartmasters.fr/5464-large_default/automotive-fuse-32v-ato-type.jpg',
            ),
            SubSubCategory(
              id: 'ssc4',
              title: 'Break System',
              parentCategory: 'Home Audio',
              image:
                  'https://i0.wp.com/studentlesson.com/wp-content/uploads/2020/09/working-of-automotive-brake-system.jpeg?resize=273%2C300&ssl=1',
            ),
            SubSubCategory(
              id: 'ssc4',
              title: 'Exhaust Systems',
              parentCategory: 'Home Audio',
              image:
                  'https://ng.jumia.is/unsafe/fit-in/680x680/filters:fill(white)/product/82/247248/7.jpg?8673',
            ),
          ],
        ),
      ],
    ),
    CategoryModel(
      id: 'c6',
      title: 'Books',
      image:
          'https://png.pngtree.com/png-clipart/20190520/original/pngtree-books-icon-design-vector-png-image_3664722.jpg',
      subcategory: [],
    ),
    CategoryModel(
      id: 'c7',
      title: 'Shoes',
      image:
          'https://png.pngtree.com/png-clipart/20210308/original/pngtree-original-running-shoes-marathon-sports-shoes-png-image_5757916.jpg',
      subcategory: [],
    ),
    CategoryModel(
      id: 'c8',
      title: 'Building',
      image:
          'https://www.wanderglobe.org/wp-content/uploads/2019/10/Construction-Materials-Are-Used-for-Buildings.jpg',
      subcategory: [],
    ),
    CategoryModel(
      id: 'c9',
      title: 'Groceries',
      image:
          'https://as1.ftcdn.net/v2/jpg/01/26/38/04/1000_F_126380465_rAZupXcY0zXdin6wR3bGjV7V4z04XvXE.jpg',
      subcategory: [],
    ),
    CategoryModel(
      id: 'c10',
      title: 'Accesories',
      image:
          'https://thumbs.dreamstime.com/b/leather-accessories-black-glyph-icon-men-women-stylish-garment-online-store-shopping-mall-category-bags-belts-silhouette-187269731.jpg',
      subcategory: [],
    ),
  ];
}
