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
 126;
 -4.93180;-1.55731;-3.95961;,
 -0.61122;-2.01652;-3.12359;,
 -0.72492;-3.08306;-2.12221;,
 -5.12433;-2.80564;-2.64303;,
 -0.61387;0.58313;4.28429;,
 -1.64238;0.40840;4.24140;,
 -1.57724;-1.38461;4.19353;,
 -0.55449;-1.19241;4.43301;,
 -6.46980;-1.24437;-4.13533;,
 -7.56206;-1.63735;-3.86909;,
 -7.44913;-0.54283;-4.46959;,
 -6.48040;-0.55190;-4.35470;,
 -4.84176;1.22256;-4.14283;,
 -6.35297;1.25426;-4.38744;,
 -6.33874;2.56267;-3.96597;,
 -4.93619;2.19363;-3.78788;,
 -6.47447;-3.40549;1.58282;,
 -7.35833;-3.57970;1.54525;,
 -7.32716;-3.99606;0.76079;,
 -6.53182;-4.17077;0.54497;,
 -6.46471;-1.73353;4.16616;,
 -7.27477;-1.64373;4.26082;,
 -7.42071;-3.08787;2.64595;,
 -6.60935;-3.07810;2.67935;,
 -6.42052;-0.09945;4.35405;,
 -7.29244;-0.25284;4.40981;,
 -6.48316;0.79058;4.06818;,
 -7.40840;0.59700;4.18838;,
 -6.62125;4.01518;-0.79180;,
 -6.51629;3.89543;-2.68105;,
 -7.50218;3.86896;-2.96415;,
 -7.55090;4.16290;-1.18985;,
 -6.38884;-3.49529;-1.80692;,
 -7.47935;-3.55759;-2.15140;,
 -7.47696;-3.05443;-2.94686;,
 -6.47395;-2.84018;-2.91489;,
 -6.42229;3.11055;-3.37896;,
 -5.29090;3.69666;-2.41840;,
 -5.08347;2.67425;-3.42970;,
 -8.42927;-1.20022;2.41992;,
 -8.40452;-0.50210;2.75689;,
 -8.38988;0.23460;2.76717;,
 -7.40389;1.66701;3.95899;,
 -8.38251;1.03887;2.48241;,
 -8.46923;2.74214;-0.54206;,
 -8.40285;2.65358;-1.67660;,
 -7.57244;1.24465;-4.47261;,
 -7.50404;2.64403;-4.10562;,
 -4.98411;-0.48655;-3.96642;,
 -7.49723;2.21903;3.11279;,
 -6.49047;1.80240;3.92879;,
 -6.54820;2.35387;3.00193;,
 -8.46974;1.95570;1.53342;,
 -7.41165;3.14776;2.29230;,
 -7.45972;4.02893;0.71637;,
 -8.43825;2.57045;0.46839;,
 -6.73421;3.94227;0.94439;,
 -6.57531;3.02533;2.36586;,
 -8.44977;1.50588;2.04286;,
 -8.48643;1.88787;-2.49758;,
 -8.46607;0.93544;-2.93660;,
 -8.49604;-0.31529;-2.86363;,
 -8.48536;-1.14395;-2.56264;,
 -8.50319;-1.95090;-1.82451;,
 -8.47107;-2.35063;-0.91931;,
 -8.46662;-2.39739;0.30211;,
 -8.50485;-2.16506;1.01166;,
 -7.32716;-3.99606;0.76079;,
 -8.46662;-2.39739;0.30211;,
 -6.53182;-4.17077;0.54497;,
 -7.48741;3.16997;-3.60182;,
 -8.49122;2.24409;-2.16139;,
 -0.70595;3.03635;-1.37671;,
 -0.22729;2.20688;-2.61201;,
 0.55128;3.07210;-1.34083;,
 0.89754;2.31028;-2.60577;,
 -8.47394;-1.76361;1.83594;,
 -5.41404;3.70544;-0.54234;,
 -5.71674;3.64144;1.19806;,
 -5.54976;2.87940;2.30760;,
 -5.25387;1.65795;3.93211;,
 -5.50289;2.22633;2.96707;,
 -5.27135;0.72683;3.97798;,
 -5.31219;-0.15978;4.28171;,
 -5.33636;-1.88158;3.94987;,
 -5.33207;-2.95954;2.65457;,
 -5.22697;-3.46302;1.76087;,
 -5.28512;-4.07396;0.13064;,
 -5.28512;-4.07396;0.13064;,
 -5.13335;-3.36535;-1.53063;,
 -0.08851;-0.51161;-3.60787;,
 -0.08640;0.68177;-3.60834;,
 -0.08742;1.32857;-3.55752;,
 -1.01425;3.20733;-0.89727;,
 -1.73164;2.70633;1.84704;,
 -1.45731;3.09934;0.47969;,
 -1.73983;1.82940;3.18264;,
 -1.73565;2.37631;2.35761;,
 -1.71157;1.14006;3.86323;,
 -1.35107;-2.92906;3.18635;,
 -1.23358;-3.56797;2.51276;,
 -1.08269;-3.87961;0.68469;,
 -1.08492;-3.84499;-0.66634;,
 -1.08269;-3.87961;0.68469;,
 -8.43825;2.57045;0.46839;,
 -7.45972;4.02893;0.71637;,
 -6.73421;3.94227;0.94439;,
 -5.71674;3.64144;1.19806;,
 -1.45731;3.09934;0.47969;,
 -0.61028;1.22556;3.86442;,
 -0.62800;2.00662;3.27196;,
 -0.63646;2.43814;2.56895;,
 -0.32167;3.09367;0.41508;,
 -0.62908;2.76514;1.88011;,
 0.02298;3.23886;-0.55870;,
 -0.32167;3.09367;0.41508;,
 1.03276;1.25871;-3.64952;,
 1.08324;0.51085;-3.42330;,
 0.70414;-0.68288;-3.56277;,
 0.29351;-2.07301;-2.99797;,
 0.13114;-3.17609;-2.03315;,
 -0.06154;-3.85270;-0.58781;,
 -0.14480;-3.98874;1.03910;,
 -0.19119;-3.57241;2.65522;,
 -0.14480;-3.98874;1.03910;,
 -0.37321;-2.75478;3.58970;;
 
 95;
 4;0,1,2,3;,
 4;4,5,6,7;,
 4;8,9,10,11;,
 4;12,13,14,15;,
 4;16,17,18,19;,
 4;20,21,22,23;,
 4;24,25,21,20;,
 4;26,27,25,24;,
 4;28,29,30,31;,
 4;32,33,34,35;,
 4;36,29,37,38;,
 4;39,21,25,40;,
 4;41,27,42,43;,
 4;44,31,30,45;,
 4;13,46,47,14;,
 4;48,11,13,12;,
 4;0,8,11,48;,
 4;49,42,50,51;,
 4;52,53,54,55;,
 4;56,54,53,57;,
 4;58,43,42,49;,
 4;35,34,9,8;,
 4;59,47,46,60;,
 4;61,10,9,62;,
 4;63,34,33,64;,
 4;65,18,17,66;,
 4;50,42,27,26;,
 4;40,25,27,41;,
 4;64,33,67,68;,
 4;69,67,33,32;,
 4;70,47,59,71;,
 4;36,14,47,70;,
 4;38,37,72,73;,
 4;73,72,74,75;,
 4;60,46,10,61;,
 4;11,10,46,13;,
 4;23,22,17,16;,
 4;66,17,22,76;,
 4;62,9,34,63;,
 4;38,15,14,36;,
 4;77,37,29,28;,
 4;78,56,57,79;,
 4;51,50,80,81;,
 4;80,50,26,82;,
 4;82,26,24,83;,
 4;83,24,20,84;,
 4;84,20,23,85;,
 4;85,23,16,86;,
 4;86,16,19,87;,
 4;88,69,32,89;,
 4;89,32,35,3;,
 4;3,35,8,0;,
 4;48,90,1,0;,
 4;12,91,90,48;,
 4;15,92,91,12;,
 4;73,92,15,38;,
 4;93,72,37,77;,
 4;79,94,95,78;,
 4;81,80,96,97;,
 4;82,98,96,80;,
 4;83,5,98,82;,
 4;84,6,5,83;,
 4;85,99,6,84;,
 4;86,100,99,85;,
 4;87,101,100,86;,
 4;89,102,103,88;,
 4;3,2,102,89;,
 4;104,105,31,44;,
 4;31,105,106,28;,
 4;28,106,107,77;,
 4;77,107,108,93;,
 4;76,22,21,39;,
 4;109,98,5,4;,
 4;110,96,98,109;,
 4;97,96,110,111;,
 4;112,95,94,113;,
 4;114,93,108,115;,
 4;74,72,93,114;,
 4;75,116,92,73;,
 4;117,91,92,116;,
 4;118,90,91,117;,
 4;119,1,90,118;,
 4;120,2,1,119;,
 4;121,102,2,120;,
 4;122,103,102,121;,
 4;123,100,101,124;,
 4;125,99,100,123;,
 4;7,6,99,125;,
 4;111,113,94,97;,
 4;97,94,79,81;,
 4;81,79,57,51;,
 4;51,57,53,49;,
 4;49,53,52,58;,
 4;70,30,29,36;,
 4;71,45,30,70;;
 
 MeshMaterialList {
  9;
  95;
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8,
  8;;
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
   0.000000;0.690400;0.251200;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
  Material {
   0.800000;0.768800;0.000000;1.000000;;
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
   0.721569;0.665098;0.050196;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
 }
 MeshNormals {
  115;
  0.111600;-0.443692;-0.889204;,
  0.065408;-0.491720;-0.868293;,
  0.016262;-0.803515;-0.595062;,
  0.066336;-0.795277;-0.602606;,
  0.010059;-0.798473;-0.601947;,
  -0.028871;-0.966389;-0.255459;,
  -0.130095;0.851385;0.508153;,
  -0.136566;0.748534;0.648881;,
  -0.093100;0.576595;0.811708;,
  -0.112321;0.269458;0.956439;,
  -0.067811;0.208946;0.975573;,
  -0.093268;-0.333317;0.938190;,
  -0.162446;-0.258706;0.952199;,
  -0.112055;-0.888987;0.444010;,
  -0.143689;-0.639395;0.755332;,
  -0.075077;-0.994519;0.072771;,
  0.037232;-0.523168;-0.851416;,
  0.080418;-0.157980;-0.984162;,
  0.093177;-0.457693;-0.884215;,
  0.058822;-0.484319;-0.872912;,
  -0.456984;-0.186829;-0.869632;,
  0.131158;-0.158128;-0.978669;,
  0.148033;0.104630;-0.983432;,
  0.146322;0.131159;-0.980503;,
  0.172365;0.512468;-0.841230;,
  0.181443;0.490836;-0.852149;,
  0.044408;-0.896319;0.441180;,
  -0.421550;-0.822539;0.381740;,
  -0.469712;-0.870886;0.144665;,
  0.034109;-0.990794;0.131011;,
  0.066701;-0.470307;0.879979;,
  -0.290024;-0.488874;0.822732;,
  -0.448346;-0.748490;0.488619;,
  0.031039;-0.850213;0.525523;,
  0.083142;0.085533;0.992860;,
  0.067220;0.087482;0.993896;,
  0.053641;0.216383;0.974834;,
  -0.456352;0.181442;0.871104;,
  0.169803;0.985478;-0.001044;,
  0.195693;0.889142;-0.413679;,
  0.154224;0.882818;-0.443676;,
  0.108705;0.993729;-0.026202;,
  0.096995;-0.917241;-0.386344;,
  0.074753;-0.926612;-0.368514;,
  0.145284;-0.717637;-0.681094;,
  0.127819;-0.749939;-0.649040;,
  0.203540;0.684803;-0.699726;,
  0.211836;0.903924;-0.371546;,
  0.214156;0.708470;-0.672464;,
  -0.836125;-0.264173;0.480736;,
  -0.819310;-0.464090;0.336677;,
  -0.836624;-0.058443;0.544651;,
  -0.836435;0.087626;0.541016;,
  -0.835547;0.271122;0.477863;,
  -0.844276;0.535908;-0.000569;,
  -0.869232;0.452340;-0.199561;,
  0.097819;0.133931;-0.986151;,
  0.132490;0.509346;-0.850302;,
  0.152086;-0.110653;-0.982154;,
  -0.003610;0.996776;-0.080148;,
  -0.009110;0.913170;-0.407477;,
  -0.470145;0.654935;0.591628;,
  0.033495;0.547914;0.835864;,
  0.042218;0.779227;0.625318;,
  -0.803528;0.477450;0.355505;,
  -0.445298;0.703293;0.554155;,
  -0.440118;0.853001;0.280511;,
  -0.821405;0.535571;0.196107;,
  0.132729;0.943494;0.303647;,
  0.071972;0.773712;0.629436;,
  -0.806940;0.412200;0.423012;,
  -0.059354;0.928207;0.367298;,
  -0.025676;0.984520;0.173384;,
  -0.870004;0.267314;-0.414290;,
  -0.865095;0.070757;-0.496593;,
  -0.843983;-0.116987;-0.523457;,
  -0.835409;-0.275390;-0.475660;,
  -0.840496;-0.420975;-0.341094;,
  -0.827595;-0.543376;-0.140814;,
  -0.812361;-0.577457;0.081325;,
  -0.809661;-0.544563;0.218860;,
  -0.867629;0.370521;-0.331564;,
  0.088554;0.918081;-0.386376;,
  0.077444;0.762483;-0.642356;,
  -0.040174;0.780173;-0.624273;,
  0.066925;-0.029135;-0.997333;,
  -0.012175;0.339904;-0.940381;,
  0.185647;0.982594;0.006676;,
  0.166725;0.942793;0.288694;,
  0.123342;0.805947;0.578995;,
  0.079410;0.600298;0.795824;,
  0.097749;0.801484;0.589973;,
  0.043427;0.303093;0.951971;,
  0.038409;0.115513;0.992563;,
  0.032837;-0.444872;0.894992;,
  -0.020566;-0.798051;0.602238;,
  -0.026443;-0.901808;0.431327;,
  0.025156;-0.998350;0.051625;,
  0.061708;-0.926236;-0.371859;,
  0.094698;-0.133890;-0.986461;,
  0.084162;0.025920;-0.996115;,
  0.072407;0.407334;-0.910404;,
  0.069189;0.996570;-0.045407;,
  0.029317;0.891083;0.452892;,
  0.054752;0.974055;0.219590;,
  -0.034760;0.708295;0.705060;,
  -0.026686;0.838382;0.544430;,
  -0.035666;0.490376;0.870781;,
  -0.105010;-0.691932;0.714285;,
  -0.088824;-0.895621;0.435860;,
  -0.042355;-0.997942;0.048142;,
  -0.012264;-0.954647;-0.297486;,
  -0.839297;-0.137710;0.525943;,
  -0.019346;0.556167;0.830845;,
  0.172712;0.686777;-0.706051;;
  95;
  4;0,1,2,3;,
  4;9,10,11,12;,
  4;18,19,20,21;,
  4;22,23,24,25;,
  4;26,27,28,29;,
  4;30,31,32,33;,
  4;34,35,31,30;,
  4;36,37,35,34;,
  4;38,39,40,41;,
  4;42,43,44,45;,
  4;46,39,47,48;,
  4;49,112,51,51;,
  4;52,37,53,53;,
  4;54,54,55,55;,
  4;23,56,57,24;,
  4;58,21,23,22;,
  4;0,18,21,58;,
  4;61,113,62,63;,
  4;64,65,66,67;,
  4;68,66,65,69;,
  4;70,53,53,61;,
  4;45,44,19,18;,
  4;73,73,74,74;,
  4;75,20,76,76;,
  4;77,77,78,78;,
  4;79,28,27,80;,
  4;62,113,37,36;,
  4;51,51,37,52;,
  4;78,78,28,79;,
  4;29,28,43,42;,
  4;81,73,73,81;,
  4;46,24,57,114;,
  4;48,47,82,83;,
  4;83,82,60,84;,
  4;74,74,20,75;,
  4;21,20,56,23;,
  4;33,32,27,26;,
  4;80,27,32,50;,
  4;76,76,77,77;,
  4;48,25,24,46;,
  4;87,47,39,38;,
  4;88,68,69,89;,
  4;63,62,90,91;,
  4;90,62,36,92;,
  4;92,36,34,93;,
  4;93,34,30,94;,
  4;94,30,33,95;,
  4;95,33,26,96;,
  4;96,26,29,97;,
  4;97,29,42,98;,
  4;98,42,45,3;,
  4;3,45,18,0;,
  4;58,99,1,0;,
  4;22,100,99,58;,
  4;25,101,100,22;,
  4;83,101,25,48;,
  4;102,82,47,87;,
  4;89,103,104,88;,
  4;91,90,105,106;,
  4;92,107,105,90;,
  4;93,10,107,92;,
  4;94,11,10,93;,
  4;95,108,11,94;,
  4;96,109,108,95;,
  4;97,110,109,96;,
  4;98,111,110,97;,
  4;3,2,111,98;,
  4;67,66,54,54;,
  4;41,66,68,38;,
  4;38,68,88,87;,
  4;87,88,104,102;,
  4;50,32,31,49;,
  4;8,107,10,9;,
  4;7,105,107,8;,
  4;106,105,7,6;,
  4;72,104,103,71;,
  4;59,102,104,72;,
  4;60,82,102,59;,
  4;84,86,101,83;,
  4;85,100,101,86;,
  4;17,99,100,85;,
  4;16,1,99,17;,
  4;4,2,1,16;,
  4;5,111,2,4;,
  4;15,110,111,5;,
  4;13,109,110,15;,
  4;14,108,109,13;,
  4;12,11,108,14;,
  4;6,71,103,106;,
  4;106,103,89,91;,
  4;91,89,69,63;,
  4;63,69,65,61;,
  4;61,65,64,70;,
  4;114,40,39,46;,
  4;81,55,55,81;;
 }
 MeshTextureCoords {
  126;
  0.663990;0.602150;,
  0.651640;0.678980;,
  0.623580;0.675040;,
  0.633530;0.595810;,
  0.756690;0.323930;,
  0.772160;0.333160;,
  0.760510;0.366460;,
  0.744510;0.357260;,
  0.669470;0.572740;,
  0.662630;0.550360;,
  0.681350;0.553480;,
  0.680820;0.573030;,
  0.711330;0.605060;,
  0.709030;0.575880;,
  0.730530;0.574500;,
  0.729060;0.602630;,
  0.837230;0.449890;,
  0.854070;0.453490;,
  0.851450;0.468300;,
  0.836800;0.471560;,
  0.842360;0.399220;,
  0.857690;0.401540;,
  0.856070;0.434330;,
  0.840510;0.431560;,
  0.849580;0.373940;,
  0.865180;0.382590;,
  0.856640;0.361040;,
  0.872400;0.372110;,
  0.788220;0.557260;,
  0.758890;0.564700;,
  0.752490;0.546810;,
  0.778350;0.539280;,
  0.616430;0.569720;,
  0.623250;0.548980;,
  0.637260;0.550310;,
  0.637720;0.570270;,
  0.742970;0.570980;,
  0.762250;0.588140;,
  0.738880;0.598860;,
  0.893480;0.417820;,
  0.897080;0.401530;,
  0.902000;0.386900;,
  0.879010;0.357090;,
  0.908920;0.370460;,
  0.779960;0.507180;,
  0.755100;0.512910;,
  0.707410;0.551340;,
  0.728210;0.551120;,
  0.681890;0.602950;,
  0.889970;0.346080;,
  0.864620;0.346990;,
  0.875790;0.333300;,
  0.924120;0.348620;,
  0.899190;0.327730;,
  0.915950;0.302330;,
  0.936380;0.328820;,
  0.902190;0.298720;,
  0.884660;0.321290;,
  0.916070;0.359370;,
  0.729160;0.515220;,
  0.706230;0.517980;,
  0.679110;0.519230;,
  0.660260;0.519410;,
  0.636400;0.517170;,
  0.614910;0.515730;,
  0.887750;0.466100;,
  0.889320;0.452140;,
  0.574770;0.548000;,
  0.590690;0.514870;,
  0.576000;0.562560;,
  0.738520;0.549400;,
  0.740170;0.513860;,
  0.775420;0.672390;,
  0.746310;0.684330;,
  0.777620;0.693610;,
  0.748000;0.703360;,
  0.891190;0.434560;,
  0.793140;0.580650;,
  0.882780;0.295080;,
  0.866690;0.312530;,
  0.842310;0.338500;,
  0.856810;0.324790;,
  0.834750;0.352220;,
  0.829330;0.367220;,
  0.821430;0.396250;,
  0.817240;0.425260;,
  0.814470;0.443150;,
  0.814130;0.474400;,
  0.581510;0.585200;,
  0.612690;0.593460;,
  0.682590;0.689610;,
  0.706960;0.689640;,
  0.720330;0.688900;,
  0.784990;0.664940;,
  0.806830;0.277290;,
  0.819070;0.253690;,
  0.789430;0.302630;,
  0.799750;0.286630;,
  0.779870;0.319000;,
  0.750220;0.401090;,
  0.746440;0.418530;,
  0.743500;0.453920;,
  0.593310;0.663840;,
  0.568770;0.658420;,
  0.800790;0.505560;,
  0.809670;0.540010;,
  0.815890;0.553140;,
  0.822490;0.572650;,
  0.809830;0.651560;,
  0.763320;0.310190;,
  0.772430;0.293070;,
  0.781350;0.279640;,
  0.805150;0.241850;,
  0.789960;0.267770;,
  0.792420;0.681720;,
  0.810430;0.671160;,
  0.718310;0.708190;,
  0.702690;0.709320;,
  0.678820;0.702980;,
  0.649320;0.694460;,
  0.620850;0.689770;,
  0.590870;0.681670;,
  0.560450;0.673200;,
  0.728810;0.414510;,
  0.727790;0.447420;,
  0.734450;0.390880;;
 }
}
