%
printf("generate lab #8\n")

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

	g2=Re*(mu2*0.001)/(D1*0.001)/ro2*((D1*0.001)^2*pi/4)*ro2*3600;
	g1=g2*(0.5+1.3*rand());
	cp1=1300+3000*rand();
	la1=0.1+0.5*rand();
	ro1=800+1200*rand();
	mu1=0.1+8.5*rand();

	bet=(2+8*rand())/10^4;
	cold_s="{c}";
	hot_s="{h}";
	wall="{w}";

fprintf(id,"\\item Вычислить распределение температур теплоносителей в прямоточном теплообменнике типа <<труба в трубе>>. \
Использовать модель идеального вытеснения для обоих потоков.\
 Параметры теплообменника: длина %5.1f~м, диаметр внешней трубы %3.1f~мм, \
 диаметр внутренней трубы %3.1f~мм, толщина стенки $\\delta_%s$= %5.0f~мм, \
 теплопроводность материала стенки $\\lambda_%s=%5.0f~\\frac{\\text{Вт}}{\\text{м} \\cdot \\text{К}}$.\
  Горячий теплоноситель (обозначен индексом <<h>>) направляется во внутреннюю трубу и\
	 имеет следующие параметры: температура $\\text{T}_%s=%4.0f~^\\circ\\mathrm{C}$, теплоемкость\
	  $c_{p%s}= %5.1f~\\frac{\\text{Дж}}{\\text{кг} \\cdot ^\\circ\\mathrm{C}}$, теплопроводность \
		$\\lambda_%s= %4.3f~\\frac{\\text{Вт}}{\\text{м} \\cdot ^\\circ\\mathrm{C}}$, плотность \
		$\\rho_%s=%5.0f \\frac{\\text{кг}}{\\text{м}^3}$, коэффициент вязкости $\\mu_%s=%5.3f \\text{мПа} \
		\\cdot \\text{с} $, коэффициент термического расширения $\\beta_%s=%7.6f ^\\circ\\mathrm{C}^{-1}$,\
		 расход $G_%s= %5.3f \\frac{\\text{кг}}{\\text{ч}}$. Холодный теплоноситель (обозначен индексом <<c>>) \
		 направляется в межтрубное пространство и имеет следующие параметры: температура $T_%s= %4.0f\
		 ~^\\circ\\mathrm{C}$, теплоемкость $c_{p%s}=%5.0f \\frac{\\text{Дж}}{\\text{кг} \\cdot ^\\circ\\mathrm{C}}$,\
			 теплопроводность $\\lambda_%s=%4.3f \\frac{\\text{Вт}}{\\text{м} \\cdot ^\\circ\\mathrm{C}}$, плотность \
			 $\\rho_%s= %5.0f~\\frac{\\text{кг}}{\\text{м}^3}$, коэффициент вязкости $\\mu_%s=%5.3f~\\text{мПа} \\cdot \\text{с} $, \
			 расход $G_%s=%5.2f~\\frac{\\text{кг}}{\\text{ч}}$. \n\n" ,L,D2,D1,wall,del,wall,la_st,hot_s,T2,hot_s,cp2,hot_s,la2,hot_s,ro2,hot_s,mu2,hot_s,bet,hot_s,g2,cold_s,T1,cold_s,cp1,cold_s,la1,cold_s, ro1,cold_s,mu1,cold_s,g1)

endfunction

function out=z2(id)
	fprintf(id, "\\item Определить распределение температуры вдоль теплообменника, если \
	изменить направление движения теплоносителей на противоточное.\n\n")
endfunction

function out=z3(id)
	fprintf(id, "\\item Определить площадь теплообмена для модели идеального смешения, необходимую для достижения \
	темпереатур на выходе из теплообоменника, таких же как для модели идеального смешения (температуры взять из предыдущих заданий).\
	Провести сравнение эффективности теплообменников с различной структурой потоков.\n\n")
endfunction

#main programm
pkg load io
arg_list=argv();
if(length(arg_list)<2)
	%if((arg_list(1)==null)||(arg_list(2)==null))
		fprintf("Error. Usege: octave regression.m group_number variant_number\n");
		break
	%endif
endif

cd results
file_id=fopen("heat.tex","w");
#fprintf(file_id,"\\textsc{\\textbf{Лабораторная работа №8 <<Моделирование теплообменника типа труба в трубе>>}}\n\n")
fprintf(file_id,"\\section{Лабораторная работа №~8 <<Моделирование теплообменника типа труба в трубе>>}\n\n  \\addtocounter{nlab}{1}")
for ii=1:str2num(arg_list{2})
	printf("\tgenerate var %d\n",ii);
	fprintf(file_id,"\\textsc{\\textbf{Вариант %d}}\n\n",ii);
	fprintf(file_id,"\\begin{enumerate} \n")
	z1(file_id)
	z2(file_id)
	z3(file_id)
	fprintf(file_id,"\\end{enumerate}\n\n")
	% z2(file_id)
endfor
fclose(file_id)


file_id=fopen("filelist.tex","a");
fprintf(file_id,"\n\\input{heat.tex}");
fclose(file_id);
