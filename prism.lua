local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function() return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...) local v18=1;local v19;v16=v4(v3(v16,5),"..",function(v30) if (v1(v30,2)==81) then local v80=0;while true do if (v80==0) then v19=v0(v3(v30,1,1));return "";end end else local v81=0;local v82;while true do if (v81==0) then v82=v2(v0(v30,16));if v19 then local v98=0;local v99;while true do if (v98==1) then return v99;end if (v98==0) then v99=v5(v82,v19);v19=nil;v98=1;end end else return v82;end break;end end end end);local function v20(v31,v32,v33) if v33 then local v83=0 -0 ;local v84;while true do if (v83==0) then v84=(v31/(2^(v32-(2 -1))))%((3 -(1 -0))^(((v33-(2 -1)) -(v32-(620 -(555 + 64)))) + (932 -(857 + 74)))) ;return v84-(v84%(569 -(367 + 201))) ;end end else local v85=927 -(214 + 713) ;local v86;while true do if (v85==(0 + 0)) then v86=(1 + 1)^(v32-(878 -(282 + 595))) ;return (((v31%(v86 + v86))>=v86) and (1638 -((2588 -(68 + 997)) + (1384 -(226 + 1044))))) or (0 + 0) ;end end end end local function v21() local v34=v1(v16,v18,v18);v18=v18 + 1 ;return v34;end local function v22() local v35,v36=v1(v16,v18,v18 + (119 -(32 + 85)) );v18=v18 + 2 ;return (v36 * (1114 -858)) + v35 ;end local function v23() local v37,v38,v39,v40=v1(v16,v18,v18 + 1 + 2 );v18=v18 + ((1311 -(87 + 263)) -(892 + 65)) ;return (v40 * (40022563 -23245347)) + (v39 * (121138 -55602)) + (v38 * (469 -213)) + v37 ;end local function v24() local v41=v23();local v42=v23();local v43=1 + 0 ;local v44=(v20(v42,(445 -264) -(67 + 113) ,20) * ((2 + 0)^32)) + v41 ;local v45=v20(v42,51 -30 ,97 -66 );local v46=((v20(v42,24 + 8 )==(3 -2)) and  -(3 -(1 + 1))) or (953 -(802 + 150)) ;if (v45==(0 -0)) then if (v44==((0 + 0) -0)) then return v46 * (0 + (885 -(261 + 624))) ;else local v89=0 + (0 -0) ;while true do if (v89==(997 -(915 + 49 + 33))) then v45=2 -1 ;v43=0 + 0 ;break;end end end elseif (v45==(2691 -644)) then return ((v44==(0 + 0)) and (v46 * ((1081 -(1020 + 60))/(0 + 0)))) or (v46 * NaN) ;end return v8(v46,v45-(2210 -((3902 -2833) + 118)) ) * (v43 + (v44/((4 -(7 -5))^(113 -(920 -(814 + 45)))))) ;end local function v25(v47) local v48;if  not v47 then v47=v23();if (v47==(0 -0)) then return "";end end v48=v3(v16,v18,(v18 + v47) -(4 -3) );v18=v18 + v47 ;local v49={};for v63=1 + 0 , #v48 do v49[v63]=v2(v1(v3(v48,v63,v63)));end return v6(v49);end local v26=v23;local function v27(...) return {...},v12("#",...);end local function v28() local v50=(function() return 736 -(223 + 513) ;end)();local v51=(function() return;end)();local v52=(function() return;end)();local v53=(function() return;end)();local v54=(function() return;end)();local v55=(function() return;end)();local v56=(function() return;end)();while true do local v65=(function() return 700 -(271 + 429) ;end)();while true do if (v65~=0) then else if (v50== #"{") then local v96=(function() return 0 + 0 ;end)();while true do if (v96==1) then for v110= #"]",v55 do local v111=(function() return 0;end)();local v112=(function() return;end)();local v113=(function() return;end)();while true do if (v111==(1501 -(1408 + 92))) then if (v112== #",") then v113=(function() return v21()~=(0 -0) ;end)();elseif (v112==(2 -0)) then v113=(function() return v24();end)();elseif (v112== #"xnx") then v113=(function() return v25();end)();end v56[v110]=(function() return v113;end)();break;end if (v111~=(0 + 0)) then else local v117=(function() return 1636 -(1373 + 263) ;end)();while true do if (v117~=(1000 -(451 + 549))) then else v112=(function() return v21();end)();v113=(function() return nil;end)();v117=(function() return 1 + 0 ;end)();end if (v117==1) then v111=(function() return 1;end)();break;end end end end end v54[ #"nil"]=(function() return v21();end)();v96=(function() return 1 + 1 ;end)();end if ((1 + 1)~=v96) then else v50=(function() return 2;end)();break;end if (v96~=0) then else v55=(function() return v23();end)();v56=(function() return {};end)();v96=(function() return 1 -0 ;end)();end end end if (v50~=0) then else local v97=(function() return 0 -0 ;end)();while true do if (v97==1) then v53=(function() return {};end)();v54=(function() return {v51,v52,nil,v53};end)();v97=(function() return 2;end)();end if (v97==2) then v50=(function() return  #"|";end)();break;end if (v97==(0 + 0)) then v51=(function() return {};end)();v52=(function() return {};end)();v97=(function() return 1385 -(746 + 638) ;end)();end end end v65=(function() return 530 -(406 + 123) ;end)();end if (v65==(1 + 0)) then if (v50==2) then for v100= #"|",v23() do local v101=(function() return v21();end)();if (v20(v101, #":", #" ")~=(0 -0)) then else local v105=(function() return 0 + 0 ;end)();local v106=(function() return;end)();local v107=(function() return;end)();local v108=(function() return;end)();local v109=(function() return;end)();while true do if ((341 -(218 + 123))~=v105) then else local v114=(function() return 1322 -(1249 + 73) ;end)();while true do if (v114~=(1582 -(1535 + 46))) then else v105=(function() return 1146 -(466 + 679) ;end)();break;end if (v114~=(0 + 0)) then else v106=(function() return 0;end)();v107=(function() return nil;end)();v114=(function() return 1;end)();end end end if (v105~=(1 + 0)) then else local v115=(function() return 0 -0 ;end)();while true do if (v115==0) then v108=(function() return nil;end)();v109=(function() return nil;end)();v115=(function() return 561 -(306 + 254) ;end)();end if (v115~=1) then else v105=(function() return 2;end)();break;end end end if (v105~=(5 -3)) then else while true do if (v106==(1 + 1)) then local v118=(function() return 1900 -(106 + 1794) ;end)();local v119=(function() return;end)();while true do if (v118~=0) then else v119=(function() return 0 + 0 ;end)();while true do if (v119~=(0 -0)) then else if (v20(v108, #"|", #",")~= #"\\") then else v109[2]=(function() return v56[v109[1469 -(899 + 568) ]];end)();end if (v20(v108,2 + 0 ,2)~= #"|") then else v109[ #"91("]=(function() return v56[v109[ #"xnx"]];end)();end v119=(function() return 2 -1 ;end)();end if (v119==(2 -1)) then v106=(function() return  #"xxx";end)();break;end end break;end end end if (v106== #"]") then local v120=(function() return 603 -(268 + 335) ;end)();while true do if ((291 -(60 + 230))==v120) then v106=(function() return 2;end)();break;end if ((572 -(426 + 146))~=v120) then else v109=(function() return {v22(),v22(),nil,nil};end)();if (v107==(103 -(17 + 86))) then local v314=(function() return 0 + 0 ;end)();local v315=(function() return;end)();while true do if (v314~=(1456 -(282 + 1174))) then else v315=(function() return 811 -(569 + 242) ;end)();while true do if (v315==(0 -0)) then v109[ #"xnx"]=(function() return v22();end)();v109[ #"0313"]=(function() return v22();end)();break;end end break;end end elseif (v107== #" ") then v109[ #"gha"]=(function() return v23();end)();elseif (v107==(5 -3)) then v109[ #"nil"]=(function() return v23() -(2^(1 + 15)) ;end)();elseif (v107== #"xnx") then local v423=(function() return 0 -0 ;end)();local v424=(function() return;end)();while true do if (v423==0) then v424=(function() return 0 -0 ;end)();while true do if (v424~=(1024 -(706 + 318))) then else v109[ #"nil"]=(function() return v23() -((1 + 1)^(32 -16)) ;end)();v109[ #"0836"]=(function() return v22();end)();break;end end break;end end end v120=(function() return 1;end)();end end end if (v106~= #"91(") then else if (v20(v108, #"19(", #"19(")== #",") then v109[ #"http"]=(function() return v56[v109[ #"0313"]];end)();end v51[v100]=(function() return v109;end)();break;end if (v106==(1251 -(721 + 530))) then local v122=(function() return 65 -(30 + 35) ;end)();local v123=(function() return;end)();while true do if (v122~=(0 + 0)) then else v123=(function() return 1271 -(945 + 326) ;end)();while true do if (v123==(2 -1)) then v106=(function() return  #" ";end)();break;end if (v123==(0 + 0)) then v107=(function() return v20(v101,2, #"xnx");end)();v108=(function() return v20(v101, #".dev",6);end)();v123=(function() return 1;end)();end end break;end end end end break;end end end end for v102= #":",v23() do v52[v102-#"[" ]=(function() return v28();end)();end return v54;end break;end end end end local function v29(v57,v58,v59) local v60=v57[1258 -(1043 + 214) ];local v61=v57[7 -5 ];local v62=v57[1215 -((435 -112) + 889) ];return function(...) local v66=v60;local v67=v61;local v68=v62;local v69=v27;local v70=1 + 0 ;local v71= -(2 -1);local v72={};local v73={...};local v74=v12("#",...) -(321 -(53 + 267)) ;local v75={};local v76={};for v87=0 + 0 ,v74 do if ((2833==2833) and (v87>=v68)) then v72[v87-v68 ]=v73[v87 + (414 -((29 -14) + 398)) ];else v76[v87]=v73[v87 + 1 ];end end local v77=(v74-v68) + (983 -(18 + (1892 -928))) ;local v78;local v79;while true do local v88=0 -0 ;while true do if ((1 + 0)==v88) then if (v79<=(26 + (1895 -(446 + 1434)))) then if (v79<=(870 -(20 + 830))) then if (v79<=(8 + 1)) then if ((v79<=(130 -(116 + 10))) or (1043>3591)) then if ((v79<=(1 + 0)) or (2890>=4079)) then if (v79>0) then v76[v78[1285 -(1040 + 243) ]]=v76[v78[741 -(542 + 196) ]][v78[4]];else v76[v78[3 -1 ]]=v58[v78[1 + 2 ]];end elseif ((4474<=4770) and ((v79<=2) or (3222<3073))) then for v205=v78[2 + 0 ],v78[2 + (2 -1) ] do v76[v205]=nil;end elseif (v79==(7 -4)) then local v236=0 -0 ;local v237;local v238;local v239;while true do if ((744<=2942) and (v236==(1551 -(1126 + 425)))) then v237=v78[407 -(118 + 287) ];v238=v76[v237];v236=3 -(1849 -(559 + 1288)) ;end if (v236==(1122 -(118 + 1003))) then v239=v76[v237 + ((1936 -(609 + 1322)) -3) ];if ((v239>(377 -(142 + 235))) or (4942==3903)) then if ((v238>v76[v237 + 1 ]) or (1833<=1322) or (248>4845)) then v70=v78[13 -10 ];else v76[v237 + 1 + (456 -(13 + 441)) ]=v238;end elseif ((1569==1569) and (v238<v76[v237 + (978 -((2066 -1513) + 424)) ])) then v70=v78[5 -2 ];else v76[v237 + 3 + 0 ]=v238;end break;end end else v70=v78[3];end elseif ((v79<=6) or (3467<=1055)) then if ((3541==3541) and (v79>(5 + 0))) then v76[v78[2 + 0 ]]={};else v76[v78[2]]=v76[v78[2 + 1 ]][v76[v78[10 -6 ]]];end elseif ((v79<=7) or (3557>=4003)) then local v132=0 + 0 ;local v133;while true do if (v132==(0 -0)) then v133=v78[5 -3 ];v76[v133](v76[v133 + (2 -1) ]);break;end end elseif (v79==8) then v76[v78[1 + 1 ]]=v59[v78[14 -11 ]];else v58[v78[756 -(239 + 514) ]]=v76[v78[1 + 1 ]];end elseif (v79<=((6688 -5345) -(797 + 532))) then if (v79<=(8 + 3)) then if ((v79==(1 + 3 + (21 -15))) or (4927<=3221)) then if (v78[(2 + 2) -2 ]<v76[v78[1206 -(373 + 364 + 465) ]]) then v70=v70 + 1 ;else v70=v78[734 -(476 + (756 -501)) ];end else local v134=v78[1132 -(369 + 761) ];v76[v134]=v76[v134](v76[v134 + 1 + 0 + 0 ]);end elseif (v79<=(21 -9)) then local v136=v78[3 -1 ];local v137,v138=v69(v76[v136]());v71=(v138 + v136) -1 ;local v139=238 -(64 + (319 -145)) ;for v207=v136,v71 do local v208=0 + 0 + 0 ;while true do if (v208==(0 -0)) then v139=v139 + (337 -(144 + 192)) ;v76[v207]=v137[v139];break;end end end elseif (v79>(229 -(42 + 174))) then v76[v78[2 + 0 ]][v78[3 + 0 + 0 ]]=v76[v78[2 + 2 ]];else local v248=v78[1506 -(363 + 820 + 321) ];v76[v248](v13(v76,v248 + (1581 -(1183 + 397)) ,v78[8 -5 ]));end elseif (v79<=(13 + 4)) then if (v79<=(11 + 1 + 3)) then v76[v78[1977 -(1913 + 62) ]]=v59[v78[3]];elseif ((v79>16) or (1780>2787)) then v76[v78[2 + 0 ]][v78[7 -4 ]]=v78[1937 -(565 + 1368) ];else for v317=v78[2],v78[11 -8 ] do v76[v317]=nil;end end elseif ((v79<=(1679 -(1477 + 184))) or (3937<=1230)) then v76[v78[(2 + 0) -(433 -(153 + 280)) ]]= #v76[v78[3 + 0 ]];elseif ((v79==(875 -(564 + 292))) or (2637<1706)) then local v251=v78[2];v76[v251]=v76[v251](v13(v76,v251 + 1 ,v71));else local v253=v78[2 -0 ];v76[v253](v13(v76,v253 + (2 -(2 -1)) ,v71));end elseif ((v79<=(334 -(244 + 60))) or (657>=1668)) then if (v79<=(20 + 5)) then if (v79<=(498 -(41 + 435))) then if (v79==21) then do return v76[v78[1003 -(938 + 63) ]];end else v76[v78[2 + 0 ]]=v78[1128 -(936 + 170 + 19) ]~=(0 + 0) ;end elseif (v79<=(1636 -(618 + 947 + 26 + 22))) then local v144=0 + 0 ;local v145;while true do if (v144==(1138 -(782 + 356))) then v145=v78[269 -(176 + 91) ];v76[v145]=v76[v145](v76[v145 + 1 + 0 ]);break;end end elseif (v79>24) then local v254=v78[4 -2 ];v76[v254]=v76[v254](v13(v76,v254 + (1 -0) ,v78[1095 -(975 + 85 + 32) ]));else local v256=1875 -(157 + 1718) ;local v257;local v258;while true do if (v256==(0 + (0 -0))) then v257=v78[2];v258={};v256=3 -2 ;end if (v256==(3 -2)) then for v387=(630 + 389) -(697 + 321) , #v75 do local v388=v75[v387];for v407=0 -0 , #v388 do local v408=0 -0 ;local v409;local v410;local v411;while true do if ((v408==(0 -0)) or (1027>3858)) then v409=v388[v407];v410=v409[1 + 0 ];v408=1 -0 ;end if (v408==(2 -1)) then v411=v409[1229 -(322 + 905) ];if ((v410==v76) and (v411>=v257)) then v258[v411]=v410[v411];v409[612 -(602 + 9) ]=v258;end break;end end end end break;end end end elseif (v79<=27) then if ((v79>26) or (2669<=2409)) then local v146=v67[v78[1192 -(449 + 740) ]];local v147;local v148={};v147=v10({},{__index=function(v209,v210) local v211=v148[v210];return v211[873 -(826 + 46) ][v211[2]];end,__newindex=function(v212,v213,v214) local v215=v148[v213];v215[1][v215[2]]=v214;end});for v217=948 -(245 + 702) ,v78[12 -8 ] do local v218=0 + 0 ;local v219;while true do if (v218==(1899 -(260 + 1638))) then if ((v219[441 -((1049 -(89 + 578)) + 58) ]==31) or (3654<450)) then v148[v217-1 ]={v76,v219[5 -2 ]};else v148[v217-(2 -1) ]={v58,v219[6 -3 ]};end v75[ #v75 + 1 + 0 + 0 ]=v148;break;end if (0==v218) then v70=v70 + 1 ;v219=v66[v70];v218=1;end end end v76[v78[2]]=v29(v146,v147,v59);else local v150=1690 -(1121 + 569) ;local v151;while true do if (v150==(214 -(22 + 192))) then v151=v78[685 -(483 + 200) ];v76[v151](v13(v76,v151 + (1464 -(1404 + 59)) ,v78[8 -5 ]));break;end end end elseif (v79<=(37 -9)) then local v152=v78[(461 + 306) -(468 + 297) ];local v153={};for v220=563 -(334 + 228) , #v75 do local v221=v75[v220];for v259=0 -0 , #v221 do local v260=0 -0 ;local v261;local v262;local v263;while true do if ((1891<4453) and (v260==0)) then v261=v221[v259];v262=v261[(1 + 0) -0 ];v260=1 + 0 ;end if (v260==1) then v263=v261[238 -(141 + 95) ];if ((v262==v76) and (v263>=v152)) then local v412=0 + 0 ;while true do if (((0 -0)==v412) or (1401>4696)) then v153[v263]=v262[v263];v261[2 -1 ]=v153;break;end end end break;end end end end elseif (v79>(7 + 22)) then local v264=0;local v265;while true do if (v264==0) then v265=v78[5 -(89 -(84 + 2)) ];v76[v265]=v76[v265](v13(v76,v265 + 1 + 0 ,v71));break;end end elseif (v78[2 + 0 ]==v76[v78[5 -1 ]]) then v70=v70 + 1 ;else v70=v78[2 + 1 ];end elseif (v79<=35) then if ((v79<=(195 -((150 -58) + 71))) or (3140<2129)) then if ((v79>(12 + 4 + 15)) or (2555<1240) or (3280<1321)) then v76[v78[2 -0 ]]= #v76[v78[768 -(574 + 191) ]];else v76[v78[2 + 0 ]]=v76[v78[3]];end elseif (v79<=(82 -49)) then v76[v78[2]]={};elseif ((4927>=2303) and (v79==(18 + 16))) then local v266=0;local v267;local v268;local v269;local v270;while true do if ((3462>=1032) and (v266==2)) then for v391=v267,v71 do local v392=849 -(254 + 595) ;while true do if (v392==(126 -(55 + 71))) then v270=v270 + (1 -0) ;v76[v391]=v268[v270];break;end end end break;end if (v266==(1790 -(573 + 1217))) then v267=v78[5 -3 ];v268,v269=v69(v76[v267](v13(v76,v267 + 1 + 0 ,v78[3])));v266=1 -0 ;end if (1==v266) then v71=(v269 + v267) -1 ;v270=939 -(714 + 225) ;v266=5 -3 ;end end else v76[v78[844 -(497 + 345) ]][v78[3 -0 ]]=v78[4];end elseif ((v79<=(5 + 33)) or (4727<=4722)) then if (v79<=(51 -15)) then v76[v78[(21 + 787) -(118 + 117 + 571) ]]=v76[v78[(1384 -(605 + 728)) -(25 + 23) ]] -v76[v78[1 + 3 ]] ;elseif ((v79>((1373 + 550) -(927 + 959))) or (1077>=2011)) then local v273=0;local v274;while true do if (v273==((0 -0) -0)) then v274=v78[734 -(16 + 716) ];v76[v274](v13(v76,v274 + (1 -0) ,v71));break;end end elseif (v76[v78[99 -(11 + 86) ]]==v76[v78[9 -5 ]]) then v70=v70 + (286 -(175 + 110)) ;else v70=v78[6 -3 ];end elseif (v79<=(192 -153)) then local v159=0;local v160;local v161;while true do if (v159==(1796 -(503 + 1293))) then v160=v78[(1 + 4) -3 ];v161=v76[v78[3 + (0 -0) ]];v159=1062 -(810 + 251) ;end if (v159==(1 + 0)) then v76[v160 + 1 + 0 ]=v161;v76[v160]=v161[v78[4 + 0 + 0 ]];break;end end elseif ((1543<2415) and (v79>40)) then if (v78[535 -(43 + 490) ]==v76[v78[737 -(711 + (60 -38)) ]]) then v70=v70 + 1 + 0 ;else v70=v78[11 -8 ];end elseif ((740<4937) and (v76[v78[(1350 -(457 + 32)) -(240 + 619) ]]==v76[v78[1 + 3 ]])) then v70=v70 + (1 -0) ;else v70=v78[3];end elseif (v79<=62) then if ((3658>=280) and (v79<=(4 + 47))) then if ((v79<=(1790 -(1344 + 400))) or (4444<2015)) then if (v79<=(448 -(255 + 150))) then if ((v79>(34 + 4 + 4)) or (885>=1031)) then if (v76[v78[2 + 0 ]]~=v78[16 -(1414 -(832 + 570)) ]) then v70=v70 + (3 -2) ;else v70=v78[(1642 + 100) -(404 + 1335) ];end else local v162=406 -(183 + 223) ;local v163;while true do if ((3554>=525) and (v162==((0 + 0) -0))) then v163=v78[2];do return v13(v76,v163,v163 + v78[3] );end break;end end end elseif (v79<=(30 + 14)) then local v164=v78[2 + 1 ];local v165=v76[v164];for v222=v164 + (338 -(10 + 327)) ,v78[(10 -7) + 1 + 0 ] do v165=v165   .. v76[v222] ;end v76[v78[340 -(118 + 220) ]]=v165;elseif ((v79==(15 + 30)) or (4200==2332)) then local v276=v78[451 -(108 + (1137 -(588 + 208))) ];local v277,v278=v69(v76[v276]());v71=(v278 + v276) -(1 + 0) ;local v279=0 -(0 -0) ;for v328=v276,v71 do local v329=1493 -(711 + 782) ;while true do if (v329==(0 -0)) then v279=v279 + (470 -(270 + 199)) ;v76[v328]=v277[v279];break;end end end else v76[v78[1 + 1 ]]=v78[3];end elseif ((2414<=2972) and (v79<=(1867 -(580 + 1239)))) then if ((v79==47) or (1278>=1316)) then v70=v78[8 -5 ];else local v168=v78[2 + 0 ];local v169=v76[v78[1 + (1802 -(884 + 916)) ]];v76[v168 + 1 ]=v169;v76[v168]=v169[v78[2 + 2 ]];end elseif (v79<=49) then local v173=v67[v78[3]];local v174;local v175={};v174=v10({},{__index=function(v223,v224) local v225=0 -0 ;local v226;while true do if (v225==(0 + 0)) then v226=v175[v224];return v226[1][v226[1169 -(645 + 522) ]];end end end,__newindex=function(v227,v228,v229) local v230=1790 -(1010 + 780) ;local v231;while true do if (v230==(0 + 0)) then v231=v175[v228];v231[4 -3 ][v231[2]]=v229;break;end end end});for v232=2 -1 ,v78[4] do local v233=1836 -(1045 + 791) ;local v234;while true do if ((3529<=3538) and ((2 -(1 + 0))==v233)) then if ((1082==1082) and (v234[1 -0 ]==(536 -(351 + 154)))) then v175[v232-1 ]={v76,v234[6 -3 ]};else v175[v232-((297 + 1263) -((4653 -3272) + 178)) ]={v58,v234[2 + 1 ]};end v75[ #v75 + (3 -2) ]=v175;break;end if (v233==(0 + 0)) then v70=v70 + (471 -(381 + 89)) ;v234=v66[v70];v233=1 + 0 ;end end end v76[v78[2 + 0 ]]=v29(v173,v174,v59);elseif (v79>50) then v76[v78[2]]=v76[v78[(1 + 3) -1 ]][v78[1160 -(1074 + 82) ]];else local v284=(1453 -(666 + 787)) -0 ;local v285;local v286;local v287;while true do if (v284==(1784 -((639 -(360 + 65)) + 1468 + 102))) then v285=v78[1457 -(990 + 465) ];v286=v76[v285];v284=1;end if (v284==(1 + 0)) then v287=v78[2 + 1 ];for v397=1 + (254 -(79 + 175)) ,v287 do v286[v397]=v76[v285 + v397 ];end break;end end end elseif ((1328<=4878) and (v79<=(220 -164))) then if (v79<=(1779 -(1668 + 58))) then if (v79==(678 -(512 + 114))) then local v177=v78[5 -3 ];local v178=v76[v177];for v235=v177 + (1 -0) ,v78[10 -7 ] do v7(v178,v76[v235]);end else local v179=0 + 0 ;local v180;local v181;while true do if (v179==(0 + (0 -0))) then v180=v78[3 + 0 + 0 ];v181=v76[v180];v179=3 -2 ;end if (1==v179) then for v350=v180 + (1995 -(109 + 1885)) ,v78[1473 -(1269 + 200) ] do v181=v181   .. v76[v350] ;end v76[v78[2]]=v181;break;end end end elseif (v79<=((315 -212) -49)) then v76[v78[817 -(98 + 717) ]]=v76[v78[829 -(802 + 24) ]][v76[v78[6 -2 ]]];elseif ((4087>=1355) and (v79>(69 -14))) then v76[v78[2]]=v78[3];elseif (v76[v78[1 + 1 ]] or (2861<458)) then v70=v70 + 1 ;else v70=v78[3 + 0 ];end elseif (v79<=(10 + 49)) then if ((v79<=(109 -52)) or (590>4650)) then v76[v78[1 + (900 -(503 + 396)) ]]=v58[v78[8 -(186 -(92 + 89)) ]];elseif ((1717<=4525) and (v79==58)) then if (v76[v78[6 -(7 -3) ]]==v78[2 + 2 ]) then v70=v70 + 1 + 0 ;else v70=v78[3];end else local v290=0 + 0 + 0 ;local v291;local v292;local v293;local v294;while true do if ((v290==0) or (3178<=1524)) then v291=v78[2 + 0 ];v292,v293=v69(v76[v291](v13(v76,v291 + 1 ,v78[3])));v290=1;end if ((4254>370) and (v290==(1 + 0))) then v71=(v293 + v291) -1 ;v294=0 + 0 ;v290=1435 -(797 + 636) ;end if ((9 -7)==v290) then for v400=v291,v71 do v294=v294 + (1620 -(1427 + 192)) ;v76[v400]=v292[v294];end break;end end end elseif (v79<=(234 -174)) then v59[v78[2 + 1 ]]=v76[v78[4 -2 ]];elseif (v79==61) then local v295=0;local v296;local v297;local v298;while true do if (v295==(0 + 0)) then v296=v78[1 + 1 ];v297=v76[v296];v295=327 -(192 + 134) ;end if (v295==(1277 -(316 + 960))) then v298=v78[3];for v403=1 + 0 ,v298 do v297[v403]=v76[v296 + v403 ];end break;end end else local v299=0 + 0 ;local v300;while true do if (v299==(0 + 0 + 0)) then v300=v78[7 -5 ];v76[v300]=v76[v300](v13(v76,v300 + 1 ,v78[554 -(83 + 468) ]));break;end end end elseif (v79<=(1878 -(1202 + 604))) then if (v79<=(312 -245)) then if ((v79<=(106 -42)) or (1635==1777)) then if ((v79>(174 -111)) or (3774<=3667)) then do return;end else local v188=(741 -416) -(45 + 280) ;local v189;while true do if (v188==0) then v189=v78[2 + 0 ];v76[v189](v76[v189 + 1 + 0 ]);break;end end end elseif ((v79<=(21 + 3 + 41)) or (3338>=3993)) then v76[v78[2]]=v76[v78[3]];elseif ((1270<2146) and (v79==(37 + 14 + 15))) then local v301=0 + 0 ;local v302;local v303;local v304;while true do if ((4563>=56) and ((3 -1)==v301)) then if ((1154<=1475) and (v303>(1911 -(340 + (4784 -3213))))) then if (v304<=v76[v302 + 1 + 0 ]) then local v431=1772 -(1733 + 39) ;while true do if (((0 + 0) -0)==v431) then v70=v78[1037 -(125 + 909) ];v76[v302 + (1951 -(1096 + 852)) ]=v304;break;end end end elseif (v304>=v76[v302 + (1 -0) ]) then v70=v78[2 + (1245 -(485 + 759)) ];v76[v302 + (3 -0) ]=v304;end break;end if ((v301==(0 + 0)) or (446==622)) then v302=v78[514 -(409 + 103) ];v303=v76[v302 + (238 -(46 + 190)) ];v301=1;end if ((1==v301) or (2610<1230)) then v304=v76[v302] + v303 ;v76[v302]=v304;v301=(224 -127) -((1240 -(442 + 747)) + 44) ;end end else do return v76[v78[1 + 1 ]];end end elseif ((2069>1009) and (v79<=(1386 -(1114 + 203)))) then if (v79>(794 -(228 + 498))) then v76[v78[2]][v78[1 + 2 ]]=v76[v78[3 + 1 ]];else do return;end end elseif ((12<4208) and ((v79<=(733 -(174 + 489))) or (1448==3083))) then v76[v78[2]]=v78[7 -(1139 -(832 + 303)) ]~=(1905 -(830 + 1075)) ;elseif (v79==(595 -((1249 -(88 + 858)) + 221))) then v76[v78[2]]=v76[v78[1272 -(231 + 1038) ]] -v76[v78[4 + 0 ]] ;else local v306=v78[1164 -(171 + 991) ];v76[v306]=v76[v306]();end elseif ((3139>916) and (v79<=(317 -240))) then if ((v79<=(198 -124)) or (2990<=2980)) then if ((2954==2954) and (v79==(182 -109))) then if ((117<=2892) and (v76[v78[2 + 0 ]]~=v78[13 -9 ])) then v70=v70 + 1 ;else v70=v78[8 -(2 + 3) ];end else local v195=0;local v196;local v197;local v198;while true do if ((v195==(1 -0)) or (453>4662) or (2575>=4275)) then v198=v76[v196 + 2 + 0 ];if ((v198>(0 -0)) or (3626<=1306)) then if (v197>v76[v196 + (1249 -(111 + 47 + 1090)) ]) then v70=v78[161 -(91 + 67) ];else v76[v196 + (8 -5) ]=v197;end elseif ((1368<3780) and (v197<v76[v196 + 1 ])) then v70=v78[1 + 2 ];else v76[v196 + (526 -(423 + (889 -(766 + 23)))) ]=v197;end break;end if (v195==0) then v196=v78[1 + 1 ];v197=v76[v196];v195=2 -1 ;end end end elseif ((v79<=((197 -157) + 35)) or (3169==2273)) then local v199=v78[773 -(326 + 445) ];local v200=v76[v199 + 2 ];local v201=v76[v199] + v200 ;v76[v199]=v201;if ((1320>595) and (v200>(0 -(0 -0)))) then if ((2481<=3279) and (v201<=v76[v199 + (2 -(2 -1)) ])) then local v353=0;while true do if ((0==v353) or (3199<590)) then v70=v78[6 -3 ];v76[v199 + 3 ]=v201;break;end end end elseif ((v201>=v76[v199 + (712 -((1798 -1268) + 181)) ]) or (4793<30) or (1063<=877)) then local v354=881 -((1687 -(1036 + 37)) + 267) ;while true do if (v354==0) then v70=v78[3];v76[v199 + 3 ]=v201;break;end end end elseif ((v79>(108 -(19 + 13))) or (1696<=1059)) then if (v78[2 -0 ]<v76[v78[9 -5 ]]) then v70=v70 + (2 -1) ;else v70=v78[3];end elseif ((2314==2314) and  not v76[v78[2]]) then v70=v70 + 1 + 0 + 0 ;else v70=v78[4 -1 ];end elseif ((924>=477) and (v79<=(165 -85))) then if ((1813<=3778) and (v79<=(1890 -(1293 + 519)))) then v59[v78[5 -2 ]]=v76[v78[4 -2 ]];elseif (v79==(150 -71)) then if v76[v78[8 -6 ]] then v70=v70 + 1 ;else v70=v78[6 -3 ];end else v58[v78[2 + 1 ]]=v76[v78[1 + 1 ]];end elseif ((4150==4150) and (v79<=(187 -106))) then if (v76[v78[1 + 1 ]]==v78[4]) then v70=v70 + 1 ;else v70=v78[1 + 2 ];end elseif (v79>82) then if ((2343==2343) and  not v76[v78[2 + (0 -0) ]]) then v70=v70 + (1097 -(709 + 387)) ;else v70=v78[3];end else local v312=1858 -(673 + 933 + 252) ;local v313;while true do if ((432<=3007) and (v312==(0 -(1480 -(641 + 839))))) then v313=v78[6 -4 ];v76[v313]=v76[v313]();break;end end end v70=v70 + (1 -(913 -(910 + 3))) ;break;end if (v88==0) then v78=v66[v70];v79=v78[(2 -1) + 0 ];v88=1 + 0 ;end end end end;end return v29(v28(),{},v17)(...);end return v15("LOL!503Q00028Q00027Q0040026Q00144003063Q004B657953797303093Q00412Q6442752Q746F6E03053Q005469746C6503093Q00436865636B204B6579030B3Q004465736372697074696F6E03253Q00456E746572204B6579206265666F7265207072652Q73696E6720746869732062752Q746F6E03083Q0043612Q6C6261636B03073Q00476574204B6579030C3Q00476574204B65792068657265026Q00F03F03093Q0053656C65637454616203043Q0077616974029A5Q99B93F026Q00184003083Q007265616466696C6503093Q00777269746566696C6503063Q00697366696C6503073Q0064656C66696C65030C3Q00736574636C6970626F61726403053Q007461626C6503063Q00696E73657274026Q000840026Q001040030A3Q006C6F6164737472696E6703043Q0067616D6503073Q00482Q747047657403493Q00682Q7470733A2Q2F6769746875622E636F6D2F64617769642D736372697074732F466C75656E742F72656C65617365732F6C61746573742F646F776E6C6F61642F6D61696E2E6C7561030C3Q0043726561746557696E646F77030F3Q00507269736D20487562202D204B657903083Q005375625469746C6503183Q004B65792073797374656D20666F7220507269736D2048756203083Q005461625769647468026Q00644003043Q0053697A6503053Q005544696D32030A3Q0066726F6D4F2Q66736574025Q00408040026Q00744003073Q00416372796C6963010003053Q005468656D6503043Q004461726B030B3Q004D696E696D697A654B657903043Q00456E756D03073Q004B6579436F646503053Q004D696E757303063Q00412Q64546162030A3Q004B65792053797374656D03043Q0049636F6E2Q033Q006B657903083Q00412Q64496E70757403083Q00496E7075744B657903093Q00496E707574204B657903123Q00496E7365727420796F7572206B65793Q2E03073Q0044656661756C74034Q00030B3Q00506C616365686F6C646572030C3Q00456E746572206B6579E280A603073Q004E756D6572696303083Q0046696E697368656403203Q0030373437663666653439636534626637382Q343862643Q613033306562373203203Q00633261383234633736632Q66343731343934626438652Q34613065646264363003203Q00323962613165616261622Q39342Q32393832623064336266393032376338343703043Q007761726E038C3Q005B4B657947756172645D202D204D692Q73696E6720726571756972656420696E666F726D6174696F6E20666F7220696E697469616C697A6174696F6E2E20506C6561736520636865636B2074686520746F6B656E7320616E6420646174612E207C20504C454153452054452Q4C204D45204946205448495320412Q504541525320494E20434F4E534F4C452103383Q005B452Q524F525D202D2054686520666F2Q6C6F77696E672072657175697265642066756E6374696F6E7320617265206D692Q73696E673A2003063Q00636F6E63617403023Q002C20032E3Q00682Q7470733A2Q2F63646E2E6B6579677561726469616E2E6F72672F6C6962726172792F76312E302E302E6C756103203Q0037613861393332353036653034386535623962656435363336666436326134612Q033Q00536574030B3Q007075626C6963546F6B656E030C3Q0070726976617465546F6B656E03083Q00747275654461746103093Q0066616C73654461746103143Q00507269736D48756253617665644B65792E747874030D3Q0056616C69646174655361766564003D012Q0012383Q00014Q0010000100113Q001238001200013Q0026510012006D00010002002Q043Q006D00010026513Q003400010003002Q043Q00340001001238001300013Q0026510013002400010001002Q043Q002400010020010014000E00040020300014001400052Q002100163Q000300301100160006000700301100160008000900061B00173Q000100062Q001F3Q00074Q001F3Q000B4Q001F3Q000F4Q001F3Q000C4Q001F3Q00044Q001F3Q00063Q00100E0016000A00172Q00190014001600022Q0041001000143Q0020010014000E00040020300014001400052Q002100163Q000300301100160006000B00301100160008000C00061B00170001000100012Q001F3Q00063Q00100E0016000A00172Q00190014001600022Q0041001100143Q0012380013000D3Q000E29000D002F00010013002Q043Q002F00010020300014000D000E0012380016000D4Q000D00140016000100120F0014000F3Q001238001500104Q003F00140002000100064F0005002900013Q002Q043Q00290001001238001300023Q0026510013000800010002002Q043Q000800010012383Q00113Q002Q043Q00340001002Q043Q000800010026513Q006C00010001002Q043Q006C0001001238001300013Q0026510013004E00010001002Q043Q004E00012Q002100143Q000500120F001500123Q00100E00140012001500120F001500133Q00100E00140013001500120F001500143Q00100E00140014001500120F001500153Q00100E00140015001500120F001500163Q00100E0014001600152Q0041000100144Q0021001400053Q001238001500123Q001238001600133Q001238001700143Q001238001800153Q001238001900164Q00320014000500012Q0041000200143Q0012380013000D3Q002651001300670001000D002Q043Q006700012Q002100146Q0041000300143Q0012380014000D4Q0012001500023Q0012380016000D3Q00044A001400660001001238001800014Q0010001900193Q0026510018005800010001002Q043Q005800012Q0036001A000200172Q003600190001001A0006530019006500010001002Q043Q0065000100120F001A00173Q002001001A001A00182Q0041001B00034Q0036001C000200172Q000D001A001C0001002Q043Q00650001002Q043Q0058000100044B001400560001001238001300023Q0026510013003700010002002Q043Q003700010012383Q000D3Q002Q043Q006C0001002Q043Q00370001001238001200193Q000E29000D00E000010012002Q043Q00E000010026513Q00AC0001001A002Q043Q00AC0001001238001300013Q000E290002007600010013002Q043Q007600010012383Q00033Q002Q043Q00AC00010026510013009400010001002Q043Q0094000100120F0014001B3Q00120F0015001C3Q00203000150015001D0012380017001E4Q0022001500174Q001E00143Q00022Q00480014000100022Q0041000C00143Q0020300014000C001F2Q002100163Q000700301100160006002000301100160021002200301100160023002400120F001700263Q002001001700170027001238001800283Q001238001900294Q001900170019000200100E0016002500170030110016002A002B0030110016002C002D00120F0017002F3Q00200100170017003000200100170017003100100E0016002E00172Q00190014001600022Q0041000D00143Q0012380013000D3Q000E29000D007200010013002Q043Q007200012Q002100143Q00010020300015000D00322Q002100173Q00020030110017000600330030110017003400352Q001900150017000200100E0014000400152Q0041000E00143Q0020010014000E0004002030001400140036001238001600374Q002100173Q00060030110017000600380030110017000800390030110017003A003B0030110017003C003D0030110017003E002B0030110017003F002B2Q00190014001700022Q0041000F00143Q001238001300023Q002Q043Q007200010026513Q00DF00010002002Q043Q00DF0001001238001300013Q002651001300B400010001002Q043Q00B40001001238000800403Q001238000900413Q0012380013000D3Q002651001300B800010002002Q043Q00B800010012383Q00193Q002Q043Q00DF0001002651001300AF0001000D002Q043Q00AF0001001238000A00423Q00064F000900CB00013Q002Q043Q00CB0001002649000900CB0001003B002Q043Q00CB000100064F000A00CB00013Q002Q043Q00CB0001002649000A00CB0001003B002Q043Q00CB000100064F000700CB00013Q002Q043Q00CB0001002649000700CB0001003B002Q043Q00CB000100064F000800CB00013Q002Q043Q00CB0001002651000800DD0001003B002Q043Q00DD0001001238001400014Q0010001500153Q000E29000100CD00010014002Q043Q00CD0001001238001500013Q000E29000100D000010015002Q043Q00D00001001238001600013Q002651001600D300010001002Q043Q00D3000100120F001700433Q001238001800444Q003F0017000200012Q00443Q00013Q002Q043Q00D30001002Q043Q00D00001002Q043Q00DD0001002Q043Q00CD0001001238001300023Q002Q043Q00AF0001001238001200023Q002651001200102Q010001002Q043Q00102Q01000E29001100E500013Q002Q043Q00E500012Q0015000400023Q0026513Q000F2Q01000D002Q043Q000F2Q012Q0012001300033Q000E0A000100022Q010013002Q043Q00022Q01001238001300014Q0010001400143Q002651001300EC00010001002Q043Q00EC0001001238001400013Q002651001400EF00010001002Q043Q00EF0001001238001500013Q002651001500F200010001002Q043Q00F2000100120F001600433Q001238001700453Q00120F001800173Q0020010018001800462Q0041001900033Q001238001A00474Q00190018001A00022Q002C0017001700182Q003F0016000200012Q00443Q00013Q002Q043Q00F20001002Q043Q00EF0001002Q043Q00022Q01002Q043Q00EC00012Q001600136Q001600056Q0041000400133Q00120F0013001B3Q00120F0014001C3Q00203000140014001D001238001600484Q0022001400164Q001E00133Q00022Q00480013000100022Q0041000600133Q001238000700493Q0012383Q00023Q0012380012000D3Q0026510012000300010019002Q043Q000300010026513Q000200010019002Q043Q0002000100200100130006004A2Q002100143Q000400100E0014004B000900100E0014004C000A00100E0014004D000700100E0014004E00082Q003F001300020001001238000B004F3Q00061B00130002000100032Q001F3Q000B4Q001F3Q00064Q001F3Q00073Q00123C001300503Q00120F001300144Q00410014000B4Q000B00130002000200064F001300372Q013Q002Q043Q00372Q0100120F001300504Q004800130001000200064F001300372Q013Q002Q043Q00372Q01001238001300014Q0010001400143Q0026510013002C2Q010001002Q043Q002C2Q01001238001400013Q0026510014002F2Q010001002Q043Q002F2Q012Q0016000400014Q0016000500013Q002Q043Q00372Q01002Q043Q002F2Q01002Q043Q00372Q01002Q043Q002C2Q010012383Q001A3Q002Q043Q00020001002Q043Q00030001002Q043Q000200012Q00188Q00443Q00013Q00033Q00073Q00028Q00026Q00F03F03093Q00777269746566696C6503053Q0056616C756503073Q0044657374726F7903053Q007072696E7403123Q0076616C696461746544656661756C744B657900313Q0012383Q00014Q0010000100013Q0026513Q001A00010002002Q043Q001A00014Q00025Q0006250001003000010002002Q043Q00300001001238000200013Q0026510002001300010001002Q043Q0013000100120F000300036Q000400016Q000500023Q0020010005000500042Q000D0003000500014Q000300033Q0020300003000300052Q003F000300020001001238000200023Q0026510002000800010002002Q043Q000800012Q0016000300014Q0009000300043Q002Q043Q00300001002Q043Q00080001002Q043Q003000010026513Q000200010001002Q043Q00020001001238000200013Q0026510002002100010002002Q043Q002100010012383Q00023Q002Q043Q000200010026510002001D00010001002Q043Q001D000100120F000300066Q000400023Q0020010004000400042Q003F0003000200014Q000300053Q0020010003000300074Q000400023Q0020010004000400042Q000B0003000200022Q0041000100033Q001238000200023Q002Q043Q001D0001002Q043Q000200012Q00443Q00017Q00023Q00030C3Q00736574636C6970626F61726403073Q006765744C696E6B00063Q00120F3Q00016Q00015Q0020010001000100022Q002D000100014Q00145Q00012Q00443Q00017Q000E3Q00028Q0003083Q007265616466696C65034Q00026Q00F03F027Q004003023Q006F7303053Q00636C6F636B03123Q0076616C696461746544656661756C744B657903053Q007072696E7403213Q0054696D652074616B656E20746F207665726966792073746F726564206B65793A2003083Q00207365636F6E647303123Q005361766564204B65792069732076616C696403143Q005361766564204B657920697320696E76616C696403073Q0064656C66696C65007E3Q0012383Q00014Q0010000100013Q000E290001000200013Q002Q043Q0002000100120F000200026Q00036Q000B0002000200022Q0041000100023Q00064F0001007D00013Q002Q043Q007D00010026490001007D00010003002Q043Q007D0001001238000200014Q0010000300073Q0026510002001300010001002Q043Q00130001001238000300014Q0010000400043Q001238000200043Q0026510002001700010004002Q043Q001700012Q0010000500063Q001238000200053Q0026510002000E00010005002Q043Q000E00012Q0010000700073Q0026510003002A00010004002Q043Q002A0001001238000800013Q0026510008002100010004002Q043Q00210001001238000300053Q002Q043Q002A00010026510008001D00010001002Q043Q001D000100120F000900063Q0020010009000900072Q00480009000100022Q0041000600094Q0047000700060004001238000800043Q002Q043Q001D00010026510003003E00010001002Q043Q003E0001001238000800013Q000E290001003900010008002Q043Q0039000100120F000900063Q0020010009000900072Q00480009000100022Q0041000400096Q000900013Q0020010009000900082Q0041000A00014Q000B0009000200022Q0041000500093Q001238000800043Q0026510008002D00010004002Q043Q002D0001001238000300043Q002Q043Q003E0001002Q043Q002D00010026510003001A00010005002Q043Q001A000100120F000800093Q0012380009000A4Q0041000A00073Q001238000B000B4Q002C00090009000B2Q003F0008000200014Q000800023Q0006250005005D00010008002Q043Q005D0001001238000800014Q0010000900093Q0026510008004B00010001002Q043Q004B0001001238000900013Q0026510009004E00010001002Q043Q004E0001001238000A00013Q002651000A005100010001002Q043Q0051000100120F000B00093Q001238000C000C4Q003F000B000200012Q0016000B00014Q0015000B00023Q002Q043Q00510001002Q043Q004E0001002Q043Q007D0001002Q043Q004B0001002Q043Q007D0001001238000800014Q0010000900093Q0026510008005F00010001002Q043Q005F0001001238000900013Q001238000A00013Q002651000A006300010001002Q043Q006300010026510009006900010004002Q043Q006900012Q0016000B6Q0015000B00023Q0026510009006200010001002Q043Q0062000100120F000B00093Q001238000C000D4Q003F000B0002000100120F000B000E6Q000C6Q003F000B00020001001238000900043Q002Q043Q00620001002Q043Q00630001002Q043Q00620001002Q043Q007D0001002Q043Q005F0001002Q043Q007D0001002Q043Q001A0001002Q043Q007D0001002Q043Q000E0001002Q043Q007D0001002Q043Q000200012Q00443Q00017Q00",v9(),...);
