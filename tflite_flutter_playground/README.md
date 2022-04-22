# tflite_flutter_playground
 -

# References
 - https://github.com/shaqian/flutter_tflite/tree/master
 - https://tfhub.dev
 - https://pub.dev/packages/tflite


# Notes
 -  > Unable to load Maven meta-data from https://google.bintray.com/exoplayer/org/tensorflow/tensorflow-lite/maven-metadata.xml.
   오류 발생 시 해결방법(임시)

   External libraries -> Flutter Plugins
   tflite-1.1.2 -> android -> build.gradle 에서 org.tensorflow:tensorflow-lite 버전을 명시해준다
