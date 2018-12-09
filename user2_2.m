function varargout = user2_2(varargin)
% USER2_2 M-file for user2_2.fig
%      USER2_2, by itself, creates a new USER2_2 or raises the existing
%      singleton*.
%
%      H = USER2_2 returns the handle to a new USER2_2 or the handle to
%      the existing singleton*.
%
%      USER2_2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in USER2_2.M with the given input arguments.
%
%      USER2_2('Property','Value',...) creates a new USER2_2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before user2_2_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to user2_2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Copyright 2002-2003 The MathWorks, Inc.

% Edit the above text to modify the response to help user2_2

% Last Modified by GUIDE v2.5 09-Sep-2016 09:13:53

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @user2_2_OpeningFcn, ...
                   'gui_OutputFcn',  @user2_2_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before user2_2 is made visible.
function user2_2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to user2_2 (see VARARGIN)

% Choose default command line output for user2_2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes user2_2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = user2_2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function CSDR_Callback(hObject, eventdata, handles)
% hObject    handle to CSDR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global B_ind;global l_ind;global P_ind;global n;global u;global s;global c;global r;global t;global XO_ind;global LO_ind;
s = sprintf('please choose matrix B');
msgbox(s,'please choose matrix B','help');pause(2);
[filename,pathname]=uigetfile({'*.txt'},'choose B');
str=[pathname, filename];
B_ind=load(str);%%choose a B_IND FROM a sure file

s = sprintf('please choose-l');

msgbox(s,'please choose matrix l','help');pause(2); 
[filename,pathname]=uigetfile({'*.txt'},'choose l');
str=[pathname, filename];
l_ind=load(str);

s = sprintf('please choose matrix P');

msgbox(s,'please choose P','help');
pause(2); 
[filename,pathname]=uigetfile({'*.txt'},'choose P');
str=[pathname, filename];
P_ind=load(str);

s = sprintf('please choose matrix XO');

msgbox(s,'please choose X0','help');
pause(2); 
[filename,pathname]=uigetfile({'*.txt'},'choose xo');
str=[pathname, filename];
XO_ind=load(str);

s = sprintf('please choose matrix LO');

msgbox(s,'please choose LO','help');
pause(2); 
[filename,pathname]=uigetfile({'*.txt'},'choose matrix lo');
str=[pathname, filename];
LO_ind=load(str);

n = inputdlg('choose n');
n= str2double(n);
t = inputdlg('choose t');
t= str2double(t);
r=n-t;

set(handles.edit1,'string','data is inputed')


% --------------------------------------------------------------------
function YJPC_Callback(hObject, eventdata, handles)
% hObject    handle to YJPC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global B_ind,global P_ind,global l_ind,global x_ind,global BT_ind,global NBB_ind,global W_ind,global v_ind,global Sigma0_ind,global vt_ind,global QXadjXadj_ind,global Q_ind,global QLL_ind,global QLadjLadj_ind,global QVV_ind,global LO_ind,global Ladj_ind,global DXadjXadj_ind,global DLadjLadj_ind,global XO_ind,global Xadj_ind;global n;global t;global r;global s;global u;global c;global finalres_indname;global finalres_indvalue;global finaldisp_ind;

BT_ind=B_ind';
W_ind=BT_ind*P_ind*l_ind;
NBB_ind=BT_ind*P_ind*B_ind;
x_ind=inv(NBB_ind)*W_ind;
x_ind
str1=num2str(x_ind);
%str='x_ind=';
%set(handles.text1,'string',str)
%set(handles.text3,'string',x_ind)

v_ind=B_ind*x_ind-l_ind;
disp('v=');
disp(v_ind);
str2=num2str(v_ind);
%str='v=';
%set(handles.text1,'string',str)
%set(handles.text3,'string',v_ind)

Xadj_ind=(XO_ind*1000+x_ind)./1000;
disp('Xadj is');
disp(Xadj_ind);
str3=num2str(Xadj_ind);
%str='Xadj=';
%set(handles.text1,'string',str)
%set(handles.text3,'string',Xadj_ind)

Ladj_ind=(LO_ind*1000+v_ind)./1000;
disp('Ladj is');
disp(Ladj_ind);
str4=num2str(Ladj_ind);
%str='Ladj=';
%set(handles.text1,'string',str)
%set(handles.text3,'string',Ladj_ind)

r=n-t;
vt_ind=v_ind';
Sigma0_ind=sqrt((vt_ind*P_ind*v_ind)*inv(r));
Sigma0_ind
str5=num2str(Sigma0_ind);
%str='Sigma0_ind=';
%set(handles.text1,'string',str)
%set(handles.text3,'string',Sigma0_ind)

Q_ind=inv(P_ind);
QLL_ind=Q_ind;
QLL_ind
str6=num2str(Q_ind);
%str='QLL_ind=';
%set(handles.text1,'string',str)
%set(handles.text3,'string',QLL_ind)

BT_ind=B_ind';
NBB_ind=BT_ind*P_ind*B_ind;
QXadjXadj_ind=inv(NBB_ind);
QXadjXadj_ind
str7=num2str(BT_ind);
%str='QXadjXadj_ind=';
%set(handles.text1,'string',str)
%set(handles.text3,'string',QXadjXadj_ind)

NBB_ind=BT_ind*P_ind*B_ind;
Q_ind=inv(P_ind);
QLL_ind=Q_ind;
QVV_ind=Q_ind-B_ind*inv(NBB_ind)*BT_ind;
QVV_ind
str8=num2str(QVV_ind);
%str='QVV_ind=';
%set(handles.text1,'string',str)
%set(handles.text3,'string',QVV_ind)

NBB_ind=BT_ind*P_ind*B_ind;
Q_ind=inv(P_ind);
QLadjLadj_ind=B_ind*inv(NBB_ind)*BT_ind;
QLadjLadj_ind
str9=num2str(QLadjLadj_ind);
%str='QLadjLadj_ind=';
%set(handles.text1,'string',str)
%set(handles.text3,'string',QLadjLadj_ind)

DXadjXadj_ind=QXadjXadj_ind.*Sigma0_ind.*Sigma0_ind;
DXadjXadj_ind
str10=num2str(DXadjXadj_ind);
%str='DXadjXadj_ind=';                                   
%set(handles.text1,'string',str)
%set(handles.text3,'string',DXadjXadj_ind)

DLadjLadj_ind=QLadjLadj_ind*Sigma0_ind*Sigma0_ind;
DLadjLadj_ind
str11=num2str(DLadjLadj_ind);
%str='DLadjLadj_ind=';
%set(handles.text1,'string',str)
%set(handles.text3,'string',DLadjLadj_ind)


%%calculate all the result and turn it into string;

str={'x=',str1,'v=',str2,'Xadj=',str3,'Ladj=',str4,'Sigma0=',str5,'QLL=',str6};msgbox(str);

str={'QXadjXadj=',str7,'QVV=',str8,'QLadjLadj=',str9,'DXadjXadj=',str10,'DLadjLadj=',str11};msgbox(str);
finalres_indname={'x_ind=       ';'v_ind=       ';'Xadj_ind=    ';'Ladj_ind=    ';'Sigma0_ind=  ';'QLL_ind=     ';'QXadjXadj_ind';'QVV_ind=     ';'QLadjLadj_ind';'DXadjXadj_ind';'DLadjLadj_ind'};%mei yi lie bi xu xiang tong cai neng xing cheng ju zhen
finalres_indvalue={x_ind;v_ind;Xadj_ind;Ladj_ind;Sigma0_ind;QLL_ind;QXadjXadj_ind;QVV_ind;QLadjLadj_ind;DXadjXadj_ind;DLadjLadj_ind};
finaldisp_ind={finalres_indname(1);finalres_indvalue(1);finalres_indname(2);finalres_indvalue(2);finalres_indname(3);finalres_indvalue(3)}

set(handles.edit1,'string','indirect adjustment is finished')
% --------------------------------------------------------------------
function print_Callback(hObject, eventdata, handles)
% hObject    handle to print (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global tem1;global B_ind,global P_ind,global l_ind,global x_ind,global BT_ind,global NBB_ind,global W_ind,global v_ind,global Sigma0_ind,global vt_ind,global QXadjXadj_ind,global Q_ind,global QLL_ind,global QLadjLadj_ind,global QVV_ind,global LO_ind,global Ladj_ind,global DXadjXadj_ind,global DLadjLadj_ind,global XO_ind,global Xadj_ind;global n;global t;global r;global s;global u;global c;global finalres_indname;global finalres_indvalue;global finaldisp_ind;
%excel = actxserver('excel.application');  % ━excel━
%set(excel,'visible',2);                   % excel━━excel                                         % ━━
%workbooks = excel.workbooks;              % ：′′━━
%workbook = invoke(workbooks,'add');       % ━′′
%sheets = excel.activeworkbook.sheets;     % ′′━━′′━：sheets
%sheet = get(sheets,'item',1);             % ━━━
%invoke(sheet,'activate');                 % ′′━
%activesheet = excel.activesheet;          % ━━
%activesheetrange = get(activesheet,'range','a1:a170');  % ━━：：′
%set(activesheetrange,'value',finalres);         % 
%invoke(workbook,'saveas','res.xls');        % %[filename,pathname]=uigetfile({'*.txt'},'');
%str=[pathname, filename];        

 Excel=actxserver('Excel.Application');
Workbook=Excel.Workbooks.Add;
Workbook.SaveAs('C:\Users\asus\Desktop\test10.xlsx')
Workbook.Close;
%Create a excel

xlswrite('C:\Users\asus\Desktop\test10.xlsx', finalres_indname(1),'NewTemp','A1'); 
tmp1=cell2mat(finalres_indvalue(1));                 %%jiang cell lei xing zhuanhuancheng mat
xlswrite('C:\Users\asus\Desktop\test10.xlsx', tmp1,'NewTemp','A2');%%chuang jian yi ge xin de biao lai xie ru

xlswrite('C:\Users\asus\Desktop\test10.xlsx', finalres_indname(2),'NewTemp2','A1'); 
tmp2=cell2mat(finalres_indvalue(2));
xlswrite('C:\Users\asus\Desktop\test10.xlsx', tmp2,'NewTemp2','A2');

xlswrite('C:\Users\asus\Desktop\test10.xlsx', finalres_indname(3),'NewTemp3','A1'); 
tmp3=cell2mat(finalres_indvalue(3));
xlswrite('C:\Users\asus\Desktop\test10.xlsx', tmp3,'NewTemp3','A2');

xlswrite('C:\Users\asus\Desktop\test10.xlsx', finalres_indname(4),'NewTemp4','A1'); 
tmp4=cell2mat(finalres_indvalue(4));
xlswrite('C:\Users\asus\Desktop\test10.xlsx', tmp4,'NewTemp4','A2');

xlswrite('C:\Users\asus\Desktop\test10.xlsx', finalres_indname(5),'NewTemp5','A1'); 
tmp5=cell2mat(finalres_indvalue(5));
xlswrite('C:\Users\asus\Desktop\test10.xlsx', tmp5,'NewTemp5','A2');

xlswrite('C:\Users\asus\Desktop\test10.xlsx', finalres_indname(6),'NewTemp6','A1'); 
tmp6=cell2mat(finalres_indvalue(6));
xlswrite('C:\Users\asus\Desktop\test10.xlsx', tmp6,'NewTemp6','A2');

xlswrite('C:\Users\asus\Desktop\test10.xlsx', finalres_indname(2),'NewTemp7','A1'); 
tmp7=cell2mat(finalres_indvalue(7));
xlswrite('C:\Users\asus\Desktop\test10.xlsx', tmp7,'NewTemp7','A2');

xlswrite('C:\Users\asus\Desktop\test10.xlsx', finalres_indname(8),'NewTemp8','A1'); 
tmp8=cell2mat(finalres_indvalue(8));
xlswrite('C:\Users\asus\Desktop\test10.xlsx', tmp8,'NewTemp8','A2');

xlswrite('C:\Users\asus\Desktop\test10.xlsx', finalres_indname(9),'NewTemp9','A1'); 
tmp9=cell2mat(finalres_indvalue(9));
xlswrite('C:\Users\asus\Desktop\test10.xlsx', tmp9,'NewTemp9','A2');

xlswrite('C:\Users\asus\Desktop\test10.xlsx', finalres_indname(10),'NewTemp10','A1'); 
tmp10=cell2mat(finalres_indvalue(10));
xlswrite('C:\Users\asus\Desktop\test10.xlsx', tmp10,'NewTemp10','A2');

xlswrite('C:\Users\asus\Desktop\test10.xlsx', finalres_indname(11),'NewTemp11','A1'); 
tmp11=cell2mat(finalres_indvalue(11));
xlswrite('C:\Users\asus\Desktop\test10.xlsx', tmp11,'NewTemp11','A2');
%above work is to convey the result to Excel

%chracters=['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'];                  %━′
%hang=1;
%for k=1:11%yi gong you shi yi ge jie guo
%    tmp1=cell2mat(finalres_indname(k));
 % tmp2=cell2mat(finalres_indvalue(k));
%  [m1,n1] = size(tmp1);%DE DAO MU BIAO JU ZHEN DE GUI MO
%%  [m2,n2] = size(tmp2);
%  str1={chracters(1),hang};
%  str2={chracters(n1),hang+m1};
%  hang=hang+m1+1;
%  str3={chracters(1),hang};
%  str4={chracters(n2),hang+m2};
%h = waitbar(1,'Please wait...');
%for i=1:10000, % computation here %
%waitbar(i/10000)
%end


winopen('C:\Users\asus\Desktop\test10.xlsx');

set(handles.edit1,'string','Finish save as excel')




% --------------------------------------------------------------------
function Untitled_3_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function YJPC2_Callback(hObject, eventdata, handles)
% hObject    handle to YJPC2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%：：S
global ed dd sd dd1 pn x0 y0 m1 m2 m3 ms pp e d sid md g f aa bb cc rt rr tt ql w
global pathname net_name s_datafile b_datafile filename;
x0=[];y0=[];e=[];d=[];sid=[];g=[];f=[];pn=[];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if(isempty(pathname)|isempty(net_name))
     [filename,pathname]=uigetfile('*.txt','Input filename');
     i=find('.'==filename);
     net_name=filename(1:i-1);
end

 fit1=fopen(strcat(pathname,filename),'rt');
if(fit1==-1)
    msgbox('Input File or Path is not correct','Warning','warn');
    return;
end                                                       %open afile to read
b_datafile='out.txt'
fit2=fopen(strcat(pathname,net_name,b_datafile),'wt');
if(fit1==-1)
    msgbox('Input File or Path is not correct','Warning','warn');
    return;
end     
 
 
[a]=fscanf(fit1,'%d',2);
ed=a(1);dd=a(2); 
sd=ed+dd;
fprintf(fit2,'%5d\n',ed,dd,dd1);
fprintf(fit2,'\n');

[pn]=fscanf(fit1,'%d',sd);
pn1=pn;
[pn1,i2]=chkdat(sd,pn,pn1);
fprintf(fit2,'%5d %5d %5d %5d %5d %5d %5d %5d %5d %5d %5d\n',pn);
fprintf(fit2,'\n');
[a]=fscanf(fit1,'%f',2*ed);
for i=1:ed
    x0(i)=a(2*i-1);
    y0(i)=a(2*i);
    fprintf(fit2,'%15.3f %15.3f\n',x0(i),y0(i));
end
fprintf(fit2,'\n');
m1=fscanf(fit1,'%d',1);
fprintf(fit2,'%5d\n',m1);
isid=0;
if(m1>0)
    fprintf(fit2,'side\n');
    [a]=fscanf(fit1,'%f',2);
    ms=a(1);
    pp=a(2);
    fprintf(fit2,'%6.2f %6.2f\n',ms,pp);
    [a]=fscanf(fit1,'%d %d %f',3*m1);
    for i=1:m1
        e(i)=a(3*i-2);d(i)=a(3*i-1);sid(i)=a(3*i);
        fprintf(fit2,'%5d %5d %15.3f\n',e(i),d(i),sid(i));
    end
    [e,i1]=chkdat(sd,pn,e);
    [d,i2]=chkdat(sd,pn,d);
    i3=0;
    for i=1:m1;
        if(e(i)==d(i))
            i3=1;
            fprintf(fit2,'* * %5d %5d %5d * *\n',i,e(i),d(i));
        end
        fprintf(fit2,'%5d %5d %15.3f\n',e(i),d(i),sid(i));
    end
    isid=i1+i2+i3;
end
idir=0;
 
kk=isid 
if(kk>0)
    msgbox('Error by function rddat1','Warning','warn');
    return;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%━━
 xyknow(1:ed)=pn1(1:ed);xyunknow(1:dd)=pn1(ed+1:sd);
    [aa]=fscanf(fit1,'%d',2);
    A=aa(1);B=aa(2);
    mn=fscanf(fit1,'%d',1);
    [bb]=fscanf(fit1,'%d',mn);
    m=bb;
    for i=1:length(m)
        if i==1
            if e(m(i))==A|e(m(i))==B
                P=d(m(i));
            else
                P=e(m(i));
            end
        else
            if e(m(i-1))==A|d(m(i-1))==A
                B=P;
            else
                A=P;
            end
            if e(m(i))==A|e(m(i))==B
                P=d(m(i));
            else
                P=e(m(i));
            end
            
        end
        for j=1:m1
                if (e(j)==P|d(j)==P)&(d(j)==A|e(j)==A)
                    
                  s1=sid(j);
                end
                 if (e(j)==P|d(j)==P)&(d(j)==B|e(j)==B)
                        s2=sid(j);
                 end
            end
         
           deltx=x0(B)-x0(A);
           delty=y0(B)-y0(A);
           alfaAB=alfa(deltx,delty) ;
           ss=sqrt(deltx*deltx+delty*delty);
           ee=(s1*s1+ss*ss-s2*s2)/(2*ss);ff=sqrt(s1*s1-ee*ee);
           x0(P)=x0(A)+ee*cos(alfaAB)-ff*sin(alfaAB);
           y0(P)=y0(A)+ee*sin(alfaAB)+ff*cos(alfaAB);  
    end
       fprintf(fit2,'\n');
       fprintf(fit2,'━━\n');
    for i=1:sd
       
        fprintf(fit2,'%15.3f %15.3f \n',x0(i),y0(i));
    end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 k=1;
while(k)   
lo=2062.648062470964;
 n=2*dd;
 sum=n*(n+1)/2.0;
 sd=ed+dd;
 a=[];
 a(1:m1,1:9)=0.0;
 c(1:sum)=0.0;
 w(1:n)=0.0;
fprintf(fit2,'━：： \n');
 for i=1:m1     %′′━：：
     dx=x0(d(i))-x0(e(i));
     dy=y0(d(i))-y0(e(i));
     ss=sqrt(dx*dx+dy*dy);
     cosa=dx/ss;
     sina=dy/ss;
     a(i,1)=2*e(i)-1-2*ed+1.0e-9;
     a(i,2)=-cosa;
     a(i,3)=a(i,1)+1;
     a(i,4)=-sina;
     a(i,5)=2*d(i)-1-2*ed+1.0e-9;
     a(i,6)=cosa;
     a(i,7)=a(i,5)+1;
     a(i,8)=sina;
     a(i,9)=10.0*(ss-sid(i));
     %ql(i)=(ms^2+(ss*pp*0.0001)^2);
     ql(i)=((ms+ss*pp*0.001));
     ql(i)=100/ql(i)^2;
	
     fprintf(fit2,'%15.3f %15.3f %15.3f %15.3f %15.3f %15.3f %15.3f %15.3f %15.3f \n',a(i,:));
 end
% fprintf(fit2,'%15.3f  \n',ql);
 for i=1:m1     %：：：：：
         for j=1:4
             jj=fix(a(i,2*j-1));
             if(jj<=0)
                 continue;
             end
             w(jj)=w(jj)+a(i,2*j)*a(i,9)*ql(i);
             di=(jj-1)*(n-jj/2.0);
             for k=1:4
                 kk=fix(a(i,2*k-1));
                 if(kk<=0|jj>kk)
                     continue;
                 end
                 c(di+kk)=c(di+kk)+a(i,2*k)*a(i,2*j)*ql(i);
             end
         end
 end
fprintf(fit2,' \n');
 fprintf(fit2,'%15.3f  \n',w);
fprintf(fit2,'：：：：：\n');
 fprintf(fit2,'%15.3f %15.3f %15.3f %15.3f %15.3f %15.3f %15.3f %15.3f %15.3f \n',c)
 
%%%%%%%%%%%%%%━：━
sd=ed+dd;
n=2*dd;
k=0;
for i=1:n
    dxy(i)=0.0;
    di=(i-1)*(n-i/2.0);
    for j=1:n
        dj=(j-1)*(n-j/2.0);
        if(j<i)
            dxy(i)=dxy(i)-c(dj+i)*w(j);
            %dxy(i)=dxy(i)-c(di+j)*w(j);
        else
            dxy(i)=dxy(i)-c(di+j)*w(j);
            %dxy(i)=dxy(i)-c(dj+i)*w(j);
        end
    end
    %if(abs(dxy(i))>1.0)
        %k=1;
    
    %end
    dxy(i)=-dxy(i)/100.0;
end
%end % while(k11) while(k11)
x(1:ed)=x0(1:ed);
y(1:ed)=y0(1:ed);
for i=1:dd
    x(ed+i)=x0(ed+i)+dxy(2*i-1);
    y(ed+i)=y0(ed+i)+dxy(2*i);
end
x0(1:sd)=x(1:sd);
y0(1:sd)=y(1:sd);
for i=1:sd
    if(i<=ed)
        vx(i)=0.0;
        vy(i)=0.0;
    else
        vx(i)=dxy(2*(i-ed)-1);
        vy(i)=dxy(2*(i-ed));
    end
end
fprintf(fit2,'           ━━\n');
fprintf(fit2,'       pn           vx               x                 vy                   y\n');
for i=1:sd 
    fprintf(fit2,'    %6d       %8.4f       %14.4f       %8.4f        %14.4f\n',pn(i),vx(i),x(i),vy(i),y(i));
end
pvv=0.0;
for i=1:n
    pvv=pvv+w(i)*dxy(i)*100.0;
end
for i=1:m1
    pvv=pvv+a(i,9)*a(i,9)/ql(i);
end
 
uw0=sqrt(pvv/((m1-n)*1.0e0));
fprintf(fit2,'   %14.4f\n',uw0);
end % while(k11) while(k11)

%%%%%%%%%%%%%%━
 global    ai bi fi 
  %fit2=fopen('D:\━\work\siliout.txt','wt')
fprintf(fit2,'        ━\n');
fprintf(fit2,'        pn(i)       mx         my          mm          a           b           fi\n');
n=2.0*dd;
maxmm=0.0;
smm=0.0;
for i=1:dd
    ii=ed+i;
    di=(2*i-2)*(n-(2*i-1)/2.0);
    dj=(2*i-1)*(n-i);
    ql=c(di+2*i-1);
    q2=c(dj+2*i);
    q3=c(di+2*i);
    dl=sqrt(abs(ql+q2-q3));
    d11=uw0*dl;
    xx=ql-q2;
    yy=2*q3;
    zz=ql+q2;
    mx1=sqrt(ql);
    my1=sqrt(q2);
    mm1=sqrt(zz);
    if(abs(xx)<1e-10)
        fi(i)=sign(90.0,q3);
    else
        fi(i)=atan(yy/xx)*57.2958;
    end
    if(xx>=0.0&yy>=0.0)
        fi(i)=fi(i)/2.0;
    elseif(xx>=0.0&yy<=0.0)
        fi(i)=(fi(i)+360.0)/2.0;
    elseif(xx<0.0)
        fi(i)=(fi(i)+180.0)/2.0;
    end
    ww=sqrt(xx*xx+yy*yy);
    a1=sqrt((zz+ww)/2.0);
    b1=sqrt((zz-ww)/2.0);
    ab1=a1-b1;
    mx=uw0*mx1;
    my=uw0*my1;
    mm=uw0*mm1;
    if(mm>maxmm)
        i1=ii;
    end
    smm=smm+mm;
    ai(i)=uw0*a1;
    bi(i)=uw0*b1;
    ab=ai(i)-bi(i);
    fprintf(fit2,'%10d     %10.3f %10.3f  %10.3f  %10.3f  %10.3f  %10.3f\n',pn(ii),mx,my,mm,ai(i),bi(i),fi(i));
end
smm=smm/dd;
fprintf(fit2,'          ：━=  %9.6f\n',uw0);
%fprintf(fit2,'           the maximum station error mm=  %8.3f(cm)   pp=   %4d\n',maxmm,pn(i1));
fprintf(fit2,'           ━━mm=  %8.3f\n',smm);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%%%%%%%%%%%%%%
axes(handles.axes1);
kk=0;
%tile1={'━'};
%prompt011={'━'};
lines=1;
d11={'100'};
c12=inputdlg('plese input the scale','scale',lines,d11);%━━
scale=str2num(str2mat(c12));
%scale=500;
hold off
title('');
xlabel('Y━');
ylabel('X━');
plot(y(1:ed),x(1:ed),'k')
hold on
plot(y((ed+1):end),x((ed+1):end),'k.')
for i=1:ed+dd %
    text(y(i)+3,x(i)+3,num2str(pn(i)));
end
for i=1:m1%′′
    plot([y(e(i)) y(d(i))],[x(e(i)) x(d(i))],'r');
end
for i=1:dd %━
    fe(i)=fi(i)*pi/180.;
 plot(y(i+ed)+(ai(i)*cos(0:0.01:2*pi)*sin(fe(i))+bi(i)*sin(0:0.01:2*pi)*cos(fe(i)))*scale,...
    x(i+ed)+(ai(i)*cos(0:0.01:2*pi)*cos(fe(i))-bi(i)*sin(0:0.01:2*pi)*sin(fe(i)))*scale,'r');
end
axis equal;
zoom on 
    
  fclose('all');
 open(strcat(pathname,net_name,b_datafile));

set(handles.edit1,'string','Finish adjustment and open the doc ')

 return

% --------------------------------------------------------------------
function SZWPC_Callback(hObject, eventdata, handles)
% hObject    handle to SZWPC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function DXPC_Callback(hObject, eventdata, handles)
% hObject    handle to DXPC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




% --------------------------------------------------------------------
function CSSR2_Callback(hObject, eventdata, handles)
% hObject    handle to CSSR2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function TJPC_Callback(hObject, eventdata, handles)
% hObject    handle to TJPC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function YJPC_CON_Callback(hObject, eventdata, handles)
% hObject    handle to YJPC_CON (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global K_con;global A_con;global W_con;global P_con;global AT_con;global Q_con;global Naa_con;global Ladj_con;global LO_con;global v_con;global vt_con;global Sigma0_con;global r;global QLL_con;global QWW_con;global QKK_con;global QVV_con;global QLadjLadj_con;global DLadjLadj_con;global XO_con;global Xadj_con;global n;global r;global t;global finalres_indname2;global finalres_indvalue2;
%GET K
Q_con=inv(P_con);
AT_con=A_con';
Naa_con=A_con*Q_con*AT_con;
K_con=-inv(Naa_con)*W_con;
str1=num2str(K_con);

Q_con=inv(P_con);
AT_con=A_con';
v_con=Q_con*AT_con*K_con;
str2=num2str(v_con);

Ladj_con=(LO_con*1000+v_con)./1000;
str2=num2str(Ladj_con);

Q_con=inv(P_con);
QLL_con=Q_con;
QLL_con
str3=num2str(QLL_con);

AT_con=A_con';
Q_con=inv(P_con);
Naa_con=A_con*Q_con*AT_con;
QWW_con=Naa_con;
QWW_con
str4=num2str(QWW_con);

AT_con=A_con';
Q_con=inv(P_con);
Naa_con=A_con*Q_con*AT_con;
QKK_con=inv(Naa_con);
QKK_con
str5=num2str(QKK_con);

% --------------------------------------------------------------------
AT_con=A_con';
Q_con=inv(P_con);
Naa_con=A_con*Q_con*AT_con;
QVV_con=Q_con*AT_con*inv(Naa_con)*A_con*Q_con;
QVV_con
str6=num2str(QVV_con);


Q_con=inv(P_con);
QLadjLadj_con=Q_con-QVV_con;
QLadjLadj_con
str7=num2str(QLadjLadj_con);

r=n-t;
vt_con=v_con';
Sigma0_con=sqrt(vt_con*P_con*v_con)./r;
Sigma0_con
str8=num2str(Sigma0_con);

DLadjLadj_con=Sigma0_con*Sigma0_con*QLadjLadj_con;
DLadjLadj_con
str9=num2str(DLadjLadj_con);

str={'K=',str1,'v=',str2,'Ladj=',str3,'QLL=',str4,'QWW=',str5,'QKK=',str6};msgbox(str);
str={'QVV=',str7,'QLadjLadj=',str9,'Sigma0=',str8};msgbox(str);
finalres_indname2={'K_con=       ';'v_con=       ';'Ladj_con=    ';'QLL_con=    ';'QWW_con=     ';'QKK_con=     ';'QVV          ';'QLadjLadj_con';'SIGMA0_CON   ';'DLadjLadj_con'};%mei yi lie bi xu xiang tong cai neng xing cheng ju zhen
finalres_indvalue2={K_con;v_con;Ladj_con;QLL_con;QWW_con;QKK_con;QVV_con;QLadjLadj_con;Sigma0_con;DLadjLadj_con};
%finaldisp_ind={finalres_indname(1);finalres_indvalue(1);finalres_indname(2);finalres_indvalue(2);finalres_indname(3);finalres_indvalue(3)}


set(handles.edit1,'string','conditional adjustment is finished')



% --------------------------------------------------------------------
function CSDR_SZW_Callback(hObject, eventdata, handles)
% hObject    handle to CSDR_SZW (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global guanceshunxubiao;global guanceluxianchangdu;global yizhidianbianhao;global obsvalue_szw;global guanceshu;global yizhidianshumu;global yizhidiandezhi;global weizhidiandezhi; global weizhidianshumu;global L_SZW;global B_SZW;global P_SZW;global v_SZW;global Sigma0_SZW;global Xadj_SZW;global Ladj_ind;

s = sprintf('please chooseobservation orders\n\n');%GUAN CE SHUNXU BIAO
msgbox(s,'please chooseorders','help');pause(2);
[filename,pathname]=uigetfile({'*.txt'},'choose orders');
str=[pathname, filename];
guanceshunxubiao=load(str);%shunxubiao

s = sprintf('please chooselength of obsevation path\n\n');% lu xian chang du
msgbox(s,'please chooselength','help');pause(2);
[filename,pathname]=uigetfile({'*.txt'},'choose length');
str=[pathname, filename];
guanceluxianchangdu=load(str);

s = sprintf('please chooseyizhidianbianhao\n\n');%yizhidian biaohao
msgbox(s,'please chooseknown points','help');pause(2);
[filename,pathname]=uigetfile({'*.txt'},'choose yizhidianbianhao');
str=[pathname, filename];
yizhidianbianhao=load(str);

s = sprintf('please chooseobservation value\n\n');%guanezhi
msgbox(s,'please choosevalue','help');pause(2);
[filename,pathname]=uigetfile({'*.txt'},'choose value');
str=[pathname, filename];
obsvalue_szw=load(str);



s = sprintf('please chooseyizhidiandezhi\n\n');%guanezhi
msgbox(s,'please chooseknown_value','help');pause(2);
[filename,pathname]=uigetfile({'*.txt'},'choose value');
str=[pathname, filename];
yizhidiandezhi=load(str);

weizhidianshumu= inputdlg('choose unknown_number');
weizhidianshumu= str2double(weizhidianshumu);

yizhidianshumu= inputdlg('choose known_number');
yizhidianshumu= str2double(yizhidianshumu);

guanceshu= inputdlg('choose guanceshu');
guanceshu= str2double(guanceshu);


% --------------------------------------------------------------------
function CSSR_con_Callback(hObject, eventdata, handles)
% hObject    handle to CSSR_con (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global K_con;global A_con;global W_con;global P_con;global AT_con;global Q_con;global Naa_con;global Ladj_con;global LO_con;global v_con;global vt_con;global Sigma0_con;global r;global QLL_con;global QWW_con;global QKK_con;global QVV_con;global QLadjLadj_con;global DLadjLadj_con;global XO_con;global Xadj_con;global n;global t;
s = sprintf('please choosematrix A');
msgbox(s,'please choosematrix A','help');pause(2);
[filename,pathname]=uigetfile({'*.txt'},'choose A');
str=[pathname, filename];
A_con=load(str);

s = sprintf('please choose  matrix W');

msgbox(s,'please choose  matrix W','help');pause(2); 
[filename,pathname]=uigetfile({'*.txt'},'choose W');
str=[pathname, filename];
W_con=load(str);

s = sprintf('please choose matrix P');

msgbox(s,'please choose  matrix P','help');
pause(2); 
[filename,pathname]=uigetfile({'*.txt'},'choose matrix P');
str=[pathname, filename];
P_con=load(str);


s = sprintf('please choose matrixLO');
msgbox(s,'please choose matrixLO','help');
pause(2); 
[filename,pathname]=uigetfile({'*.txt'},'choose matrix lo');
str=[pathname, filename];
LO_con=load(str);

n = inputdlg('choosen');
n= str2double(n);
t = inputdlg('chooset');
t= str2double(t);
r=n-t;


set(handles.edit1,'string','data is inputed')



% --------------------------------------------------------------------
function YJPC_SZW_Callback(hObject, eventdata, handles)
% hObject    handle to YJPC_SZW (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global guanceshunxubiao;global guanceluxianchangdu;global yizhidiandebiaohao;global obsvalue_szw;global guanceshu;global yizhidianshumu;global yizhidiandezhi;global weizhidiandezhi; global weizhidianshumu;global L_SZW;global B_SZW;global P_SZW;global v_SZW;global Sigma0_SZW;global Xadj_SZW;global Ladj_ind;global weizhidianshumu;
%shunxu_szw:′length_szw━━：：knownpoints_szw′known_numberkno
%wn_value
%get rough high value of unknown points
%knownpoints_szw:the numberof the kmown point,do not have value;
%known_value not only have the number of known points ,but also have
%the value
weizhidiandezhi=zeros(weizhidianshumu,4)    %wei zhi dian de di yi lie shi di yi ge guan ce dian xu hao ,di er lie shi ta de zhi,di san lie shi di er ge guan ce dian xu hao ,di si lie shi ta de zhi
judge1=0;%fu zhu bian liang
judge2=0;
tip1=0;%this is a number to set as the exact  order number of known_value
tip2=0;
numtest=0;
%while numtest==0%numtest use to calculate the number of the  unknown
for ddd=1:3
for k=1:guanceshu
    judge1=0;%fu zhu bian liang
judge2=0;
    for h=1:yizhidianshumu
if guanceshunxubiao(k,1)==yizhidiandebianhao(h)%%pan duan di yi ge guan ce dian zhong shi fou you yi zhi dian
    judge1=1;%%guan ce de dian zhong you yi zhi dian
    tip1=h;%ji lu xia shi na yi ge yi zhi dian
   break
end
    end

    for p=1:yizhidianshumu  %%pan duan di er ge guan ce dian zhong shi fou you yi zhi dian
    if guanceshunxubiao(k,2)==yizhidiandebianhao(p)
        judge2=1;%%guan ce de dian zhong you yi zhi dian
        tip2=p;%ji lu xia shi na yi ge yi zhi dian
   break
    end
    end 
    %judge whether the two points are known
    if judge1==1&judge2==1   %%fen qing kuang tao lun ying gai ru he zhu li liru liang ge dou yi zhi 
        
    elseif judge1==0&judge2==0%%shang shu liang zhong qing kuang jiu shenme dou bu gan
        
    elseif judge1==1&judge2==0
     weizhidiandezhi(k,3)=guanceshunxubiao(k,2);
        weizhidiandezhi(k,4)=yizhidiandezhi(tip1,2)+obsvalue_szw(k);%the first colume of yizhidiandezhi if its order,the second is its value
    else
         weizhidiandezhi(k,1)=guanceshunxubiao(k,1);
        weizhidiandezhi(k,2)=yizhidiandezhi(tip2,2)-obsvalue_szw(k);
    end
end
[m1,n1] = size(weizhidiandezhi);

%put the new point to yizhidiandezhi
for m=1:m1
        if weizhidiandezhi(m,1)~=0;%jiang bu deng yu ling de wei zhi dian jia ru dao yi zhi dian
            yizhidiandezhi(yizhidianshumu+m,1)=weizhidiandezhi(m,1);
            yizhidiandezhi(yizhidianshumu+m,2)=weizhidiandezhi(m,2);
        
        elseif weizhidiandezhi(m,3)~=0;
          yizhidiandezhi(yizhidianshumu+m,1)=weizhidiandezhi(m,3);
            yizhidiandezhi(yizhidianshumu+m,2)=weizhidiandezhi(m,4);
        else 
            continue
        end
end

%chuangjian yige zongde weizhidian gaocheng guzhi
finalunknownvalue=zeros(weizhidianshumu,2);
for h=1:weizhidianshumu
    for k=1:guanceshu
        if weizhidiandezhi(k,1)==h
            finalunknownvalue(h,1)= weizhidiandezhi(k,1);
             finalunknownvalue(h,2)= weizhidiandezhi(k,2);
        elseif weizhidiandezhi(k,3)==h
            finalunknownvalue(h,1)= weizhidiandezhi(k,3);
             finalunknownvalue(h,2)= weizhidiandezhi(k,4);
        end
    end
end

[m1,n1] = size(yizhidiandezhi)
yizhidianshumu=m1;
%panduan1shifou yijing you1 suoyou de1dian zuobiao guzhi
for h=1:yizhidianshumu
    yizhidiandebianhao(h)=yizhidiandezhi(h,1);
end

end


%above work is to figure out the rough high value,do it again to make sure
%all the number is delt with
guanceluxianchangdu=1./guanceluxianchangdu;
P_SZW=diag([guanceluxianchangdu]);
%above work is to set P
yizhidianshumu=3;
yizhidiandebiaohao=[-1;-2;-3];
B_SZW=zeros(guanceshu,weizhidianshumu);
B_1=0;
B_2=0;

for k=1:guanceshu
judge1=0;%fu zhu bian liang
judge2=0;
    for h=1:yizhidianshumu
if guanceshunxubiao(k,1)==yizhidiandebianhao(h)
    judge1=1;
    tip1=h;
   break
end
    end

    for p=1:yizhidianshumu
    if guanceshunxubiao(k,2)==yizhidiandebianhao(p)
        judge2=1;
        tip2=p;
   break
    end
    end 

 if judge1==1&judge2==0
     B_1=0;
     B_2=1;
 elseif judge1==0&judge2==1
     B_1=-1;
     B_2=0;
 elseif judge1==0&judge2==0
      B_1=-1;
     B_2=1;
 end


% B_SZW=zeros(guanceshu,weizhidianshumu);
a=guanceshunxubiao(k,1);
b=guanceshunxubiao(k,2);
if a>0
B_SZW(k,a)=B_1;
end
if b>0
B_SZW(k,b)=B_2;
end
BT_SZW=B_SZW';

end
%above work is to get B_SZW
l_tmp=0;
tip1=0;%this is a number to set as the exact  order number of known_value
tip2=0;
yizhidianshumu=3;
yizhidiandebiaohao=[-1;-2;-3];
for k=1:guanceshu
judge1=0;%fu zhu bian liang
judge2=0;
    for h=1:yizhidianshumu
if guanceshunxubiao(k,1)==yizhidiandebianhao(h)
    judge1=1;
    tip1=h;
   break
end
tmpwzd1=guanceshunxubiao(k,1);%jilu weizhidiandehaoma
end
    

    for p=1:yizhidianshumu
    if guanceshunxubiao(k,2)==yizhidiandebianhao(p)
        judge2=1;
        tip2=p;
   break
    end
     tmpwzd2=guanceshunxubiao(k,2);
    end
     
    
 if judge1==1&judge2==0
     l_tmp=finalunknownvalue(tmpwzd2,2)-yizhidiandezhi(tip1)-obsvalue_szw(k);
 elseif judge1==0&judge2==1
    l_tmp=yizhidiandezhi(tip2)-finalunknownvalue(tmpwzd1,2)-obsvalue_szw(k);
 elseif judge1==0&judge2==0
     l_tmp=finalunknownvalue(tmpwzd2,2)-finalunknownvalue(tmpwzd1,2)-obsvalue_szw(k);
 end
L_SZW(k)=l_tmp;
end
%above work is to set l

BT_SZW=B_SZW';
W_SZW=BT_SZW*P_SZW*L_SZW;
NBB_SZW=BT_SZW*P_SZW*B_SZW;
x_SZW=inv(NBB_SZW)*W_SZW;


%above work is to GET x
v_SZW=B_SZW*x_SZW-L_SZW;

r=guanceshu-unknown_number;
vt_SZW=v_SZW';
Sigma0_SZW=sqrt((vt_SZW*P_SZW*v_SZW)*inv(r));

Xadj_SZW=(XO_ind*1000+x_ind)./1000;

Ladj_ind=(LO_ind*1000+v_ind)./1000;

BT_ind=B_ind';
NBB_ind=BT_ind*P_ind*B_ind;
Q_ind=inv(P_ind);
QLL_ind=Q_ind;
QXadjXadj_ind=inv(NBB_ind);




  


% --------------------------------------------------------------------
function SRCS_ind_Callback(hObject, eventdata, handles)
% hObject    handle to SRCS_ind (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




% --------------------------------------------------------------------
function WCTY_Callback(hObject, eventdata, handles)
% hObject    handle to WCTY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function CSDU_TY_Callback(hObject, eventdata, handles)
% hObject    handle to CSDU_TY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global QXX_circle;global QYY_circle;global QXY_circle;global Sigma0_circle;global EE_circle;global FF_circle;global theta_circle;
s = sprintf('please chooseQXX');
msgbox(s,'please chooseQXX','help');pause(2);
[filename,pathname]=uigetfile({'*.txt'},'choose QXX');
str=[pathname, filename];
QXX_circle=load(str);

s = sprintf('please chooseQYY');
msgbox(s,'please chooseQYY','help');pause(2);
[filename,pathname]=uigetfile({'*.txt'},'choose QYY');
str=[pathname, filename];
QYY_circle=load(str);

s = sprintf('please chooseQXY');
msgbox(s,'please chooseQXY','help');pause(2);
[filename,pathname]=uigetfile({'*.txt'},'choose QXY');
str=[pathname, filename];
QXY_circle=load(str);

s = sprintf('please chooseSigma0');
msgbox(s,'please chooseSigma0','help');pause(2);
[filename,pathname]=uigetfile({'*.txt'},'choose Sigma0');
str=[pathname, filename];
Sigma0_circle=load(str);


set(handles.edit1,'string','data is inputed')



% --------------------------------------------------------------------
function GetDPP_Callback(hObject, eventdata, handles)
% hObject    handle to GetDPP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global QXX_circle;global QYY_circle;global QXY_circle;global Sigma0_circle;global EE_circle;global FF_circle;global theta_circle;global DXX_circle;global DYY_circle;global DPP_circle;
DXX_circle=QXX_circle*Sigma0_circle*Sigma0_circle
DYY_circle=QYY_circle*Sigma0_circle*Sigma0_circle
DPP_circle=DYY_circle+DXX_circle;
str2=num2str(DPP_circle);
str={'DPP_circle=',str2};
msgbox(str);

set(handles.edit1,'string',' point erro is calculated')


% --------------------------------------------------------------------
function RYFXWC_Callback(hObject, eventdata, handles)
% hObject    handle to RYFXWC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global QXX_circle;global QYY_circle;global QXY_circle;global Sigma0_circle;global EE_circle;global FF_circle;global theta_circle;global DXX_circle;global DYY_circle;global DPP_circle;global changeangel_circle;global Qchangeangel_circle;global Dchangeangel_circle;
changeangel_circle= inputdlg('choose another angle');
changeangel_circle= str2double(changeangel_circle);
Dchangeangel_circle=Sigma0_circle*Sigma0_circle*(QXX_circle*cosd(changeangel_circle)*cosd(changeangel_circle)+QYY_circle*sind(changeangel_circle)*sind(changeangel_circle)+QXY_circle*sind(2*changeangel_circle))
str2=num2str(Dchangeangel_circle);
str={'Dchangeangel_circle=',str2};
msgbox(str);

set(handles.edit1,'string',' erro is calculated')




% --------------------------------------------------------------------
function Get3condition_Callback(hObject, eventdata, handles)
% hObject    handle to Get3condition (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global QXX_circle;global QYY_circle;global QXY_circle;global Sigma0_circle;global EE_circle;global FF_circle;global theta_circle;global K_circl;global QEE_circle;
K_circle=sqrt((QXX_circle-QYY_circle)*(QXX_circle-QYY_circle)+4*QXY_circle*QXY_circle);
QEE_circle=0.5*(QXX_circle+QYY_circle+K_circle);
QFF_circle=0.5*(QXX_circle+QYY_circle-K_circle);
theta_circle=atan(QXY_circle./(QEE_circle-QYY_circle))*180./pi;
if(theta_circle<0)
theta_circle=theta_circle+360;
elseif(theta_circle>360)
theta_circle=theta_circle-360;
end
if (theta_circle+180>360)
  theta_circle=theta_circle-180;
else theta_circle=theta_circle+180;
end
EE_circle=sqrt(Sigma0_circle*Sigma0_circle*QEE_circle);
FF_circle=sqrt(Sigma0_circle*Sigma0_circle*QFF_circle);
str1=num2str(theta_circle);
str3=num2str(EE_circle);
str4=num2str(FF_circle);
str={'theta_circle1=',str1,'EE_circle',str3,'FF_circle=',str4};
msgbox(str);

set(handles.edit1,'string',' three characters are calculated')


% --------------------------------------------------------------------
function Getany_Callback(hObject, eventdata, handles)
% hObject    handle to Getany (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global QXX_circle;global QYY_circle;global QXY_circle;global Sigma0_circle;global EE_circle;global FF_circle;global theta_circle;global DXX_circle;global DYY_circle;global DPP_circle;global changeangel_circle;global Qchangeangel_circle;global Dchangeangel_circle;global changeangel2_circle;global Qchangeangel2_circle;global Dchangeangel2_circle;
changeangel2_circle=inputdlg('choosechangeange2');
changeangel2_circle= str2double(changeangel2_circle);
Dchangeangel2_circle=EE_circle*EE_circle*cosd(changeangel2_circle)*cosd(changeangel2_circle)+FF_circle*FF_circle*sind(changeangel2_circle)*sind(changeangel2_circle)
str1='Dchangeangel2_circle=';
str2=num2str(Dchangeangel2_circle);
str={str1,str2};
msgbox(str);

set(handles.edit1,'string',' finish calculating erro based on EF')


% --------------------------------------------------------------------
function Getdistance_Callback(hObject, eventdata, handles)
% hObject    handle to Getdistance (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global QXX_circle;global QYY_circle;global QXY_circle;global Sigma0_circle;global EE_circle;global FF_circle;global theta_circle;global DXX_circle;global DYY_circle;global DPP_circle;global changeangel_circle;global Qchangeangel_circle;global Dchangeangel_circle;global changeangel2_circle;global Qchangeangel2_circle;global Dchangeangel2_circle;global zong_circle;global heng_circle;global distance_circle;global distanceerro;global angelerro;
changeangel2_circle=inputdlg('choosechangeange2');
distance_circle=inputdlg('distance');
changeangel2_circle= str2double(changeangel2_circle);
distance_circle= str2double(distance_circle);
zong_circle=EE_circle*EE_circle*cos(changeangel2_circle)*cos(changeangel2_circle)+FF_circle*FF_circle*sin(changeangel2_circle)*sin(changeangel2_circle)
heng_circle=FF_circle*FF_circle*cos(changeangel2_circle)*cos(changeangel2_circle)+EE_circle*EE_circle*sin(changeangel2_circle)*sin(changeangel2_circle)
distanceerro=zong_circle./distance_circle
str2=num2str(distanceerro);
str={'distanceerro=',str2};
msgbox(str);

set(handles.edit1,'string',' finish calculating erro based on distance')

% --------------------------------------------------------------------
function Getangle_Callback(hObject, eventdata, handles)
% hObject    handle to Getangle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global QXX_circle;global QYY_circle;global QXY_circle;global Sigma0_circle;global EE_circle;global FF_circle;global theta_circle;global DXX_circle;global DYY_circle;global DPP_circle;global changeangel_circle;global Qchangeangel_circle;global Dchangeangel_circle;global changeangel2_circle;global Qchangeangel2_circle;global Dchangeangel2_circle;global zong_circle;global heng_circle;global distance_circle;global distanceerro;global angelerro;
changeangel2_circle=inputdlg('choosechangeange2');
distance_circle=inputdlg('choosedistance');
changeangel2_circle= str2double(changeangel2_circle);
distance_circle= str2double(distance_circle);
zong_circle=EE_circle*EE_circle*cos(changeangel2_circle)*cos(changeangel2_circle)+FF_circle*FF_circle*sin(changeangel2_circle)*sin(changeangel2_circle)
heng_circle=FF_circle*FF_circle*cos(changeangel2_circle)*cos(changeangel2_circle)+EE_circle*EE_circle*sin(changeangel2_circle)*sin(changeangel2_circle)
angelerro=206265*heng_circle./distance_circle
str2=num2str(angelerro);
str={'angelerro=',str2};
msgbox(str);

set(handles.edit1,'string',' finish calculating erro based on angle')

% --------------------------------------------------------------------
function draw_Callback(hObject, eventdata, handles)
% hObject    handle to draw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%━′′━━：：━
% 2008━1022
%：Xcenter,Ycenter━LongAxis′′━ShortAxis━Angle：：━
% 
% PlotEllipse(0,0,3,5,pi/6)

global EE_circle ;global FF_circle;global theta_circle;

axes(handles.axes1);
Xcenter=0;
Ycenter=0;
LongAxis=EE_circle;ShortAxis=FF_circle;Angle=theta_circle;
t1=0:.02:pi;
t2=pi:.02:2*pi;
z1=exp(i*t1);
z2=exp(i*t2);
z1=(LongAxis*real(z1)+i*ShortAxis*imag(z1))*exp(i*Angle);
z2=(LongAxis*real(z2)+i*ShortAxis*imag(z2))*exp(i*Angle);
z1=z1+Xcenter+Ycenter*i;
z2=z2+Xcenter+Ycenter*i;
plot(z1,'r')
hold on
plot(z2,'r')
hold off
grid on
[x,y] = ginput(1)

set(handles.edit1,'string','circle is drawn')


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global EE_circle ;global FF_circle;global theta_circle;

axes(handles.axes1);
Xcenter=0;
Ycenter=0;
LongAxis=EE_circle;ShortAxis=FF_circle;Angle=theta_circle;
t1=0:.02:pi;
t2=pi:.02:2*pi;
z1=exp(i*t1);
z2=exp(i*t2);
z1=(LongAxis*real(z1)+i*ShortAxis*imag(z1))*exp(i*Angle);
z2=(LongAxis*real(z2)+i*ShortAxis*imag(z2))*exp(i*Angle);
z1=z1+Xcenter+Ycenter*i;
z2=z2+Xcenter+Ycenter*i;
plot(z1,'r')
hold on
plot(z2,'r')
hold off
grid on
[x,y] = ginput(1)



% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global point_x;global point_y;global distance;
[x,y] = ginput(1)
point_x=x
point_y=y
distance=sqrt(point_x*point_x+point_y*point_y)
str=num2str(distance);
str1='distance=';
res={str1,str};
res=cell2mat(res);
msgbox(res);




% --------------------------------------------------------------------
function HELP_Callback(hObject, eventdata, handles)
% hObject    handle to HELP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function SYSM_Callback(hObject, eventdata, handles)
% hObject    handle to SYSM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
winopen('E:\Final work\software document.docx');

% --------------------------------------------------------------------
function Untitled_5_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function CSDZB_Callback(hObject, eventdata, handles)
% hObject    handle to CSDZB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
winopen('E:\Final work\Parameter table.docx');



function a=alfa(dx,dy)%%%%%：：
a11=atan(dy/dx);
if (dy>0&dx>0)
    a=a11;
elseif (dx<0)
    a=pi+a11;
else
    a=2*pi+a11;
end 


function[dh,h,V,L,uw0,uwh,uw1]=calculatelevelnet(ed,dd,sd,pn,h0,be,en,hd,distance);
% 
A=sparse(zeros(sd,gd));    %━━
b=(0:(gd-1)*sd);
A(be'+b)=-1;
A(en'+b)=1;
A=A';
A=A(:,1:dd);
l=zeros(gd,1);   %━
l=h0(be)-h0(en)+hd;
p=diag(1./distance);    %：━
dh=inv(A'*p*A)*A'*p*1;  %
h00=h0(dd+1:sd);
h0=h0(1:dd);            %：━
h=h0+dh;                %：
V=A*dh-1;               %
L=hd+V;                 %

%：
uw0=sqrt(V'*p*V/(gd-dd));   %：━
Qxx=inv(A'*p*A);
uwh=uw0*sqrt(diag(Qxx));    %：━
uwh(dd+1:ed+dd)=0.0;
Qff=A*Qxx*A';
uwh=uw0*sqrt(diag(Qff));    %━
h=[h;h00];                  %━
h0=[h0;h00];
dh=[dh;zeros(ed,1)];
return


function[n1,k]=chkdat(sd,pn,n1)
n=length(n1);
k=0;
for i=1:n
  i1=0;
  for j=1:sd
     if(n1(i)==pn(j))
        i1=1;
        n1(i)=j;
        break;  
     end
  end
  if(i1==0)
%       fprintf(fit2,'%5d%5d\n',n1(i));
     k=1;
  end
end
return


function c=invsqr(c,n)
  ss=0.0;
  for i=1:n
      di=(i-1)*(n-i/2.0);
      for j=i:n
          ss=c(di+j);
          for k=1:i-1
              dk=(k-1)*(n-k/2.0);
              ss=ss-c(dk+j)/c(dk+k);
          end
          if(i==j)
              c(di+j)=1/ss;
          else
              c(di+j)=ss*c(di+i);
          end
      end
  end
  for i=1:n-1
      di=(i-1)*(n-i/2.0);
      for j=i+1:n
          ss=-c(di+j);
          for k=i+1:j-1
              dk=(k-1)*(n-k/2.0);
              ss=ss-c(di+k)*c(dk+j);
          end
          c(di+j)=ss;
      end
  end
  for i=1:n-1
      di=(i-1)*(n-i/2.0);
      for j=i:n
          dj=(j-1)*(n-j/2.0);
          if(j==i)
              ss=c(di+j);
          else
              ss=c(di+j)*c(dj+i);
          end
          for k=j+1:n
              dk=(k-1)*(n-k/2.0);
              ss=ss+c(di+k)*c(dj+k)*c(dk+k);
          end
          c(di+j)=ss;
      end
  end
  return
  
   function level3
[ed,dd,sd,gd,pn,h0,k1,k2,h1,s]=readlevelnetdata;
global pathname net_name s_datafile b1_datafile;
global ed dd sd pn gd h0 k1 k2 h1 s dh;
[dh,h,V,L,uw0,uwh,uw1]=calculatelevelnet(ed,dd,sd,pn,gd,h0,k1,k2,h1,s);
writelevelnetdata(pn,k1,k2,h1,V,L,h0,dh,h,uwh,uw0);   %━
return


function [ed,dd,sd,gd,pn,h0,k1,k2,h1,s]=readlevelnetdata;
global pathname net_name s_datafile b_datafile;
global ed dd sd pn gd h0 k1 k2 h1 s k11 k12;
k1=[];k2=[];h=[];s=[];
if(isempty(pathname)|isempty(net_name))
     [filename,pathname]=uigetfile('*.txt','Input filename');
     i=find('.'==filename);
     net_name=filename(1:i-1);
end
fid1=fopen(strcat(pathname,net_name,s_datafile),'rt');
if(fid1==-1)
    msgbox('Input File or Path is not correct','Warning','warn');
    return;
end                                        %open afile to read

%open afile to read
ed=fscanf(fid1,'%f',1);    %
dd=fscanf(fid1,'%f',1);    %
sd=ed+dd;                  %
gd=fscanf(fid1,'%f',1);    %
pn=fscanf(fid1,'%f',sd);   %
%known data
h0=fscanf(fid1,'%f',ed);    %
h0(dd+1:ed+dd)=h0(1:ed)
heightdiff=fscanf(fid1,'%f',[4,gd]);
heightdiff=heightdiff';
k1=heightdiff(:,1);         %
k2=heightdiff(:,2);         %
k11=heightdiff(:,1);         %
k12=heightdiff(:,2);         %
h1=heightdiff(:,3);         %
s=heightdiff(:,4);         %━：：
fclose('all');
%
[k1,k01]=chkdat(sd,pn,k1);
[k2,k02]=chkdat(sd,pn,k2);
h0(1:dd)=20000.;
ie=0;
while(1)%━
   for k=1:gd
         i=k1(k);
         j=k2(k);
         if(h0(i)<le4&h0(j)>le4)
            h0(j)=h0(i)+h1(k);
            ie=ie+1;
         end
         
         if(h0(i)>le4&h0(j)<le4)
            h0(i)=h0(j)-h1(k);
            ie=ie+1;
         end   
   end
   if(ie==dd)
      break;
   end
end
h0=reshape(h0,length(h0),1);
return 

% --------------------------------------------------------------------
function CSSR_DXW_Callback(hObject, eventdata, handles)
% hObject    handle to CSSR_DXW (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

s = sprintf('please chooseA\n\n');
msgbox(s,'please chooseA','help');pause(2);
[filename,pathname]=uigetfile({'*.txt'},'choose A');
str=[pathname, filename];
A_con=load(str);




% --------------------------------------------------------------------
function YUANDAIMA_Callback(hObject, eventdata, handles)
% hObject    handle to YUANDAIMA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 winopen('D:\work\user2_2.m')


% --------------------------------------------------------------------
function ERCIKAIFA_Callback(hObject, eventdata, handles)
% hObject    handle to ERCIKAIFA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




% --------------------------------------------------------------------
function kyykfa_Callback(hObject, eventdata, handles)
% hObject    handle to kyykfa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)





% --------------------------------------------------------------------
function JSJY_Callback(hObject, eventdata, handles)
% hObject    handle to JSJY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function GYUDJY_Callback(hObject, eventdata, handles)
% hObject    handle to GYUDJY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function GYSIGMADEJIANYAN_Callback(hObject, eventdata, handles)
% hObject    handle to GYSIGMADEJIANYAN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function knownsigma_Callback(hObject, eventdata, handles)
% hObject    handle to knownsigma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global h;global sig;global ci;global zval;global x;global m;global sigma;global alpha;global tail;
s = sprintf('please choosex\n\n');
msgbox(s,'please choosex','help');pause(2);
[filename,pathname]=uigetfile({'*.txt'},'choose x');
str=[pathname, filename];
x=load(str);
m = inputdlg('chooseaverage number');
m= str2double(m);
sigma = inputdlg('choosebiao zhun cha');
sigma= str2double(sigma);


[h,sig.ci,zval]=ztest(x,m,sigma,0.05,0)
zval= num2str(zval);
ci=num2str(ci);
str='';
str1='accept'
str2='refuse'
if h==0
    str=str1;
elseif h==1
    str=str2;
end
zhixinjujian='area of convince';
res={zhixinjujian;ci;zval;str};
msgbox(res) ;   
set(handles.edit1,'string','Finish hypothesis testing ')
% --------------------------------------------------------------------
function unknownsigma_Callback(hObject, eventdata, handles)
% hObject    handle to unknownsigma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global h;global sig;global ci;global zval;global x;global m;global sigma;global alpha;global tail;
s = sprintf('please choosex\n\n');
msgbox(s,'please choosex','help');pause(2);
[filename,pathname]=uigetfile({'*.txt'},'choose x');
str=[pathname, filename];
x=load(str);
m = inputdlg('chooseaverage number');
m= str2double(m);


[h,sig,ci]=ttest(x,m,0.05,0)
ci=num2str(ci);
str='';
str1='accept'
str2='refuse'
if h==0
    str=str1;
elseif h==1
    str=str2;
end
zhixinjujian='area of convince';
res={zhixinjujian;ci;str};
msgbox(res) ;   
set(handles.edit1,'string','Finish hypothesis testing ')



% --------------------------------------------------------------------
function uyizhi_Callback(hObject, eventdata, handles)
% hObject    handle to uyizhi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global h;global sig;global ci;global zval;global x;global m;global sigma;global alpha;global tail;
s = sprintf('please choosex\n\n');
msgbox(s,'please choosex','help');pause(2);
[filename,pathname]=uigetfile({'*.txt'},'choose x');
str=[pathname, filename];
x=load(str);
m = inputdlg('choosesigma');
m= str2double(m);
sigma = inputdlg('choosesigma');
sigma= str2double(sigma);
alpha = inputdlg('choosealpha');
alpha= str2double(alpha);



% --------------------------------------------------------------------
function Untitled_7_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
%function u_Callback(hObject, eventdata, handles)
% hObject    handle to u (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




% --------------------------------------------------------------------
%function u_Callback(hObject, eventdata, handles)
% hObject    handle to u (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
%function u_Callback(hObject, eventdata, handles)
% hObject    handle to u (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
%function u_Callback(hObject, eventdata, handles)
% hObject    handle to u (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function uweizhi_Callback(hObject, eventdata, handles)
% hObject    handle to uweizhi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global h;global sig;global ci;global zval;global x;global m;global sigma;global alpha;global tail;global varO;global varci;global stats;
s = sprintf('please choosex\n\n');
msgbox(s,'please choosex','help');pause(2);
[filename,pathname]=uigetfile({'*.txt'},'choose x');
str=[pathname, filename];
x=load(str);

var0 = inputdlg('chooseYiZhiDeFangCha');
var0= str2double(varO);
[h,sig,varci,stats]=vartest(x,var0,0.05,0)
varci= num2str(varci);
stats=num2str(stats);
str='';
str1='accept'
str2='refuse'
if h==0
    str=str1;
elseif h==1
    str=str2;
end
zhixinjujian='area of convince';
res={zhixinjujian;varci;stats;str};
msgbox(res) ;   



% --------------------------------------------------------------------
function SGMAXDLGZT_Callback(hObject, eventdata, handles)
% hObject    handle to SGMAXDLGZT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global h;global sig;global ci;global zval;global X;global Y;global sigma;global alpha;global tail;
s = sprintf('please chooseX\n\n');
msgbox(s,'please chooseX','help');pause(2);
[filename,pathname]=uigetfile({'*.txt'},'choose X');
str=[pathname, filename];
X=load(str);
s = sprintf('please chooseY\n\n');
msgbox(s,'please chooseY','help');pause(2);
[filename,pathname]=uigetfile({'*.txt'},'choose Y');
str=[pathname, filename];
Y=load(str);

[h,sig.ci]=ttest2(X,Y,0.05,0)
ci=num2str(ci);
str='';
str1='accept'
str2='refuse'
if h==0
    str=str1;
elseif h==1
    str=str2;
end
zhixinjujian='area of convince';
res={zhixinjujian;ci;str};
msgbox(res) ;   
set(handles.edit1,'string','Finish hypothesis testing ')



% --------------------------------------------------------------------
function JZWZSDL_Callback(hObject, eventdata, handles)
% hObject    handle to JZWZSDL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global h;global sig;global ci;global zval;global x;global y;global sigma;global alpha;global tail;global varO;global varci;global stats;
s = sprintf('please choosex\n\n');
msgbox(s,'please choosex','help');pause(2);
[filename,pathname]=uigetfile({'*.txt'},'choose x');
str=[pathname, filename];
x=load(str);
s = sprintf('please choosey\n\n');
msgbox(s,'please choosey','help');pause(2);
[filename,pathname]=uigetfile({'*.txt'},'choose y');
str=[pathname, filename];
y=load(str);
[h,sig,varci,stats]=vartest2(x,y,0.05,0)
varci= num2str(varci);
stats=num2str(stats);
str='';
str1='accept'
str2='refuse'
if h==0
    str=str1;
elseif h==1
    str=str2;
end
zhixinjujian='area of convince';
res={zhixinjujian;varci;stats;str};
msgbox(res) ;   




% --------------------------------------------------------------------
function SCCDEXCEL_Callback(hObject, eventdata, handles)
% hObject    handle to SCCDEXCEL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global finalres_indname2;global finalres_indvalue2;
 Excel=actxserver('Excel.Application');
Workbook=Excel.Workbooks.Add;
Workbook.SaveAs('C:\Users\asus\Desktop\test101.xlsx')
Workbook.Close;
%

xlswrite('C:\Users\asus\Desktop\test101.xlsx', finalres_indname2(1),'NewTemp','A1'); 
tmp1=cell2mat(finalres_indvalue2(1));
xlswrite('C:\Users\asus\Desktop\test101.xlsx', tmp1,'NewTemp','A2');

xlswrite('C:\Users\asus\Desktop\test101.xlsx', finalres_indname2(2),'NewTemp2','A1'); 
tmp2=cell2mat(finalres_indvalue2(2));
xlswrite('C:\Users\asus\Desktop\test101.xlsx', tmp2,'NewTemp2','A2');

xlswrite('C:\Users\asus\Desktop\test101.xlsx', finalres_indname2(3),'NewTemp3','A1'); 
tmp3=cell2mat(finalres_indvalue2(3));
xlswrite('C:\Users\asus\Desktop\test101.xlsx', tmp3,'NewTemp3','A2');

xlswrite('C:\Users\asus\Desktop\test101.xlsx', finalres_indname2(4),'NewTemp4','A1'); 
tmp4=cell2mat(finalres_indvalue2(4));
xlswrite('C:\Users\asus\Desktop\test101.xlsx', tmp4,'NewTemp4','A2');

xlswrite('C:\Users\asus\Desktop\test101.xlsx', finalres_indname2(5),'NewTemp5','A1'); 
tmp5=cell2mat(finalres_indvalue2(5));
xlswrite('C:\Users\asus\Desktop\test101.xlsx', tmp5,'NewTemp5','A2');

xlswrite('C:\Users\asus\Desktop\test101.xlsx', finalres_indname2(6),'NewTemp6','A1'); 
tmp6=cell2mat(finalres_indvalue2(6));
xlswrite('C:\Users\asus\Desktop\test101.xlsx', tmp6,'NewTemp6','A2');

xlswrite('C:\Users\asus\Desktop\test101.xlsx', finalres_indname2(2),'NewTemp7','A1'); 
tmp7=cell2mat(finalres_indvalue2(7));
xlswrite('C:\Users\asus\Desktop\test101.xlsx', tmp7,'NewTemp7','A2');

xlswrite('C:\Users\asus\Desktop\test101.xlsx', finalres_indname2(8),'NewTemp8','A1'); 
tmp8=cell2mat(finalres_indvalue2(8));
xlswrite('C:\Users\asus\Desktop\test101.xlsx', tmp8,'NewTemp8','A2');

xlswrite('C:\Users\asus\Desktop\test101.xlsx', finalres_indname2(9),'NewTemp9','A1'); 
tmp9=cell2mat(finalres_indvalue2(9));
xlswrite('C:\Users\asus\Desktop\test101.xlsx', tmp9,'NewTemp9','A2');

xlswrite('C:\Users\asus\Desktop\test101.xlsx', finalres_indname2(10),'NewTemp10','A1'); 
tmp10=cell2mat(finalres_indvalue2(10));
xlswrite('C:\Users\asus\Desktop\test101.xlsx', tmp10,'NewTemp10','A2');


%above work is to convey the result to Excel

%chracters=['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'];                  %━′
%hang=1;
%for k=1:11%yi gong you shi yi ge jie guo
%    tmp1=cell2mat(finalres_indname(k));
 % tmp2=cell2mat(finalres_indvalue(k));
%  [m1,n1] = size(tmp1);%DE DAO MU BIAO JU ZHEN DE GUI MO
%%  [m2,n2] = size(tmp2);
%  str1={chracters(1),hang};
%  str2={chracters(n1),hang+m1};
%  hang=hang+m1+1;
%  str3={chracters(1),hang};
%  str4={chracters(n2),hang+m2};
h = waitbar(1,'Please wait...');
for i=1:10000, % computation here %
waitbar(i/10000)
end

[filename,pathname]=uigetfile({'*.txt'},'choose a save path');
str=[pathname];
path = ['E:\test\test10.xlsx'] ;
savepath=str;
copyfile(path,savepath);
winopen('E:\test\test10.xlsx');

set(handles.edit1,'string','Finish save as excel')


% --------------------------------------------------------------------
function M2C_Callback(hObject, eventdata, handles)
% hObject    handle to M2C (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
s = sprintf('please choosefile.m\n\n');
msgbox(s,'please choosefile.m','help');pause(2);
[filename,pathname]=uigetfile({'*.m'},'choose file.m');
str=[pathname, filename];
mcc ：Cm str;


% --------------------------------------------------------------------
function M2C2_Callback(hObject, eventdata, handles)
% hObject    handle to M2C2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
s = sprintf('please choosefile.m\n\n');
msgbox(s,'please choosefile.m','help');pause(2);
[filename,pathname]=uigetfile({'*.m'},'choose file.m');
str=[pathname, filename];
mcc str;

% --------------------------------------------------------------------
function MTLABC_Callback(hObject, eventdata, handles)
% hObject    handle to MTLABC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
s = sprintf('please choosefile.c\n\n');
msgbox(s,'please choosefile.c','help');pause(2);
[filename,pathname]=uigetfile({'*.c'},'choose file.c');
str=[pathname, filename];
mex str;



% --------------------------------------------------------------------
function CREATEMFC_Callback(hObject, eventdata, handles)
% hObject    handle to CREATEMFC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
winopen('E:\：\matlab\C′━━MEX.doc');


% --------------------------------------------------------------------
function SCDEXCELSZW_Callback(hObject, eventdata, handles)
% hObject    handle to SCDEXCELSZW (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 Excel=actxserver('Excel.Application');
Workbook=Excel.Workbooks.Add;
Workbook.SaveAs('E:\test\test10.xlsx')
Workbook.Close;
%

xlswrite('E:\test\test10.xlsx', finalres_indname(1),'NewTemp','A1'); 
tmp1=cell2mat(finalres_indvalue(1));
xlswrite('E:\test\test10.xlsx', tmp1,'NewTemp','A2');

xlswrite('E:\test\test10.xlsx', finalres_indname(2),'NewTemp2','A1'); 
tmp2=cell2mat(finalres_indvalue(2));
xlswrite('E:\test\test10.xlsx', tmp2,'NewTemp2','A2');

xlswrite('E:\test\test10.xlsx', finalres_indname(3),'NewTemp3','A1'); 
tmp3=cell2mat(finalres_indvalue(3));
xlswrite('E:\test\test10.xlsx', tmp3,'NewTemp3','A2');

xlswrite('E:\test\test10.xlsx', finalres_indname(4),'NewTemp4','A1'); 
tmp4=cell2mat(finalres_indvalue(4));
xlswrite('E:\test\test10.xlsx', tmp4,'NewTemp4','A2');

xlswrite('E:\test\test10.xlsx', finalres_indname(5),'NewTemp5','A1'); 
tmp5=cell2mat(finalres_indvalue(5));
xlswrite('E:\test\test10.xlsx', tmp5,'NewTemp5','A2');

xlswrite('E:\test\test10.xlsx', finalres_indname(6),'NewTemp6','A1'); 
tmp6=cell2mat(finalres_indvalue(6));
xlswrite('E:\test\test10.xlsx', tmp6,'NewTemp6','A2');

xlswrite('E:\test\test10.xlsx', finalres_indname(2),'NewTemp7','A1'); 
tmp7=cell2mat(finalres_indvalue(7));
xlswrite('E:\test\test10.xlsx', tmp7,'NewTemp7','A2');

xlswrite('E:\test\test10.xlsx', finalres_indname(8),'NewTemp8','A1'); 
tmp8=cell2mat(finalres_indvalue(8));
xlswrite('E:\test\test10.xlsx', tmp8,'NewTemp8','A2');

xlswrite('E:\test\test10.xlsx', finalres_indname(9),'NewTemp9','A1'); 
tmp9=cell2mat(finalres_indvalue(9));
xlswrite('E:\test\test10.xlsx', tmp9,'NewTemp9','A2');

xlswrite('E:\test\test10.xlsx', finalres_indname(10),'NewTemp10','A1'); 
tmp10=cell2mat(finalres_indvalue(10));
xlswrite('E:\test\test10.xlsx', tmp10,'NewTemp10','A2');

xlswrite('E:\test\test10.xlsx', finalres_indname(11),'NewTemp11','A1'); 
tmp11=cell2mat(finalres_indvalue(11));
xlswrite('E:\test\test10.xlsx', tmp11,'NewTemp11','A2');
%above work is to convey the result to Excel

%chracters=['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'];                  %′：
%hang=1;
%for k=1:11%yi gong you shi yi ge jie guo
%    tmp1=cell2mat(finalres_indname(k));
 % tmp2=cell2mat(finalres_indvalue(k));
%  [m1,n1] = size(tmp1);%DE DAO MU BIAO JU ZHEN DE GUI MO
%%  [m2,n2] = size(tmp2);
%  str1={chracters(1),hang};
%  str2={chracters(n1),hang+m1};
%  hang=hang+m1+1;
%  str3={chracters(1),hang};
%  str4={chracters(n2),hang+m2};
h = waitbar(1,'Please wait...');
for i=1:10000, % computation here %
waitbar(i/10000)
end


[filename,pathname]=uigetfile({'*.txt'},'choose a save path');
str=[pathname];
path = ['E:\test\test10.xlsx'] ;
savepath=str;
copyfile(path,savepath);
winopen('E:\test\test10.xlsx');




% --------------------------------------------------------------------
function SCDEXCLDAPXIAN_Callback(hObject, eventdata, handles)
% hObject    handle to SCDEXCLDAPXIAN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Excel=actxserver('Excel.Application');
Workbook=Excel.Workbooks.Add;
Workbook.SaveAs('E:\test\test10.xlsx')
Workbook.Close;
%

xlswrite('E:\test\test10.xlsx', finalres_indname(1),'NewTemp','A1'); 
tmp1=cell2mat(finalres_indvalue(1));
xlswrite('E:\test\test10.xlsx', tmp1,'NewTemp','A2');

xlswrite('E:\test\test10.xlsx', finalres_indname(2),'NewTemp2','A1'); 
tmp2=cell2mat(finalres_indvalue(2));
xlswrite('E:\test\test10.xlsx', tmp2,'NewTemp2','A2');

xlswrite('E:\test\test10.xlsx', finalres_indname(3),'NewTemp3','A1'); 
tmp3=cell2mat(finalres_indvalue(3));
xlswrite('E:\test\test10.xlsx', tmp3,'NewTemp3','A2');

xlswrite('E:\test\test10.xlsx', finalres_indname(4),'NewTemp4','A1'); 
tmp4=cell2mat(finalres_indvalue(4));
xlswrite('E:\test\test10.xlsx', tmp4,'NewTemp4','A2');

xlswrite('E:\test\test10.xlsx', finalres_indname(5),'NewTemp5','A1'); 
tmp5=cell2mat(finalres_indvalue(5));
xlswrite('E:\test\test10.xlsx', tmp5,'NewTemp5','A2');

xlswrite('E:\test\test10.xlsx', finalres_indname(6),'NewTemp6','A1'); 
tmp6=cell2mat(finalres_indvalue(6));
xlswrite('E:\test\test10.xlsx', tmp6,'NewTemp6','A2');

xlswrite('E:\test\test10.xlsx', finalres_indname(2),'NewTemp7','A1'); 
tmp7=cell2mat(finalres_indvalue(7));
xlswrite('E:\test\test10.xlsx', tmp7,'NewTemp7','A2');

xlswrite('E:\test\test10.xlsx', finalres_indname(8),'NewTemp8','A1'); 
tmp8=cell2mat(finalres_indvalue(8));
xlswrite('E:\test\test10.xlsx', tmp8,'NewTemp8','A2');

xlswrite('E:\test\test10.xlsx', finalres_indname(9),'NewTemp9','A1'); 
tmp9=cell2mat(finalres_indvalue(9));
xlswrite('E:\test\test10.xlsx', tmp9,'NewTemp9','A2');

xlswrite('E:\test\test10.xlsx', finalres_indname(10),'NewTemp10','A1'); 
tmp10=cell2mat(finalres_indvalue(10));
xlswrite('E:\test\test10.xlsx', tmp10,'NewTemp10','A2');

xlswrite('E:\test\test10.xlsx', finalres_indname(11),'NewTemp11','A1'); 
tmp11=cell2mat(finalres_indvalue(11));
xlswrite('E:\test\test10.xlsx', tmp11,'NewTemp11','A2');
%above work is to convey the result to Excel

%chracters=['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'];                  %：━
%hang=1;
%for k=1:11%yi gong you shi yi ge jie guo
%    tmp1=cell2mat(finalres_indname(k));
 % tmp2=cell2mat(finalres_indvalue(k));
%  [m1,n1] = size(tmp1);%DE DAO MU BIAO JU ZHEN DE GUI MO
%%  [m2,n2] = size(tmp2);
%  str1={chracters(1),hang};
%  str2={chracters(n1),hang+m1};
%  hang=hang+m1+1;
%  str3={chracters(1),hang};
%  str4={chracters(n2),hang+m2};
h = waitbar(1,'Please wait...');
for i=1:10000, % computation here %
waitbar(i/10000)
end


[filename,pathname]=uigetfile({'*.txt'},'choose a save path');
str=[pathname];
path = ['E:\test\test10.xlsx'] ;
savepath=str;
copyfile(path,savepath);
winopen('E:\test\test10.xlsx');




% --------------------------------------------------------------------
function qicanshu_Callback(hObject, eventdata, handles)
% hObject    handle to qicanshu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    function [rad]=dms_rad(dms)
        d=fix(dms);
        f1=(dms-d).*100;
        f=fix(f1);
        m=(f1-f).*100;
        f=f./60;
        m=m./3600;
        r=(d+f+m)./180;
        rad=r.*pi;
        
        function [dms]=rad_mds(rad)
            a=mod(rad,2*pi);
            d=rad2deg(a);
            d1=fix(d);
            d2=(d-d1).*60;
            f=fix(d2);
            f1=(d2-f).*60;
            dms=d1+f./100+f1./10000;
% --------------------------------------------------------------------

         
function BLH2XYZ_Callback(hObject, eventdata, handles)
% hObject    handle to BLH2XYZ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global X;global Y;global Z;global B;global L;global H;global n_tra;global ellipsoid;
B = inputdlg('chooseB');
B= str2double(B);
L = inputdlg('chooseL');
L= str2double(L);
H = inputdlg('chooseH');
H= str2double(H);

B=dms_rad(B);
L=dms_rad(L);
a=6378137;
b=6356752.3142;
e=(sqrt(a^2-b^2))/a;
e1=(sqrt(a^2-b^2))/b;
V=sqrt(1+(e1.^2).*cos(B).^2);
c=(a.^2)/b;
N=c./V;
X=(N+H).*cos(B).*cos(L);
Y=(N+H).*cos(B).*sin(L);
Z=(N.*(1-e.^2)+H).*sin(B);

X=num2str(X)
Y=num2str(Y)
Z=num2str(Z)


str={'X=';X;'Y=';Y;'Z=';Z}
msgbox(str)

set(handles.edit1,'string','BLH2XYZ IS FINISHED')



% --------------------------------------------------------------------
 
                
                
                
function GSZS_Callback(hObject, eventdata, handles)
% hObject    handle to GSZS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
rho=206265;
a=6378245;
b=6356863.018773;
e=sqrt((a*a-b*b)./a./a);
e2=sqrt((a*a-b*b)./b./b);
c=a*sqrt(1+e2*e2);
S=44797.2826;
B1=deg2rad(47.78129083);
L1=deg2rad(35.82675833);
A12=deg2rad(44.20379556);
Amnew=A12;
Bmnew=B1;

while 1
Amold= Amnew;
Bmold=Bmnew;
V=sqrt(1-e*e*cos(Bmold)*cos(Bmold));
M=c./V./V./V;
N=c./V;
deltaB=rho./M.*S.*cos(Amold);
deltaL=rho./N.*S.*sin(Amold).*sec(Bmold);
deltaA=deltaL.*sin(Bmold);

deltaLFIN=deltaL.*(1+deltaA.*deltaA./24./rho./rho-deltaB.*deltaB./24./rho./rho);
deltaBFIN=deltaB.*(1+deltaL.*deltaL./12./rho./rho+deltaA.*deltaA./24./rho./rho);
deltaAFIN=deltaA.*(1+deltaB.*deltaB./12./rho./rho+deltaL.*deltaL./12./rho./rho*cos(Bmnew)+deltaA.*deltaA./24./rho./rho);

B2=B1+deltaBFIN;
L2=L1+deltaLFIN;
A21=A12+deltaAFIN;

Bmnew=(B1+B2)./2;
Amnew=(A12+A21)./2;

V=sqrt(1-e*e*cos(Bmnew)*cos(Bmnew));
M=c./V./V./V;
N=c./V;
newdeltaB=rho./M.*S.*cos(Amnew);
newdeltaL=rho./N.*S.*sin(Amnew).*sec(Bmnew);
newdeltaA=deltaL.*sin(Bmnew);

deltaLFINnew=newdeltaL.*(1+newdeltaA.*newdeltaA./24./rho./rho-newdeltaB.*newdeltaB./24./rho./rho);
deltaBFINnew=newdeltaB.*(1+newdeltaL.*newdeltaL./12./rho./rho+newdeltaA.*newdeltaA./24./rho./rho);
deltaAFINnew=newdeltaA.*(1+newdeltaB.*newdeltaB./12./rho./rho+newdeltaL.*newdeltaL./12./rho./rho*cos(Bmnew)+newdeltaA.*newdeltaA./24./rho./rho);


a=abs(deltaLFINnew-deltaLFIN);
b=abs(deltaBFINnew-deltaBFIN);
c=abs(deltaAFINnew-deltaAFIN);


if a<0.00000000000000001&&b<0.000000000000000001&&c<0.000000000000000001
    break;
end
B2=B1+deltaLFINnew;
L2=L1+deltaBFINnew;
A21=A12+deltaAFINnew;

Bmnew=(B1+B2)./2;
Amnew=(A12+A21)./2;

end




B2=rad2deg(B2);
L2=rad2deg(L2);
A21=rad2deg(A21);


% --------------------------------------------------------------------
function GSFS_Callback(hObject, eventdata, handles)
% hObject    handle to GSFS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
rho=206265;
a=6378245;
b=6356863.018773;
e=sqrt((a*a-b*b)./a./a);
e2=sqrt((a*a-b*b)./b./b);
c=a*sqrt(1+e2*e2);

A=-1.2258e+015;
B=1.2905e+015;

 yita=e2*cos(B);
 t=tan(B);
deltaL=0.419075111;
deltaB=0.288053166;
 
 V=sqrt(1-e*e*cos(B)*cos(B));
 N=c./V;
 
 r01= N./rho.*cos(B);
 r21=N.*cos(B)./24./rho./rho./rho./V./V./V./V*(1+ yita.* yita-9.* yita.* yita.*t.*t+yita.*yita.*yita.*yita);
 r03=-N./24./rho./rho./rho.*cos(B).*cos(B).*cos(B).*t.*t;
 
 S10= N./rho./ V./ V;
 S12=-N./24./rho./rho./rho./ V./ V.*cos(B).*cos(B).*(2+3*t.*t+2* yita* yita);
 S30=N./8./rho./rho./rho./V./V./V./V./V./V*( yita* yita-t*t* yita* yita+yita.*yita.*yita.*yita);
 
 t01=t*cos(B);
 t21=1/24./rho./rho./V./V./V./V.*cos(B).*t.*(2+7*yita.*yita+9.*t.*t.* yita.* yita+5.* yita.* yita.* yita.* yita);
 t03=1./24./rho./rho.*cos(B).*cos(B).*cos(B).*t.*(2+t.*t+2.*yita.*yita);
 
 
 deltaA=t01*deltaL+t21*deltaB*deltaB*deltaL+t03*deltaL*deltaL*deltaL;
 
 
SsinAm=r01*deltaL+ r21*deltaB*deltaB*deltaL+r03*deltaL*deltaL*deltaL;
ScosAm= S10*deltaB+S12*deltaB*deltaL*deltaL+S30*deltaB*deltaB*deltaB;

Am=atan(SsinAm/ScosAm);

S=SsinAm/sin(Am);

A12=Am-1/2*deltaA;
A21=Am+1/2*deltaA;



% --------------------------------------------------------------------
function Seven_Callback(hObject, eventdata, handles)
% hObject    handle to Seven (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function CSSR_SEVEN_Callback(hObject, eventdata, handles)
% hObject    handle to CSSR_SEVEN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global A;global B;


s = sprintf('please choosepoints1\n\n');
msgbox(s,'please choosepoints1','help');pause(2);
[filename,pathname]=uigetfile({'*.txt'},'choose points1');
str1=[pathname, filename];
A=load(str1);%%choose a B_IND FROM a sure file

s = sprintf('please choosepoints2\n\n');
msgbox(s,'please choose points2','help');pause(2); 
[filename,pathname]=uigetfile({'*.txt'},'choose points2');
str2=[pathname, filename];
B=load(str2);

set(handles.edit1,'string','data is inputed')

% --------------------------------------------------------------------
function JS_Callback(hObject, eventdata, handles)
% hObject    handle to JS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global A;global B;
Xa=A(:,1);
Ya=A(:,3)
Za=A(:,3)
Xb=B(:,1)
Yb=B(:,2)
Zb=B(:,3)
L=[Xb-Xa;Yb-Ya;Zb-Za];
[m,n]=size(A);
if(m<3)
    return;
end
C=[ones(m,1),zeros(m,1),zeros(m,1),zeros(m,1),-Za,Ya,Xa;
zeros(m,1),ones(m,1),zeros(m,1),Za,zeros(m,1),-Xa,Ya;
zeros(m,1),zeros(m,1),ones(m,1),-Ya,Xa,zeros(m,1),Za];
N=C'*C;
W=C'*L;
dx=N\W
dx=num2str(dx)
str={'deltaX=','deltaY=','deltaZ=','sigmax=','sigmay=','sigmaz=','k='}
msgbox(str)
msgbox(dx)
set(handles.edit1,'string','Finish translation ')
% --------------------------------------------------------------------
function GS_CSSR_ZS_Callback(hObject, eventdata, handles)
% hObject    handle to GS_CSSR_ZS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global B ;global L ;global L0 ;global n ;
B = inputdlg('chooseB');
B= str2double(B);
L = inputdlg('chooseL');
L= str2double(L);
L0 = inputdlg('chooseL0');
L0= str2double(L0);


set(handles.edit1,'string','data is inputed')
% --------------------------------------------------------------------
function GS_JSZS_Callback(hObject, eventdata, handles)
% hObject    handle to GS_JSZS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global B ;global L ;global L0 ;global n ;
B=dms_rad(B);
L=dms_rad(L);
L0=dms_rad(L0);

a=6378137;
b=6356752.3142;
e=(sqrt(a^2-b^2))/a;
e1=(sqrt(a^2-b^2))/b;
X=get_X(B,a,b,e1);
V=sqrt(1+(e1.^2).*cos(B).^2);
c=(a.^2)/b;
M=c./(V.^3);
N=c./V;
t=tan(B);
n=sqrt((e1.^2).*(cos(B)).^2);
l=L-L0;
xp1=X
xp2=(N.*sin(B).*cos(B).*l.^2)./2         
xp3=(N.*sin(B).*((cos(B)).^3).*(5-t.^2+9.*n.^2+4.*n.^4).*l.^4)./24;
xp4=(N.*sin(B).*((cos(B)).^5).*(61-58.*t.^2+t.^4).*l.^6)./720;
x=xp1+xp2+xp3+xp4;
yp1=N.*cos(B).*l;
yp2=N.*(cos(B) ) .^3.*(1-t.^2+n.^2).*l.^3/6;
yp3=N.*(cos(B)).^5.*(5-18.*t.^2+t.^4+14.*n.^2-58.*(n.^2).*(t.^2)).*l.^5/120;
y=yp1+yp2+yp3;
x=num2str(x)
y=num2str(y)
 str={'x=',x,'y=',y};
 msgbox(str);
set(handles.edit1,'string','Finish Gauss positive formula ')
% --------------------------------------------------------------------
function GS_FS_CSSR_Callback(hObject, eventdata, handles)
% hObject    handle to GS_FS_CSSR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global X,global Y;global L0;global n;
X = inputdlg('chooseX');
X= str2double(X);
Y = inputdlg('chooseY');
Y= str2double(Y);
L0 = inputdlg('chooseL0');
L0= str2double(L0);

set(handles.edit1,'string','data is inputed')

function [F1,F2]=getF1F2(a,e2,Bi,Li)
 c=a.*sqrt(1+e2);
 t=tan(Bi);
 ng=sqrt(e2.*cos(Bi).^2);
 V=sqrt(1+ng.^2);
 N=c./V;
 a1=N.*cos(Bi);
 a2=0.5.*N.*cos(Bi).*sin(Bi);
 a3=N.*cos(Bi).^3.*(1-t.^2+ng.^2)./6;
 a6=N.*sin(Bi).*cos(Bi).^5.*(61-58.*t.^2+t.^4)./720;
 a4=N.*sin(Bi).*cos(Bi).^3.*(5-t.^2+9.*ng.^2+4.*ng.^4)./24;
 b0=1-0.75.*e2+(45.0/64).*e2.^2-(175/256).*e2^3+(11025.0/16384).*e2.^4.0;
 b2=b0-1;
 b4=15.*e2^2./32-175.*e2^3./384+3675.*e2^4./8192;
 b6=-35.*e2^3./96+735.*e2^4./2048;
 b8=315.*e2^4./1024;
 F1=(c.*b2+(c.*b4+(c.*b6+c.*b8.*cos(Bi).^2).*cos(Bi).^2).*cos(Bi).^2.0).*sin(Bi).*cos(Bi);
 F2=a2.*Li.*Li+a4.*Li.^4.0+a6.*Li.^6.0;

function  [F3]=getF3(a,e2,Bi,Li)
    c=a.*sqrt(1+e2);
    t=tan(Bi);
    ng=sqrt(e2.*cos(Bi).^2);
    V=sqrt(1+ng.^2);
    N=c./V;
    a3=N.*cos(Bi).^3.*(1-t.^2+ng.^2)./6;
    a5=N.*cos(Bi).^5.*(5-18.*t.^2+t.^4+14.*ng.^2-58.*t.^2.*ng.^2)./120;
    F3=a3.*Li.^3+a5.*Li.*5;



% --------------------------------------------------------------------
function GS_FS_JS_Callback(hObject, eventdata, handles)
% hObject    handle to GS_FS_JS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global X,global Y;global L0;global n;
LO=dms_rad(L0);
%ellipsoid=get_ellipsoid(n);
%a=ellipsoid.a;
%b=ellipsoid.b;
a=6378137;
b=6356752.3142;
e1=(sqrt(a^2-b^2))/a;
e2=(sqrt(a^2-b^2))/b;
e1=e1.^2;
e2=e2.^2;
c=a.*sqrt(1+e2);
b=1-0.75.*e2+(45.0/64).*e2^2-(175.0/256).*e2^3.0+(11025.0/16384).*e2^4.0;
B0=X/(c*b);
kq=1-e1.*sin(B0).^2.0;
a1=a.*cos(B0)./sqrt(kq);
IO=Y./a1;
an=length(X);
dd=0.00000000001;
dx=dd.*ones(1,an);
Bi=B0;
li=IO;

while(1)
    [f1,f2]=getF1F2(a,e2,Bi,li);
    Bi=(X-f1-f2)./(c.*b);
    kq=(1-e1.*sin(Bi).^2.0);
    a1=a.*cos(Bi)./sqrt(kq);
    f3=getF3(a,e2,Bi,IO);
    li=(Y-f3)./a1;
    dB=B0-Bi;
    dL=IO-li;
    dB=abs(dB);
    dL=abs(dL);
    IO=li;
    B0=Bi;
    ai=dB<dx;
    bi=dL<dx;
    aii=sum(ai);
    bii=sum(bi);
    if(aii==an||bii==an)
        break;
    end
end

L=L0+li;
B=Bi;
L=rad_mds(L)
B=rad_mds(B)
B=num2str(B)
L=num2str(L)
str={'B=',B,'L=',L}
msgbox(str);

set(handles.edit1,'string','Finish GaussNegative formula ')



% --------------------------------------------------------------------
function CSSR_FHSZLU_Callback(hObject, eventdata, handles)
% hObject    handle to CSSR_FHSZLU (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global guanceluxianchangdu;global obsvalue_szw;global guanceshu;global yizhidiandezhi;global weizhidiandezhi; global weizhidianshumu;global L_SZW;global B_SZW;global P_SZW;global v_SZW;global Sigma0_SZW;global Xadj_SZW;global Ladj_ind;

s = sprintf('please chooselength of obsevation path');% lu xian chang du
msgbox(s,'please chooselength','help');pause(2);
[filename,pathname]=uigetfile({'*.txt'},'choose length');
str=[pathname, filename];
guanceluxianchangdu=load(str);


s = sprintf('please chooseobservation value');%guanezhi
msgbox(s,'please choosevalue','help');pause(2);
[filename,pathname]=uigetfile({'*.txt'},'choose value');
str=[pathname, filename];
obsvalue_szw=load(str);



s = sprintf('please chooseknown points value');%guanezhi
msgbox(s,'please chooseknown_value','help');pause(2);
[filename,pathname]=uigetfile({'*.txt'},'choose value');
str=[pathname, filename];
yizhidiandezhi=load(str);

weizhidianshumu= inputdlg('input unknown_number');
weizhidianshumu= str2double(weizhidianshumu);

yizhidianshumu= 2;

guanceshu= inputdlg('choose guanceshu');
guanceshu= str2double(guanceshu);


set(handles.edit1,'string','data is inputed')
% --------------------------------------------------------------------
function YJPC_FHSZLX_Callback(hObject, eventdata, handles)
% hObject    handle to YJPC_FHSZLX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global guanceluxianchangdu;global obsvalue_szw;global guanceshu;global yizhidiandezhi;global weizhidiandezhi; global weizhidianshumu;global L_SZW;global B_SZW;global P_SZW;global v_SZW;global Sigma0_SZW;global Xadj_SZW;global Ladj_ind;

guanceluxianchangdu=1./guanceluxianchangdu;
P_SZW=diag(guanceluxianchangdu);
sum=0;
for i=1:guanceshu
    sum=sum+obsvalue_szw(i);
end
chazhi=yizhidiandezhi(1)+sum-yizhidiandezhi(2);
zonggaizhengzhi=-chazhi;
V_SZW=ones(guanceshu);
for i=1:guanceshu
    V_SZW(i,i)=zonggaizhengzhi*P_SZW(i);
end
for i=1:guanceshu
    obsvalue_szw(i)=obsvalue_szw(i)+V_SZW(i,i);
end
disp('obsvalueadj');
str1=num2str(obsvalue_szw)
msgbox('observation adjustment=');
msgbox(str1)


set(handles.edit1,'string','Finish adjustment of level ')
    
% --------------------------------------------------------------------
function CSSR_BHSZLX_Callback(hObject, eventdata, handles)
% hObject    handle to CSSR_BHSZLX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global guanceluxianchangdu;global obsvalue_szw;global guanceshu;global yizhidiandezhi;global weizhidiandezhi; global weizhidianshumu;global L_SZW;global B_SZW;global P_SZW;global v_SZW;global Sigma0_SZW;global Xadj_SZW;global Ladj_ind;

s = sprintf('please chooselength of obsevation path\n\n');% lu xian chang du
msgbox(s,'please chooselength','help');pause(2);
[filename,pathname]=uigetfile({'*.txt'},'choose length');
str=[pathname, filename];
guanceluxianchangdu=load(str);


s = sprintf('please chooseobservation value\n\n');%guanezhi
msgbox(s,'please choosevalue','help');pause(2);
[filename,pathname]=uigetfile({'*.txt'},'choose value');
str=[pathname, filename];
obsvalue_szw=load(str);



s = sprintf('please chooseyizhidiandezhi\n\n');%guanezhi
msgbox(s,'please chooseknown_value','help');pause(2);
[filename,pathname]=uigetfile({'*.txt'},'choose value');
str=[pathname, filename];
yizhidiandezhi=load(str);

weizhidianshumu= inputdlg('choose unknown_number');
weizhidianshumu= str2double(weizhidianshumu);

yizhidianshumu= 1;

guanceshu= inputdlg('choose guanceshu');
guanceshu= str2double(guanceshu);


set(handles.edit1,'string','data is inputed')
% --------------------------------------------------------------------
function YJPC_BHSZLX_Callback(hObject, eventdata, handles)
% hObject    handle to YJPC_BHSZLX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global guanceluxianchangdu;global obsvalue_szw;global guanceshu;global yizhidiandezhi;global weizhidiandezhi; global weizhidianshumu;global L_SZW;global B_SZW;global P_SZW;global v_SZW;global Sigma0_SZW;global Xadj_SZW;global Ladj_ind;

guanceluxianchangdu=1./guanceluxianchangdu;
P_SZW=diag(guanceluxianchangdu);
sum=0;
for i=1:guanceshu
    sum=sum+obsvalue_szw(i);
end
chazhi=sum-yizhidiandezhi;
zonggaizhengzhi=-chazhi;
V_SZW=ones(guanceshu);
for i=1:guanceshu
    V_SZW(i,i)=zonggaizhengzhi*P_SZW(i);
end
for i=1:guanceshu
    obsvalue_szw(i)=obsvalue_szw(i)+V_SZW(i,i);
end
disp('obsvalueadj');
msgbox(obsvalue_szw);
set(handles.edit1,'string','Finish adjustment of level ')
% --------------------------------------------------------------------
function FHSZLX_Callback(hObject, eventdata, handles)
% hObject    handle to FHSZLX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function BHSZLX_Callback(hObject, eventdata, handles)
% hObject    handle to BHSZLX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    function [X]=get_X(B,a,b,e2)
        e2=e2^2;
b0=1-3.*e2./4+45.*e2^2./64-175.*e2^3/256+11025.*e2^4./16384;
b2=b0-1;
b4=15.*e2./32-175.*e2^3./384+3675.*e2^4./8192;
b6=-35.*e2^3./96+735.*e2^4./2048;
b8=315.*e2^4./1024;
c=a.^2./b;
X=c.*(b0.*B+(b2.*cos(B)+b4.*cos(B).^3+b6.*cos(B).^5+b8.*cos(B).^7).*sin(B));


% --------------------------------------------------------------------
function Get_X_Callback(hObject, eventdata, handles)
% hObject    handle to Get_X (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global B;global a;global b;global e2;
B = inputdlg('chooseB');
B= str2double(B);
a = inputdlg('choosea');
a= str2double(a);
b = inputdlg('chooseb');
b= str2double(b);
e2 = inputdlg('choosee2');
e2= str2double(e2);
e2=e2^2;
b0=1-3.*e2./4+45.*e2^2./64-175.*e2^3/256+11025.*e2^4./16384;
b2=b0-1;
b4=15.*e2./32-175.*e2^3./384+3675.*e2^4./8192;
b6=-35.*e2^3./96+735.*e2^4./2048;
b8=315.*e2^4./1024;
c=a.^2./b;
X=c.*(b0.*B+(b2.*cos(B)+b4.*cos(B).^3+b6.*cos(B).^5+b8.*cos(B).^7).*sin(B));
str1=num2str(X);
str={'X=',str1};
msgbox(str);

set(handles.edit1,'string','Finish calculating  meridian arc length')



% --------------------------------------------------------------------
function HZDGX_Callback(hObject, eventdata, handles)
% hObject    handle to HZDGX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)






% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global X;global Y;global Z;
s = sprintf('please chooseX\n\n');
msgbox(s,'please chooseX','help');pause(2);
[filename,pathname]=uigetfile({'*.txt'},'choose X');
str=[pathname, filename];
X=load(str);

s = sprintf('please chooseY\n\n');
msgbox(s,'please chooseY','help');pause(2);
[filename,pathname]=uigetfile({'*.txt'},'choose Y');
str=[pathname, filename];
Y=load(str);

s = sprintf('please chooseZ\n\n');
msgbox(s,'please chooseZ','help');pause(2);
[filename,pathname]=uigetfile({'*.txt'},'choose Z');
str=[pathname, filename];
Z=load(str);




% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global X;global Y;global Z;

if get(handles.radiobutton1,'value')
    option=1;
elseif get(handles.radiobutton2,'value')
    option=2;
elseif get(handles.radiobutton3,'value')
    option=3;
    elseif get(handles.radiobutton4,'value')
    option=4;
end


figure(1)
if option==1
subplot(2,2,1)
contour(X,Y,Z,16)
title('1')
xlabel('x-axis')
ylabel('y-axis')
colorbar;
elseif option==2
subplot(2,2,3)
contour3(X,Y,Z,16)
title('2')
xlabel('x-axis')
ylabel('y-axis')
zlabel('z-axis')
colorbar;
elseif option==3
subplot(2,2,2)
surf(X,Y,Z)
title('1')
xlabel('x-axis')
ylabel('y-axis')
zlabel('z-axis')
colorbar;
elseif option==4
subplot(2,2,4)
surfc(X,Y,Z)
title('2')
xlabel('x-axis')
ylabel('y-axis')
zlabel('z-axis')
colorbar;
end
set(handles.edit1,'string',  'finish contour')

% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background, change
%       'usewhitebg' to 0 to use default.  See ISPC and COMPUTER.
usewhitebg = 1;
if usewhitebg
    set(hObject,'BackgroundColor',[.9 .9 .9]);
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end




% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1
set(handles.radiobutton1,'value',1);
set(handles.radiobutton2,'value',0);
set(handles.radiobutton3,'value',0);
set(handles.radiobutton4,'value',0);




% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.radiobutton1,'value',0);
set(handles.radiobutton2,'value',1);
set(handles.radiobutton3,'value',0);
set(handles.radiobutton4,'value',0);

% Hint: get(hObject,'Value') returns toggle state of radiobutton2




% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton3
set(handles.radiobutton1,'value',0);
set(handles.radiobutton2,'value',0);
set(handles.radiobutton3,'value',1);
set(handles.radiobutton4,'value',0);




% --- Executes on button press in radiobutton4.
function radiobutton4_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton4
set(handles.radiobutton1,'value',0);
set(handles.radiobutton2,'value',0);
set(handles.radiobutton3,'value',0);
set(handles.radiobutton4,'value',1);




% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end




% --------------------------------------------------------------------
function JSRYYDDWC_Callback(hObject, eventdata, handles)
% hObject    handle to JSRYYDDWC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global point_x;global point_y;global distance;
msgbox('Please mousedown a point')
pause(2)
[x,y] = ginput(1)
point_x=x
point_y=y
distance=sqrt(point_x*point_x+point_y*point_y)
str=num2str(distance);
str1='distance=';
res={str1,str};
res=cell2mat(res);
msgbox(res);




function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end




% --- Executes during object creation, after setting all properties.
function pushbutton4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called




% --------------------------------------------------------------------
function CSSR_DX_Callback(hObject, eventdata, handles)
% hObject    handle to CSSR_DX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function [ellipsoid]=get_ellipsoid(n)
     global ellipsoid;
     if n==1
                    ellipsoid.a=1;
                     ellipsoid.b=2;
     elseif n==2   
         ellipsoid.a=1;
          ellipsoid.b=2;
           elseif n==3   
         ellipsoid.a=1;
          ellipsoid.b=2;
       end
% --------------------------------------------------------------------
function XYZ2BLH_Callback(hObject, eventdata, handles)
% hObject    handle to XYZ2BLH (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global X;global Y;global Z;global n;
X = inputdlg('chooseX');
X= str2double(X);
Y = inputdlg('chooseY');
Y= str2double(Y);
Z = inputdlg('chooseZ');
Z= str2double(Z);
dd=4.8*10^-10.0;
a=6378137;
b=6356752.3142;
e1=(sqrt(a^2-b^2))/a;
ee=e1.^2;
aa=a;
L=atan(Y./X)
B0=Z./sqrt(X.*X+Y.*Y);
B0=atan(B0);
Bi=B0;
while(1)
    N0=aa./sqrt(1-ee.*sin(Bi).^2.0);
    tanB=(Z+N0.*ee.*sin(Bi))./sqrt(X.*X+Y.*Y);
    Bi=atan(tanB)
    dB=Bi-B0;
    dB=abs(dB);
    B0=Bi;
    if(dB<dd)
        break;
    end
end
N=N0;
B=B0;
if(L<0)
    L=L+pi;
end
H=Z./sin(B)-N.*(1-ee);
B=rad_mds(B);
L=rad_mds(B);
B=num2str(B)
H=num2str(H)
L=num2str(L)

str={'B=',B,'L=',L,'H=',H};
msgbox(str);
set(handles.edit1,'string','XYZ2BLH IS FINISHED')


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global X;global Y;global Z;
s = sprintf('please chooseX\n\n');
msgbox(s,'please chooseX','help');pause(2);
[filename,pathname]=uigetfile({'*.txt'},'choose X');
str=[pathname, filename];
X=load(str);%%choose a B_IND FROM a sure file

s = sprintf('please chooseY\n\n');
msgbox(s,'please chooseY','help');pause(2);
[filename,pathname]=uigetfile({'*.txt'},'choose Y');
str=[pathname, filename];
Y=load(str);%%choose a B_IND FROM a sure file

s = sprintf('please chooseZ\n\n');
msgbox(s,'please chooseZ','help');pause(2);
[filename,pathname]=uigetfile({'*.txt'},'choose Z');
str=[pathname, filename];
Z=load(str);%%choose a B_IND FROM a sure file


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1);
cla reset



