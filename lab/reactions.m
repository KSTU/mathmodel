%
printf("\nGenerate lab #9\n")
%Задания по химической кинетике
function z1(id)
	 reak=["\\begin{equation*} \\begin{aligned} A+B \\xleftrightarrow[k_2]{k_1} C +\\Delta H_1 \\\\ A \\xrightarrow{k_3} B + \\Delta H_2 \\end{aligned} \\end{equation*}",
		"\\begin{equation*} \\begin{aligned} A \\xleftrightarrow[k_2]{k_1} C + \\Delta H_1 \\\\ A \\xrightarrow{k_3} B + \\Delta H_2 \\end{aligned} \\end{equation*}",
		"\\begin{equation*} \\begin{aligned} A \\xleftrightarrow[k_2]{k_1} B + \\Delta H_1 \\\\ B \\xrightarrow{k_3} C + \\Delta H_2 \\end{aligned} \\end{equation*}",
		"\\begin{equation*} \\begin{aligned} A+B \\xleftrightarrow[k_2]{k_1} C + \\Delta H_1 \\\\ B + C \\xrightarrow{k_3} D + \\Delta H_2 \\end{aligned} \\end{equation*}",
		"\\begin{equation*} \\begin{aligned} A \\xrightarrow{k_1} B + \\Delta H_1 \\\\ A \\xrightarrow{k_2} C + \\Delta H_2 \\\\ A \\xrightarrow{k_3} D + \\Delta H_3 \\end{aligned} \\end{equation*}"
		"\\begin{equation*} \\begin{aligned} A \\xleftrightarrow[k_2]{k_1} B + C + \\Delta H_1 \\\\ B + C \\xrightarrow{k_3} D + \\Delta H_2 \\end{aligned} \\end{equation*}"];
	nreak=5;	%заменить на функцию
	dh=[2 2 2 2 3 2 ];	%
	creak=ceil(rand()*nreak);
	tn=200+200*rand();	%начальная температура
	tk=tn+100;
	R=8.314;
	k11=0.05+0.13*rand();
	k12=k11*(3.5+5*rand());

	k21=0.02+0.04*rand();
	k22=k11*(3.5+5*rand());

	k31=0.03+0.09*rand();
	k32=k11*(3.5+5*rand());

	E1=(R*tn*tk*log(k11/k12))/(tn-tk);
	E2=(R*tn*tk*log(k21/k22))/(tn-tk);
	E3=(R*tn*tk*log(k31/k32))/(tn-tk);

	k01=k11/exp(-E1/R/tn);
	k02=k21/exp(-E2/R/tn);
	k03=k31/exp(-E3/R/tn);

	cp=2000+2000*rand();
	c1=15+20*rand();
	c2=(0.2+0.2*rand());

	dh1=(5+rand()*40)*(-1)^(ceil(2*rand()));
	dh2=(5+rand()*40)*(-1)^(ceil(2*rand()));
	dh3=(5+rand()*40)*(-1)^(ceil(2*rand()));
	fprintf(id," В реакторе идеального вытеснения протекает реакция: %s На вход  реактор подается смесь при температуре $ T_{н} = %4.0f K$, теплоемкость смеси $c_p=%5.0f \\frac{Дж}{моль \\cdot K}$, состав подаваемой смеси: $c_A=%3.1f \\frac{моль}{л}$, $c_B=%3.1f \\frac{моль}{л}$. ",reak(creak,:),tn,cp,c1,c2)
	fprintf(id,"Параметры реакций: энергии активации $E_{a1}=%4.1f \\frac{кДж}{моль}$, $E_{a2}=%4.1f  \\frac{кДж}{моль}$, $E_{a3}=%4.1f  \\frac{кДж}{моль}$, предэкспоненциальный множитель $k_{01}=%10.0f$,$k_{02}=%10.0f$,$k_{03}=%10.0f$,",E1/1000,E2/1000,E3/1000,k01,k02,k03)
	if(dh(creak)==2)
		fprintf(id," тепловой эффект $\\Delta H_1= %4.1f  \\frac{кДж}{моль}$, $\\Delta H_2=%4.1f \\frac{кДж}{моль}$.",dh1,dh2);
	else
		fprintf(id," тепловой эффект $\\Delta H_1= %4.1f \\frac{кДж}{моль}$, $\\Delta H_2=%4.1f \\frac{кДж}{моль}$, $\\Delta H_3 = %4.1f \\frac{кДж}{моль}$",dh1,dh2,dh3);
	endif
	fprintf(id,"\\begin{itemize} \\item Составить математическую модель изотермического реактора. Определить распределение концентрации компонентов по времени. Определить изменение конверсии по компоненту A, селективности и выхода по компоненту B. ");
	
	fprintf(id,"\\item  Составить математическую модель адиабатического реактора, определить изменение концентрации и температуры во времени. Сравнить изменение концентрации компонентов, конверсии и селективности для адиабатического и изотермического реактора от времени. ");
	fprintf(id, "\\item  Составить математическую модель реактора идеального смешения. Сравнить изменение во времени конверсии и селективности для модели идеального вытеснения и смешения. ");
	
	fprintf(id,"\\end{itemize}\n\n");
	printf("|_")

endfunction

%main program
cd results
arg_list=argv();
if(length(arg_list)<2)
	%if((arg_list(1)==null)||(arg_list(2)==null))
		fprintf("Error. Usege: octave reactions.m group_number variant_number\n");
		break
	%endif
endif
file_id=fopen("reactions.tex","w");
fprintf(file_id,"\\section {Лабораторная работа №~9 <<Моделирование реакций в реакторах с различной структурой потоков>>}\n\n  \\addtocounter{nlab}{1}")
for ii=1:str2num(arg_list{2})
	fprintf(file_id,"\\textsc{\\textbf{Вариант %d}}\n\n",ii);
	z1(file_id);
endfor
fclose(file_id);

file_id=fopen("filelist.tex","a");	#append file to the end
fprintf(file_id,"\n\\input{reactions.tex}");
fclose(file_id);

file_id=fopen("number.tex","w")
fprintf(file_id,"%s",arg_list{1})
fclose(file_id)
