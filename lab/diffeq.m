function out=z1(id)
	ode=["\\dfrac{dy}{dx}=x sin(x)";
	"\\dfrac{dy}{y}=\\dfrac{dx}{x-1}";
	"\\dfrac{dy}{1+y^2}=\\dfrac{dx}{\\sqrt{x}}";
	"dy=(x^2-1)dx";
	"(1+x^2)dy-2xydx=0";
	"\\dfrac{dx}{dy}=y^2 cos(x)";
	"\\sqrt{4-y^2}dx+y\\sqrt{9-x^2}dy=0";
	"xy\\dfrac{dy}{dx}=1-x^2";
	"(1+\\sqrt{x})dx=xydy";
	"\\dfrac{dy}{dx}=cos^2(x-y)";
	"\\dfrac{dy}{dx}=\\sqrt{2x+y+1}";
	 "\\dfrac{dy}{dx}+2y=0";
	"\\dfrac{dy}{dx}+2y=0";
	"x\\dfrac{dy}{dx}+y=0";
	"\\dfrac{dy}{dx}=\\dfrac{y-3x}{x+3y}";
	"x^2+y^2\\dfrac{dy}{dx}=1";
	"\\dfrac{dy}{dx}=\\dfrac{y}{x+y}";
	"\\dfrac{dy}{dx}=\\sqrt{\\dfrac{y}{x+y}}";
	"(x^2+y^2)\\dfrac{dy}{dx}=4x";
	"(x^2+y^2)\\dfrac{dy}{dx}=x+y";
	"(x^2+y^2)\\dfrac{dy}{dx}=sin(x+y)";
	"\\dfrac{dy}{dx}=\\sqrt{4x+2y-1}";
	"\\dfrac{dy}{dx}=y^{2/3}";
	"(x+2y)\\dfrac{dy}{dx}=1";
	"(x+2y)\\dfrac{dy}{dx}=\\sqrt{xy}";
	"(x+2y)\\dfrac{dy}{dx}=y^2";
	"\\dfrac{dy}{dx}=cos(x-y^2)";
	"\\dfrac{dy}{dx}=cos(x^2-y)";
	"\\dfrac{dy}{dx}-\\dfrac{4y}{x}=x\\sqrt{y}";
	"\\dfrac{dy}{dx}-2xy=2xy^3";
];
	eq_n=ceil(rand()*rows(ode));
	a=ceil(rand()*9);
	ya=ceil(rand()*5);
	b=a+1+ceil(rand()*9);
	fprintf(id,"\\item (1 балл) Решить численно дифференциальное уравнение $%s$ с начальными значениями $y(%6.0f)=%6.0f$ на интервале от $x=%6.0f$ до $x=%6.0f$. Построить график функции.",ode(eq_n,:),a,ya,a,b);
endfunction

function out=z2(id)
	eq_list1=["\\dfrac{dy}{dx}=\\sqrt{x-y+z}";
	"\\dfrac{dy}{dx}=\\sqrt{x+y+z}";
	"\\dfrac{dy}{dx}=\\dfrac{x+y}{1+z}";
	"\\dfrac{dy}{dx}=sin(x+y+z)";
	"\\dfrac{dy}{dx}=sin(x-y+z)";
	"\\dfrac{dy}{dx}=\\dfrac{x^2}{y}";
	"\\dfrac{dy}{dx}=\\dfrac{x^2}{\\sqrt{yz}}";
	"\\dfrac{dy}{dx}=x";
	"\\dfrac{dy}{dx}=y";
	"\\dfrac{dy}{dx}=z";
	"\\dfrac{dy}{dx}=x-2y";
	"\\dfrac{dy}{dx}=\\dfrac{y}{z}";
	"\\dfrac{dy}{dx}=\\dfrac{3+x}{x+3z}";
	"\\dfrac{dy}{dx}=z^{2/3}";
	];
	eq_list2=["\\dfrac{dz}{dx}=\\sqrt{x-y+z}";
	"\\dfrac{dz}{dx}=\\sqrt{x+y+z}";
	"\\dfrac{dz}{dx}=\\dfrac{x+y}{1+z}";
	"\\dfrac{dz}{dx}=sin(x+y+z)";
	"\\dfrac{dz}{dx}=sin(x-y+z)";
	"\\dfrac{dz}{dx}=\\dfrac{x^2}{y}";
	"\\dfrac{dz}{dx}=\\dfrac{x^2}{\\sqrt{yz}}";
	"\\dfrac{dz}{dx}=x";
	"\\dfrac{dz}{dx}=y";
	"\\dfrac{dz}{dx}=z";
	"\\dfrac{dz}{dx}=x-2y";
	"\\dfrac{dz}{dx}=\\dfrac{y}{z}";
	"\\dfrac{dz}{dx}=\\dfrac{3+x}{x+3z}";
	"\\dfrac{dz}{dx}=x^{1/3}";
	];
	eq_n1=ceil(rand()*rows(eq_list1));
	eq_n2=ceil(rand()*rows(eq_list2));
	while(eq_n1==eq_n2)
		eq_n2=ceil(rand()*rows(eq_list2));
	endwhile
	a=ceil(rand()*9);
	ya=(rand()*5);
	b=a+1+ceil(rand()*9);
	za=(rand()*5);
	fprintf(id,"\\item (1 балл) Решить численно систему дифференциальных уравнений:\n \\begin{equation*}\n");
		fprintf(id,"\\left\\\{\n");
		fprintf(id,"\\begin{gathered}\n")
		fprintf(id,"%s\\\\\n",eq_list1(eq_n1,:));
		fprintf(id,"%s\n",eq_list2(eq_n2,:));
		fprintf(id,"\\end{gathered}\n")
		fprintf(id,"\\right.\n")
	fprintf(id,"\\end{equation*}\n");
	fprintf(id,"на интервале от $x=%2.0f$ от $x=%2.0f$ с граничными условиями: $y(%2.0f)=%3.2f$, $z(%2.0f)=%3.2f$. Построить график функции. \n",a,b,a,ya,a,za);
endfunction

function out=fun_id(x,y,z,fid)
	switch (fid)
		case 1
			out.n="\\sqrt{x-y+z}";
			out.res=sqrt(x-y+z);
		case 2
			out.n="\\sqrt{x+y+z}";
			out.res=sqrt(x+y+z);
		case 3
			out.n="\\dfrac{x+y}{1+z}";
			out.res=(x+y)/(1+z);
		case 4
			out.n="sin(x+y+z)";
			out.res=sin(x+y+z);
		case 5
			out.n="sin(x-y+z)";
			out.res=sin(x-y+z);
		case 6
			out.n="\\dfrac{x^2}{y}";
			out.res=x^2/y;
		case 7
			out.n="\\dfrac{x^2}{\\sqrt{yz}}";
			out.res=x^2/y/z;
		case 8
			out.n="x";
			out.res=x;
		case 9
			out.n="y";
			out.res=y;
		case 10
			out.n="z";
			out.res=z;
		case 11
			out.n="x-2y";
			out.res=x-2*y;
		case 12
			out.n="\\dfrac{y}{z}";
			out.res=y/z;
		case 13
			out.n="\\dfrac{3+x}{x+3z}";
			out.res=(3+x)/(x+3*z);
		case 14
			out.n="x^{1/3}";
			out.res=x^(1/3);
	endswitch
	out.fnum=14;
endfunction

function out=eq_sys(x,f,varargin)
	fid1=varargin{1};
	fid2=varargin{2};
	out(1)=fun_id(x,f(1),f(2),fid1).res;
	out(2)=fun_id(x,f(1),f(2),fid2).res;
endfunction

function out=z3(id)
	
	neq1=ceil(rand()*fun_id(1,1,1,1).fnum);
	neq2=ceil(rand()*fun_id(1,1,1,1).fnum);
	
	while(neq1==neq2)
		neq2=ceil(rand()*fun_id(1,1,1,1).fnum);
	endwhile
	a=ceil(rand()*9);
	ya=(rand()*5);
	b=a+1+ceil(rand()*9);
	za=(rand()*5);
	
	fprintf(id,"\\item (1 балл) Решить численно систему дифференциальных уравнений:\n \\begin{equation*}\n");
		fprintf(id,"\\left\\\{\n");
		fprintf(id,"\\begin{gathered}\n")
		fprintf(id,"\\dfrac{dy}{dx}=%s\\\\\n",fun_id(1,1,1,neq1).n);
		fprintf(id,"\\dfrac{dz}{dx}=%s\n",fun_id(1,1,1,neq2).n);
		fprintf(id,"\\end{gathered}\n")
		fprintf(id,"\\right.\n")
	fprintf(id,"\\end{equation*}\n");
	odep=odeset("RelTol",1e-3,"AbsTol",1e-3,'InitialStep',0.001,'MaxStep',0.005);
	con=ode23(@eq_sys,[a b],[ya za],odep,neq1,neq2);
	fprintf(id,"на интервале от $x=%2.0f$ от $x=%2.0f$ с граничными условиями: $y(%2.0f)=%3.2f$, $z(%2.0f)=%3.2f$.  Построить график функции. \n",a,b,a,ya,b,con.y(length(con.x),2));
endfunction

function out=z4(id)
	nz=ceil(rand()*6);
	fprintf(id,"\\item (1 балл) ");
	if(nz==1)
		Vsos=10+rand()*20;
		ras=2+rand()*5;
		sol=0.3+rand()*0.4;
		vre=5+30*rand();
		fprintf(id," В сосуд, содержащий %2.3f л воды подают %2.2f раствор соли концентрацией %2.2f кг/л. Поступающий в сосуд раствор моментально равномерно перемешивается с водой (модель идеального смешения), и смесь вытекает с таким же расхдом. Составить дифференциальное уравнение изменения массы соли в сосуде. Построить график изменения массы соли во времени. Сколько соли будет в сосуде через %3.0f минут?\n\n",Vsos,ras,sol,vre);
	endif
	if(nz==2)
		Vsos=10+rand()*20;
		c=2+rand()*5;
		vre=5+30*rand();
		dras=0.1+rand()*0.2;
		fprintf(id," В сосуд, содержащий %2.3f л воды, открытием задвижки (в начальный момент задвижка закрыта) начинают подавать раствор соли концентрацией %2.2f кг/л. Расход воды равномерно увеличивается на %2.1f л/мин. Поступающий в сосуд раствор моментально равномерно перемешивается с водой, и смесь вытекает с той же скоростью. Составить дифференциальное уравнение изменения массы соли в сосуде. Построить график изменения массы соли во времени. Сколько соли будет в сосуде через %3.0f минут?\n\n",Vsos,c,dras,vre);
	endif
	if(nz==3)
		Vsos=30+rand()*20;
		ras=0.5+rand()*1;
		fprintf(id," Сосуд объемом %4.2f л содержит воздух (80 \\%% кислорода, 20 \\%% азота). В сосуд втекает %4.2f л азота в секунду, который моментально перемешивается, и вытекает такое же количество смеси. Записать дифференциальное уравнение изменения массы азота в сосуде. Построить график изменения концентрации азота по времени. Определить через какое время в сосуде будет 99 \\%% азота\n\n",Vsos,ras);
	endif
	if(nz==4)
		Vsos=100+rand()*200;
		sol=30+rand()*30;
		ras=0.5+rand()*1;
		minu=100+rand()*100;
		fprintf(id," В баке находится %4.1f л раствора, содержащего %4.2f кг соли. В бак непрерывно подается вода (расход воды %2.1f л/мин), которая перемешивается с имеющимся раствором. Смесь вытекает с тем же расходом. Записать дифференциальное уравнения изменения массы соли. Построить график зависимости концентрации соли от времени. Определить какое количество соли в баке останется через %4.0f минут?\n\n",Vsos,sol,ras,minu);
	endif
	if(nz==5)
		mass=5+rand()*5;
		S=0.5+rand()*3;
		to=20+rand()*10;
		cp=1400+1500*rand();
		t2=to+5+rand()*5;
		t1=t2+10+rand()*100;
		K=300+rand()*300;
		fprintf(id," Тело массой %2.1f кг и площадью поверхности %2.1f м$^2$ охлаждается в помещении с постоянной температурой воздуха %2.1f $^\\circ\\mathrm{C}$. Теплоемкость материала %4.1f $\\frac{Дж}{кг\ град}$. Записать уравнение описывающее изменение температуры тела во времени (при условии высокой теплопроводности материала тела). Определить за какое время температура тела опустится с %3.1f $^\\circ\\mathrm{C}$ до %3.1f $^\\circ\\mathrm{C}$ при постоянном коэффициенте теплопередачи равным %5.0f $\\frac{Вт}{м^2 град.}$ \n\n",mass,S,to,cp,t1,t2,K);
	endif
	if(nz==6)
		la1=20+rand()*100;
		la2=0.5+rand()*0.5;
		tol=5+10*rand();
		T1=500+rand()*300;
		q=200+rand()*300;
		fprintf(id," Записать дифференциальное уравнение распределения температуры вдоль стенки, материал которой имеет следующую зависимость теплопроводности от темепратуры: $\\lambda=%3.1f+%3.1fT$. Построить распределение темпарутры по толщине стенки толщиной %3.1f см при температуре стенки с одной стороны равной %4.0f K и тепловом потоке %3.1f Вт/м. Определить температуру с другой стороны стенки.\n\n ",la1,la2,tol,T1,q)
	endif
endfunction

function out=z5(id)
	nz=ceil(rand()*5);
	fprintf(id,"\\item (1 балл)");
	if(nz==1)
		V1=80+rand()*50;
		V2=80+rand()*50;
		sol=10+20*rand();
		ras=4+rand()*4;
		
		fprintf(id," В баке находится %4.0f л раствора, содержащего %2.1f кг соли. В бак втекает %2.1f л воды в минуту, моментально перемешивается во всем объеме бака а избыток воды переливается в другой %3.1f литровый бак, первоначально заполненный чистой водой. Избыток жидкости из него выливается. Записать систему дифференциальных уравнений, описывающих изменение массы соли в баках, построить зависимости изменения массы соли в баках. Определить когда во втором баке будет максимальная масса соли.\n\n ",V1,sol,ras,V2)
	endif
	if(nz==2)
		a=20+rand()*40;
		b=20+rand()*40;
		h=30+100*rand();
		ras=1+2*rand();
		S=1+3*rand();
		
		fprintf(id," В прямоугольный бак сечением %3.1f см x %3.1f и высотой %3.1f см поступает %3.1f л в секунду. На дне имеется отверстие площадью %3.1fсм. За какое время наполнится бак? Записать  дифференциальное уравнение изменения уровня жидкости (или объема воды в баке) от времени, построить график. Сравнить результат с временем заполнения этого бака без отверстия.\n\n ",a,b,h,ras,S)
	endif
	if(nz==3)
		r=15+rand()*10;
		h=20+rand()*40;
		d=0.5+0.8*rand();
		fprintf(id," Воронка имеет форму конуса радиуом R= %3.1f см и высотой H=%3.1f см, обращенного вершиной вниз. За какое время вытечет вся вода из конуса через круглое отверстие диаметра %2.1f см, сделанное в вершине конуса. Записать дифференциальное уравнения изменения уровня жидкости (или объема) от времени и построить графики.\n\n",r,h,d)
	endif
	if(nz==4)
		m=2+5*rand();
		S=0.5+3*rand();
		dt=2+5*rand();
		ro=2000+4000*(rand());
		cp=600+500*rand();
		K=400+rand()*400;
		te=500+rand()*300;
		fprintf(id," При комнатной температуре 20$^\\circ\\mathrm{C}$ в печь поместили заготовку массой %3.1f кг и поверхностью %3.1f м$^2$, после включения температура воздуха в печи равномерно увеличивалась на %2.1f градуса в минуту. Плотность материала заготовки --- %4.1f $кг/м^\\mathrm{3}$, теплоемкость --- %4.1f $\\frac{Дж}{кг\\cdot град}$. Коэффициент теплопередачи между воздухом и металлом равен %5.0f $\\frac{Вт}{м^2 град.}$. Определить через какое время металл нагреется до температуры %5.0f градусов",m,S,dt,ro,cp,K,te)
	endif
	if(nz==5)
		D=5+rand()*50;
		V=50+rand()*100;
		ros=1500+5000*rand();
		cps=1000+1000*rand();
		K=300+rand()*300;
		Tv=20+rand()*20;
		Ts=Tv+20+rand()*60;
		fprintf(id," Сфера диаметром %3.1f см, имеющая температуру %3.1f $^\\circ\\mathrm{C}$, для охлаждения была опущена в сосуд объемом %4.0f л, заполненный водой, имеющей температуру %3.1f $^\\circ\\mathrm{C}$ . Плотность материала сферы --- %4.1f кг/м$^\\mathrm{3}$, теплоемкость --- %4.1f $\\frac{Дж}{кг\\cdot град}$, плотность воды равна 1000 кг/м$^\\mathrm{3}$, теплоемкость воды --- 4200 $\\frac{Дж}{кг\\cdot град}$, коэффициент теплоотдачи равен %5.0f $\\frac{Вт}{м^2 град.}$. Записать систему дифференциальных уравнений изменения температуры воды и сферы при условии отсутствия теплообмена с окружающей средой. Построить график зависимости температуры воды и сферы от времени. Определить время, при котором разница между температурой воды и сферы равна 5 $^\\circ\\mathrm{C}$. \n\n",D,Ts,V,Tv,ros,cps,K);
	endif
endfunction

#main programm
pkg load all
Gnum=1
var_num=20
file_id=fopen("diffeq.tex","w");
fprintf(file_id,"\\textsc{\\textbf{Лабораторная работа №3}}\n\n",Gnum)
for ii=1:var_num
	fprintf(file_id,"\\textsc{\\textbf{Вариант %d}}\n",ii)
	fprintf(file_id,"\\begin{enumerate}\n");
	z1(file_id);
	z2(file_id);
	z3(file_id);
	z4(file_id);
	%z4(file_id);
	fprintf(file_id,"\\end{enumerate}\n");
	#fprintf(file_id,"\\newpage\n")
	printf("generated %d \n",ii)
endfor
fclose(file_id);
