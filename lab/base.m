%

function z1(id)	%простейшие вычисления
	simple=["\\sin \\left( \\dfrac{\\pi}{7} \\right)"
	"\\cos(14)"
	"\\dfrac{7+\\sin(2)}{3}"
	"\\ln(3+sin(4))"
	"\\sin(4 e^2)"];
	simp_num=rows(simple);
	simp_rand1=round(rand()*(simp_num-1))+1;
	simp_rand2=round(rand()*(simp_num-1))+1;
	simp_rand3=round(rand()*(simp_num-1))+1;
	while(simp_rand2==simp_rand1)
		simp_rand2=round(rand()*(simp_num-1))+1;
	endwhile
	while((simp_rand2==simp_rand1)||(simp_rand3==simp_rand2))
		simp_rand3=round(rand()*(simp_num-1))+1;
	endwhile
	
	fprintf(id,"\\item Вычислить: \n")
		fprintf(id,"\\begin{equation*}%s\\end{equation*}\n",simple(simp_rand1,:));
		fprintf(id,"\\begin{equation*}%s\\end{equation*}\n",simple(simp_rand2,:));
		fprintf(id,"\\begin{equation*}%s\\end{equation*}\n",simple(simp_rand3,:));
	fprintf(id,"\n")
endfunction

function z2(id)
	iteg_z=["\\int \\sin(7x)"
	"\\int \\cos(x^2)"
	"\\int \\dfrac{x^4+1}{x^2}"];
	diff_z=[ "{\\dfrac{sin(5 x +3)}{x}}"
	"\\dfrac{7+x}{x^2}"
	"\\dfrac{3}{2}"
	];
	int_num=rows(iteg_z);
	diff_num=rows(diff_z);
	int_rand=round(rand()*(int_num-1))+1;
	diff_rand=round(rand()*(diff_num-1))+1;

	fprintf(id,"\\item Вычислить аналитически: \n ");
	fprintf(id,"\\begin{equation*} %s \\end{equation*}",iteg_z(int_rand,:));
	fprintf(id,"\\begin{equation*} %s \\end{equation*}",diff_z(diff_rand,:));
	fprintf(id,"\n");
endfunction

function z4(id)
	func1=["y(x)=x^2+4"
	"y(x)=\dfrac{x+4}{x^2+1}"
	"y(x)=x^3+4 \\sqrt(x)"
	"y(x)=x"
	"y(x)=\\sqrt(x)"];

	func2=["z(x)=10-x^2"
	"z(x)=\ln(x^2+1)"
	"z(x)=\\dfrac{x^3+10}{x^2+1}"];

	f1_num=rows(func1);
	f2_num=rows(func2);
	
	f1_rand=round(rand()*(f1_num-1))+1;
	f2_rand=round(rand()*(f2_num-1))+1;
	
	x1=floor(rand()*100-50)/10;
	x2=x1+floor(rand()*100)/2;

	y_cur=1;
	fprintf(id,"\\item Построить график функции %s в диапазоне от $x=%3.1f$ до $x=%3.1f$, определить, при каком значениии $x$ $y=%3.1f$. На этом же графике построить функцию $%s $. Определить координаты точки пересечения графиков. ",func1(f1_num),x1,x2,y_cur, func2(f2_num))

endfunction

function z5(id)
	if(rand()>0.8)
		matr=4;
	else
		matr=3;
	endif
	matr
	amat="\\begin{bmatrix}\n";
		for ii=1:matr
			for jj=1:matr
				amat=strcat(amat,num2str(floor(rand()*100)/10));
				if(jj!=matr)
					amat=strcat(amat," &");
				else
					amat=strcat(amat," \\\\\n");
				endif
			endfor
		endfor
	amat=strcat(amat,"\\end{bmatrix}\n");

	bmat="\\begin{bmatrix}\n";
		for ii=1:matr
			for jj=1:matr
				bmat=strcat(bmat,num2str(floor(rand()*100)/10));
				if(jj!=matr)
					bmat=strcat(bmat," &");
				else
					bmat=strcat(bmat," \\\\\n");
				endif
			endfor
		endfor
	bmat=strcat(bmat,"\\end{bmatrix}\n");
	rand_z=rand();
	if(rand_z<0.2)
		znak=" + ";
	elseif(rand_z<0.4)
		znak=" - ";
	elseif(rand_z<0.6)
		znak=" \\cdot ";
	else
		znak=" / ";
	endif
	fprintf(id,"\\item Определить сумму, произведение матриц $A=%s$ и $B=%s$. Вычислить $D_{i,j}=A_{i,j} %s B_{i,j}$ и определитель матрицы D\n",amat,bmat,"+")
endfunction

function z6(id)
	fprintf(id,"\\item Решить систему уравнений: \n")
endfunction


%main program
arg_list=argv();
if(length(arg_list)<2)
	%if((arg_list(1)==null)||(arg_list(2)==null))
		fprintf("Error. Usege: octave base.m group_number variant_number\n");
		break
	%endif
endif
file_id=fopen("base.tex","w");  
fprintf(file_id,"\\textsc{\\textbf{Лабораторная работа №1 }}\n\n",arg_list{1})

for ii=1:str2num(arg_list{2})
	fprintf(file_id,"\\textsc{\\textbf{Вариант %d}}\n\n",ii)
	fprintf(file_id,"\\begin{enumerate}\n");
	z1(file_id);
	z2(file_id);
	z4(file_id);
	z5(file_id);
	fprintf(file_id,"\\end{enumerate}\n");
endfor
fclose(file_id)
