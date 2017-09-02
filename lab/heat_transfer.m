function out=z1(id)
	typstr=[ "прямоточном" "противоточном" ];
	Rtype=ceil(rand()*3);
	ttype=ceil(rand()*2);
	if(ttype==1)
		typstr="прямоточном";
		typstr2="прямоточный";
	else
		typstr="противоточном";
		typstr2="противоточный";
	endif
	if(Rtype==1)
		Re=500+1000*rand();
	elseif(Rtype==2)
		Re=3000+5000*rand();
	elseif(Rtype==3)
		Re=12000+10000*rand();
	endif
	L=10+20*rand();
	D1=10+30*rand();
	D2=D1*(1+0.4+rand()*1);
	del=2+5*rand();
	la_st=300+400*rand();
	T1=20+20*rand();
	T2=T1+50+200*rand();
	cp2=1300+3000*rand();
	la2=0.1+0.5*rand();
	ro2=600+1000*rand();
	mu2=0.1+10.5*rand();
	
	g2=Re*(mu2*0.001)/(D1*0.001)/ro2*((D1*0.001)^2*pi/4)*ro2*3600
	g1=g2*(0.5+1.3*rand());
	cp1=1300+3000*rand();
	la1=0.1+0.5*rand();
	ro1=800+1200*rand();
	mu1=0.1+8.5*rand();
	
	bet=(2+8*rand())/10^4;
	cold_s="{C}";
	hot_s="{H}";
	wall="{w}";
	
fprintf(id,"Смоделировать процесс теплообмена в %s теплообменнике типа \"труба в трубе\". Использовать модель идеального вытеснения для обоих потоков. Параметры теплообменника: длина %5.1f м, диаметр внешней трубы %3.1f мм, диаметр внутренней трубы %3.1f мм, толщина стенки $\\delta_%s$= %5.0f мм, теплопроводность материала стенки $\\lambda_%s=%5.0f \\frac{Вт}{м \\cdot К}$. Горячий теплоноситель (обозначен индексом H) направляется во внутреннюю трубу и имеет следующие параметры: температура $T_%s=%4.0f ^\\circ\\mathrm{C}$, теплоемкость $c_{p%s}= %5.1f \\frac{Дж}{кг \\cdot ^\\circ\\mathrm{C}}$, теплопроводность $\\lambda_%s= %4.3f \\frac{Вт}{м \\cdot ^\\circ\\mathrm{C}}$, плотность $\\rho_%s=%5.0f \\frac{кг}{м^3}$, коэффициент вязкости $\\mu_%s=%5.3f мПа \\cdot с $, коэффициент термического расширения $\\beta_%s=%7.6f ^\\circ\\mathrm{C}^{-1}$, расход $G_%s= %5.3f \\frac{кг}{ч}$. Холодный теплоноситель (обозначен индексом C) направляется в межтрубное пространство и имеет следующие параметры: температура $T_%s= %4.0f ^\\circ\\mathrm{C}$, теплоемкость $c_{p%s}=%5.0f \\frac{Дж}{кг \\cdot ^\\circ\\mathrm{C}}$, теплопроводность $\\lambda_%s=%4.3f \\frac{Вт}{м \\cdot ^\\circ\\mathrm{C}}$, плотность $\\rho_%s= %5.0f \\frac{кг}{м^3}$, коэффициент вязкости $\\mu_%s=%5.3f мПа \\cdot с $, расход $G_%s=%5.2f \\frac{кг}{ч}$. ", typstr ,L,D2,D1,wall,del,wall,la_st,hot_s,T2,hot_s,cp2,hot_s,la2,hot_s,ro2,hot_s,mu2,hot_s,bet,hot_s,g2,cold_s,T1,cold_s,cp1,cold_s,la1,cold_s, ro1,cold_s,mu1,cold_s,g1)

fprintf(id, "Определить распределение температуры теплоносителя по длине теплообменника.\n\n") 
endfunction

function out=z2(id)
	typstr=[ "прямоточном" "противоточном" ];
	Rtype=ceil(rand()*3);
	ttype=ceil(rand()*2);
	if(ttype==1)
		typstr="прямоточном";
		typstr2="прямоточный";
	else
		typstr="противоточном";
		typstr2="противоточный";
	endif
	if(Rtype==1)
		Re=500+1000*rand();
	elseif(Rtype==2)
		Re=3000+5000*rand();
	elseif(Rtype==3)
		Re=12000+10000*rand();
	endif
	L=10+20*rand();
	D1=10+30*rand();
	D2=D1*(1+0.4+rand()*1);
	del=2+5*rand();
	la_st=300+400*rand();
	T1=20+20*rand();
	T2=T1+50+200*rand();
	cp2=1300+3000*rand();
	la2=0.1+0.5*rand();
	ro2=800+1200*rand();
	mu2=0.1+10.0*rand();
	
	g2=Re*(mu2*0.001)/(D1*0.001)/ro2*((D1*0.001)^2*pi/4)*ro2*3600
	g1=g2*(0.5+1.3*rand());
	cp1=1300+3000*rand();
	la1=0.1+0.5*rand();
	ro1=800+1200*rand();
	mu1=0.1+8.5*rand();
	

	bet=(2+rand()*10)/10^4;
	Tlast=T1+(T2-T1)*(0.4+0.2*rand())
	
	cold_s="{C}";
	hot_s="{H}";
	wall="{w}";

fprintf(id,"Спроектировать %s теплообменник типа \"труба в трубе\" для нагревания сырья с исходной температурой $T_%s= %4.0f ^\\circ\\mathrm{C}$ и расходом $G_%s=%5.2f \\frac{кг}{ч}$ до температуры %4.1f $^\\circ\\mathrm{C}$ свойства сырья: теплоемкость $c_{p%s}=%5.0f \\frac{Дж}{кг \\cdot ^\\circ\\mathrm{C}}$ , $\\lambda_%s=%4.3f \\frac{Вт}{м \\cdot ^\\circ\\mathrm{C}}$, плотность $\\rho_%s= %5.0f \\frac{кг}{м^3}$, коэффициент вязкости $\\mu_%s = %5.3f мПа \\cdot с $. Горячий теплоноситель имеет температуру $T_%s=%4.0f ^\\circ\\mathrm{C}$, теплоемкость $c_{p%s}= %5.1f \\frac{Дж}{кг \\cdot ^\\circ\\mathrm{C}}$,теплопроводность $\\lambda_%s= %4.3f \\frac{Вт}{м \\cdot ^\\circ\\mathrm{C}}$, плотность $\\rho_%s=%5.0f \\frac{кг}{м^3}$, коэффициент вязкости $\\mu_%s=%5.3f мПа \\cdot с $, коэффициент теплового расширения $\\beta = %2.6f ^\\circ\\mathrm{C}^{-1}$. В качестве материала стенки теплообменника используется металл толщиной $\\delta_%s = %5.0f$ мм, теплопроводность материала стенки $\\lambda_{%s}=%5.0f \\frac{Вт}{м \\cdot ^\\circ\\mathrm{C}}$. ",typstr2,cold_s, T1, cold_s, g1, Tlast,cold_s, cp1,cold_s, la1,cold_s, ro1, cold_s, mu1, hot_s, T2, hot_s, cp2,hot_s, la2, hot_s, ro2, hot_s, mu2, bet,wall ,del,wall,la_st)

fprintf(id, "Определить распределение температуры теплоносителя по длине теплообменника.\n\n") 
endfunction

%main programm
arg_list=argv();
if(length(arg_list)<2)
	%if((arg_list(1)==null)||(arg_list(2)==null))
		fprintf("Error. Usege: octave heat_transfer.m group_number variant_number\n");
		break
	%endif
endif

file_id=fopen("heat_transfer.tex","w");
for ii=1:str2num(arg_list{2})
fprintf(file_id,"\\textsc{\\textbf{Вариант %d}}\n\n",ii);
fprintf(file_id,"Поверочный расчет\n\n")
z1(file_id)
fprintf(file_id,"Проектный расчет\n\n")
z2(file_id)
endfor
fclose(file_id)

