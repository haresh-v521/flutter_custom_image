👉 A versatile Flutter package for displaying images with various sources, including assets, SVGs, and  
network images. The \`ImageViewer\` widget simplifies the integration of different image types,  
providing customization options for dimensions, error handling, and border-radius.

![](https://33333.cdn.cke-cs.com/kSW7V9NHUXugvhoQeFaf/images/30a5c9c3dad26fd7d48d15f0f267064a38acd597435c05a1.png)

**👉 Parameters**

<table><tbody><tr><td>imagePath&nbsp;</td><td>Path to the image, either an asset, SVG, or network URL ✅</td></tr><tr><td>imageType&nbsp;</td><td>Type of the image (ImageType.asset, ImageType.svg, ImageType.network) ✅</td></tr><tr><td>width and height&nbsp;</td><td>Dimensions of the image ❌</td></tr><tr><td>boxFit&nbsp;</td><td>BoxFit for the image ❌</td></tr><tr><td>errorIcon&nbsp;</td><td>Icon to display in case of loading errors ❌</td></tr><tr><td>imageColor&nbsp;</td><td>Color to apply to the image ❌</td></tr><tr><td>alignment&nbsp;</td><td>Alignment of the image within its container ❌&nbsp;</td></tr><tr><td><p>topLeftRadius,&nbsp;</p><p>topRightRadius,&nbsp;</p><p>bottomLeftRadius,&nbsp;</p><p>bottomRightRadius</p></td><td>Border radiius for clipping ❌</td></tr></tbody></table>

👉 **Show me the code 👀**

```Dart
enum ImageType { asset, svg, network }
ImageViewer(
  imagePath: 'your_image_path',
  imageType: ImageType.asset, // Change to your desired ImageType
  // Add other optional parameters for customization
)
```

```Dart
class MenuExample extends StatefulWidget {
  @override
  _MenuExampleState createState() => _MenuExampleState();
}
class _MenuExampleState extends State<MenuExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ImageViewer(
          imagePath: 'http://via.placeholder.com/200x200',
          imageType: ImageType.network,
          width: 200,
          height: 200,
          boxFit: BoxFit.cover,
          errorIcon: Icons.error_outline,
          errorIconColor: Colors.blueGrey,
          imageColor: Colors.blue,
          alignment: Alignment.center,
          topLeftRadius: 10,
          topRightRadius: 20,
          bottomLeftRadius: 30,
          bottomRightRadius: 40,
        ),
      ),
    );
  }
}
```