%

#main programm
pkg load io
arg_list=argv();
if(length(arg_list)<2)
	%if((arg_list(1)==null)||(arg_list(2)==null))
		fprintf("Error. Usege: octave regression.m group_number variant_number\n");
		break
	%endif
endif

cd data-phase
tempfile=readdir(pwd);
file.num=numel(tempfile)-2;
for ii=1:file.num
	filelist{ii}=tempfile{ii+2};
endfor
for ii=1:file.num
	filelist{ii}
	file_id=fopen(filelist{ii},"r");
	file.subs1{ii}=fgetl(file_id);
	file.subs2{ii}=fgetl(file_id);
	file.mix{ii}=fgetl(file_id);
	file.nt(ii)=fscanf(file_id,"%f",1);
	file.np(ii)=fscanf(file_id,"%f",1);
	for jj=1:file.nt(ii)
		file.temp(ii,jj)=fscanf(file_id,"%f",1);
	endfor
	for jj=1:file.np(ii)
		file.pres(ii,jj)=fscanf(file_id,"%f",1);
	endfor
endfor

#file.temp
#file.pres

equa=["Клапейрона $ln(p_i^0(T))=A-\\frac{B}{T}$";
"Антуана $ln(p_i^0(T))=A-\\frac{B}{T+C}$";
"Риделя $ln(p_i^0(T))=A-\\frac{B}{T}+C ln(T)+DT^2$";
"Миллера $ln(p_i^0(T))=A-\\frac{B}{T}+C T+DT^3$";
"Ренкина $ln(p_i^0(T))=A-\\frac{B}{T}+СT^2$";
"Кеэгоу $ln(p_i^0(T))=A+\\frac{B}{T}+СT+BT^2$";
];

equ_gam=["Маргулеса"
		"Вильсона"
		"Ван~-- Лаара"
		"NRTL"
];

cd ..
#Gnum=input("Введите номер группы: ","s");
#file_id=fopen("gnumber","w")
#	fprintf(file_id,"%s",Gnum)
#fclose(file_id)

cd results
arg_list=argv();
if(length(arg_list)<2)
	%if((arg_list(1)==null)||(arg_list(2)==null))
		fprintf("Error. Usege: octave reactions.m group_number variant_number\n");
		break
	%endif
endif

file_id=fopen("phase_ideal.tex","w");
fprintf(file_id,"\\section{Лабораторная работа №~5 <<Определение условий фазовых равновесий пар~-- жидкость>>}\n\n \\addtocounter{nlab}{1}")
n_eq=rows(equa);
for ii=1:str2num(arg_list{2})
	
	nid=ceil(rand()*file.num);
	if(nid>file.num)
		nid=file.num;
	endif
	if(nid<1)
		nid=1;
	endif
	neq1=ceil(rand()*n_eq);
	if(neq1>n_eq)
		neq1=n_eq;
	endif
	if(neq1<1)
		neq1=1;
	endif
	neq2=ceil(rand()*n_eq);
	if(neq2>n_eq)
		neq2=n_eq;
	endif
	if(neq2<1)
		neq2=1;
	endif
	while(neq1==neq2)
		neq2=ceil(rand()*n_eq);
		if(neq2>n_eq)
			neq2=n_eq;
		endif
		if(neq2<1)
			neq2=1;
		endif
	endwhile
	
	cur_p_id=ceil(rand()*file.np(nid));
	if(cur_p_id>file.np(nid))
		cur_p_id=file.np(nid);
	endif
	if(cur_p_id<1)
		cur_p_id=1;
	endif
	cur_t_id=ceil(rand()*file.nt(nid));
	if(cur_t_id>file.nt(nid))
		cur_t_id=file.nt(nid);
	endif
	if(cur_t_id<1)
		cur_t_id=1;
	endif
	cur_p=file.pres(nid,cur_p_id);
	cur_t=file.temp(nid,cur_t_id);
	fprintf(file_id,"\\textsc{\\textbf{Вариант %d}}\n",ii)

	en2_rnd=neq1=ceil(rand()*rows(equ_gam))

	fprintf(file_id,"\\begin{enumerate}\n")
	fprintf(file_id,"\\item По экспериментальным данным (из справочника теплофизических свойств чистых веществ) получить описание давления паров чистого компонента от температуры. Для %s использовать уравнение %s, для %s использовать уравнение %s. На основе полученных уравнений и закона Рауля, для смеси %s построить $p-x,y$ и $y-x$ диаграммы равновесия пар-жидкость при температуре %6.1f $^\\circ$C . Сравнить результаты полученные по модели с экспериментальными данными и сделать вывод о применимости модели.\n\n",file.subs1{nid},equa(neq1,:),file.subs2{nid},equa(neq2,:),file.mix{nid},cur_t)
	fprintf(file_id,"\\item Построить $T-x,y$ и $y-x$ диаграммы при давлении %6.1f мм.рт.ст.. Сравнить результаты полученные по модели с экспериментальными данными и сделать вывод о применимости модели. ",cur_p)
	fprintf(file_id,"\\item Используя экспериментальные данные определить параметеры уравнения %s для описания коэффициента активности. Используя найденные значения параметров построить $T-x,y$ и $p-x,y$ диаграммы. Сравнить с результатом, полученным по уравнению Рауля.",equ_gam(en2_rnd,:))
	fprintf(file_id,"\\end{enumerate}\n\n")
	printf("%d\t%d\n",cur_p_id,cur_t_id)
	printf("generated %d \n",ii)
endfor
fclose(file_id);

file_id=fopen("filelist.tex","a")
fprintf(file_id,"\n\\input{phase_ideal.tex}")
fclose(file_id)

file_id=fopen("number.tex","w")
fprintf(file_id,"%s",arg_list{1})
fclose(file_id)
