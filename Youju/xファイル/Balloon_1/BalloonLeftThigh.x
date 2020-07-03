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
 79;
 -3.70531;-11.84875;1.48932;,
 -3.97879;-8.89696;0.95649;,
 -3.18190;-11.17444;-2.00943;,
 2.66504;-6.96841;-3.08922;,
 1.55696;-5.13889;-4.27749;,
 3.15545;-6.12910;0.62643;,
 -3.17248;-6.96841;-3.14112;,
 -2.06911;-9.82114;-4.47552;,
 -3.41296;-9.17044;-2.32536;,
 -0.24427;-4.33255;-4.91877;,
 1.96718;-3.03586;-4.05114;,
 -2.08795;-3.31879;-4.38594;,
 -3.97879;-8.89696;0.95649;,
 -3.78076;-4.93612;0.56040;,
 3.45722;-9.12331;1.05078;,
 -3.69589;-15.78130;2.79546;,
 -2.71036;-15.50779;-1.20783;,
 -2.22943;-17.88430;0.37650;,
 -3.51670;-17.78530;3.78567;,
 -0.24427;-9.98149;-4.84803;,
 -1.72018;-8.32642;-4.96593;,
 -0.23956;-6.99199;-5.30070;,
 -1.65415;-18.46900;5.07765;,
 -2.04079;-14.61190;5.59161;,
 -3.69589;-15.78130;2.79546;,
 1.72673;-14.61190;5.62461;,
 -1.92763;-10.17952;5.17668;,
 0.92039;-18.46429;5.10123;,
 3.41480;-11.98546;1.55061;,
 1.34006;-13.10770;5.33229;,
 1.57583;-13.50379;5.75193;,
 -2.07382;-13.05112;-1.91985;,
 -1.72489;-11.31592;-3.97572;,
 -0.25372;-12.33442;-3.62679;,
 1.53809;-13.05112;-1.89156;,
 1.22690;-11.30650;-3.95214;,
 -2.05495;-5.13889;-4.30578;,
 -2.28601;-7.27963;4.35150;,
 -2.51233;-6.81280;4.71930;,
 -1.36180;-0.47074;-4.73016;,
 1.83986;0.88727;-3.65979;,
 2.21711;0.53360;-3.95214;,
 3.48551;1.44839;0.13131;,
 3.85802;1.09472;0.13131;,
 2.26424;-15.44650;-1.16067;,
 1.40606;-17.88430;0.40950;,
 1.89647;-3.03586;4.36092;,
 -2.16340;-3.31879;4.32321;,
 1.75970;-6.71851;4.75701;,
 2.93384;-14.86651;2.93220;,
 2.63678;-17.78530;4.16289;,
 -3.81847;-3.31879;0.16431;,
 -3.78076;-4.93612;0.56040;,
 -3.81847;-3.31879;0.16431;,
 3.41948;-2.63506;0.23034;,
 2.48117;0.43460;3.58290;,
 -0.26314;-14.03662;-2.16033;,
 -1.98421;-13.50379;5.71893;,
 -1.73902;-13.10770;5.30871;,
 1.41551;-10.17952;5.20497;,
 1.57583;-9.81172;-4.44723;,
 2.65562;-11.17444;-1.95756;,
 -3.18190;-11.17444;-2.00943;,
 2.89139;-9.17044;-2.26878;,
 -3.70531;-11.84875;1.48932;,
 1.23161;-8.31700;-4.94706;,
 1.51925;-7.18531;4.38450;,
 -1.56928;-1.88062;-4.71129;,
 2.10866;0.78824;3.39429;,
 -1.79089;-1.34779;4.26663;,
 -3.81847;-3.56869;0.07473;,
 -3.42238;-3.23389;-3.51360;,
 -3.64873;-2.37100;3.71022;,
 -3.67702;-3.19144;3.37542;,
 -3.17719;-1.72030;-4.61226;,
 -3.81847;-3.56869;0.07473;,
 -3.86092;-2.73409;0.07473;,
 -3.51670;-17.78530;3.78567;,
 -3.86092;-2.73409;0.07473;;
 
 126;
 3;0,1,2;,
 3;3,4,5;,
 3;6,7,8;,
 3;4,9,10;,
 3;11,10,9;,
 3;12,13,6;,
 3;14,3,5;,
 3;15,16,17;,
 3;15,17,18;,
 3;19,20,21;,
 3;22,23,24;,
 3;22,25,23;,
 3;1,0,26;,
 3;22,27,25;,
 3;28,29,30;,
 3;31,32,33;,
 3;34,33,35;,
 3;36,6,13;,
 3;37,38,1;,
 3;39,40,41;,
 3;41,40,42;,
 3;41,42,43;,
 3;16,44,45;,
 3;16,45,17;,
 3;46,47,38;,
 3;46,38,48;,
 3;49,27,50;,
 3;47,51,52;,
 3;47,52,38;,
 3;53,11,36;,
 3;53,36,13;,
 3;46,54,43;,
 3;46,43,55;,
 3;34,44,56;,
 3;16,56,44;,
 3;5,4,10;,
 3;5,10,54;,
 3;0,24,23;,
 3;0,23,57;,
 3;26,58,29;,
 3;26,29,59;,
 3;21,20,36;,
 3;19,60,35;,
 3;35,61,34;,
 3;49,45,44;,
 3;28,59,29;,
 3;21,36,9;,
 3;12,8,62;,
 3;33,34,56;,
 3;14,61,63;,
 3;57,23,25;,
 3;57,25,30;,
 3;60,3,63;,
 3;26,0,58;,
 3;60,61,35;,
 3;31,16,15;,
 3;31,15,64;,
 3;65,3,60;,
 3;19,65,60;,
 3;19,35,33;,
 3;4,65,21;,
 3;66,48,38;,
 3;66,38,37;,
 3;28,49,44;,
 3;28,44,34;,
 3;67,41,10;,
 3;67,10,11;,
 3;19,32,7;,
 3;55,68,69;,
 3;12,6,8;,
 3;7,6,20;,
 3;14,28,61;,
 3;19,21,65;,
 3;19,33,32;,
 3;54,10,41;,
 3;54,41,43;,
 3;7,62,8;,
 3;31,56,16;,
 3;14,48,66;,
 3;4,21,9;,
 3;7,32,31;,
 3;7,31,62;,
 3;53,70,71;,
 3;3,65,4;,
 3;14,59,28;,
 3;33,56,31;,
 3;20,19,7;,
 3;38,52,1;,
 3;72,73,69;,
 3;37,26,59;,
 3;37,59,66;,
 3;73,47,69;,
 3;66,59,14;,
 3;28,34,61;,
 3;20,6,36;,
 3;31,64,62;,
 3;14,5,48;,
 3;67,11,71;,
 3;39,67,74;,
 3;74,67,71;,
 3;68,55,43;,
 3;68,43,42;,
 3;39,41,67;,
 3;69,47,46;,
 3;69,46,55;,
 3;75,73,72;,
 3;75,72,76;,
 3;51,47,73;,
 3;22,24,77;,
 3;75,51,73;,
 3;71,11,53;,
 3;49,25,27;,
 3;49,50,45;,
 3;57,58,0;,
 3;30,29,58;,
 3;30,58,57;,
 3;30,25,49;,
 3;30,49,28;,
 3;60,63,61;,
 3;36,11,9;,
 3;5,54,46;,
 3;5,46,48;,
 3;63,3,14;,
 3;74,71,70;,
 3;74,70,78;,
 3;1,26,37;;
 
 MeshMaterialList {
  8;
  126;
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6,
  6;;
  Material {
   0.065600;0.037600;0.800000;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
  Material {
   0.775200;0.612000;0.489600;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
  Material {
   0.800000;0.084800;0.232000;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
  Material {
   0.800000;0.627200;0.677600;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
  Material {
   0.800000;0.000000;0.116000;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
  Material {
   0.724706;0.552157;0.000000;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
  Material {
   0.285600;0.800000;0.000000;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
  Material {
   0.000000;0.683922;0.489412;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
 }
 MeshNormals {
  108;
  -0.984186;-0.100457;0.145901;,
  -0.983164;-0.105903;0.148905;,
  -0.900167;-0.285238;-0.329147;,
  0.916999;0.080111;-0.390763;,
  0.678132;0.116611;-0.725630;,
  0.998676;0.051432;-0.000325;,
  -0.905007;0.059964;-0.421149;,
  -0.686112;-0.256978;-0.680597;,
  -0.937082;-0.092671;-0.336583;,
  0.020741;0.164260;-0.986199;,
  0.175364;0.080872;-0.981176;,
  -0.194256;0.060106;-0.979108;,
  -0.994753;0.095935;0.035551;,
  0.996080;0.033913;0.081695;,
  -0.994231;-0.101456;-0.034789;,
  -0.966122;-0.085096;-0.243654;,
  -0.908841;-0.298014;-0.291884;,
  -0.908828;-0.247279;-0.335984;,
  0.007909;-0.312228;-0.949974;,
  -0.471602;-0.046400;-0.880590;,
  0.007351;0.048947;-0.998774;,
  -0.354758;-0.015075;0.934837;,
  -0.615705;-0.058031;0.785837;,
  -0.008856;-0.123710;0.992279;,
  -0.897200;-0.009196;0.441529;,
  0.469740;-0.014959;0.882678;,
  0.994520;0.030864;0.099883;,
  0.511220;0.577468;0.636541;,
  0.148464;0.758128;0.634981;,
  -0.661224;-0.450512;-0.599851;,
  -0.401837;-0.495760;-0.769903;,
  0.007165;-0.619478;-0.784981;,
  0.628011;-0.427808;-0.650063;,
  0.468814;-0.492198;-0.733454;,
  -0.997649;-0.050743;-0.046051;,
  -0.711635;0.076756;-0.698344;,
  -0.528827;-0.492973;0.690883;,
  -0.581095;-0.423959;0.694685;,
  0.054747;0.206722;-0.976867;,
  0.258729;0.764276;-0.590712;,
  0.603785;0.336703;-0.722548;,
  -0.070433;-0.374805;0.924424;,
  0.632871;0.767519;-0.101921;,
  0.809823;0.586466;0.015641;,
  0.097147;-0.448128;-0.888675;,
  0.011111;-0.549361;-0.835512;,
  0.007531;0.115184;0.993316;,
  -0.188727;0.092170;0.977695;,
  0.137756;-0.446014;0.884361;,
  0.346885;0.334201;0.876345;,
  0.820673;0.059136;0.568330;,
  -0.993452;-0.023506;-0.111803;,
  0.994033;-0.088060;-0.064366;,
  0.627119;0.362674;0.689339;,
  0.008868;-0.467933;-0.883719;,
  -0.537525;0.584650;0.607660;,
  -0.124265;0.614900;0.778753;,
  -0.010567;0.194842;0.980778;,
  0.672847;-0.224976;-0.704744;,
  0.881893;-0.287765;-0.373438;,
  0.939150;-0.094656;-0.330208;,
  0.484860;-0.046251;-0.873368;,
  0.105321;-0.464823;0.879117;,
  -0.036608;-0.151524;-0.987775;,
  0.412992;0.680084;0.605742;,
  -0.121408;0.090138;0.988502;,
  0.999463;-0.011057;0.030846;,
  0.993624;-0.038044;0.106130;,
  -0.313216;-0.134042;0.940175;,
  -0.088598;-0.302336;-0.949075;,
  -0.052000;-0.476568;-0.877599;,
  0.007559;-0.553623;-0.832733;,
  -0.014169;0.110832;0.993738;,
  -0.929010;0.100308;0.356200;,
  -0.934190;-0.032585;-0.355285;,
  0.939266;-0.052778;0.339108;,
  0.933942;-0.089068;0.346149;,
  0.941748;-0.103401;-0.320030;,
  -0.008130;0.121043;0.992614;,
  -0.008052;0.044103;0.998995;,
  0.944582;-0.277787;-0.174927;,
  0.931283;-0.305229;-0.198865;,
  0.952271;-0.173429;-0.251201;,
  0.883904;0.053165;0.464636;,
  -0.008954;-0.114542;0.993378;,
  -0.009207;-0.115380;0.993279;,
  -0.893433;-0.037364;0.447639;,
  -0.957377;0.183385;-0.223158;,
  -0.038980;0.437960;0.898149;,
  0.377044;-0.688552;0.619462;,
  -0.011532;0.268743;0.963143;,
  0.883630;0.095007;0.458444;,
  0.941926;0.070479;0.328340;,
  -0.351105;-0.303241;-0.885872;,
  -0.999268;0.000995;-0.038238;,
  -0.999010;0.017807;0.040777;,
  -0.998509;-0.016455;0.052041;,
  -0.097871;-0.995180;0.006107;,
  -0.111254;-0.992805;0.044275;,
  -0.435364;0.367214;0.821956;,
  0.998875;0.016000;-0.044635;,
  -0.084328;-0.995922;-0.032071;,
  0.906491;-0.082060;0.414174;,
  0.928556;-0.220430;-0.298655;,
  -0.436363;0.763381;0.476273;,
  0.910690;0.062671;0.408310;,
  -0.991553;0.018473;-0.128380;,
  -0.991045;0.087030;-0.101274;;
  126;
  3;0,1,2;,
  3;3,4,5;,
  3;6,7,8;,
  3;4,9,10;,
  3;11,10,9;,
  3;1,12,6;,
  3;13,3,5;,
  3;14,15,16;,
  3;14,16,17;,
  3;18,19,20;,
  3;21,22,14;,
  3;21,23,22;,
  3;1,0,24;,
  3;21,25,23;,
  3;26,27,28;,
  3;29,30,31;,
  3;32,31,33;,
  3;35,6,12;,
  3;36,37,1;,
  3;38,39,40;,
  3;40,39,42;,
  3;40,42,43;,
  3;70,44,45;,
  3;70,45,71;,
  3;46,47,72;,
  3;46,72,48;,
  3;50,25,49;,
  3;73,51,12;,
  3;73,12,37;,
  3;51,74,35;,
  3;51,35,12;,
  3;75,52,76;,
  3;75,76,53;,
  3;32,44,54;,
  3;70,54,44;,
  3;5,4,77;,
  3;5,77,52;,
  3;0,14,22;,
  3;0,22,55;,
  3;78,56,79;,
  3;78,79,57;,
  3;20,19,35;,
  3;18,58,33;,
  3;33,59,32;,
  3;80,81,82;,
  3;26,83,27;,
  3;20,35,9;,
  3;1,8,2;,
  3;31,32,54;,
  3;13,59,60;,
  3;84,22,23;,
  3;84,23,85;,
  3;58,3,60;,
  3;24,0,86;,
  3;58,59,33;,
  3;87,15,14;,
  3;29,14,0;,
  3;61,3,58;,
  3;18,61,58;,
  3;18,33,31;,
  3;4,61,20;,
  3;62,48,37;,
  3;62,37,36;,
  3;26,80,82;,
  3;26,82,32;,
  3;63,40,10;,
  3;63,10,11;,
  3;18,30,7;,
  3;88,64,65;,
  3;1,6,8;,
  3;7,6,19;,
  3;13,26,59;,
  3;18,20,61;,
  3;18,31,30;,
  3;52,77,40;,
  3;52,40,43;,
  3;7,2,8;,
  3;29,54,70;,
  3;89,48,62;,
  3;4,20,9;,
  3;7,30,29;,
  3;7,29,2;,
  3;66,66,67;,
  3;3,61,4;,
  3;13,83,26;,
  3;31,54,29;,
  3;19,18,7;,
  3;37,12,1;,
  3;41,68,65;,
  3;90,78,57;,
  3;90,57,62;,
  3;68,47,65;,
  3;91,83,13;,
  3;26,32,59;,
  3;19,6,35;,
  3;29,0,2;,
  3;13,5,92;,
  3;63,11,93;,
  3;38,63,69;,
  3;69,63,93;,
  3;64,53,43;,
  3;64,43,42;,
  3;38,40,63;,
  3;65,47,46;,
  3;65,46,53;,
  3;94,95,96;,
  3;94,96,34;,
  3;97,98,98;,
  3;21,99,99;,
  3;66,66,100;,
  3;101,101,97;,
  3;50,102,25;,
  3;80,103,81;,
  3;55,56,104;,
  3;28,27,56;,
  3;28,56,55;,
  3;105,102,50;,
  3;105,50,26;,
  3;58,60,59;,
  3;35,11,9;,
  3;5,52,75;,
  3;5,75,92;,
  3;60,3,13;,
  3;106,107,94;,
  3;106,94,34;,
  3;1,24,36;;
 }
 MeshTextureCoords {
  79;
  0.968800;0.186500;,
  0.979500;0.215800;,
  0.997100;0.206100;,
  0.666300;0.251700;,
  0.627300;0.283000;,
  0.714100;0.257000;,
  0.493700;0.251600;,
  0.526000;0.221500;,
  0.486900;0.228400;,
  0.580100;0.293900;,
  0.628200;0.377800;,
  0.528800;0.375100;,
  0.430400;0.231300;,
  0.425900;0.255900;,
  0.717400;0.224700;,
  0.432700;0.087400;,
  0.531900;0.085500;,
  0.531100;0.005700;,
  0.432200;0.012300;,
  0.579900;0.219800;,
  0.536200;0.237300;,
  0.579900;0.251400;,
  0.893800;0.043300;,
  0.894700;0.085300;,
  0.983300;0.083700;,
  0.799300;0.085300;,
  0.892400;0.206000;,
  0.805900;0.043400;,
  0.709600;0.182300;,
  0.803500;0.152400;,
  0.801400;0.130400;,
  0.526500;0.187400;,
  0.536400;0.205700;,
  0.579900;0.195000;,
  0.633300;0.187400;,
  0.623600;0.205800;,
  0.526500;0.278300;,
  0.893100;0.241900;,
  0.897700;0.254800;,
  0.539100;0.466400;,
  0.613200;0.476700;,
  0.614700;0.466700;,
  0.714800;0.479200;,
  0.714100;0.469400;,
  0.625300;0.085500;,
  0.621400;0.009200;,
  0.807200;0.349800;,
  0.897700;0.348000;,
  0.797500;0.255900;,
  0.710900;0.086900;,
  0.710900;0.013500;,
  0.987200;0.351700;,
  0.988300;0.248700;,
  0.426400;0.353300;,
  0.717400;0.358600;,
  0.810800;0.455400;,
  0.579900;0.177000;,
  0.894100;0.130400;,
  0.893000;0.155500;,
  0.803900;0.206000;,
  0.633800;0.221600;,
  0.666300;0.207200;,
  0.493800;0.207200;,
  0.673200;0.228400;,
  0.430600;0.196000;,
  0.623400;0.237400;,
  0.798700;0.242400;,
  0.531800;0.442700;,
  0.811400;0.462100;,
  0.903100;0.443900;,
  0.426900;0.398700;,
  0.475200;0.413900;,
  0.963200;0.431600;,
  0.964500;0.425000;,
  0.485600;0.437700;,
  0.978200;0.419400;,
  0.977400;0.431600;,
  0.981300;0.005600;,
  0.431900;0.419100;;
 }
}
