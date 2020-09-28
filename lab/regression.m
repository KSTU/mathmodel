%
printf("generate lab #2")

function z1(id)
	fprintf(id,"\\textbf{Задание 1} ");
	fun_list=["y(x)=a e^{b x}+c"; "y(x)=a \\cdot x^b+c"];

	ai=["a_0","a_1"];
	fun2_list=["x"; "x^{3.7}"; "\\dfrac{1}{x}"; "x^{1.2}"; "x^{0.3}"; "\\dfrac{x}{1+x}"; "\\dfrac{x^{2.4}}{1+x^2}"; "\\sqrt{x}"];
	fun3_list=["y(x)=A \\cdot e^{-\\dfrac{B}{x}+C}"; "y(x)=\\dfrac{B+x^C}{A+x}"; "y(x)=B+10^{A+Cx}"; "y(x)=\\dfrac{A x^2 + B x +C}{\\sqrt{x} +D}"; "y(x)=\\dfrac{A x^B} {C+x}"];
	fun4_list=["кубический сплайн"; "параболический сплайн"];
	A=normrnd(0.2,5);
	B=normrnd(1,5);
	C=normrnd(2,5);
	D=normrnd(4,5);


	xmin=ceil(rand()*100)/10;
	xdel=ceil(rand()*100)/10;


%=====================
fprintf(id,"В результате измерения зависимости переменной состояния $y$ от входного фактора $x$ были получены значения, представленные в таблице. Описать табличные данные следующими функциональными зависимостями:\n \\begin{itemize} \n")
	fprintf(id,"\\item $y(x)=a x+b$\n")
	if(rand()>0.5)
		fprintf(id,"\\item $y(x)=a_3 x^3 +a_2 x^2 + a_1 x +a_0$\n");
	else
		fprintf(id,"\\item $y(x)=a_2 x^2 + a_1 x +a_0$\n");
	endif
#	temp1=ceil(rand()*5);
#	temp2=ceil(rand()*5);
#	while(temp1==temp2)
#		temp2=ceil(rand()*5);
#	endwhile
	fprintf(id,"\\item $%s$\n",fun_list(1,:));
	fprintf(id,"\\item $%s$\n",fun_list(2,:));
	fun2_num=rows(fun2_list);
	temp1=ceil(rand()*fun2_num);
	temp2=ceil(rand()*fun2_num);
	temp3=ceil(rand()*fun2_num);
	while(temp1==temp2)
		temp2=ceil(rand()*fun2_num);
	endwhile
	while((temp1==temp3)&&(temp2==temp3))
		temp3=ceil(rand()*fun2_num);
	endwhile
	fprintf(id,"\\item $y(x)=a_0 %s+a_1 %s +a_2 %s$\n",fun2_list(temp1,:),fun2_list(temp2,:),fun2_list(temp3,:));
	fun3_num=rows(fun3_list);
	temp1=ceil(rand()*fun3_num);
	fprintf(id,"\\item $%s$\n",fun3_list(temp1,:));

	fun4_num=rows(fun4_list);
	temp4=ceil(rand()*fun4_num);

	fprintf(id,"\\item %s\n",fun4_list(temp4,:));
	fprintf(id,"\\end{itemize}\n")
%%%%%%%%%%%5

	#таблица исходных данных
	fprintf(id,"\\begin{table}[h]\n");	%\\begin{wraptable}{r}{0.15\\linewidth}\n
	fprintf(id,"\\begin{tabular}{|c|c|}\n\\hline\n");
	fprintf(id,"x & y \\\\ \\hline\n")

	func_num=3;
	func_cur= ceil(rand()*func_num);
	#if(func_cur==1)
		for ii=1:10
			cur_x(ii)=xmin+(ii-1)*xdel;
			if(func_cur==1)
				cur_y(ii)=A/100*cur_x(ii)^3+B/10*cur_x(ii)^2+C*cur_x(ii);
			endif
			if(func_cur==2)
				cur_y(ii)=B*cur_x(ii)^(B)-C/cur_x(ii)^abs(C);
			endif
			if(func_cur==3)
				cur_y(ii)=(A*cur_x(ii)^2+B*cur_x(ii)+C)/(sqrt(cur_x(ii))+D/10);
			endif

		endfor
		E=max(cur_y)+rand()*100;
		if(max(abs(cur_y))>10000)
			koef=10000/max(abs(cur_y))*normrnd(1,0.1);
		elseif(max(abs(cur_y))<5)
			koef=5000;
		else
			koef=1;
		endif
		for ii=1:10
			fprintf(id,"%5.2f & %10.2f \\\\ \\hline \n",cur_x(ii),cur_y(ii)*koef*normrnd(1,0.2))
		endfor
	#endif
	fprintf(id,"\\end{tabular}\n")
	fprintf(id,"\\end{table}\n\n")


endfunction

function z2(id)
	A=normrnd(0.2,5);
	if(A>0)
		za=" + ";
	else
		za=" ";
	endif
	B=normrnd(1,5);
	if(B>0)
		zb=" + ";
	else
		zb=" ";
	endif
	C=normrnd(2,5);
	if(C>0)
		zc=" + ";
	else
		zc=" ";
	endif
	D=normrnd(4,5);
	if(D>0)
		zd=" + ";
	else
		zd=" ";
	endif
	E=abs(normrnd(1,5));
	if(E>2)
		E=2-E;
	endif
	if(E>0)
		ze=" + ";
	else
		ze=" ";
	endif
	fprintf(id,"\\item Решить уравнение: ")
	eq1_num=3-0.00001;
	temp1=ceil(rand()*eq1_num);
	switch(temp1)
		case 1
			#полином 3-й степени
			fprintf(id,"$%10.2f x^3 + %10.2f x^2 %s %10.2f x %10.2f = 0 $",-abs(A),abs(B),zc,C,-abs(D));
		case 2
			#логарифмическое выражение
			fprintf(id,"$ln{(%6.2f x^2 - %6.2f)}=%10.2f$",abs(A),abs(B),abs(E));
		case 3
			#корень
			fprintf(id,"$\\sqrt{(%10.2f x^2 %s %10.2f x)}$=%10.2f",abs(A),zb,B,abs(E*D));
	endswitch
	fprintf(id,"\n\n")
endfunction

function z3(id)
	A=normrnd(5,5);
	if(A>0)
		az=" + ";
	else
		az=" ";
	endif
	B=normrnd(5,5);
	if(B>0)
		bz=" + ";
	else
		bz=" ";
	endif
	C=normrnd(2,1);
	if(C>0)
		cz=" + ";
	else
		cz=" ";
	endif
	D=normrnd(100,5);
	if(D>0)
		dz=" + ";
	else
		dz=" ";
	endif
	#для второй функции
	A1=normrnd(5,5);
	if(A1>0)
		a1z=" + ";
	else
		a1z=" ";
	endif
	B1=normrnd(5,5);
	if(B1>0)
		b1z=" + ";
	else
		b1z=" ";
	endif
	C1=normrnd(2,1);
	if(C1>0)
		c1z=" + ";
	else
		c1z=" ";
	endif
	D1=normrnd(100,5);
	if(D1>0)
		d1z=" + ";
	else
		d1z=" ";
	endif
	E1=normrnd(100,5);
	if(D1>0)
		e1z=" + ";
	else
		e1z=" ";
	endif

	fprintf(id,"\\item Решить систему уравнений:\n")
	fprintf(id,"\\begin{equation*}\n");
	fprintf(id,"\\left\\{\n");
	fprintf(id,"\\begin{aligned}\n")
	eq1_num=4;
	temp1=ceil(rand()*eq1_num);
	%first
	if(temp1==1)	#1 -степень --- 3-степень
		fprintf(id,"%5.2f x %s %5.2f y = %5.2f \\\\\n",A,bz,B,C)
		fprintf(id,"%5.2f x^3 %s %5.2f %s %5.2f x %s %5.2f y = %5.2f \\\\\n",A1,b1z,B1,c1z,C1,d1z,D1,E1)
	endif
	if(temp1==2)	#3 -степень --- элипсоид
		fprintf(id,"%5.2f x^3 %s %5.2f x^2 %s %5.2f x =y\\\\\n",A,bz,B,cz,C)
		fprintf(id,"%5.2f x^2 + %5.2f y^2 = %5.2f \\\\\n",abs(A1),abs(B1),abs(C1)*100)
	endif
	if(temp1==3)	#1 степень --- элипсоид
		fprintf(id,"%5.2f y  = %5.2f x \\\\\n",A,B);
		fprintf(id,"%5.2f x^2 %s %5.2f y^2 = %5.2f \\\\\n",abs(A1),b1z,abs(B1),abs(C1)*100)
	endif
	if(temp1==4)	#2 степень и круг
		fprintf(id,"%5.2f y = %5.2f x^2\\\\\n",A,B);
		fprintf(id,"%5.2f x^2 + %5.2f y^2 = %6.2f\n",abs(A1),abs(B1),abs(E1)*100)
	endif
	if(temp1==5)	#круг и
		fprintf(id,"x^2 + %5.2f y^2 %5.2f = %10.2f ",abs(A),bz,abs(B),abs(C)*1000);
		fprintf(id,"y^2= %6.2f x^{%3.2f}",B,1/3*normrnd(1,0.4))
	endif
	fprintf(id,"\\end{aligned}\n")
	fprintf(id,"\\right.\n")
	fprintf(id,"\\end{equation*}\n")
endfunction

function z4(id,prop,minr,maxr,units,vvo)
#	num=odsread('lab2.ods', 'z2', 'A1:A1','OCT');
#	num
#	vvo_range=strcat('A2:A',num2str(num+1));
#	[numarr, vvo, rawarr, limits]=odsread('lab2.ods', 'z2', vvo_range,'OCT');
#	prop_range=strcat('B2:B',num2str(num+1));
#	[numarr, prop, rawarr, limits]=odsread('lab2.ods', 'z2', prop_range,'OCT');
#	max_range=strcat('C2:C',num2str(num+1));
#	[maxr, temps, rawarr, limits]=odsread('lab2.ods', 'z2', max_range,'OCT');
#	min_range=strcat('D2:D',num2str(num+1));
#	[minr, temps, rawarr, limits]=odsread('lab2.ods', 'z2', min_range,'OCT');
#	units_range=strcat('E2:E',num2str(num+1));
#	[numarr, units, rawarr, limits]=odsread('lab2.ods', 'z2', units_range,'OCT');
	
	
	
	temp_rand=ceil(rand()*rows(minr));
	units{temp_rand};
#	prop(temp_rand,:)
#	vvo(temp_rand,:)
#	units(temp_rand,:)
	cur_prop=minr(temp_rand)+(maxr(temp_rand)-minr(temp_rand))*rand();
	fprintf(id,"\\textbf{Задание 2} ");
	fprintf(id," Используя данные из справочника теплофизических свойств описать %s %s. В качестве аппроксимирующей функции может выступать любое выражение, однако максимальное отклонение не должно превышать 10\\%%. Определить, при какой температуре %s равна $%8.1f %s$.\n\n",prop{temp_rand}, vvo{temp_rand},prop{temp_rand},cur_prop,units{temp_rand})	#vvo{temp_rand},
endfunction	

function z5(id)
	por=0.5+rand()*2;
	c0=10+rand()*10;
	k=0.1+0.3*rand();
	cmax=0.17+0.05*rand();

	fprintf(id,"\\textbf{Задание 3} ");
	fprintf(id,"В таблице представлено изменение концентрации исходного вещества (c) от вермени ($\\tau$). Определить порядок реакции и константу скорости реакции.\n\n",por);
	#таблица исходных данных
	fprintf(id,"\\begin{table}[h]\n");	%\\begin{wraptable}{r}{0.15\\linewidth}\n
	fprintf(id,"\\begin{tabular}{|c|c|}\n\\hline\n");
	fprintf(id,"$\\tau$, с & c, моль/л \\\\ \\hline\n")
	maxtau=(c0^(1-por)-cmax^(1-por))/(1-por)/k;
	tn=8+ceil(rand()*8);
	for ii=1:tn
		ctau=maxtau/tn*(ii-1);
		curc=(c0^(1-por)-(1-por)*k*ctau)^(1/(1-por));
		fprintf(id,"%5.2f & %10.2f \\\\ \\hline \n",ctau,curc*normrnd(1,0.06))
	endfor
	#endif
	fprintf(id,"\\end{tabular}\n")
	fprintf(id,"\\end{table}\n\n")
	fprintf(id,"\\newpage\n\n")
endfunction

%main program
pkg load odepkg
pkg load io
arg_list=argv();
if(length(arg_list)<2)
	%if((arg_list(1)==null)||(arg_list(2)==null))
		fprintf("Error. Usege: octave regression.m group_number variant_number\n");
		break
	%endif
endif
#read data for 4 z
[vvo prop temp_min temp_max units]=textread( 'lab2.data', '%s %s %f %f %s' ,'delimiter' , '\t' ,1 );

cd results
file_id=fopen("regression.tex","w");
fprintf(file_id,"\\section{Лабораторная работа №~2 <<Регрессионный анализ, методы аппроксимации>>}\n\n  \\addtocounter{nlab}{1}")
#fprintf(file_id,"\\textsc{\\textbf{Группа %s}}\n\n",arg_list{1})
#fprintf(file_id,"\\input{regression_theory.tex}\n\n")


#file_id2=fopen("lab2.data","r");

#fclose(file_id2);


for ii=1:str2num(arg_list{2})
	fprintf(file_id,"\\textsc{\\textbf{Вариант %d}}\n\n",ii)
#	fprintf(file_id,"\\begin{enumerate}\n");
	z1(file_id)
#	z2(file_id)
#	z3(file_id)
	cd ..
#	z4(file_id,prop,temp_min,temp_max,units,vvo)
	cd results
#	z5(file_id)
	printf("generated %d\n",ii);
#	fprintf(file_id,"\\end{enumerate}\n");

endfor
fprintf(file_id,"\\newpage\n");
fclose(file_id);


file_id=fopen("filelist.tex","a");
fprintf(file_id,"\n\\input{regression.tex}");
fclose(file_id);
