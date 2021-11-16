
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'vector_tile_layer.dart';
import 'vector_tile.dart';
import 'raw/raw_vector_tile.dart' as raw;
import 'util/geojson.dart';
import 'util/geometry.dart';
import 'util/command.dart';
import 'package:file_picker/file_picker.dart';


void decodeGeoJsonFeatureCollection() async {
  VectorTile tile = await VectorTile.fromPath(path: 'data/sample-12-3262-1923.pbf');

  GeoJsonFeatureCollection featureCollection = tile.toGeoJson(x: 3262, y: 1923, z: 12);

  print(featureCollection.type); // GeoJsonType.FeatureCollection
  print(featureCollection.features.length); // 12049
}

void decodeForEachGeoJsonType() async {
  VectorTile tile = await VectorTile.fromPath(path: 'data/sample-12-3262-1923.pbf');
  VectorTileLayer layer = tile.layers.firstWhere((layer) => layer.name == 'poi');

  layer.features.forEach((feature) {
    feature.decodeGeometry();

    if (feature.geometryType == GeometryType.Point) {
      var geojson = feature.toGeoJson<GeoJsonPoint>(x: 3262, y: 1923, z: 12);

      print(geojson?.type);
      print(geojson?.properties);
      print(geojson?.geometry?.type);
      print(geojson?.geometry?.coordinates);
      print('\n');
    }

    if (feature.geometryType == GeometryType.MultiPoint) {
      var geojson = feature.toGeoJson<GeoJsonMultiPoint>(x: 3262, y: 1923, z: 12);

      //...
    }

    if (feature.geometryType == GeometryType.LineString) {
      var geojson = feature.toGeoJson<GeoJsonLineString>(x: 3262, y: 1923, z: 12);

      //...
    }

    if (feature.geometryType == GeometryType.MultiLineString) {
      var geojson = feature.toGeoJson<GeoJsonMultiLineString>(x: 3262, y: 1923, z: 12);

      //...
    }

    if (feature.geometryType == GeometryType.Polygon) {
      var geojson = feature.toGeoJson<GeoJsonPolygon>(x: 3262, y: 1923, z: 12);

      //...
    }

    if (feature.geometryType == GeometryType.MultiPolygon) {
      var geojson = feature.toGeoJson<GeoJsonMultiPolygon>(x: 3262, y: 1923, z: 12);

      //...
    }
  });
}

/// Read & Decode given vector tile file
/// Decode raw features to GeoJson format
/// All GeoJsonType was decode one and
/// Then we must use type cast to read each type specific data
void decodeForAllGeoJsonType() async {
  VectorTile tile = await VectorTile.fromPath(path: 'data/sample-12-3262-1923.pbf');
  VectorTileLayer layer = tile.layers.firstWhere((layer) => layer.name == 'poi');

  layer.features.forEach((feature) {
    var geojson = feature.toGeoJson(x: 3262, y: 1923, z: 12);

    if (feature.geometryType == GeometryType.Point) {
      print((geojson as GeoJsonPoint).type);
      print((geojson as GeoJsonPoint).properties);
      print((geojson as GeoJsonPoint).geometry?.type);
      print((geojson as GeoJsonPoint).geometry?.coordinates);
    }

    if (feature.geometryType == GeometryType.MultiPoint) {
      print((geojson as GeoJsonMultiPoint).type);
      print((geojson as GeoJsonMultiPoint).properties);
      print((geojson as GeoJsonMultiPoint).geometry?.type);
      print((geojson as GeoJsonMultiPoint).geometry?.coordinates);
    }

    // Other types ...
  });
}

/// Create & Encode a set of vector tile data from raw format
// void encode() async {
//   var i64_v = Int64();
//   i64_v = 65 as Int64 ;
//   var values = [
//     raw.createVectorTileValue(intValue: (65 as Int64)),
//     raw.createVectorTileValue(stringValue: 'basketball'),
//   ];
//
//   var features = [
//     raw.createVectorTileFeature(
//       id: Int64(31162829580),
//       tags: [0, 0, 1, 1],
//       type: raw.VectorTile_GeomType.POINT,
//       geometry: [9, 8058, 1562],
//     ),
//   ];
//
//   var layers = [
//     raw.createVectorTileLayer(
//       name: 'poi',
//       extent: 4096,
//       version: 2,
//       keys: ['render_height', 'name'],
//       values: values,
//       features: features,
//     ),
//   ];
//
//   var tile = raw.createVectorTile(layers: layers);
//
//   // Save to disk
//   await raw.encodeVectorTile(path: '../gen/tile.pbf', tile: tile);
// }


main() {
  // encode();
  // decodeForEachGeoJsonType();
  runApp(MyApp());
  // decodeGeoJsonFeatureCollection();
}



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter File Upload Example',
      home: MvtSample(),
    );
  }
}
class MvtSample extends StatefulWidget {
  static const title = 'MvtSample';

  @override
  _MvtSampleState createState() => _MvtSampleState();

}



class _MvtSampleState extends State<MvtSample> {

  String state = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter MVT parse Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(state)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          FilePickerResult? result = await FilePicker.platform.pickFiles();
          if(result != null){
            Uint8List? bytes =  result.files.single.bytes;

            VectorTile tile = await VectorTile.fromBytes(bytes: bytes!);
            VectorTileLayer layer = tile.layers.firstWhere((layer) => layer.name == 'poi');

            layer.features.forEach((feature) {
              var geojson = feature.toGeoJson(x: 3262, y: 1923, z: 12);

              if (feature.geometryType == GeometryType.Point) {
                print((geojson as GeoJsonPoint).type);
                print((geojson as GeoJsonPoint).properties);
                print((geojson as GeoJsonPoint).geometry?.type);
                print((geojson as GeoJsonPoint).geometry?.coordinates);
              }

              if (feature.geometryType == GeometryType.MultiPoint) {
                print((geojson as GeoJsonMultiPoint).type);
                print((geojson as GeoJsonMultiPoint).properties);
                print((geojson as GeoJsonMultiPoint).geometry?.type);
                print((geojson as GeoJsonMultiPoint).geometry?.coordinates);
              }

              // Other types ...
            });

          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}