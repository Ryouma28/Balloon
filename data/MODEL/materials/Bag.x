xof 0302txt 0064
template Header {
 <3D82AB43-62DA-11cf-AB39-0020AF71E433>
 WORD major;
 WORD minor;
 DWORD flags;
}

template Vector {
 <3D82AB5E-62DA-11cf-AB39-0020AF71E433>
 FLOAT x;
 FLOAT y;
 FLOAT z;
}

template Coords2d {
 <F6F23F44-7686-11cf-8F52-0040333594A3>
 FLOAT u;
 FLOAT v;
}

template Matrix4x4 {
 <F6F23F45-7686-11cf-8F52-0040333594A3>
 array FLOAT matrix[16];
}

template ColorRGBA {
 <35FF44E0-6C7C-11cf-8F52-0040333594A3>
 FLOAT red;
 FLOAT green;
 FLOAT blue;
 FLOAT alpha;
}

template ColorRGB {
 <D3E16E81-7835-11cf-8F52-0040333594A3>
 FLOAT red;
 FLOAT green;
 FLOAT blue;
}

template IndexedColor {
 <1630B820-7842-11cf-8F52-0040333594A3>
 DWORD index;
 ColorRGBA indexColor;
}

template Boolean {
 <4885AE61-78E8-11cf-8F52-0040333594A3>
 WORD truefalse;
}

template Boolean2d {
 <4885AE63-78E8-11cf-8F52-0040333594A3>
 Boolean u;
 Boolean v;
}

template MaterialWrap {
 <4885AE60-78E8-11cf-8F52-0040333594A3>
 Boolean u;
 Boolean v;
}

template TextureFilename {
 <A42790E1-7810-11cf-8F52-0040333594A3>
 STRING filename;
}

template Material {
 <3D82AB4D-62DA-11cf-AB39-0020AF71E433>
 ColorRGBA faceColor;
 FLOAT power;
 ColorRGB specularColor;
 ColorRGB emissiveColor;
 [...]
}

template MeshFace {
 <3D82AB5F-62DA-11cf-AB39-0020AF71E433>
 DWORD nFaceVertexIndices;
 array DWORD faceVertexIndices[nFaceVertexIndices];
}

template MeshFaceWraps {
 <4885AE62-78E8-11cf-8F52-0040333594A3>
 DWORD nFaceWrapValues;
 Boolean2d faceWrapValues;
}

template MeshTextureCoords {
 <F6F23F40-7686-11cf-8F52-0040333594A3>
 DWORD nTextureCoords;
 array Coords2d textureCoords[nTextureCoords];
}

template MeshMaterialList {
 <F6F23F42-7686-11cf-8F52-0040333594A3>
 DWORD nMaterials;
 DWORD nFaceIndexes;
 array DWORD faceIndexes[nFaceIndexes];
 [Material]
}

template MeshNormals {
 <F6F23F43-7686-11cf-8F52-0040333594A3>
 DWORD nNormals;
 array Vector normals[nNormals];
 DWORD nFaceNormals;
 array MeshFace faceNormals[nFaceNormals];
}

template MeshVertexColors {
 <1630B821-7842-11cf-8F52-0040333594A3>
 DWORD nVertexColors;
 array IndexedColor vertexColors[nVertexColors];
}

template Mesh {
 <3D82AB44-62DA-11cf-AB39-0020AF71E433>
 DWORD nVertices;
 array Vector vertices[nVertices];
 DWORD nFaces;
 array MeshFace faces[nFaces];
 [...]
}

Header{
1;
0;
1;
}

Mesh {
 186;
 -8.00000;10.00000;2.10177;,
 8.00000;10.00000;2.10177;,
 8.00000;10.00000;-2.10177;,
 -8.00000;10.00000;-2.10177;,
 -8.00000;8.00000;-2.62721;,
 8.00000;8.00000;-2.62721;,
 8.00000;-8.00000;-2.62721;,
 -8.00000;-8.00000;-2.62721;,
 -8.00000;-10.00000;-2.10177;,
 8.00000;-10.00000;-2.10177;,
 8.00000;-10.00000;2.10177;,
 -8.00000;-10.00000;2.10177;,
 -8.00000;-8.00000;2.62721;,
 8.00000;-8.00000;2.62721;,
 8.00000;8.00000;2.62721;,
 -8.00000;8.00000;2.62721;,
 10.00000;8.00000;2.10177;,
 10.00000;-8.00000;2.10177;,
 10.00000;-8.00000;-2.10177;,
 10.00000;8.00000;-2.10177;,
 -10.00000;-8.00000;2.10177;,
 -10.00000;8.00000;2.10177;,
 -10.00000;8.00000;-2.10177;,
 -10.00000;-8.00000;-2.10177;,
 -8.00000;10.00000;-2.10177;,
 8.00000;10.00000;-2.10177;,
 8.00000;9.41421;-2.47331;,
 -8.00000;9.41421;-2.47331;,
 8.00000;8.00000;-2.62721;,
 -8.00000;-9.41421;-2.47331;,
 8.00000;-9.41421;-2.47331;,
 8.00000;-10.00000;-2.10177;,
 -8.00000;-8.00000;-2.62721;,
 8.00000;-8.00000;-2.62721;,
 -8.00000;9.41421;2.47331;,
 8.00000;9.41421;2.47331;,
 8.00000;10.00000;2.10177;,
 -8.00000;8.00000;2.62721;,
 8.00000;8.00000;2.62721;,
 -8.00000;-10.00000;2.10177;,
 8.00000;-10.00000;2.10177;,
 8.00000;-9.41421;2.47331;,
 -8.00000;-9.41421;2.47331;,
 8.00000;-8.00000;2.62721;,
 9.41421;9.41421;2.10177;,
 9.41421;9.41421;-2.10177;,
 10.00000;8.00000;-2.10177;,
 9.41421;-9.41421;-2.10177;,
 9.41421;-9.41421;2.10177;,
 10.00000;-8.00000;-2.10177;,
 10.00000;-8.00000;2.10177;,
 -9.41421;9.41421;-2.10177;,
 -9.41421;9.41421;2.10177;,
 -10.00000;8.00000;-2.10177;,
 -10.00000;8.00000;2.10177;,
 -9.41421;-9.41421;2.10177;,
 -9.41421;-9.41421;-2.10177;,
 -10.00000;-8.00000;-2.10177;,
 9.41421;8.00000;-2.47331;,
 9.41421;-8.00000;-2.47331;,
 9.41421;-8.00000;2.47331;,
 9.41421;8.00000;2.47331;,
 -9.41421;-8.00000;-2.47331;,
 -9.41421;8.00000;-2.47331;,
 -9.41421;8.00000;2.47331;,
 -9.41421;-8.00000;2.47331;,
 -10.05000;0.58257;-3.97286;,
 10.05000;0.58257;-3.97286;,
 10.05000;-0.58257;-3.97286;,
 -10.05000;-0.58257;-3.97286;,
 10.05000;0.58257;-3.97286;,
 10.05000;0.58257;-2.76633;,
 10.05000;-0.58257;-2.76633;,
 10.05000;-0.58257;-3.97286;,
 10.05000;0.58257;-2.76633;,
 -10.05000;0.58257;-2.76633;,
 -10.05000;-0.58257;-2.76633;,
 10.05000;-0.58257;-2.76633;,
 -10.05000;0.58257;-2.76633;,
 -10.05000;0.58257;-3.97286;,
 -10.05000;-0.58257;-3.97286;,
 -10.05000;-0.58257;-2.76633;,
 10.05000;0.58257;-3.97286;,
 -10.05000;0.58257;-3.97286;,
 -10.05000;-0.58257;-3.97286;,
 10.05000;-0.58257;-3.97286;,
 0.58257;10.05000;-3.97286;,
 0.58257;-10.05000;-3.97286;,
 -0.58257;-10.05000;-3.97286;,
 -0.58257;10.05000;-3.97286;,
 0.58257;-10.05000;-3.97286;,
 0.58257;-10.05000;-2.76633;,
 -0.58257;-10.05000;-2.76633;,
 -0.58257;-10.05000;-3.97286;,
 0.58257;-10.05000;-2.76633;,
 0.58257;10.05000;-2.76633;,
 -0.58257;10.05000;-2.76633;,
 -0.58257;-10.05000;-2.76633;,
 0.58257;10.05000;-2.76633;,
 0.58257;10.05000;-3.97286;,
 -0.58257;10.05000;-3.97286;,
 -0.58257;10.05000;-2.76633;,
 0.58257;-10.05000;-3.97286;,
 0.58257;10.05000;-3.97286;,
 -0.58257;10.05000;-3.97286;,
 -0.58257;-10.05000;-3.97286;,
 11.18473;0.60326;2.52804;,
 11.18473;0.60326;-4.02298;,
 10.01960;0.60326;-4.02298;,
 10.01960;0.60326;2.52804;,
 11.18473;0.60326;-4.02298;,
 11.18473;-0.60327;-4.02298;,
 10.01960;-0.60327;-4.02298;,
 10.01960;0.60326;-4.02298;,
 11.18473;-0.60327;-4.02298;,
 11.18473;-0.60326;2.52804;,
 10.01960;-0.60326;2.52804;,
 10.01960;-0.60327;-4.02298;,
 11.18473;-0.60326;2.52804;,
 11.18473;0.60326;2.52804;,
 10.01960;0.60326;2.52804;,
 10.01960;-0.60326;2.52804;,
 11.18473;0.60326;-4.02298;,
 11.18473;0.60326;2.52804;,
 10.01960;0.60326;2.52804;,
 10.01960;0.60326;-4.02298;,
 -10.07967;0.60326;2.52804;,
 -10.07967;0.60326;-4.02298;,
 -11.24480;0.60326;-4.02298;,
 -11.24480;0.60326;2.52804;,
 -10.07967;0.60326;-4.02298;,
 -10.07967;-0.60327;-4.02298;,
 -11.24480;-0.60327;-4.02298;,
 -11.24480;0.60326;-4.02298;,
 -10.07967;-0.60327;-4.02298;,
 -10.07967;-0.60326;2.52804;,
 -11.24480;-0.60326;2.52804;,
 -11.24480;-0.60327;-4.02298;,
 -10.07967;-0.60326;2.52804;,
 -10.07967;0.60326;2.52804;,
 -11.24480;0.60326;2.52804;,
 -11.24480;-0.60326;2.52804;,
 -10.07967;0.60326;-4.02298;,
 -10.07967;0.60326;2.52804;,
 -11.24480;0.60326;2.52804;,
 -11.24480;0.60326;-4.02298;,
 0.53394;11.30218;2.52803;,
 0.53394;11.30218;-4.02298;,
 -0.63119;11.30218;-4.02298;,
 -0.63119;11.30218;2.52803;,
 0.53394;11.30218;-4.02298;,
 0.53394;10.09565;-4.02298;,
 -0.63119;10.09565;-4.02298;,
 -0.63119;11.30218;-4.02298;,
 0.53394;10.09565;-4.02298;,
 0.53394;10.09566;2.52804;,
 -0.63119;10.09566;2.52803;,
 -0.63119;10.09565;-4.02298;,
 0.53394;10.09566;2.52804;,
 0.53394;11.30218;2.52803;,
 -0.63119;11.30218;2.52803;,
 -0.63119;10.09566;2.52803;,
 0.53394;11.30218;-4.02298;,
 0.53394;11.30218;2.52803;,
 -0.63119;11.30218;2.52803;,
 -0.63119;11.30218;-4.02298;,
 0.53394;-9.95871;2.52803;,
 0.53394;-9.95871;-4.02298;,
 -0.63119;-9.95871;-4.02298;,
 -0.63119;-9.95871;2.52803;,
 0.53394;-9.95871;-4.02298;,
 0.53394;-11.16524;-4.02298;,
 -0.63119;-11.16524;-4.02298;,
 -0.63119;-9.95871;-4.02298;,
 0.53394;-11.16524;-4.02298;,
 0.53394;-11.16524;2.52804;,
 -0.63119;-11.16524;2.52803;,
 -0.63119;-11.16524;-4.02298;,
 0.53394;-11.16524;2.52804;,
 0.53394;-9.95871;2.52803;,
 -0.63119;-9.95871;2.52803;,
 -0.63119;-11.16524;2.52803;,
 0.53394;-9.95871;-4.02298;,
 0.53394;-9.95871;2.52803;,
 -0.63119;-9.95871;2.52803;,
 -0.63119;-9.95871;-4.02298;;
 
 98;
 4;0,1,2,3;,
 4;4,5,6,7;,
 4;8,9,10,11;,
 4;12,13,14,15;,
 4;16,17,18,19;,
 4;20,21,22,23;,
 4;24,25,26,27;,
 4;27,26,28,4;,
 4;29,30,31,8;,
 4;32,33,30,29;,
 4;34,35,36,0;,
 4;37,38,35,34;,
 4;39,40,41,42;,
 4;42,41,43,12;,
 4;25,36,44,45;,
 4;45,44,16,46;,
 4;40,31,47,48;,
 4;48,47,49,50;,
 4;0,24,51,52;,
 4;52,51,53,54;,
 4;8,39,55,56;,
 4;56,55,20,57;,
 4;33,28,58,59;,
 4;59,58,46,49;,
 4;38,43,60,61;,
 4;61,60,50,16;,
 4;4,32,62,63;,
 4;63,62,57,53;,
 4;12,37,64,65;,
 4;65,64,54,20;,
 3;25,45,26;,
 3;45,46,58;,
 3;58,26,45;,
 3;26,58,28;,
 3;27,51,24;,
 3;63,53,51;,
 3;51,27,63;,
 3;4,63,27;,
 3;30,47,31;,
 3;59,49,47;,
 3;47,30,59;,
 3;33,59,30;,
 3;35,44,36;,
 3;61,16,44;,
 3;44,35,61;,
 3;38,61,35;,
 3;8,56,29;,
 3;56,57,62;,
 3;62,29,56;,
 3;29,62,32;,
 3;40,48,41;,
 3;48,50,60;,
 3;60,41,48;,
 3;41,60,43;,
 3;0,52,34;,
 3;52,54,64;,
 3;64,34,52;,
 3;34,64,37;,
 3;42,55,39;,
 3;65,20,55;,
 3;55,42,65;,
 3;12,65,42;,
 4;66,67,68,69;,
 4;70,71,72,73;,
 4;74,75,76,77;,
 4;78,79,80,81;,
 4;78,71,82,83;,
 4;84,85,72,81;,
 4;86,87,88,89;,
 4;90,91,92,93;,
 4;94,95,96,97;,
 4;98,99,100,101;,
 4;98,91,102,103;,
 4;104,105,92,101;,
 4;106,107,108,109;,
 4;110,111,112,113;,
 4;114,115,116,117;,
 4;118,119,120,121;,
 4;118,111,122,123;,
 4;124,125,112,121;,
 4;126,127,128,129;,
 4;130,131,132,133;,
 4;134,135,136,137;,
 4;138,139,140,141;,
 4;138,131,142,143;,
 4;144,145,132,141;,
 4;146,147,148,149;,
 4;150,151,152,153;,
 4;154,155,156,157;,
 4;158,159,160,161;,
 4;158,151,162,163;,
 4;164,165,152,161;,
 4;166,167,168,169;,
 4;170,171,172,173;,
 4;174,175,176,177;,
 4;178,179,180,181;,
 4;178,171,182,183;,
 4;184,185,172,181;;
 
 MeshMaterialList {
  12;
  98;
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1;;
  Material {
   0.800000;0.752941;0.549020;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
   TextureFilename {
    "data/TEXTURE/Model_Texture/Cloth_Tex.jpg";
   }
  }
  Material {
   0.636863;0.696471;0.800000;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
   TextureFilename {
    "data/TEXTURE/Model_Texture/Cord_Tex.jpeg";
   }
  }
  Material {
   0.765600;0.659200;0.241600;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
  Material {
   0.000000;0.000000;0.000000;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
  Material {
   0.800000;0.800000;0.800000;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
  Material {
   0.800000;0.000000;0.060000;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
  Material {
   0.000000;0.000000;0.000000;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
  Material {
   0.743200;0.263200;0.094400;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
  Material {
   0.969000;1.000000;0.000000;1.000000;;
   50.000000;
   0.500000;0.500000;0.500000;;
   0.096900;0.100000;0.000000;;
  }
  Material {
   1.000000;1.000000;1.000000;1.000000;;
   50.000000;
   0.500000;0.500000;0.500000;;
   0.100000;0.100000;0.100000;;
  }
  Material {
   0.000000;1.000000;0.000000;1.000000;;
   50.000000;
   0.500000;0.500000;0.500000;;
   0.000000;0.100000;0.000000;;
  }
  Material {
   1.000000;0.008000;0.537000;1.000000;;
   50.000000;
   0.500000;0.500000;0.500000;;
   0.100000;0.000800;0.053700;;
  }
 }
 MeshNormals {
  84;
  -0.172716;0.859548;0.480984;,
  0.172716;0.859548;0.480984;,
  -0.172716;0.859548;-0.480984;,
  0.172716;0.859548;-0.480984;,
  -0.054093;0.054093;-0.997070;,
  0.054093;0.054093;-0.997070;,
  -0.054093;-0.054093;-0.997070;,
  0.054093;-0.054093;-0.997070;,
  -0.172716;-0.859548;-0.480984;,
  0.172716;-0.859548;-0.480984;,
  -0.172716;-0.859548;0.480984;,
  0.172716;-0.859548;0.480984;,
  -0.054093;-0.054093;0.997070;,
  0.054093;-0.054093;0.997070;,
  -0.054093;0.054093;0.997070;,
  0.054093;0.054093;0.997070;,
  0.859548;0.172716;0.480984;,
  0.859548;-0.172716;0.480984;,
  0.859548;0.172716;-0.480984;,
  0.859548;-0.172716;-0.480984;,
  -0.859548;-0.172716;0.480984;,
  -0.859548;0.172716;0.480984;,
  -0.859548;-0.172716;-0.480984;,
  -0.859548;0.172716;-0.480984;,
  -0.117186;0.312373;-0.942704;,
  0.117186;0.312373;-0.942704;,
  -0.117186;-0.312373;-0.942704;,
  0.117186;-0.312373;-0.942704;,
  -0.117186;0.312373;0.942704;,
  0.117186;0.312373;0.942704;,
  -0.117186;-0.312373;0.942704;,
  0.117186;-0.312373;0.942704;,
  0.552760;0.552760;0.623629;,
  0.552760;0.552760;-0.623629;,
  0.552760;-0.552760;0.623629;,
  0.552760;-0.552760;-0.623629;,
  -0.552760;0.552760;0.623629;,
  -0.552760;0.552760;-0.623629;,
  -0.552760;-0.552760;0.623629;,
  -0.552760;-0.552760;-0.623629;,
  0.312373;-0.117186;-0.942704;,
  0.312373;0.117186;-0.942704;,
  0.312373;-0.117186;0.942704;,
  0.312373;0.117186;0.942704;,
  -0.312373;-0.117186;-0.942704;,
  -0.312373;0.117186;-0.942704;,
  -0.312373;-0.117186;0.942704;,
  -0.312373;0.117186;0.942704;,
  0.000000;0.000000;-1.000000;,
  1.000000;0.000000;0.000000;,
  0.000000;0.000000;1.000000;,
  -1.000000;0.000000;0.000000;,
  0.000000;1.000000;0.000000;,
  0.000000;-1.000000;-0.000000;,
  0.000000;0.000000;-1.000000;,
  0.000001;-1.000000;-0.000000;,
  0.000000;0.000000;1.000000;,
  -0.000001;1.000000;0.000000;,
  1.000000;-0.000000;-0.000000;,
  -1.000000;0.000000;0.000000;,
  -0.000001;1.000000;-0.000001;,
  0.000000;0.000000;-1.000000;,
  -0.000000;-1.000000;0.000000;,
  -0.000001;0.000001;1.000000;,
  1.000000;0.000000;0.000000;,
  -1.000000;0.000000;0.000000;,
  -0.000001;1.000000;-0.000001;,
  0.000000;0.000000;-1.000000;,
  -0.000000;-1.000000;0.000000;,
  -0.000001;0.000001;1.000000;,
  1.000000;0.000000;0.000000;,
  -1.000000;0.000000;0.000000;,
  -0.000000;1.000000;-0.000001;,
  0.000000;0.000000;-1.000000;,
  0.000000;-1.000000;0.000000;,
  -0.000001;0.000001;1.000000;,
  1.000000;0.000000;0.000000;,
  -1.000000;0.000000;0.000000;,
  -0.000001;1.000000;-0.000001;,
  0.000000;0.000000;-1.000000;,
  -0.000000;-1.000000;0.000000;,
  -0.000001;0.000001;1.000000;,
  1.000000;0.000000;0.000000;,
  -1.000000;0.000000;0.000000;;
  98;
  4;0,1,3,2;,
  4;4,5,7,6;,
  4;8,9,11,10;,
  4;12,13,15,14;,
  4;16,17,19,18;,
  4;20,21,23,22;,
  4;2,3,25,24;,
  4;24,25,5,4;,
  4;26,27,9,8;,
  4;6,7,27,26;,
  4;28,29,1,0;,
  4;14,15,29,28;,
  4;10,11,31,30;,
  4;30,31,13,12;,
  4;3,1,32,33;,
  4;33,32,16,18;,
  4;11,9,35,34;,
  4;34,35,19,17;,
  4;0,2,37,36;,
  4;36,37,23,21;,
  4;8,10,38,39;,
  4;39,38,20,22;,
  4;7,5,41,40;,
  4;40,41,18,19;,
  4;15,13,42,43;,
  4;43,42,17,16;,
  4;4,6,44,45;,
  4;45,44,22,23;,
  4;12,14,47,46;,
  4;46,47,21,20;,
  3;3,33,25;,
  3;33,18,41;,
  3;41,25,33;,
  3;25,41,5;,
  3;24,37,2;,
  3;45,23,37;,
  3;37,24,45;,
  3;4,45,24;,
  3;27,35,9;,
  3;40,19,35;,
  3;35,27,40;,
  3;7,40,27;,
  3;29,32,1;,
  3;43,16,32;,
  3;32,29,43;,
  3;15,43,29;,
  3;8,39,26;,
  3;39,22,44;,
  3;44,26,39;,
  3;26,44,6;,
  3;11,34,31;,
  3;34,17,42;,
  3;42,31,34;,
  3;31,42,13;,
  3;0,36,28;,
  3;36,21,47;,
  3;47,28,36;,
  3;28,47,14;,
  3;30,38,10;,
  3;46,20,38;,
  3;38,30,46;,
  3;12,46,30;,
  4;48,48,48,48;,
  4;49,49,49,49;,
  4;50,50,50,50;,
  4;51,51,51,51;,
  4;52,52,52,52;,
  4;53,53,53,53;,
  4;54,54,54,54;,
  4;55,55,55,55;,
  4;56,56,56,56;,
  4;57,57,57,57;,
  4;58,58,58,58;,
  4;59,59,59,59;,
  4;60,60,60,60;,
  4;61,61,61,61;,
  4;62,62,62,62;,
  4;63,63,63,63;,
  4;64,64,64,64;,
  4;65,65,65,65;,
  4;66,66,66,66;,
  4;67,67,67,67;,
  4;68,68,68,68;,
  4;69,69,69,69;,
  4;70,70,70,70;,
  4;71,71,71,71;,
  4;72,72,72,72;,
  4;73,73,73,73;,
  4;74,74,74,74;,
  4;75,75,75,75;,
  4;76,76,76,76;,
  4;77,77,77,77;,
  4;78,78,78,78;,
  4;79,79,79,79;,
  4;80,80,80,80;,
  4;81,81,81,81;,
  4;82,82,82,82;,
  4;83,83,83,83;;
 }
 MeshTextureCoords {
  186;
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;;
 }
}
