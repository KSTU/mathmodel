%
printf("generate lab #4")

function out=z1(id)
	fun_list=["\\sum\\limits_{n=1}^{N} \\dfrac{n}{n+1}"
		"\\sum\\limits_{n=1}^{N} \\dfrac{n}{(n+1)^2}"
		"\\sum\\limits_{n=1}^{N} \\dfrac{n}{\ln(n)}"
		"\\sum\\limits_{n=0}^{N} \\dfrac{n+3}{n+9}"
		"\\sum\\limits_{n=1}^{N} \\dfrac{\\ln(n)}{n^2}"
		"\\sum\\limits_{n=1}^{N} n \\cdot sin(n)"
		"\\sum\\limits_{n=1}^{N} n^{2-n}"
		"\\sum\\limits_{n=1}^{N} n+\\dfrac{n}{4+n}"
		"\\sum\\limits_{n=1}^{N} n-\\sin(n)"
		"\\sum\\limits_{n=1}^{N} {\\sin(n)}^2"
		"\\sum\\limits_{n=1}^{N} {n}^{0.3}"
		"\\sum\\limits_{n=1}^{N} {n}^{0.9}"
		"\\sum\\limits_{n=1}^{N} \\dfrac{\\ln(n)}{\\ln(n+1)}"
		"\\sum\\limits_{n=1}^{N} \\dfrac{\\ln(n)}{\\ln(n^2)}"
		"\\sum\\limits_{n=1}^{N} \\dfrac{\\ln(n+1)}{\\ln(n)}"
		"\\sum\\limits_{n=1}^{N} \\dfrac{\\ln(n^2)}{n^2}"
		"\\sum\\limits_{n=1}^{N} \\dfrac{\\ln(n)+e^{-n}}{e^{-n}}"
		"\\sum\\limits_{n=1}^{N} \\dfrac{e^(-n)}{e^{1-n}}"
		"\\sum\\limits_{n=1}^{N} {e^{-n}}"
		"\\sum\\limits_{n=1}^{N} {\\dfrac{1}{n} e^{-n}}"
		"\\sum\\limits_{n=1}^{N} {\\dfrac{1}{n} }"
		"\\sum\\limits_{n=1}^{N} {\\dfrac{1}{n} +sin(n)}"
		"\\sum\\limits_{n=1}^{N} {\\dfrac{1}{n} -\\dfrac{1}{n^2}}"
		"\\sum\\limits_{n=1}^{N} {n -\\dfrac{1}{n}}"
		"\\sum\\limits_{n=1}^{N} {n (n-1)}"
		"\\sum\\limits_{n=1}^{N} {n (n+1)}"
		"\\sum\\limits_{n=1}^{N} {n \\sin(n)}"
		"\\sum\\limits_{n=1}^{N} \\dfrac{\\sin(n)+1}{\\cos(n)+1}"
];
	f_n=ceil(rand()*rows(fun_list));
	N=ceil(rand()*6)+3;
	fprintf(id,"\\item  Создать программу, возвращающую значение $%s$, если N=%d. \n",fun_list(f_n,:),N);
endfunction

function out=z2(id)
	fun_list=["\\dfrac{n}{n+1}"
		"\\dfrac{n}{(n+1)^2}"
		"\\dfrac{n}{\ln(n)}"
		" \\dfrac{n+3}{n+9}"
		" \\dfrac{\\ln(n)}{n^2}"
		" n \\cdot sin(n)"
		"n^{2-n}"
		"n+\\dfrac{n}{4+n}"
		"n-\\sin(n)"
		"{\\sin(n)}^2"
		"{n}^{0.3}"
		"{n}^{0.9}"
		"\\dfrac{\\ln(n)}{\\ln(n+1)}"
		"\\dfrac{\\ln(n)}{\\ln(n^2)}"
		"\\dfrac{\\ln(n+1)}{\\ln(n)}"
		"\\dfrac{\\ln(n^2)}{n^2}"
		"\\dfrac{\\ln(n)+e^{-n}}{e^{-n}}"
		"\\dfrac{e^(-n)}{e^{1-n}}"
		"{e^{-n}}"
		"{\\dfrac{1}{n} e^{-n}}"
		"{\\dfrac{1}{n} }"
		"{\\dfrac{1}{n} +sin(n)}"
		"{\\dfrac{1}{n} -\\dfrac{1}{n^2}}"
		"{n -\\dfrac{1}{n}}"
		"{n (n-1)}"
		"{n (n+1)}"
		"{n \\sin(n)}"
		"\\dfrac{\\sin(n)+1}{\\cos(n)+1}"
];
	bound_list=["n-3<"
	"n+4<"
	"n/3<"
	"n^2<"
	"n^{1.5}<"
	"n<"
	"n^{2.5}<"
	"e^{n-2}<"
	"n-4<"
	"0.3n<"
	"0.3n+4<"
	];
	f_n=ceil(rand()*rows(fun_list));
	b_n=ceil(rand()*rows(bound_list));
	N=rand()*100+10;
	fprintf(id,"\\item  Создать программу, возвращающую значение $\\sum\\limits_{%s %3.0f} %s$. \n",bound_list(b_n,:),N,fun_list(f_n,:));
endfunction

function out=z3(id)
	fun_list=["D_{i,j}=\\begin{cases} A_{i,j}, & \\text{если } A_{i,j}<0 \\\\ -A_{i,j}, & \\text{если } A_{i,j}>0 \\end{cases}"
	"D_{i,j}=\\begin{cases} A_{1,1}, & \\text{если } A_{i,j}<A_{1,1} \\\\ A_{i,j}, & \\text{если } A_{i,j}>A_{1,1} \\end{cases}"
	"D_{i,j}=\\begin{cases} \\sin(A_{i,j}), & \\text{если } A_{i,j}<\\pi \\\\ \\cos(A_{i,j}), & \\text{если } A_{i,j}>\\pi \\end{cases}"
	"D_{i,j}=\\begin{cases} A_{i,j}^2, & \\text{если } \\sqrt{A_{i,j}}<5 \\\\ \\sqrt{A_{i,j}}, & \\text{если } \\sqrt{A_{i,j}}>5 \\end{cases}"
	"D_{i,j}=\\begin{cases} 5 A_{i,j}, & \\text{если } \\sqrt{A_{i,j}}<7 \\\\ \\sqrt{ 6 A_{i,j}}, & \\text{если } \\sqrt{A_{i,j}}>7 \\end{cases}"
	"D_{i,j}=\\begin{cases} A_{i,j}+4, & \\text{если } {A_{i,j}}<\\sin(A_{i,j}) \\\\  A_{i,j}-1, & \\text{если } {A_{i,j}}>\\sin(A_{i,j}) \\end{cases}"
	"D_{i,j}=\\begin{cases} A_{i,j}+A_{i,j}^{i+j}, & \\text{если } {A_{i,j}}<0 \\\\  A_{i,j}^{i+j+2}, & \\text{если } {A_{i,j}}>0 \\end{cases}"
	"D_{i,j}=\\begin{cases} A_{i,j}^{i-j}, & \\text{если } {A_{i,j}}<0 \\\\  A_{i,j}^{i+-j+1}, & \\text{если } {A_{i,j}}>0 \\end{cases}"
	"D_{i,j}=\\begin{cases} A_{i,j}^{i-j}, & \\text{если } {A_{i,j}}<0 \\\\  A_{i,j}^{i+-j+1}, & \\text{если } {A_{i,j}}>0 \\end{cases}"
	"D_{i,j}=\\begin{cases} i+j, & \\text{если } {A_{i,j}}<i+j \\\\  A_{i,j}+j, & \\text{если } {A_{i,j}}>i+j \\end{cases}"
	"D_{i,j}=\\begin{cases} i-j, & \\text{если } {A_{i,j}}<i+j \\\\  A_{i,j}^j, & \\text{если } {A_{i,j}}>i+j \\end{cases}"
	"D_{i,j}=\\begin{cases} A_{i,j}+\\cos(i)+\\cos(j), & \\text{если } {A_{i,j}}<i \\\\  A_{i,j}+\\sin(i)+\\sin(j), & \\text{если } {A_{i,j}}>i \\end{cases}"
	"D_{i,j}=\\begin{cases} A_{i,j}+i, & \\text{если } {A_{i,j}}<i \\\\  A_{i,j}-j, & \\text{если } {A_{i,j}}>i \\end{cases}"
	"D_{i,j}=\\begin{cases} A_{i,j}, & \\text{если } {A_{i,j}}<i \\\\  -A_{i,j}, & \\text{если } {A_{i,j}}>i \\end{cases}"
	"D_{i,j}=\\begin{cases} A_{i,j}+\\cos(i)+\\cos(j), & \\text{если } {A_{i,j}}<i \\\\  A_{i,j}+\\sin(i)+\\sin(j), & \\text{если } {A_{i,j}}>i \\end{cases}"
];
	f_n=ceil(rand()*rows(fun_list));
	fprintf(id,"\\item Создать функцию, аргументом которой является массив $A$ произвольной размерностью, возвращающую значение $%s$ \n",fun_list(f_n,:));
endfunction

function out=z4(id)
	t1=3+rand()*10;
	v1=30+rand()*100;
	t2=20+rand()*60;
	t3=1+rand()*4;
	
	fprintf(id,"\\item Машина трогается с места и за %4.1f минуты разгоняется с постоянным ускорением до %3.1f ${\\frac{км}{ч}}$, далее машина %4.0f минут едет с постоянной скоростью, после чего начинает торможение с постоянным ускорением и через %3.0f минут останавливается. Построить график изменения скорости от времени. Решить дифференциальное уравнение для изменения координаты маашины во времения и определить путь пройденный машиной. ",t1,v1,t2,t3);
endfunction

function out=z5(id)
	fun_list=["Реализовать алгоритм перемножения двух матриц, сравнить результат работы программы со встроенной функцией перемножения матриц. "
	"Составить программу определения количества отрицательных чисел в произвольной матрице. "
	"Составить программу определения количества четных чисел в произвольной матрице. "
	"Составить программу определения суммы положительных чисел всех элементов матрицы. "
	"Составить программу сравнивающую сумму элементов двух матриц, и возвращающую матрицу с большей суммой элементов."
	"Составить программу определения произведения элементов матрицы больших 1."
	"Составить программу, аргументом которой является произвольная матрица, и возвращающую массив, содержащий количество элементов больших 1 и количество элментов больше 5."
];
	f_n=ceil(rand()*rows(fun_list));
	fprintf(id," \\item %s",fun_list(f_n,:));
endfunction

#main programm
#pkg load all
arg_list=argv();
if(length(arg_list)<2)
	%if((arg_list(1)==null)||(arg_list(2)==null))
		fprintf("Error. Usege: octave regression.m group_number variant_number\n");
		break
	%endif
endif

cd results

file_id=fopen("prog.tex","w");
fprintf(file_id,"\\section {Лабораторная работа №~4 <<Основы программирования>>}\n\n \\addtocounter{nlab}{1}")
for ii=1:str2num(arg_list{2})
	fprintf(file_id,"\\textsc{\\textbf{Вариант %d}}\n",ii)
	fprintf(file_id,"\\begin{enumerate}\n");
	z1(file_id);
	z2(file_id);
	z3(file_id);
	z4(file_id);
	z5(file_id);
#	z6(file_id);
	fprintf(file_id,"\n\n\\end{enumerate}\n");
	#fprintf(file_id,"\\newpage\n")
	printf("generated %d \n",ii)
endfor
fclose(file_id);

file_id=fopen("filelist.tex","a")
fprintf(file_id,"\n\\input{prog.tex}")
fclose(file_id)

file_id=fopen("number.tex","w")
fprintf(file_id,"%s",arg_list{1})
fclose(file_id)
