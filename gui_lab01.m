
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% - ‘”Õ ÷»» »Õ»÷»¿À»¿÷»». Õ≈ “–Œ√¿“‹!!! - %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
set(gcf, 'WindowState', 'maximized')

handles.output = hObject;
guidata(hObject, handles);
set(handles.uipanel29, 'Visible', 'off')
set(handles.checkbox10, 'Value', 0)

function varargout = gui_lab01_OutputFcn(~, ~, handles) 
assignin("base", "handles", handles)

varargout{1} = handles.output;
assignin("base", "varargout", varargout)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%% -  ÕŒœ ¿ œŒ—“–Œ≈Õ»ﬂ √–¿‘» ¿ ¬ Œ Õ≈ - %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function pushbutton_plot_Callback(~, ~, handles)

cla reset
axes_CreateFcn

if get(handles.checkbox9, 'Value')
    handles.dat09 = 1;
    guidata(gcbo, handles);
else
    handles.dat09 = 0;
    guidata(gcbo, handles);
end

if get(handles.checkbox10, 'Value')
    handles.dat10 = 1;
    guidata(gcbo, handles);
else
    handles.dat10 = 0;
    guidata(gcbo, handles);
end

% Á‡ÔÛÒÍ ÒÍËÔÚ‡
Lab_3_1;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   

%%% -  ÕŒœ ¿ "œŒ—“–Œ»“‹" œ≈–¬ŒÕ¿◊¿À‹ÕŒ Õ≈ƒŒ—“”œÕ¿ - %%%%%%%%%%%%%%%%%%%%%%%
function pushbutton_plot_CreateFcn(~, ~, ~)

% set(hObject, 'Enable', 'off')                                              % !!!!!!!
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 

%%% -  ÕŒœ ¿ Œ◊»—“ » Œ Õ¿ — √–¿‘» ¿Ã» - %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function pushbutton_clear_Callback(~, ~, ~)

% Ó˜ËÒÚÍ‡ ÓÒÂÈ
cla reset
axes_CreateFcn

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function pushbutton_clear_CreateFcn(hObject, ~, ~)

set(hObject, 'Enable', 'on')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%% - œ≈–¬ŒÕ¿◊¿À‹Õ¿ﬂ Õ¿—“–Œ… ¿ Œ—≈… - %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function axes_CreateFcn(~, ~, ~)
% axis equal
box on
grid on

set(gca, 'XLim', [ 0  6.0*10^3 ]);
set(gca, 'YLim', [ 0  4.0*10^3 ]);

xlabel('L, Ï');
ylabel('H, Ï');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%% - Ã≈Õﬁ ¬€¡Œ–¿ Ã¿Õ≈¬–¿ - %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
    % ÍÌÓÔÍ‡ "œÓÒÚÓËÚ¸" ‰ÓÒÚÛÔÌ‡ ÔÓÒÎÂ ‚˚·Ó‡ ‚Ë‰‡ „‡ÙËÍ‡                % !!!!!!!
    set(handles.pushbutton_plot, 'Enable', 'on')                           % !!!!!!!
else
    set(handles.pushbutton_plot, 'Enable', 'off')                          % !!!!!!!
end

function popupmenu_manevr_CreateFcn(hObject, ~, ~)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%% - Ã≈Õﬁ ¬€¡Œ–¿ ¬»ƒ¿ √–¿‘» ¿ - %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
    % ÍÌÓÔÍ‡ "œÓÒÚÓËÚ¸" ‰ÓÒÚÛÔÌ‡ ÔÓÒÎÂ ‚˚·Ó‡ ‚Ë‰‡ „‡ÙËÍ‡                % !!!!!!!
    set(handles.pushbutton_plot, 'Enable', 'on')                           % !!!!!!!
else
    set(handles.pushbutton_plot, 'Enable', 'off')                          % !!!!!!!
end

function popupmenu_graph_CreateFcn(hObject, ~, ~)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%% - Œ¡À¿—“‹ ¬¬Œƒ¿  ŒŒ–ƒ»Õ¿“€ Z11 - %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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


%%% - Œ¡À¿—“‹ ¬¬Œƒ¿  ŒŒ–ƒ»Õ¿“€ X11 - %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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



%%% - Œ¡À¿—“‹ ¬¬Œƒ¿  ŒŒ–ƒ»Õ¿“€ Z21 - %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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


%%% - Œ¡À¿—“‹ ¬¬Œƒ¿  ŒŒ–ƒ»Õ¿“€ X21 - %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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



%%% - Œ¡À¿—“‹ ¬¬Œƒ¿ — Œ–Œ—“» V11 - %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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



%%% - Œ¡À¿—“‹ ¬¬Œƒ¿ — Œ–Œ—“» V2 - %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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





%%% - Œ¡À¿—“‹ ¬¬Œƒ¿ — Œ–Œ—“» PSI11 - %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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







%%% - Œ¡À¿—“‹ ¬¬Œƒ¿ — Œ–Œ—“» PSI2 - %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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



%%% - Œ¡À¿—“‹ ¬¬Œƒ¿ tk - %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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


%%% - Œ¡À¿—“‹ ¬¬Œƒ¿ K_1 - %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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


%%% - Œ¡À¿—“‹ ¬¬Œƒ¿ K_2 - %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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



%%% - Œ¡À¿—“‹ ¬¬Œƒ¿ — Œ–Œ—“» PS0 - %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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



%%% - Œ¡À¿—“‹ ¬¬Œƒ¿ — Œ–Œ—“» V0 - %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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



%%% - Œ¡À¿—“‹ ¬¬Œƒ¿  ŒŒ–ƒ»Õ¿“€ Z0 - %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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



%%% - Œ¡À¿—“‹ ¬¬Œƒ¿  ŒŒ–ƒ»Õ¿“€ X0 - %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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




%%% - Œ¡À¿—“‹ ¬¬Œƒ¿ K_31 - %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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


%%% - Œ¡À¿—“‹ ¬¬Œƒ¿ K_32 - %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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



%%% - Œ¡À¿—“‹ ¬¬Œƒ¿ K_33 - %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
       name_1 = strcat(num2str(handles.dat2),'-',num2str(handles.dat3),'_',datime,'-','”Ô‡‚ÎˇÂÏ˚È Ó·˙ÂÍÚÇ','.txt');
       Data1 = ydata(1); %—É–ø—Ä–∞–≤–ª—è–µ–º—ã–π –æ–±—ä–µ–∫—Ç
       matrix1 = cat(1,Data1{:});
       save_in_file(name_1,matrix1)

       name_2 = strcat(num2str(handles.dat2),'-',num2str(handles.dat3),'_',datime,'-','÷ÂÎ¸','.txt');
       Data2 = ydata(2); %—Ü–µ–ª—å
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


% --- Executes on button press in checkbox10.
function checkbox10_Callback(hObject, ~, handles)
% hObject    handle to checkbox10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox10
if get(hObject, 'Value')
    set(handles.uipanel29, 'Visible', 'on')
else
    set(handles.uipanel29, 'Visible', 'off')
end

function launchCnt_Callback(hObject, ~, handles)
% hObject    handle to launchCnt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of launchCnt as text
%        str2double(get(hObject,'String')) returns contents of launchCnt as a double
handles.dat_LaunchCnt = str2double(get(hObject,'String'));
guidata(gcbo, handles);

% --- Executes during object creation, after setting all properties.
function launchCnt_CreateFcn(hObject, ~, handles)
% hObject    handle to launchCnt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
handles.dat_LaunchCnt = str2double(get(hObject,'String'));
guidata(gcbo, handles);

function LaunchAngles_Callback(hObject, ~, handles)
% hObject    handle to LaunchAngles (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of LaunchAngles as text
%        str2double(get(hObject,'String')) returns contents of LaunchAngles as a double
handles.dat_LaunchAngles = str2double(get(hObject,'String'));
guidata(gcbo, handles);

% --- Executes during object creation, after setting all properties.
function LaunchAngles_CreateFcn(hObject, ~, handles)
% hObject    handle to LaunchAngles (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
handles.dat_LaunchAngles = str2double(get(hObject,'String'));
guidata(gcbo, handles);

% --- Executes on key press with focus on checkbox10 and none of its controls.
function checkbox10_KeyPressFcn(~, ~, ~)
% hObject    handle to checkbox10 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
