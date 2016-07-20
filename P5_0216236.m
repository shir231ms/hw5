function varargout = P5_0216236(varargin)
% P5_0216236 MATLAB code for P5_0216236.fig
%      P5_0216236, by itself, creates a new P5_0216236 or raises the existing
%      singleton*.
%
%      H = P5_0216236 returns the handle to a new P5_0216236 or the handle to
%      the existing singleton*.
%
%      P5_0216236('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in P5_0216236.M with the given input arguments.
%
%      P5_0216236('Property','Value',...) creates a new P5_0216236 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before P5_0216236_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to P5_0216236_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help P5_0216236

% Last Modified by GUIDE v2.5 07-Jun-2016 03:01:08

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @P5_0216236_OpeningFcn, ...
                   'gui_OutputFcn',  @P5_0216236_OutputFcn, ...
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


% --- Executes just before P5_0216236 is made visible.
function P5_0216236_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to P5_0216236 (see VARARGIN)

% Choose default command line output for P5_0216236
handles.output = hObject;

    set(handles.sliderX, 'Value', 0);
    set(handles.sliderY, 'Value', 0);
    handles.data.range=[0 500 0 500];
    handles.data.imWH=[handles.axesPlot.XLim handles.axesPlot.YLim];
    handles.data.fullfilename='';
    handles = setZoom(handles, 1);

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes P5_0216236 wait for user response (see UIRESUME)
% uiwait(handles.figure1);



% --- Outputs from this function are returned to the command line.
function varargout = P5_0216236_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Loadbutton.
function Loadbutton_Callback(hObject, eventdata, handles)
% hObject    handle to Loadbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
  % Load an image file
    [baseFileName,folder]=uigetfile({'*.jpg;*.tif;*.png;*.gif','All Image Files'},'Select the image file');
    cd(folder);
    handles.data.fullfilename = fullfile(folder, baseFileName);
  % reset every function whenever loading a new image
    handles.data.zoom=1;
    axes(handles.axesPlot);
    myImage=imageRender(handles.data.fullfilename,handles.data.zoom);
    axis(handles.data.range);
  % gain image size and store the size into data.imWH
    [height, width, p]=size(myImage);
    handles.data.imWH=[0 width 0 height];
    handles = setZoom(handles,handles.data.zoom);
    setSlider(handles);
    guidata(hObject, handles);


% --- Executes on slider movement.
function sliderX_Callback(hObject, eventdata, handles)
% hObject    handle to sliderX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
    vx = get(hObject, 'Value');
    set(handles.axesPlot, 'XLim', [vx+handles.data.range(1) vx+handles.data.range(2)]);
    guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function sliderX_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function sliderY_Callback(hObject, eventdata, handles)
% hObject    handle to sliderY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
    vy = get(hObject, 'Value');
    set(handles.axesPlot, 'YLim', [vy+handles.data.range(3) vy+handles.data.range(4)]);
    guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function sliderY_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in Zinbutton.
function Zinbutton_Callback(hObject, eventdata, handles)
% hObject    handle to Zinbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    if handles.data.zoom < 8
      % whenever zoom, reimage and setZoom and setSlider again.
        axes(handles.axesPlot);
        myImage=imageRender(handles.data.fullfilename, handles.data.zoom*2);
        axis(handles.data.range);
        [height, width, p]=size(myImage);
        handles.data.imWH=[0 width 0 height];
        setZoom(handles, handles.data.zoom*2);
        handles.data.zoom = handles.data.zoom*2; % update data.zoom
        setSlider(handles);
        guidata(hObject, handles);
    end

% --- Executes on button press in Zoutbutton.
function Zoutbutton_Callback(hObject, eventdata, handles)
% hObject    handle to Zoutbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    if handles.data.zoom > 1
      % whenever zoom, reimage and setZoom and setSlider again.
        axes(handles.axesPlot);
        myImage=imageRender(handles.data.fullfilename, handles.data.zoom/2);
        axis(handles.data.range);
        [height, width, p]=size(myImage);
        handles.data.imWH=[0 width 0 height];
        setZoom(handles, handles.data.zoom/2);
        handles.data.zoom = handles.data.zoom/2; % update data.zoom
        setSlider(handles);
        guidata(hObject, handles);
    end
    
    function handles = setZoom(handles, zoom)
    % [set zoom button - following 2 steps]
      % Step1: Text Word
        set(handles.textZoom, 'String', ['Zoom: ' num2str(zoom) 'x']);
      % Step2: set Zoom Button Enable
        enableout = 'on'; if zoom == 1; enableout = 'off'; end
        set(handles.Zoutbutton, 'Enable', enableout);
        enablein = 'on'; if zoom == 8; enablein ='off'; end
        set(handles.Zinbutton, 'Enable', enablein);
        guidata(handles.textZoom, handles);
        
     function handles = setSlider(handles)  
    % [set two sliders - following 5 steps]
      % Step1: set slider Enable
        if handles.data.imWH(2)-handles.data.imWH(1)>handles.data.range(2)-handles.data.range(1)
            enablesliX='on';
        else
            enablesliX='off';
        end
        if handles.data.imWH(4)-handles.data.imWH(3)>handles.data.range(4)-handles.data.range(3)
            enablesliY='on';
        else
            enablesliY='off';
        end
        set(handles.sliderX, 'Enable', enablesliX);
        set(handles.sliderY, 'Enable', enablesliY);
      % Step2: set slider Max Min 
        if strcmp(enablesliX,'on')==1
            set(handles.sliderX, 'Min', handles.data.imWH(1)-handles.data.range(1));
            set(handles.sliderX, 'Max', handles.data.imWH(2)-handles.data.range(2));
        end
        if strcmp(enablesliY,'on')==1
            set(handles.sliderY, 'Min', handles.data.imWH(3)-handles.data.range(3));
            set(handles.sliderY, 'Max', handles.data.imWH(4)-handles.data.range(4));
        end
      % Step3: set slider Value
        if strcmp(enablesliX,'on')==1
            vx=handles.axesPlot.XLim(1)-handles.data.range(1);
            set(handles.sliderX, 'Value', vx);
        end
        if strcmp(enablesliY,'on')==1
            vy=handles.axesPlot.YLim(1)-handles.data.range(3);
            set(handles.sliderY, 'Value', vy);
        end
      % Step4: set slider SliderStep
        if strcmp(enablesliX,'on')==1
            set(handles.sliderX, 'SliderStep', [.01 .1]);
        end
        if strcmp(enablesliY,'on')==1
            set(handles.sliderY, 'SliderStep', [.01 .1]);
        end
      % Step5: set axesPlot XLim YLim
        if strcmp(enablesliX,'on')==1
            set(handles.axesPlot, 'XLim', [vx+handles.data.range(1) vx+handles.data.range(2)]);
        end
        if strcmp(enablesliY,'on')==1
            set(handles.axesPlot, 'YLim', [vy+handles.data.range(3) vy+handles.data.range(4)]);
        end
        guidata(handles.textZoom, handles);
       
    function im=imageRender(filename,m) % According to P3_0216236.m
        X=imread(filename);
        if (m>size(X,1)) || (m>size(X,2))
            msg = 'incorrect value of input "m".';
            error(msg) ;
        else
            if m==1 % if m=1 -> dont need to compute the mean color!
                image(X);
                im=X;
            else
                map=[X(:,:,1) X(:,:,2) X(:,:,3)];
            % Part1. Use the solution to Exam01-Q2 for expand one cell to m*m cells
                r1 = reshape(repmat(map(:),1,m)', size(map,1)*m, size(map,2))';
                result1 = reshape(repmat(r1(:),1,m)', size(r1,1)*m, size(r1,2))';
            % Part2. Output the result image
                % display the closet color image with 'Mosaic' matrix
                sz=m*m*numel(X(:,:,1));
                Mosaic(:,:,1)=reshape(result1(1:sz),size(X,1)*m,size(X,2)*m);
                Mosaic(:,:,2)=reshape(result1(sz+1:2*sz),size(X,1)*m,size(X,2)*m);
                Mosaic(:,:,3)=reshape(result1(2*sz+1:3*sz),size(X,1)*m,size(X,2)*m);
                image(Mosaic);
                im=Mosaic;
            end
        end
        
