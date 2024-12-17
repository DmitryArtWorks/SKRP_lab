
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% - ÔÓÍÊÖÈÈ ÈÍÈÖÈÀËÈÀÖÈÈ. ÍÅ ÒĞÎÃÀÒÜ!!! - %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function varargout = gui_lab01(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_lab01_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_lab01_OutputFcn, ...
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


function gui_lab01_OpeningFcn(hObject, ~, handles, varargin)

handles.output = hObject;
guidata(hObject, handles);


function varargout = gui_lab01_OutputFcn(~, ~, handles) 

varargout{1} = handles.output;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%% - ÊÍÎÏÊÀ ÏÎÑÒĞÎÅÍÈß ÃĞÀÔÈÊÀ Â ÎÊÍÅ - %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function pushbutton_plot_Callback(hObject, ~, handles)

if get(handles.checkbox9, 'Value')
    handles.dat09 = 1;
    guidata(gcbo, handles);
else
    handles.dat09 = 0;
    guidata(gcbo, handles);
end

% êíîïêà "Ïîñòğîèòü" íåäîñòóïíà ïîñëå âûâîäà ãğàôèêà         % !!!!!!!
set(hObject, 'Enable', 'off')                                % !!!!!!!

% çàïóñê ñêğèïòà
Lab_3_1;

% êíîïêà "Î÷èñòèòü" äîñòóïíà ïîñëå âûâîäà ãğàôèêà            % !!!!!!!
set(handles.pushbutton_clear, 'Enable', 'on')                % !!!!!!!
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
set(handles.pushbutton4, 'Enable', 'on')    

%%% - ÊÍÎÏÊÀ "ÏÎÑÒĞÎÈÒÜ" ÏÅĞÂÎÍÀ×ÀËÜÍÎ ÍÅÄÎÑÒÓÏÍÀ - %%%%%%%%%%%%%%%%%%%%%%%
function pushbutton_plot_CreateFcn(hObject, ~, ~)

set(hObject, 'Enable', 'off')                                              % !!!!!!!
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 

%%% - ÊÍÎÏÊÀ Î×ÈÑÒÊÈ ÎÊÍÀ Ñ ÃĞÀÔÈÊÀÌÈ - %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function pushbutton_clear_Callback(hObject, ~, handles)

% î÷èñòêà îñåé
cla reset
axes_CreateFcn

% êíîïêà "Î÷èñòèòü" íåäîñòóïíà ïîñëå î÷èñòêè                               % !!!!!!!
set(hObject, 'Enable', 'off')                                              % !!!!!!!

% êíîïêà "Ïîñòğîèòü" äîñòóïíà ïîñëå î÷èñòêè                                % !!!!!!!
set(handles.pushbutton_plot, 'Enable', 'on')                               % !!!!!!!
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
set(handles.pushbutton4, 'Enable', 'off')

%%% - ÊÍÎÏÊÀ "Î×ÈÑÒÈÒÜ" ÏÅĞÂÎÍÀ×ÀËÜÍÎ ÍÅÄÎÑÒÓÏÍÀ - %%%%%%%%%%%%%%%%%%%%%%%%
function pushbutton_clear_CreateFcn(hObject, ~, ~)

set(hObject, 'Enable', 'off')                                              % !!!!!!!
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%% - ÏÅĞÂÎÍÀ×ÀËÜÍÀß ÍÀÑÒĞÎÉÊÀ ÎÑÅÉ - %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function axes_CreateFcn(~, ~, ~)
% axis equal
box on
grid on

set(gca, 'XLim', [ 0  6.0*10^3 ]);
set(gca, 'YLim', [ 0  4.0*10^3 ]);

xlabel('L, ì');
ylabel('H, ì');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%% - ÌÅÍŞ ÂÛÁÎĞÀ ÌÀÍÅÂĞÀ - %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function popupmenu_manevr_Callback(hObject, ~, handles)

slctn = get(hObject,'Value');
switch slctn
    case (1 +1)
        handles.dat2 = 3;
        guidata(gcbo, handles);
    case (2 +1)
        handles.dat2 = 1;
        guidata(gcbo, handles);
    case (3 +1)
        handles.dat2 = 2;
        guidata(gcbo, handles);
end


slctn2 = get(handles.popupmenu_graph,'Value');

if ((slctn2 - 1)*(slctn - 1)) > 0
    % êíîïêà "Ïîñòğîèòü" äîñòóïíà ïîñëå âûáîğà âèäà ãğàôèêà                % !!!!!!!
    set(handles.pushbutton_plot, 'Enable', 'on')                           % !!!!!!!
else
    set(handles.pushbutton_plot, 'Enable', 'off')                          % !!!!!!!
end

function popupmenu_manevr_CreateFcn(hObject, ~, ~)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%% - ÌÅÍŞ ÂÛÁÎĞÀ ÂÈÄÀ ÃĞÀÔÈÊÀ - %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function popupmenu_graph_Callback(hObject, ~, handles)

slctn = get(hObject,'Value');
switch slctn
    case (1 +1)
        handles.dat3 = 1;
        guidata(gcbo, handles);
    case (2 +1)
        handles.dat3 = 2;
        guidata(gcbo, handles);
    case (3 +1)
        handles.dat3 = 3;
        guidata(gcbo, handles);
    case (4 +1)
        handles.dat3 = 4;
        guidata(gcbo, handles);
    case (5 +1)
        handles.dat3 = 5;
        guidata(gcbo, handles);
    case (6 +1)
        handles.dat3 = 6;
        guidata(gcbo, handles);
    case (7 +1)
        handles.dat3 = 7;
        guidata(gcbo, handles);
end


slctn2 = get(handles.popupmenu_manevr,'Value');

if ((slctn2 - 1)*(slctn - 1)) > 0
    % êíîïêà "Ïîñòğîèòü" äîñòóïíà ïîñëå âûáîğà âèäà ãğàôèêà                % !!!!!!!
    set(handles.pushbutton_plot, 'Enable', 'on')                           % !!!!!!!
else
    set(handles.pushbutton_plot, 'Enable', 'off')                          % !!!!!!!
end

function popupmenu_graph_CreateFcn(hObject, ~, ~)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%% - ÎÁËÀÑÒÜ ÂÂÎÄÀ ÊÎÎĞÄÈÍÀÒÛ Z11 - %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function edit_z11_Callback(hObject, ~, handles)

handles.datz11 = str2double(get(hObject,'String'));
guidata(gcbo, handles);

function edit_z11_CreateFcn(hObject, ~, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

handles.datz11 = str2double(get(hObject,'String'));
guidata(gcbo, handles);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%% - ÎÁËÀÑÒÜ ÂÂÎÄÀ ÊÎÎĞÄÈÍÀÒÛ X11 - %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function edit_x11_Callback(hObject, ~, handles)

handles.datx11 = str2double(get(hObject,'String'));
guidata(gcbo, handles);

function edit_x11_CreateFcn(hObject, ~, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

handles.datx11 = str2double(get(hObject,'String'));
guidata(gcbo, handles);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%% - ÎÁËÀÑÒÜ ÂÂÎÄÀ ÊÎÎĞÄÈÍÀÒÛ Z21 - %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function edit_z21_Callback(hObject, ~, handles)

handles.datz21 = str2double(get(hObject,'String'));
guidata(gcbo, handles);

function edit_z21_CreateFcn(hObject, ~, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

handles.datz21 = str2double(get(hObject,'String'));
guidata(gcbo, handles);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%% - ÎÁËÀÑÒÜ ÂÂÎÄÀ ÊÎÎĞÄÈÍÀÒÛ X21 - %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function edit_x21_Callback(hObject, ~, handles)

handles.datx21 = str2double(get(hObject,'String'));
guidata(gcbo, handles);

function edit_x21_CreateFcn(hObject, ~, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

handles.datx21 = str2double(get(hObject,'String'));
guidata(gcbo, handles);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%% - ÎÁËÀÑÒÜ ÂÂÎÄÀ ÑÊÎĞÎÑÒÈ V11 - %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function edit_V11_Callback(hObject, ~, handles)

handles.dat_V11 = str2double(get(hObject,'String'));
guidata(gcbo, handles);

function edit_V11_CreateFcn(hObject, ~, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

handles.dat_V11 = str2double(get(hObject,'String'));
guidata(gcbo, handles);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%% - ÎÁËÀÑÒÜ ÂÂÎÄÀ ÑÊÎĞÎÑÒÈ V2 - %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function edit_V2_Callback(hObject, ~, handles)

handles.datV2 = str2double(get(hObject,'String'));
guidata(gcbo, handles);

function edit_V2_CreateFcn(hObject, ~, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

handles.datV2 = str2double(get(hObject,'String'));
guidata(gcbo, handles);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%





%%% - ÎÁËÀÑÒÜ ÂÂÎÄÀ ÑÊÎĞÎÑÒÈ PSI11 - %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function edit_psi11_Callback(hObject, ~, handles)

handles.dat_psi11 = str2double(get(hObject,'String'));
guidata(gcbo, handles);

function edit_psi11_CreateFcn(hObject, ~, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

handles.dat_psi11 = str2double(get(hObject,'String'));
guidata(gcbo, handles);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%







%%% - ÎÁËÀÑÒÜ ÂÂÎÄÀ ÑÊÎĞÎÑÒÈ PSI2 - %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function edit_psi2_Callback(hObject, ~, handles)

handles.datpsi2 = str2double(get(hObject,'String'));
guidata(gcbo, handles);

function edit_psi2_CreateFcn(hObject, ~, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

handles.datpsi2 = str2double(get(hObject,'String'));
guidata(gcbo, handles);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%% - ÎÁËÀÑÒÜ ÂÂÎÄÀ tk - %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function edit_tk_Callback(hObject, ~, handles)

handles.dat_tk = str2double(get(hObject,'String'));
guidata(gcbo, handles);

function edit_tk_CreateFcn(hObject, ~, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

handles.dat_tk = str2double(get(hObject,'String'));
guidata(gcbo, handles);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%% - ÎÁËÀÑÒÜ ÂÂÎÄÀ K_1 - %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function edit_K_1_Callback(hObject, ~, handles)

handles.dat_K_1 = str2double(get(hObject,'String'));
guidata(gcbo, handles);

function edit_K_1_CreateFcn(hObject, ~, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

handles.dat_K_1 = str2double(get(hObject,'String'));
guidata(gcbo, handles);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%% - ÎÁËÀÑÒÜ ÂÂÎÄÀ K_2 - %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function edit_K_2_Callback(hObject, ~, handles)

handles.dat_K_2 = str2double(get(hObject,'String'));
guidata(gcbo, handles);

function edit_K_2_CreateFcn(hObject, ~, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

handles.dat_K_2 = str2double(get(hObject,'String'));
guidata(gcbo, handles);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%% - ÎÁËÀÑÒÜ ÂÂÎÄÀ ÑÊÎĞÎÑÒÈ PS0 - %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function edit_psi0_Callback(hObject, ~, handles)

handles.datpsi0 = str2double(get(hObject,'String'));
guidata(gcbo, handles);

function edit_psi0_CreateFcn(hObject, ~, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

handles.datpsi0 = str2double(get(hObject,'String'));
guidata(gcbo, handles);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%% - ÎÁËÀÑÒÜ ÂÂÎÄÀ ÑÊÎĞÎÑÒÈ V0 - %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function edit_V0_Callback(hObject, ~, handles)

handles.datV0 = str2double(get(hObject,'String'));
guidata(gcbo, handles);

function edit_V0_CreateFcn(hObject, ~, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

handles.datV0 = str2double(get(hObject,'String'));
guidata(gcbo, handles);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%% - ÎÁËÀÑÒÜ ÂÂÎÄÀ ÊÎÎĞÄÈÍÀÒÛ Z0 - %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function edit_z0_Callback(hObject, ~, handles)

handles.datz0 = str2double(get(hObject,'String'));
guidata(gcbo, handles);

function edit_z0_CreateFcn(hObject, ~, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

handles.datz0 = str2double(get(hObject,'String'));
guidata(gcbo, handles);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%% - ÎÁËÀÑÒÜ ÂÂÎÄÀ ÊÎÎĞÄÈÍÀÒÛ X0 - %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function edit_x0_Callback(hObject, ~, handles)

handles.datx0 = str2double(get(hObject,'String'));
guidata(gcbo, handles);

function edit_x0_CreateFcn(hObject, ~, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

handles.datx0 = str2double(get(hObject,'String'));
guidata(gcbo, handles);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



% --------------------------------------------------------------------
function uipushtool6_ClickedCallback(~, ~, ~)

saveas(gui_lab01, 'screen.png')

% hObject    handle to uipushtool6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




%%% - ÎÁËÀÑÒÜ ÂÂÎÄÀ K_31 - %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function edit_K_31_Callback(hObject, ~, handles)

handles.dat_K_31 = str2double(get(hObject,'String'));
guidata(gcbo, handles);

function edit_K_31_CreateFcn(hObject, ~, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

handles.dat_K_31 = str2double(get(hObject,'String'));
guidata(gcbo, handles);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%% - ÎÁËÀÑÒÜ ÂÂÎÄÀ K_32 - %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function edit_K_32_Callback(hObject, ~, handles)

handles.dat_K_32 = str2double(get(hObject,'String'));
guidata(gcbo, handles);

function edit_K_32_CreateFcn(hObject, ~, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

handles.dat_K_32 = str2double(get(hObject,'String'));
guidata(gcbo, handles);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%% - ÎÁËÀÑÒÜ ÂÂÎÄÀ K_33 - %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function edit_K_33_Callback(hObject, ~, handles)

handles.dat_K_33 = str2double(get(hObject,'String'));
guidata(gcbo, handles);

function edit_K_33_CreateFcn(hObject, ~, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

handles.dat_K_33 = str2double(get(hObject,'String'));
guidata(gcbo, handles);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
datime = string(datetime("now", "Format", 'dd-MM-yyyy-HH-mm'));

%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% h = gcf; %current figure handle
% axesObjs = get(h, 'Children'); %axes handles
% dataObjs = get(axesObjs, 'Children'); %handles to low-level graphics objects in axes
lineObjs = findobj('type', 'line','LineStyle','-'); %type of low-level graphics object
xdata = get(lineObjs, 'XData'); %data from low-level grahics objects
ydata = get(lineObjs, 'YData');

switch handles.dat3
    case (1)
        save_two_obj(hObject, eventdata, handles,ydata,xdata,datime);
    case (2)
        save_one_obj(hObject, eventdata, handles,ydata,xdata,datime);
    case (3)
        save_two_obj(hObject, eventdata, handles,ydata,xdata,datime);
    case (4)
        save_two_obj(hObject, eventdata, handles,ydata,xdata,datime);
    case (5)
        save_one_obj(hObject, eventdata, handles,ydata,xdata,datime);
    case (6)
        save_two_obj(hObject, eventdata, handles,ydata,xdata,datime);
    case (7)
        save_one_obj(hObject, eventdata, handles,ydata,xdata,datime);
end


function save_two_obj(~, ~, handles,ydata,xdata,datime)
       name_1 = strcat(num2str(handles.dat2),'-',num2str(handles.dat3),'_',datime,'-','Óïğàâëÿåìûé îáúåêò‚','.txt');
       Data1 = ydata(1); %ÑƒĞ¿Ñ€Ğ°Ğ²Ğ»ÑĞµĞ¼Ñ‹Ğ¹ Ğ¾Ğ±ÑŠĞµĞºÑ‚
       matrix1 = cat(1,Data1{:});
       save_in_file(name_1,matrix1)

       name_2 = strcat(num2str(handles.dat2),'-',num2str(handles.dat3),'_',datime,'-','Öåëü','.txt');
       Data2 = ydata(2); %Ñ†ĞµĞ»ÑŒ
       matrix2 = cat(1,Data2{:});
       save_in_file(name_2,matrix2);
       
       X = xdata(1);
       x_dat = cat(1,X{:});
       namex = strcat(num2str(handles.dat2),'-',num2str(handles.dat3 -1),'_',datime,'-','OX','.txt');
       save_in_file(namex,x_dat);

function save_one_obj(~, ~, handles,ydata,xdata,datime)
    name = strcat(num2str(handles.dat2),'-',num2str(handles.dat3),'_',datime,'-','OY','.txt');
    
    save_in_file(name,ydata)
    
    namex = strcat(num2str(handles.dat2),'-',num2str(handles.dat3 - 1),'_',datime,'-','OX','.txt');
    save_in_file(namex,xdata);
    
function save_in_file(name,data)
fileID = fopen(name,'w');
fprintf(fileID,' %6.4f', data);
fclose(fileID);


% --- Executes on button press in checkbox9.
function checkbox9_Callback(~, ~, ~)
% hObject    handle to checkbox9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox9
