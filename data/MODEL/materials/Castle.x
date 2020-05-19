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
 324;
 1004.66351;328.43710;-997.50330;,
 1084.55029;328.43710;-997.50330;,
 1084.55029;-0.89650;-997.50330;,
 1004.66351;-0.89650;-997.50330;,
 1084.55029;328.43710;1076.99255;,
 1004.66351;328.43710;1076.99255;,
 1004.66351;-0.89650;1076.99255;,
 1084.55029;-0.89650;1076.99255;,
 1004.66351;328.43710;-549.38507;,
 1004.66351;328.43710;-997.50330;,
 1004.66351;-0.89650;-997.50330;,
 1004.66351;-0.89650;-549.38507;,
 1084.55029;328.43710;-549.38531;,
 1084.55029;-0.89650;-549.38531;,
 1084.55029;-0.89650;-997.50330;,
 1084.55029;328.43710;-997.50330;,
 1084.55029;328.43710;-549.38531;,
 1004.66351;328.43710;-997.50330;,
 1004.66351;328.43710;-549.38507;,
 1004.66351;-0.89650;-549.38507;,
 1004.66351;-0.89650;-997.50330;,
 1084.55029;-0.89650;-549.38531;,
 1004.66351;-0.89650;3.98780;,
 1004.66351;328.43710;3.98780;,
 1084.55029;328.43710;3.98770;,
 1084.55029;-0.89650;3.98770;,
 1004.66351;328.43710;3.98780;,
 1084.55029;328.43710;3.98770;,
 1084.55029;-0.89650;3.98770;,
 1004.66351;-0.89650;3.98780;,
 1004.66351;-0.89650;566.68732;,
 1004.66351;-0.89650;1076.99255;,
 1004.66351;328.43710;1076.99255;,
 1004.66351;328.43710;566.68732;,
 1084.55029;328.43710;566.68732;,
 1084.55029;328.43710;1076.99255;,
 1084.55029;-0.89650;1076.99255;,
 1084.55029;-0.89650;566.68732;,
 1004.66351;328.43710;566.68732;,
 1004.66351;328.43710;1076.99255;,
 1084.55029;328.43710;566.68732;,
 1084.55029;-0.89650;566.68732;,
 1004.66351;-0.89650;1076.99255;,
 1004.66351;-0.89650;566.68732;,
 -1085.86084;328.43710;-997.50592;,
 -1005.97430;328.43710;-997.50592;,
 -1005.97430;-0.89650;-997.50592;,
 -1085.86084;-0.89650;-997.50592;,
 -1005.97430;328.43710;1076.98999;,
 -1085.86084;328.43710;1076.98999;,
 -1085.86084;-0.89650;1076.98999;,
 -1005.97430;-0.89650;1076.98999;,
 -1085.86084;328.43710;-549.38531;,
 -1085.86084;328.43710;-997.50592;,
 -1085.86084;-0.89650;-997.50592;,
 -1085.86084;-0.89650;-549.38531;,
 -1005.97430;328.43710;-549.38531;,
 -1005.97430;-0.89650;-549.38531;,
 -1005.97430;-0.89650;-997.50592;,
 -1005.97430;328.43710;-997.50592;,
 -1005.97430;328.43710;-549.38531;,
 -1085.86084;328.43710;-997.50592;,
 -1085.86084;328.43710;-549.38531;,
 -1085.86084;-0.89650;-549.38531;,
 -1085.86084;-0.89650;-997.50592;,
 -1005.97430;-0.89650;-549.38531;,
 -1085.86084;-0.89650;3.98770;,
 -1085.86084;328.43710;3.98770;,
 -1005.97430;328.43710;3.98770;,
 -1005.97430;-0.89650;3.98770;,
 -1085.86084;328.43710;3.98770;,
 -1005.97430;328.43710;3.98770;,
 -1005.97430;-0.89650;3.98770;,
 -1085.86084;-0.89650;3.98770;,
 -1085.86084;-0.89650;566.68732;,
 -1085.86084;-0.89650;1076.98999;,
 -1085.86084;328.43710;1076.98999;,
 -1085.86084;328.43710;566.68732;,
 -1005.97430;328.43710;566.68732;,
 -1005.97430;328.43710;1076.98999;,
 -1005.97430;-0.89650;1076.98999;,
 -1005.97430;-0.89650;566.68732;,
 -1085.86084;328.43710;566.68732;,
 -1085.86084;328.43710;1076.98999;,
 -1005.97430;328.43710;566.68732;,
 -1005.97430;-0.89650;566.68732;,
 -1085.86084;-0.89650;1076.98999;,
 -1085.86084;-0.89650;566.68732;,
 -1086.48315;328.43710;-1000.00000;,
 -1086.48315;328.43710;-1079.88672;,
 -1086.48315;-0.89650;-1079.88672;,
 -1086.48315;-0.89650;-1000.00000;,
 1081.19922;328.43710;-1079.88672;,
 1081.19922;328.43710;-1000.00000;,
 1081.19922;-0.89650;-1000.00000;,
 1081.19922;-0.89650;-1079.88672;,
 -654.69385;328.43710;-1000.00000;,
 -1086.48315;328.43710;-1000.00000;,
 -1086.48315;-0.89650;-1000.00000;,
 -654.69385;-0.89650;-1000.00000;,
 -171.51128;-0.89650;-1000.00000;,
 -171.51128;328.43710;-1000.00000;,
 -654.69385;-0.89650;-1079.88672;,
 -1086.48315;-0.89650;-1079.88672;,
 -1086.48315;328.43710;-1079.88672;,
 -654.69385;328.43710;-1079.88672;,
 -171.51128;328.43710;-1079.88672;,
 -171.51128;-0.89650;-1079.88672;,
 -654.69385;328.43710;-1079.88672;,
 -1086.48315;328.43710;-1000.00000;,
 -654.69385;328.43710;-1000.00000;,
 -171.51128;328.43710;-1000.00000;,
 -171.51128;328.43710;-1079.88672;,
 -654.69385;-0.89650;-1000.00000;,
 -1086.48315;-0.89650;-1000.00000;,
 -654.69385;-0.89650;-1079.88672;,
 -171.51128;-0.89650;-1079.88672;,
 -171.51128;-0.89650;-1000.00000;,
 694.14948;-0.89650;-1000.00000;,
 1081.19922;-0.89650;-1000.00000;,
 1081.19922;328.43710;-1000.00000;,
 694.14948;328.43710;-1000.00000;,
 276.16949;328.43710;-1000.00000;,
 276.16949;-0.89650;-1000.00000;,
 694.14948;328.43710;-1079.88672;,
 1081.19922;328.43710;-1079.88672;,
 1081.19922;-0.89650;-1079.88672;,
 694.14948;-0.89650;-1079.88672;,
 276.16949;-0.89650;-1079.88672;,
 276.16949;328.43710;-1079.88672;,
 694.14948;328.43710;-1000.00000;,
 1081.19922;328.43710;-1000.00000;,
 694.14948;328.43710;-1079.88672;,
 276.16949;328.43710;-1079.88672;,
 276.16949;328.43710;-1000.00000;,
 694.14948;-0.89650;-1079.88672;,
 1081.19922;-0.89650;-1000.00000;,
 694.14948;-0.89650;-1000.00000;,
 276.16949;-0.89650;-1000.00000;,
 276.16949;-0.89650;-1079.88672;,
 -1086.48169;328.43710;1096.58911;,
 -1086.48169;328.43710;1016.70239;,
 -1086.48169;-0.89650;1016.70239;,
 -1086.48169;-0.89650;1096.58911;,
 1077.19116;328.43710;1016.70258;,
 1077.19141;328.43710;1096.58911;,
 1077.19141;-0.89650;1096.58911;,
 1077.19116;-0.89650;1016.70258;,
 -654.69385;328.43710;1096.58911;,
 -1086.48169;328.43710;1096.58911;,
 -1086.48169;-0.89650;1096.58911;,
 -654.69385;-0.89650;1096.58911;,
 -171.51109;-0.89650;1096.58911;,
 -171.51109;328.43710;1096.58911;,
 -654.69385;-0.89650;1016.70251;,
 -1086.48169;-0.89650;1016.70239;,
 -1086.48169;328.43710;1016.70239;,
 -654.69385;328.43710;1016.70251;,
 -171.51128;328.43710;1016.70251;,
 -171.51128;-0.89650;1016.70251;,
 -654.69385;328.43710;1016.70251;,
 -1086.48169;328.43710;1096.58911;,
 -654.69385;328.43710;1096.58911;,
 -171.51109;328.43710;1096.58911;,
 -171.51128;328.43710;1016.70251;,
 -654.69385;-0.89650;1096.58911;,
 -1086.48169;-0.89650;1096.58911;,
 -654.69385;-0.89650;1016.70251;,
 -171.51128;-0.89650;1016.70251;,
 -171.51109;-0.89650;1096.58911;,
 694.14948;-0.89650;1096.58911;,
 1077.19141;-0.89650;1096.58911;,
 1077.19141;328.43710;1096.58911;,
 694.14948;328.43710;1096.58911;,
 272.16019;328.43710;1096.58911;,
 272.16019;-0.89650;1096.58911;,
 694.14948;328.43710;1016.70251;,
 1077.19116;328.43710;1016.70258;,
 1077.19116;-0.89650;1016.70258;,
 694.14948;-0.89650;1016.70251;,
 272.16019;-0.89650;1016.70251;,
 272.16019;328.43710;1016.70251;,
 694.14948;328.43710;1096.58911;,
 1077.19141;328.43710;1096.58911;,
 694.14948;328.43710;1016.70251;,
 272.16019;328.43710;1016.70251;,
 272.16019;328.43710;1096.58911;,
 694.14948;-0.89650;1016.70251;,
 1077.19141;-0.89650;1096.58911;,
 694.14948;-0.89650;1096.58911;,
 272.16019;-0.89650;1096.58911;,
 272.16019;-0.89650;1016.70251;,
 -130.63940;-1.54800;1092.85400;,
 -130.63940;-1.54800;1012.96729;,
 -130.63940;562.83112;1012.96729;,
 -130.63940;562.83112;1092.85400;,
 314.71649;562.83112;1012.96729;,
 314.71649;562.83112;1092.85400;,
 314.71649;-1.54800;1092.85400;,
 314.71649;-1.54800;1012.96729;,
 408.38611;538.30829;1012.96729;,
 408.38611;630.62738;1012.96729;,
 408.38611;630.62738;1092.85400;,
 408.38611;538.30829;1092.85400;,
 -223.82539;562.83112;1092.85400;,
 -223.82539;562.83112;1012.96729;,
 -223.82539;-1.54800;1012.96729;,
 -223.82539;-1.54800;1092.85400;,
 -130.63940;562.83112;1092.85400;,
 -223.82539;562.83112;1092.85400;,
 -223.82539;-1.54800;1092.85400;,
 -130.63940;-1.54800;1092.85400;,
 -130.63940;562.83112;1012.96729;,
 -130.63940;-1.54800;1012.96729;,
 -223.82539;-1.54800;1012.96729;,
 -223.82539;562.83112;1012.96729;,
 -130.63940;562.83112;1012.96729;,
 -223.82539;562.83112;1092.85400;,
 -130.63940;562.83112;1092.85400;,
 -130.63940;-1.54800;1092.85400;,
 -223.82539;-1.54800;1092.85400;,
 -130.63940;-1.54800;1012.96729;,
 221.53040;562.83112;1092.85400;,
 221.53040;562.83112;1012.96729;,
 221.53040;-1.54800;1012.96729;,
 221.53040;-1.54800;1092.85400;,
 314.71649;562.83112;1092.85400;,
 221.53040;562.83112;1092.85400;,
 221.53040;-1.54800;1092.85400;,
 314.71649;-1.54800;1092.85400;,
 314.71649;562.83112;1012.96729;,
 314.71649;-1.54800;1012.96729;,
 221.53040;-1.54800;1012.96729;,
 221.53040;562.83112;1012.96729;,
 314.71649;562.83112;1012.96729;,
 221.53040;562.83112;1092.85400;,
 314.71649;562.83112;1092.85400;,
 314.71649;-1.54800;1092.85400;,
 221.53040;-1.54800;1092.85400;,
 314.71649;-1.54800;1012.96729;,
 -294.04889;630.62738;1092.85400;,
 -294.04889;630.62738;1012.96729;,
 -294.04889;538.30829;1012.96729;,
 -294.04889;538.30829;1092.85400;,
 408.38611;630.62738;1092.85400;,
 -294.04889;630.62738;1092.85400;,
 -294.04889;538.30829;1092.85400;,
 408.38611;538.30829;1092.85400;,
 408.38611;630.62738;1012.96729;,
 408.38611;538.30829;1012.96729;,
 -294.04889;538.30829;1012.96729;,
 -294.04889;630.62738;1012.96729;,
 408.38611;630.62738;1012.96729;,
 -294.04889;630.62738;1092.85400;,
 408.38611;630.62738;1092.85400;,
 408.38611;538.30829;1092.85400;,
 -294.04889;538.30829;1092.85400;,
 408.38611;538.30829;1012.96729;,
 -130.63940;-1.54800;-1000.85291;,
 -130.63940;-1.54800;-1080.73950;,
 -130.63940;562.83112;-1080.73950;,
 -130.63940;562.83112;-1000.85291;,
 314.71649;562.83112;-1080.73950;,
 314.71649;562.83112;-1000.85291;,
 314.71649;-1.54800;-1000.85291;,
 314.71649;-1.54800;-1080.73950;,
 408.38611;538.30829;-1080.73950;,
 408.38611;630.62738;-1080.73950;,
 408.38611;630.62738;-1000.85291;,
 408.38611;538.30829;-1000.85291;,
 -223.82539;562.83112;-1000.85291;,
 -223.82539;562.83112;-1080.73950;,
 -223.82539;-1.54800;-1080.73950;,
 -223.82539;-1.54800;-1000.85291;,
 -130.63940;562.83112;-1000.85291;,
 -223.82539;562.83112;-1000.85291;,
 -223.82539;-1.54800;-1000.85291;,
 -130.63940;-1.54800;-1000.85291;,
 -130.63940;562.83112;-1080.73950;,
 -130.63940;-1.54800;-1080.73950;,
 -223.82539;-1.54800;-1080.73950;,
 -223.82539;562.83112;-1080.73950;,
 -130.63940;562.83112;-1080.73950;,
 -223.82539;562.83112;-1000.85291;,
 -130.63940;562.83112;-1000.85291;,
 -130.63940;-1.54800;-1000.85291;,
 -223.82539;-1.54800;-1000.85291;,
 -130.63940;-1.54800;-1080.73950;,
 221.53040;562.83112;-1000.85291;,
 221.53040;562.83112;-1080.73950;,
 221.53040;-1.54800;-1080.73950;,
 221.53040;-1.54800;-1000.85291;,
 314.71649;562.83112;-1000.85291;,
 221.53040;562.83112;-1000.85291;,
 221.53040;-1.54800;-1000.85291;,
 314.71649;-1.54800;-1000.85291;,
 314.71649;562.83112;-1080.73950;,
 314.71649;-1.54800;-1080.73950;,
 221.53040;-1.54800;-1080.73950;,
 221.53040;562.83112;-1080.73950;,
 314.71649;562.83112;-1080.73950;,
 221.53040;562.83112;-1000.85291;,
 314.71649;562.83112;-1000.85291;,
 314.71649;-1.54800;-1000.85291;,
 221.53040;-1.54800;-1000.85291;,
 314.71649;-1.54800;-1080.73950;,
 -294.04889;630.62738;-1000.85291;,
 -294.04889;630.62738;-1080.73950;,
 -294.04889;538.30829;-1080.73950;,
 -294.04889;538.30829;-1000.85291;,
 408.38611;630.62738;-1000.85291;,
 -294.04889;630.62738;-1000.85291;,
 -294.04889;538.30829;-1000.85291;,
 408.38611;538.30829;-1000.85291;,
 408.38611;630.62738;-1080.73950;,
 408.38611;538.30829;-1080.73950;,
 -294.04889;538.30829;-1080.73950;,
 -294.04889;630.62738;-1080.73950;,
 408.38611;630.62738;-1080.73950;,
 -294.04889;630.62738;-1000.85291;,
 408.38611;630.62738;-1000.85291;,
 408.38611;538.30829;-1000.85291;,
 -294.04889;538.30829;-1000.85291;,
 408.38611;538.30829;-1080.73950;;
 
 110;
 4;0,1,2,3;,
 4;4,5,6,7;,
 4;8,9,10,11;,
 4;12,13,14,15;,
 4;16,1,17,18;,
 4;19,20,2,21;,
 4;22,23,8,11;,
 4;24,25,13,12;,
 4;26,27,16,18;,
 4;28,29,19,21;,
 4;30,31,32,33;,
 4;30,33,23,22;,
 4;34,35,36,37;,
 4;34,37,25,24;,
 4;38,39,4,40;,
 4;38,40,27,26;,
 4;41,7,42,43;,
 4;41,43,29,28;,
 4;44,45,46,47;,
 4;48,49,50,51;,
 4;52,53,54,55;,
 4;56,57,58,59;,
 4;60,45,61,62;,
 4;63,64,46,65;,
 4;66,67,52,55;,
 4;68,69,57,56;,
 4;70,71,60,62;,
 4;72,73,63,65;,
 4;74,75,76,77;,
 4;74,77,67,66;,
 4;78,79,80,81;,
 4;78,81,69,68;,
 4;82,83,48,84;,
 4;82,84,71,70;,
 4;85,51,86,87;,
 4;85,87,73,72;,
 4;88,89,90,91;,
 4;92,93,94,95;,
 4;96,97,98,99;,
 4;96,99,100,101;,
 4;102,103,104,105;,
 4;102,105,106,107;,
 4;108,89,109,110;,
 4;108,110,111,112;,
 4;113,114,90,115;,
 4;113,115,116,117;,
 4;118,119,120,121;,
 4;118,121,122,123;,
 4;124,125,126,127;,
 4;124,127,128,129;,
 4;130,131,92,132;,
 4;130,132,133,134;,
 4;135,95,136,137;,
 4;135,137,138,139;,
 4;140,141,142,143;,
 4;144,145,146,147;,
 4;148,149,150,151;,
 4;148,151,152,153;,
 4;154,155,156,157;,
 4;154,157,158,159;,
 4;160,141,161,162;,
 4;160,162,163,164;,
 4;165,166,142,167;,
 4;165,167,168,169;,
 4;170,171,172,173;,
 4;170,173,174,175;,
 4;176,177,178,179;,
 4;176,179,180,181;,
 4;182,183,144,184;,
 4;182,184,185,186;,
 4;187,147,188,189;,
 4;187,189,190,191;,
 3;192,193,194;,
 3;194,195,192;,
 4;196,197,198,199;,
 4;200,201,202,203;,
 4;204,205,206,207;,
 4;208,209,210,211;,
 4;212,213,214,215;,
 4;216,205,217,218;,
 4;219,220,206,221;,
 4;222,223,224,225;,
 4;226,227,228,229;,
 4;230,231,232,233;,
 4;234,223,235,236;,
 4;237,238,224,239;,
 4;240,241,242,243;,
 4;244,245,246,247;,
 4;248,249,250,251;,
 4;252,241,253,254;,
 4;255,256,242,257;,
 3;258,259,260;,
 3;260,261,258;,
 4;262,263,264,265;,
 4;266,267,268,269;,
 4;270,271,272,273;,
 4;274,275,276,277;,
 4;278,279,280,281;,
 4;282,271,283,284;,
 4;285,286,272,287;,
 4;288,289,290,291;,
 4;292,293,294,295;,
 4;296,297,298,299;,
 4;300,289,301,302;,
 4;303,304,290,305;,
 4;306,307,308,309;,
 4;310,311,312,313;,
 4;314,315,316,317;,
 4;318,307,319,320;,
 4;321,322,308,323;;
 
 MeshMaterialList {
  1;
  110;
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
  0;;
  Material {
   0.800000;0.800000;0.800000;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
   TextureFilename {
    "data/TEXTURE/wall.jpg";
   }
  }
 }
 MeshNormals {
  40;
  0.000000;0.000000;1.000000;,
  0.000000;0.000000;-1.000000;,
  -1.000000;0.000000;0.000000;,
  1.000000;0.000000;0.000000;,
  0.000000;1.000000;0.000000;,
  0.000000;-1.000000;-0.000000;,
  0.000000;0.000000;1.000000;,
  0.000000;0.000000;-1.000000;,
  -1.000000;0.000000;0.000000;,
  1.000000;0.000000;0.000000;,
  0.000000;1.000000;0.000000;,
  0.000000;-1.000000;-0.000000;,
  1.000000;0.000000;0.000000;,
  -1.000000;0.000000;0.000000;,
  0.000000;-0.000000;1.000000;,
  0.000000;0.000000;-1.000000;,
  0.000000;1.000000;0.000000;,
  0.000000;-1.000000;-0.000000;,
  1.000000;0.000000;-0.000003;,
  -1.000000;0.000000;0.000000;,
  0.000000;-0.000000;1.000000;,
  0.000000;0.000000;-1.000000;,
  0.000000;0.000000;-1.000000;,
  0.000000;0.000000;-1.000000;,
  0.000000;0.000000;-1.000000;,
  0.000000;1.000000;0.000000;,
  0.000000;-1.000000;-0.000000;,
  0.000000;0.000000;-1.000000;,
  1.000000;0.000000;0.000000;,
  -1.000000;0.000000;0.000000;,
  0.000000;0.000000;1.000000;,
  0.000000;0.000000;-1.000000;,
  0.000000;1.000000;0.000000;,
  0.000000;-1.000000;0.000000;,
  1.000000;0.000000;0.000000;,
  -1.000000;0.000000;0.000000;,
  0.000000;0.000000;1.000000;,
  0.000000;0.000000;-1.000000;,
  0.000000;1.000000;0.000000;,
  0.000000;-1.000000;0.000000;;
  110;
  4;1,1,1,1;,
  4;0,0,0,0;,
  4;2,2,2,2;,
  4;3,3,3,3;,
  4;4,4,4,4;,
  4;5,5,5,5;,
  4;2,2,2,2;,
  4;3,3,3,3;,
  4;4,4,4,4;,
  4;5,5,5,5;,
  4;2,2,2,2;,
  4;2,2,2,2;,
  4;3,3,3,3;,
  4;3,3,3,3;,
  4;4,4,4,4;,
  4;4,4,4,4;,
  4;5,5,5,5;,
  4;5,5,5,5;,
  4;7,7,7,7;,
  4;6,6,6,6;,
  4;8,8,8,8;,
  4;9,9,9,9;,
  4;10,10,10,10;,
  4;11,11,11,11;,
  4;8,8,8,8;,
  4;9,9,9,9;,
  4;10,10,10,10;,
  4;11,11,11,11;,
  4;8,8,8,8;,
  4;8,8,8,8;,
  4;9,9,9,9;,
  4;9,9,9,9;,
  4;10,10,10,10;,
  4;10,10,10,10;,
  4;11,11,11,11;,
  4;11,11,11,11;,
  4;13,13,13,13;,
  4;12,12,12,12;,
  4;14,14,14,14;,
  4;14,14,14,14;,
  4;15,15,15,15;,
  4;15,15,15,15;,
  4;16,16,16,16;,
  4;16,16,16,16;,
  4;17,17,17,17;,
  4;17,17,17,17;,
  4;14,14,14,14;,
  4;14,14,14,14;,
  4;15,15,15,15;,
  4;15,15,15,15;,
  4;16,16,16,16;,
  4;16,16,16,16;,
  4;17,17,17,17;,
  4;17,17,17,17;,
  4;19,19,19,19;,
  4;18,18,18,18;,
  4;20,20,20,20;,
  4;20,20,20,20;,
  4;22,24,24,22;,
  4;22,22,21,21;,
  4;25,25,25,25;,
  4;25,25,25,25;,
  4;26,26,26,26;,
  4;26,26,26,26;,
  4;20,20,20,20;,
  4;20,20,20,20;,
  4;23,27,27,23;,
  4;23,23,21,21;,
  4;25,25,25,25;,
  4;25,25,25,25;,
  4;26,26,26,26;,
  4;26,26,26,26;,
  3;28,28,28;,
  3;28,28,28;,
  4;28,28,28,28;,
  4;28,28,28,28;,
  4;29,29,29,29;,
  4;30,30,30,30;,
  4;31,31,31,31;,
  4;32,32,32,32;,
  4;33,33,33,33;,
  4;29,29,29,29;,
  4;30,30,30,30;,
  4;31,31,31,31;,
  4;32,32,32,32;,
  4;33,33,33,33;,
  4;29,29,29,29;,
  4;30,30,30,30;,
  4;31,31,31,31;,
  4;32,32,32,32;,
  4;33,33,33,33;,
  3;34,34,34;,
  3;34,34,34;,
  4;34,34,34,34;,
  4;34,34,34,34;,
  4;35,35,35,35;,
  4;36,36,36,36;,
  4;37,37,37,37;,
  4;38,38,38,38;,
  4;39,39,39,39;,
  4;35,35,35,35;,
  4;36,36,36,36;,
  4;37,37,37,37;,
  4;38,38,38,38;,
  4;39,39,39,39;,
  4;35,35,35,35;,
  4;36,36,36,36;,
  4;37,37,37,37;,
  4;38,38,38,38;,
  4;39,39,39,39;;
 }
 MeshTextureCoords {
  324;
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.783990;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.783990;1.000000;,
  0.216010;0.000000;,
  0.216010;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  0.783990;0.000000;,
  1.000000;1.000000;,
  0.783990;1.000000;,
  0.783990;0.000000;,
  1.000000;0.000000;,
  0.783990;1.000000;,
  0.517240;1.000000;,
  0.517240;0.000000;,
  0.482760;0.000000;,
  0.482760;1.000000;,
  0.517240;1.000000;,
  0.517240;0.000000;,
  0.517240;1.000000;,
  0.517240;0.000000;,
  0.245990;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  0.245990;0.000000;,
  0.754010;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.754010;1.000000;,
  0.245990;1.000000;,
  0.000000;1.000000;,
  0.245990;0.000000;,
  0.245990;1.000000;,
  0.000000;0.000000;,
  0.245990;0.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.783990;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.783990;1.000000;,
  0.216010;0.000000;,
  0.216010;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  0.783990;0.000000;,
  1.000000;1.000000;,
  0.783990;1.000000;,
  0.783990;0.000000;,
  1.000000;0.000000;,
  0.783990;1.000000;,
  0.517240;1.000000;,
  0.517240;0.000000;,
  0.482760;0.000000;,
  0.482760;1.000000;,
  0.517240;1.000000;,
  0.517240;0.000000;,
  0.517240;1.000000;,
  0.517240;0.000000;,
  0.245990;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  0.245990;0.000000;,
  0.754010;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.754010;1.000000;,
  0.245990;1.000000;,
  0.000000;1.000000;,
  0.245990;0.000000;,
  0.245990;1.000000;,
  0.000000;0.000000;,
  0.245990;0.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.812560;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.812560;1.000000;,
  0.602800;1.000000;,
  0.602800;0.000000;,
  0.187440;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  0.187440;0.000000;,
  0.397200;0.000000;,
  0.397200;1.000000;,
  0.812560;0.000000;,
  1.000000;1.000000;,
  0.812560;1.000000;,
  0.602800;1.000000;,
  0.602800;0.000000;,
  0.812560;0.000000;,
  1.000000;0.000000;,
  0.812560;1.000000;,
  0.602800;1.000000;,
  0.602800;0.000000;,
  0.186580;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  0.186580;0.000000;,
  0.388060;0.000000;,
  0.388060;1.000000;,
  0.813420;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.813420;1.000000;,
  0.611940;1.000000;,
  0.611940;0.000000;,
  0.186580;1.000000;,
  0.000000;1.000000;,
  0.186580;0.000000;,
  0.388060;0.000000;,
  0.388060;1.000000;,
  0.186580;1.000000;,
  0.000000;0.000000;,
  0.186580;0.000000;,
  0.388060;0.000000;,
  0.388060;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.812560;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.812560;1.000000;,
  0.602800;1.000000;,
  0.602800;0.000000;,
  0.187440;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  0.187440;0.000000;,
  0.397200;0.000000;,
  0.397200;1.000000;,
  0.812560;0.000000;,
  1.000000;1.000000;,
  0.812560;1.000000;,
  0.602800;1.000000;,
  0.602800;0.000000;,
  0.812560;0.000000;,
  1.000000;0.000000;,
  0.812560;1.000000;,
  0.602800;1.000000;,
  0.602800;0.000000;,
  0.184640;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  0.184640;0.000000;,
  0.388060;0.000000;,
  0.388060;1.000000;,
  0.815360;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.815360;1.000000;,
  0.611940;1.000000;,
  0.611940;0.000000;,
  0.184640;1.000000;,
  0.000000;1.000000;,
  0.184640;0.000000;,
  0.388060;0.000000;,
  0.388060;1.000000;,
  0.184640;1.000000;,
  0.000000;0.000000;,
  0.184640;0.000000;,
  0.388060;0.000000;,
  0.388060;1.000000;,
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
  0.602800;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.602800;1.000000;,
  0.397200;0.000000;,
  0.397200;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  0.602800;0.000000;,
  1.000000;1.000000;,
  0.602800;1.000000;,
  0.602800;0.000000;,
  1.000000;0.000000;,
  0.602800;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.602800;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.602800;1.000000;,
  0.397200;0.000000;,
  0.397200;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  0.602800;0.000000;,
  1.000000;1.000000;,
  0.602800;1.000000;,
  0.602800;0.000000;,
  1.000000;0.000000;,
  0.602800;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.602800;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.602800;1.000000;,
  0.397200;0.000000;,
  0.397200;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  0.602800;0.000000;,
  1.000000;1.000000;,
  0.602800;1.000000;,
  0.602800;0.000000;,
  1.000000;0.000000;,
  0.602800;1.000000;,
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
  0.602800;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.602800;1.000000;,
  0.397200;0.000000;,
  0.397200;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  0.602800;0.000000;,
  1.000000;1.000000;,
  0.602800;1.000000;,
  0.602800;0.000000;,
  1.000000;0.000000;,
  0.602800;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.602800;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.602800;1.000000;,
  0.397200;0.000000;,
  0.397200;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  0.602800;0.000000;,
  1.000000;1.000000;,
  0.602800;1.000000;,
  0.602800;0.000000;,
  1.000000;0.000000;,
  0.602800;1.000000;,
  0.000000;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.000000;1.000000;,
  0.602800;0.000000;,
  1.000000;0.000000;,
  1.000000;1.000000;,
  0.602800;1.000000;,
  0.397200;0.000000;,
  0.397200;1.000000;,
  0.000000;1.000000;,
  0.000000;0.000000;,
  0.602800;0.000000;,
  1.000000;1.000000;,
  0.602800;1.000000;,
  0.602800;0.000000;,
  1.000000;0.000000;,
  0.602800;1.000000;;
 }
}
