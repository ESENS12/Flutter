import 'raw/raw_vector_tile.dart' as raw;
import 'vector_tile_geom_type.dart';
import 'vector_tile_feature.dart';
import 'vector_tile_value.dart';

class VectorTileLayer {
  String name;
  int extent;
  int version;
  List<String> keys;
  List<VectorTileValue> values;
  List<VectorTileFeature> features;

  VectorTileLayer({
    required this.name,
    required this.extent,
    required this.version,
    required this.keys,
    required this.values,
    required this.features,
  });

  static VectorTileLayer fromRaw({required raw.VectorTile_Layer rawLayer}) {
    List<VectorTileValue> values = rawLayer.values.map((value) {
      return VectorTileValue(
        stringValue: value.hasStringValue() ? value.stringValue : null,
        floatValue: value.hasFloatValue() ? value.floatValue : null,
        doubleValue: value.hasDoubleValue() ? value.doubleValue : null,
        intValue: value.hasIntValue() ? value.intValue : null,
        uintValue: value.hasUintValue() ? value.uintValue : null,
        sintValue: value.hasSintValue() ? value.sintValue : null,
        boolValue: value.hasBoolValue() ? value.boolValue : null,
      );
    }).toList();
    List<VectorTileFeature> features = rawLayer.features.map((feature) {
      return VectorTileFeature(
        id: feature.id,
        tags: feature.tags,
        type: VectorTileGeomTypeExtension.fromRaw(feature.type),
        geometryList: feature.geometry,
        extent: rawLayer.extent,
        keys: rawLayer.keys,
        values: values,
      );
    }).toList();

    return VectorTileLayer(
      name: rawLayer.name,
      extent: rawLayer.extent,
      version: rawLayer.version,
      keys: rawLayer.keys,
      values: values,
      features: features,
    );
  }
}
