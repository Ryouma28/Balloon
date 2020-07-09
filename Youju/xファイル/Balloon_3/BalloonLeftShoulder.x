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
 130;
 1.29397;-0.08347;5.07765;,
 1.59103;1.80734;4.73814;,
 0.86962;1.54331;4.90317;,
 0.59611;2.66081;1.63077;,
 0.71872;2.28359;-0.10446;,
 0.43108;1.90637;0.18318;,
 0.35563;2.27417;1.64493;,
 0.98749;-0.44656;5.08707;,
 0.55369;1.16135;4.78059;,
 1.35055;-0.08347;-1.77366;,
 1.63819;1.78850;-1.32099;,
 2.82646;1.97237;-1.13709;,
 2.74156;0.35975;4.93149;,
 2.74630;-1.29061;5.31813;,
 4.29292;0.82184;4.58727;,
 2.79817;0.35975;-1.66050;,
 2.81230;-1.29532;-1.70766;,
 4.33534;0.81713;-1.23141;,
 4.15615;2.08085;-0.54297;,
 2.78401;1.97711;4.35150;,
 4.12786;2.08556;3.88467;,
 1.05352;-0.43714;-1.67466;,
 0.61969;1.18964;-1.12296;,
 0.94033;1.48670;-1.22199;,
 1.44487;-1.89886;-1.26441;,
 1.61461;-2.68162;1.87125;,
 0.91675;-3.12013;1.80525;,
 0.48295;-1.98376;-1.42473;,
 4.25047;-1.54051;4.42695;,
 2.73214;-1.73386;5.05407;,
 2.52940;-2.72875;1.93728;,
 1.61935;3.09935;1.58835;,
 1.67593;2.67968;-0.14688;,
 2.52940;-2.72875;1.93728;,
 2.79346;-1.73854;-1.33515;,
 4.30234;-1.54051;-0.90135;,
 2.80759;2.96258;-0.04317;,
 1.39300;-1.93189;4.90317;,
 0.98749;-0.44656;5.08707;,
 0.51124;-2.33269;4.66743;,
 4.02886;2.90129;0.32463;,
 4.70314;2.59952;1.60248;,
 4.70314;2.03840;0.00870;,
 1.61461;-2.68162;1.87125;,
 2.73214;-1.73386;5.05407;,
 6.32521;1.17551;-1.12767;,
 9.04591;0.98219;-1.27857;,
 9.08836;-1.37545;-1.33044;,
 6.32992;-1.37077;-1.18425;,
 6.19318;2.43449;1.61190;,
 9.02707;2.48636;1.59306;,
 5.05678;1.20377;-1.36815;,
 5.03320;-1.40848;-1.42473;,
 4.92946;2.78813;1.59306;,
 5.14636;1.21322;4.72872;,
 6.15073;1.19909;4.29021;,
 4.67485;2.03840;3.26226;,
 4.54753;0.63797;4.28547;,
 4.45795;2.01482;3.41316;,
 4.49095;2.01482;-0.14217;,
 4.58527;0.63797;-0.93906;,
 4.70314;1.10006;-1.12767;,
 4.58527;0.63797;-0.93906;,
 4.49095;2.01482;-0.14217;,
 4.79743;1.10948;4.48824;,
 4.50508;2.59010;1.59777;,
 4.45795;2.01482;3.41316;,
 4.00528;2.90129;2.96991;,
 4.78801;-1.24816;4.68627;,
 5.13694;-1.42264;4.94562;,
 0.43108;1.90637;0.18318;,
 -0.19604;1.18493;-0.92019;,
 -0.36110;2.12798;1.66377;,
 0.35563;2.27417;1.64493;,
 0.39337;1.91108;3.30000;,
 -0.21020;1.05761;4.78530;,
 0.39337;1.91108;3.30000;,
 0.68098;2.30246;3.56403;,
 1.65706;2.75984;3.50745;,
 2.78401;2.97203;3.24339;,
 2.78401;3.28793;1.59777;,
 4.00057;3.11348;1.62135;,
 1.05352;-0.43714;-1.67466;,
 0.61969;1.18964;-1.12296;,
 11.52145;0.63797;3.67248;,
 11.77135;0.51065;3.39900;,
 11.73835;1.54802;1.52232;,
 11.48374;1.84979;1.52232;,
 11.49316;-1.18687;3.71022;,
 11.74306;-1.05484;3.43200;,
 11.47429;-2.24308;1.48932;,
 11.73364;-1.98376;1.49403;,
 11.71006;-1.20571;-0.68916;,
 11.95525;-1.06897;-0.38736;,
 11.73364;-1.98376;1.49403;,
 11.47429;-2.24308;1.48932;,
 11.73835;0.64739;-0.61842;,
 11.98354;0.52007;-0.32136;,
 9.05536;0.99632;4.45050;,
 9.01762;-1.41790;4.54011;,
 8.96104;-2.49772;1.78638;,
 8.96104;-2.49772;1.78638;,
 4.04770;-1.14442;4.83246;,
 4.54753;0.63797;4.28547;,
 0.91675;-3.12013;1.80525;,
 0.55369;1.16135;4.78059;,
 6.15073;-1.39432;4.50711;,
 5.06623;-2.58259;1.85712;,
 6.23089;-2.52130;1.87125;,
 6.23089;-2.52130;1.87125;,
 5.06623;-2.58259;1.85712;,
 4.67956;-1.23874;-1.17954;,
 4.64185;-2.49301;1.84296;,
 4.64185;-2.49301;1.84296;,
 12.93133;-1.15855;-0.35436;,
 13.18594;-1.99318;1.40445;,
 11.94112;-2.01202;1.45632;,
 11.94112;-2.01202;1.45632;,
 12.04957;-1.01710;3.49332;,
 13.18594;-1.99318;1.40445;,
 13.56316;-1.18687;3.37542;,
 11.93167;1.66589;1.48461;,
 12.04012;0.59081;3.50274;,
 13.57732;0.75584;3.39429;,
 13.20952;1.64234;1.43274;,
 12.92188;0.65681;-0.37323;,
 4.10431;-1.15387;-1.34457;,
 4.30234;-1.54051;-0.90135;,
 2.79346;-1.73854;-1.33515;,
 4.25047;-1.54051;4.42695;;
 
 196;
 3;0,1,2;,
 3;3,4,5;,
 3;3,5,6;,
 3;7,0,2;,
 3;7,2,8;,
 3;9,10,11;,
 3;12,13,14;,
 3;15,16,9;,
 3;17,11,18;,
 3;19,14,20;,
 3;21,22,23;,
 3;21,23,9;,
 3;9,23,10;,
 3;24,25,26;,
 3;24,26,27;,
 3;4,23,22;,
 3;4,22,5;,
 3;28,29,30;,
 3;4,3,31;,
 3;4,31,32;,
 3;33,34,35;,
 3;11,10,32;,
 3;11,32,36;,
 3;37,38,39;,
 3;11,36,40;,
 3;11,40,18;,
 3;40,41,42;,
 3;29,37,43;,
 3;29,43,30;,
 3;44,13,0;,
 3;44,0,7;,
 3;45,46,47;,
 3;45,47,48;,
 3;45,49,50;,
 3;45,50,46;,
 3;51,45,48;,
 3;51,48,52;,
 3;53,49,45;,
 3;53,45,51;,
 3;54,55,49;,
 3;54,49,53;,
 3;56,14,57;,
 3;56,57,58;,
 3;59,60,17;,
 3;59,17,42;,
 3;61,62,63;,
 3;64,65,66;,
 3;20,14,56;,
 3;56,67,20;,
 3;64,68,69;,
 3;64,69,54;,
 3;70,71,72;,
 3;73,70,72;,
 3;74,72,75;,
 3;74,73,72;,
 3;76,8,2;,
 3;76,2,77;,
 3;1,78,77;,
 3;1,77,2;,
 3;79,80,31;,
 3;79,31,78;,
 3;67,81,80;,
 3;67,80,79;,
 3;56,41,67;,
 3;82,27,71;,
 3;82,71,83;,
 3;84,85,86;,
 3;84,86,87;,
 3;88,89,85;,
 3;88,85,84;,
 3;90,91,89;,
 3;90,89,88;,
 3;92,93,94;,
 3;92,94,95;,
 3;96,97,93;,
 3;96,93,92;,
 3;87,86,97;,
 3;87,97,96;,
 3;84,98,99;,
 3;84,99,88;,
 3;87,50,98;,
 3;87,98,84;,
 3;88,99,100;,
 3;88,100,90;,
 3;95,101,47;,
 3;95,47,92;,
 3;92,47,46;,
 3;92,46,96;,
 3;96,46,50;,
 3;96,50,87;,
 3;78,31,3;,
 3;78,3,77;,
 3;32,10,23;,
 3;32,23,4;,
 3;19,20,67;,
 3;19,67,79;,
 3;81,40,36;,
 3;81,36,80;,
 3;42,41,65;,
 3;42,65,59;,
 3;42,17,18;,
 3;41,81,67;,
 3;19,1,0;,
 3;58,65,41;,
 3;58,41,56;,
 3;32,31,80;,
 3;32,80,36;,
 3;76,77,3;,
 3;76,3,6;,
 3;40,81,41;,
 3;78,1,19;,
 3;78,19,79;,
 3;102,57,14;,
 3;34,24,82;,
 3;68,64,103;,
 3;12,19,0;,
 3;43,37,39;,
 3;43,39,104;,
 3;34,33,25;,
 3;34,25,24;,
 3;27,82,24;,
 3;75,105,74;,
 3;83,71,70;,
 3;69,106,55;,
 3;69,55,54;,
 3;107,108,106;,
 3;107,106,69;,
 3;52,48,109;,
 3;52,109,110;,
 3;52,111,61;,
 3;52,61,51;,
 3;18,40,42;,
 3;62,61,111;,
 3;66,103,64;,
 3;65,53,51;,
 3;65,51,61;,
 3;65,64,54;,
 3;65,54,53;,
 3;55,106,99;,
 3;55,99,98;,
 3;49,55,98;,
 3;49,98,50;,
 3;108,100,99;,
 3;108,99,106;,
 3;112,111,52;,
 3;112,52,110;,
 3;38,105,75;,
 3;38,75,39;,
 3;48,47,101;,
 3;48,101,109;,
 3;68,113,107;,
 3;68,107,69;,
 3;63,65,61;,
 3;114,115,116;,
 3;117,118,89;,
 3;117,89,91;,
 3;117,119,120;,
 3;117,120,118;,
 3;121,86,85;,
 3;121,85,122;,
 3;123,124,121;,
 3;123,121,122;,
 3;97,86,121;,
 3;118,122,85;,
 3;118,85,89;,
 3;122,118,120;,
 3;122,120,123;,
 3;93,114,116;,
 3;116,94,93;,
 3;125,97,121;,
 3;121,124,125;,
 3;93,97,125;,
 3;93,125,114;,
 3;15,11,17;,
 3;17,60,126;,
 3;126,127,128;,
 3;126,128,16;,
 3;13,44,129;,
 3;13,129,102;,
 3;126,16,17;,
 3;127,126,60;,
 3;57,102,129;,
 3;14,13,102;,
 3;38,37,29;,
 3;21,9,16;,
 3;21,16,128;,
 3;35,111,112;,
 3;113,68,28;,
 3;28,30,113;,
 3;112,33,35;,
 3;111,35,62;,
 3;103,28,68;,
 3;0,13,12;,
 3;14,19,12;,
 3;9,11,15;,
 3;17,16,15;;
 
 MeshMaterialList {
  11;
  196;
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9,
  9;;
  Material {
   0.119200;0.106400;0.530400;1.000000;;
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
   0.548800;0.627200;0.800000;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
  Material {
   0.385600;0.000000;0.056800;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
  Material {
   0.511200;0.395200;0.000000;1.000000;;
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
   0.000000;0.467200;0.336000;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
  Material {
   0.222400;0.380000;0.000000;1.000000;;
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
   0.000000;0.000000;0.000000;1.000000;;
   5.000000;
   0.000000;0.000000;0.000000;;
   0.000000;0.000000;0.000000;;
  }
 }
 MeshNormals {
  147;
  -0.318412;0.947819;-0.015896;,
  -0.348582;0.567412;-0.746012;,
  0.180383;-0.650340;-0.737916;,
  -0.279644;0.535810;0.796685;,
  -0.278303;-0.141107;0.950072;,
  0.410507;-0.906384;-0.099755;,
  -0.008855;0.075284;0.997123;,
  0.006835;0.592960;0.805203;,
  -0.144182;0.315590;0.937878;,
  -0.689135;0.724584;0.008413;,
  -0.611626;0.701650;-0.365514;,
  -0.590320;0.741301;-0.319367;,
  -0.574121;0.818523;-0.020151;,
  -0.165418;-0.013505;0.986131;,
  -0.388054;0.480772;0.786303;,
  -0.117414;0.139648;-0.983215;,
  -0.150308;0.544413;-0.825240;,
  0.118296;0.562722;-0.818138;,
  0.069000;0.282208;0.956869;,
  0.142659;-0.182955;0.972716;,
  0.479257;0.280731;0.831566;,
  0.122253;0.169898;-0.977849;,
  0.082024;-0.239764;-0.967360;,
  0.495566;0.239119;-0.835007;,
  0.458627;0.585830;-0.668180;,
  0.143045;0.561430;0.815067;,
  0.448254;0.598306;0.664152;,
  -0.254964;-0.085575;-0.963156;,
  -0.513408;0.494699;-0.701203;,
  -0.452086;0.463943;-0.761824;,
  0.216694;-0.741277;-0.635257;,
  0.226433;-0.972736;0.050126;,
  0.413012;-0.716481;0.562207;,
  0.017069;-0.757425;0.652700;,
  0.096236;-0.995317;0.009103;,
  -0.276097;0.960746;-0.027165;,
  -0.241339;0.858388;-0.452687;,
  0.079514;-0.784802;-0.614624;,
  0.413222;-0.776732;-0.475327;,
  0.027042;0.919735;-0.391606;,
  -0.135781;-0.158161;0.978033;,
  0.433047;0.801502;-0.412388;,
  0.671743;0.740782;0.001635;,
  0.665117;0.584413;-0.464845;,
  0.026823;0.021891;-0.999400;,
  0.142709;0.026907;-0.989399;,
  0.043478;0.023118;-0.998787;,
  0.105861;0.021438;-0.994150;,
  0.126558;0.978047;0.165550;,
  0.124345;0.978594;-0.163990;,
  -0.070908;0.023162;-0.997214;,
  -0.338216;0.023795;-0.940768;,
  -0.037108;0.993815;-0.104668;,
  -0.014488;0.791855;0.610537;,
  0.185898;0.398887;0.897960;,
  0.727566;0.508345;0.460686;,
  0.822947;0.066979;0.564155;,
  -0.188219;-0.853955;-0.485114;,
  0.884963;0.348128;-0.309269;,
  0.825659;0.056859;-0.561297;,
  -0.751288;0.199340;-0.629150;,
  0.822767;0.535325;0.191000;,
  0.892511;0.449673;0.034903;,
  0.383772;0.842136;0.378848;,
  -0.651056;-0.136685;0.746621;,
  -0.102590;0.083160;0.991242;,
  -0.624852;0.720352;0.301087;,
  -0.563907;0.736232;0.374126;,
  -0.201676;0.886663;0.416120;,
  0.000707;0.919977;0.391972;,
  -0.026539;0.999520;-0.015995;,
  0.323122;0.945522;-0.039744;,
  0.579707;0.405800;0.706588;,
  0.770980;0.226005;0.595409;,
  0.747687;0.647920;0.145479;,
  0.540712;0.839901;0.046868;,
  0.561963;-0.485450;0.669728;,
  0.479423;-0.721771;0.499199;,
  0.450916;-0.892511;0.009961;,
  0.426329;-0.903363;-0.046688;,
  0.560213;-0.440657;-0.701415;,
  0.656827;-0.193048;-0.728911;,
  0.567858;0.477389;-0.670550;,
  0.783802;0.460918;-0.416184;,
  0.150212;0.681426;0.716306;,
  0.141729;0.042273;0.989002;,
  0.071273;-0.997245;0.020560;,
  0.621315;-0.163464;0.766320;,
  -0.052427;0.500700;-0.864032;,
  -0.035172;-0.896437;-0.441773;,
  0.195839;0.081730;0.977224;,
  -0.130060;-0.981478;0.140661;,
  0.034618;-0.999193;0.020371;,
  -0.725987;-0.175537;-0.664928;,
  -0.006328;-0.999466;-0.032062;,
  0.013885;-0.999459;-0.029814;,
  -0.052019;-0.997069;0.056109;,
  -0.021512;-0.897889;0.439697;,
  -0.018272;-0.912830;0.407931;,
  -0.252179;0.966435;0.049079;,
  -0.160408;0.389622;0.906898;,
  -0.013931;0.897933;0.439912;,
  0.016778;0.999048;-0.040279;,
  0.537102;-0.314415;-0.782729;,
  0.231318;-0.940358;0.249438;,
  0.023444;0.006146;0.999706;,
  0.095234;0.894028;-0.437771;,
  0.128294;0.878859;-0.459508;,
  -0.273494;0.839635;-0.469271;,
  -0.308791;-0.766182;-0.563571;,
  -0.458646;-0.496677;-0.736855;,
  -0.287763;-0.798045;0.529449;,
  -0.430121;-0.576177;0.694993;,
  -0.179302;-0.864127;0.470251;,
  -0.837272;0.069382;-0.542367;,
  -0.943985;0.114465;-0.309501;,
  -0.680693;0.251493;0.688047;,
  -0.579930;0.068870;0.811750;,
  -0.815450;0.462310;0.348298;,
  -0.481680;0.036204;-0.875599;,
  0.070693;-0.925473;0.372158;,
  0.065047;-0.929400;-0.363297;,
  -0.010864;-0.994808;-0.101189;,
  -0.009858;-0.992682;0.120355;,
  -0.695037;0.147337;0.703716;,
  0.418051;-0.866407;0.273080;,
  0.068726;-0.923363;0.377727;,
  -0.228268;-0.909706;0.346885;,
  -0.161327;-0.923877;-0.347022;,
  0.023116;-0.937523;-0.347154;,
  -0.846131;0.244869;0.473393;,
  -0.500034;0.865986;-0.005830;,
  0.050642;-0.915829;0.398363;,
  0.929619;0.347577;-0.122470;,
  -0.521989;0.852893;-0.010073;,
  -0.388798;0.458630;0.799058;,
  -0.277649;0.597784;-0.752040;,
  -0.162742;0.003826;0.986661;,
  -0.198984;0.024248;0.979703;,
  0.074260;-0.007798;0.997208;,
  0.071462;-0.010209;0.997391;,
  -0.133399;-0.881920;-0.452129;,
  -0.061319;0.042510;-0.997213;,
  0.032851;-0.010217;-0.999408;,
  0.419011;-0.840477;-0.343552;,
  -0.626806;0.067970;-0.776205;,
  -0.484417;0.122313;0.866245;;
  196;
  3;6,7,8;,
  3;9,10,11;,
  3;9,11,12;,
  3;13,6,8;,
  3;13,8,14;,
  3;15,16,17;,
  3;18,19,20;,
  3;21,22,15;,
  3;23,17,24;,
  3;25,20,26;,
  3;27,28,29;,
  3;27,29,15;,
  3;15,29,16;,
  3;30,31,5;,
  3;30,5,2;,
  3;10,29,28;,
  3;10,28,11;,
  3;32,33,34;,
  3;10,9,35;,
  3;10,35,36;,
  3;34,37,38;,
  3;17,16,36;,
  3;17,36,39;,
  3;40,13,4;,
  3;17,39,41;,
  3;17,41,24;,
  3;41,42,43;,
  3;33,104,31;,
  3;33,31,34;,
  3;33,19,6;,
  3;105,6,13;,
  3;44,45,46;,
  3;44,46,47;,
  3;106,48,49;,
  3;106,49,107;,
  3;50,44,47;,
  3;50,47,51;,
  3;52,48,106;,
  3;52,106,108;,
  3;53,54,48;,
  3;53,48,52;,
  3;55,20,56;,
  3;109,110,57;,
  3;58,59,23;,
  3;111,112,113;,
  3;60,114,115;,
  3;61,62,61;,
  3;26,20,55;,
  3;55,63,26;,
  3;116,64,65;,
  3;116,65,117;,
  3;11,1,0;,
  3;12,11,0;,
  3;66,0,3;,
  3;66,12,0;,
  3;66,14,118;,
  3;66,118,67;,
  3;7,68,67;,
  3;7,67,8;,
  3;69,70,35;,
  3;69,35,68;,
  3;63,71,70;,
  3;63,70,69;,
  3;55,42,63;,
  3;27,119,1;,
  3;27,1,28;,
  3;72,73,74;,
  3;72,74,75;,
  3;76,77,73;,
  3;76,73,72;,
  3;78,79,77;,
  3;78,77,76;,
  3;80,81,79;,
  3;80,79,78;,
  3;82,83,81;,
  3;82,81,80;,
  3;75,74,83;,
  3;75,83,82;,
  3;72,84,85;,
  3;72,85,76;,
  3;75,49,84;,
  3;75,84,72;,
  3;76,120,86;,
  3;76,86,78;,
  3;78,86,121;,
  3;78,121,80;,
  3;80,46,45;,
  3;80,45,82;,
  3;82,107,49;,
  3;82,49,75;,
  3;68,35,9;,
  3;68,9,67;,
  3;36,16,29;,
  3;36,29,10;,
  3;25,26,63;,
  3;25,63,69;,
  3;71,41,39;,
  3;71,39,70;,
  3;113,122,123;,
  3;113,123,111;,
  3;43,23,24;,
  3;42,71,63;,
  3;25,7,6;,
  3;57,123,122;,
  3;57,122,109;,
  3;36,35,70;,
  3;36,70,39;,
  3;66,67,9;,
  3;66,9,12;,
  3;41,71,42;,
  3;68,7,25;,
  3;68,25,69;,
  3;87,56,20;,
  3;37,30,27;,
  3;64,116,124;,
  3;18,25,6;,
  3;31,104,125;,
  3;31,125,5;,
  3;37,34,31;,
  3;37,31,30;,
  3;2,27,30;,
  3;3,14,66;,
  3;28,1,11;,
  3;65,90,54;,
  3;65,54,53;,
  3;91,92,126;,
  3;91,126,127;,
  3;128,129,92;,
  3;128,92,91;,
  3;51,93,60;,
  3;51,60,50;,
  3;24,41,43;,
  3;114,60,93;,
  3;130,124,116;,
  3;131,52,108;,
  3;131,108,60;,
  3;131,116,53;,
  3;131,53,52;,
  3;54,90,85;,
  3;54,85,84;,
  3;48,54,84;,
  3;48,84,49;,
  3;92,86,120;,
  3;92,120,126;,
  3;94,93,128;,
  3;94,128,91;,
  3;13,14,3;,
  3;13,3,4;,
  3;129,121,86;,
  3;129,86,92;,
  3;132,94,91;,
  3;64,91,127;,
  3;58,62,133;,
  3;89,95,96;,
  3;96,97,77;,
  3;96,77,79;,
  3;96,95,98;,
  3;96,98,97;,
  3;99,134,135;,
  3;99,135,100;,
  3;101,102,99;,
  3;101,99,100;,
  3;136,134,99;,
  3;137,100,135;,
  3;137,135,138;,
  3;100,137,139;,
  3;100,139,140;,
  3;141,89,96;,
  3;96,79,141;,
  3;88,136,99;,
  3;99,102,88;,
  3;142,136,88;,
  3;81,88,143;,
  3;21,17,23;,
  3;23,59,103;,
  3;103,38,37;,
  3;103,37,22;,
  3;19,33,32;,
  3;19,32,87;,
  3;103,22,23;,
  3;38,103,59;,
  3;56,87,32;,
  3;20,19,87;,
  3;13,40,33;,
  3;27,15,22;,
  3;27,22,37;,
  3;38,144,94;,
  3;94,132,32;,
  3;32,34,94;,
  3;94,34,38;,
  3;93,145,114;,
  3;124,146,64;,
  3;6,19,18;,
  3;20,25,18;,
  3;15,17,21;,
  3;23,22,21;;
 }
 MeshTextureCoords {
  130;
  0.047400;0.895000;,
  0.049600;0.866000;,
  0.035200;0.869600;,
  0.027300;0.800800;,
  0.029800;0.772500;,
  0.023100;0.771200;,
  0.019500;0.800800;,
  0.043000;0.898900;,
  0.028300;0.874500;,
  0.052900;0.715000;,
  0.048800;0.744800;,
  0.079600;0.748500;,
  0.079600;0.892800;,
  0.078800;0.908900;,
  0.127000;0.883300;,
  0.078500;0.717700;,
  0.077400;0.696600;,
  0.126600;0.726100;,
  0.114500;0.755700;,
  0.080400;0.860200;,
  0.115200;0.853400;,
  0.045400;0.709400;,
  0.027100;0.737100;,
  0.034800;0.741300;,
  0.047100;0.673000;,
  0.046900;0.636700;,
  0.027300;0.636700;,
  0.019300;0.673000;,
  0.123100;0.929200;,
  0.078400;0.927500;,
  0.078100;0.992200;,
  0.058600;0.800800;,
  0.054300;0.772400;,
  0.078100;0.636700;,
  0.078000;0.680100;,
  0.125700;0.680100;,
  0.083500;0.776000;,
  0.045100;0.946200;,
  0.039200;0.904900;,
  0.023700;0.954100;,
  0.119400;0.776600;,
  0.141100;0.801300;,
  0.133400;0.758400;,
  0.050800;0.992200;,
  0.078500;0.915800;,
  0.179700;0.742200;,
  0.238100;0.742200;,
  0.238300;0.687500;,
  0.179700;0.687500;,
  0.179700;0.800800;,
  0.238300;0.800800;,
  0.156300;0.742200;,
  0.156300;0.687500;,
  0.156300;0.800800;,
  0.156300;0.863300;,
  0.179700;0.863300;,
  0.134800;0.841300;,
  0.131800;0.889200;,
  0.140600;0.847700;,
  0.138200;0.754900;,
  0.133200;0.723900;,
  0.144400;0.742000;,
  0.138800;0.722900;,
  0.144300;0.751800;,
  0.148400;0.863300;,
  0.148400;0.800800;,
  0.147000;0.850400;,
  0.119700;0.823800;,
  0.148400;0.925800;,
  0.156300;0.925800;,
  0.017300;0.769100;,
  0.004700;0.745700;,
  0.003900;0.800800;,
  0.013300;0.800500;,
  0.017900;0.841800;,
  0.006200;0.881400;,
  0.023700;0.839700;,
  0.030400;0.838500;,
  0.054700;0.837000;,
  0.083900;0.831600;,
  0.086700;0.800000;,
  0.120300;0.801600;,
  0.037600;0.703400;,
  0.021700;0.732900;,
  0.293000;0.863300;,
  0.304700;0.863300;,
  0.312500;0.800800;,
  0.300800;0.800800;,
  0.293000;0.925800;,
  0.304700;0.925800;,
  0.293000;0.992200;,
  0.304700;0.992200;,
  0.300800;0.687500;,
  0.312500;0.687500;,
  0.304700;0.636700;,
  0.293000;0.636700;,
  0.304700;0.742200;,
  0.316400;0.742200;,
  0.238300;0.863300;,
  0.238300;0.925800;,
  0.238300;0.992200;,
  0.238300;0.636700;,
  0.113700;0.909000;,
  0.137300;0.894500;,
  0.027300;0.992200;,
  0.023000;0.878900;,
  0.179700;0.925800;,
  0.156300;0.992200;,
  0.179700;0.992200;,
  0.179700;0.636700;,
  0.156300;0.636700;,
  0.144500;0.687500;,
  0.144500;0.636700;,
  0.148400;0.992200;,
  0.367200;0.687500;,
  0.375000;0.636700;,
  0.343800;0.636700;,
  0.343800;0.992200;,
  0.343800;0.925800;,
  0.375000;0.992200;,
  0.382800;0.925800;,
  0.343800;0.800800;,
  0.343800;0.863300;,
  0.382800;0.863300;,
  0.375000;0.800800;,
  0.365300;0.742700;,
  0.116200;0.696200;,
  0.121300;0.687400;,
  0.078100;0.687400;,
  0.117200;0.916300;;
 }
}
