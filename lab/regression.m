%
function z1(id)
	fprintf(id,"\\item ");
	fun_list=["y(x)=a e^{b x}+c"; "y(x)=a \\cdot x^b+c"];

	ai=["a_0","a_1"];
	fun2_list=["x"; "x^{3.7}"; "\\dfrac{1}{x}"; "x^{1.2}"; "x^{0.3}"; "\\dfrac{x}{1+x}"; "\\dfrac{x^{2.4}}{1+x^2}"; "\\sqrt{x}"];
	fun3_list=["y(x)=A \\cdot e^{-\\dfrac{B}{x}+C}"; "y(x)=\\dfrac{B+x^C}{A+x}"; "y(x)=B+10^{A+Cx}"; "y(x)=\\dfrac{A x^2 + B x +C}{\\sqrt{x} +D}"];
	A=normrnd(0.2,5);
	B=normrnd(1,5);
	C=normrnd(2,5);
	D=normrnd(4,5);
	
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
	fun2_num=8-0.0001;
	temp1=ceil(rand()*fun2_num);
	temp2=ceil(rand()*fun2_num);
	temp3=ceil(rand()*fun2_num);
	while(temp1==temp2)
		temp2=ceil(rand()*fun2_num);
	endwhile
	while((temp1==temp3)&&(temp2==temp3))
		temp3=ceil(rand()*fun2_num);
	endwhile
	fprintf(id,"\\item $y(x)=a_0 %s+a_1 %s +a_2 %s$",fun2_list(temp1,:),fun2_list(temp2,:),fun2_list(temp3,:));
	fun3_num=3;
	temp1=ceil(rand()*fun3_num);
	fprintf(id,"\\item $%s$",fun3_list(temp1,:));
	
	fprintf(id,"\\end{itemize}\n")
	xmin=ceil(rand()*100)/10
	xdel=ceil(rand()*100)/10

	#таблица исходных данных
	fprintf(id,"\\begin{table}[h]\n");
	fprintf(id,"\\begin{tabular}{|c|c|}\n\\hline\n");
	fprintf(id,"x & y \\\\ \\hline\n")
	
	func_num=3;
	func_cur= ceil(rand()*func_num)
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
				cur_y(ii)=(A*cur_x(ii)^2+B*cur_x(ii)+C)/(sqrt(cur_x(ii))+D/10)
			endif
			
		endfor
		E=max(cur_y)+rand()*100;
		if(max(abs(cur_y))>10000)
			koef=10000/max(abs(cur_y))*normrnd(1,0.1)
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

function z4(id)
	temp=readdir(pwd);
	file_num=numel(temp)-2;
	for ii=1:file_num
		file_list{ii}=temp{ii+2};
	endfor
	cur_num=ceil(rand()*file_num);
	file_id=fopen(file_list{cur_num},"r");
	file_str=getnst(file_list{cur_num});
	prop_name1=fscanf(file_id,"%s",1);
	prop_name2=fscanf(file_id,"%s",1);
	sub_name1=fscanf(file_id,"%s",1);
	sub_name2=fscanf(file_id,"%s",1);
	p_unit=fscanf(file_id,"%s",1) %fgetl(file_id);
	c_unit=fscanf(file_id,"%s",1)

	printf("%s %s",p_unit,c_unit)

	fclose(file_id);
	%%%
	file_id=fopen("tetssdf","w");
	fprintf(file_id,"вл опрывлаои ваи ывммчс\nss hfkjdhf sdf hsdljf ")
	fclose(file_id);
	
endfunction

%main program
pkg load all
arg_list=argv();
if(length(arg_list)<2)
	%if((arg_list(1)==null)||(arg_list(2)==null))
		fprintf("Error. Usege: octave regression.m group_number variant_number\n");
		break
	%endif
endif
file_id=fopen("regression.tex","w");
fprintf(file_id,"\\textsc{\\textbf{Лабораторная работа <<Регрессионный анализ, методы аппроксимации>>}}\n\n")
for ii=1:arg_list{2}
	fprintf(file_id,"\\textsc{\\textbf{Вариант %d}}\n",ii)
	fprintf(file_id,"\\begin{enumerate}\n");
	z1(file_id)
	z2(file_id)
	z3(file_id)
#	z4(file_id)
	fprintf(file_id,"\\end{enumerate}\n");
	fprintf(file_id,"\\newpage\n")
endfor
fclose(file_id);

