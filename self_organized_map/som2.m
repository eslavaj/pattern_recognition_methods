load Data2.mat;
i1=find(classes==1);
i2=find(classes==2);
i3=find(classes==3);
i4=find(classes==4);
i5=find(classes==5);

figure;
plot(D(i1,1),D(i1,2),'r.');
hold on;
plot(D(i2,1),D(i2,2),'g.');
plot(D(i3,1),D(i3,2),'b.');
plot(D(i4,1),D(i4,2),'k.');
plot(D(i5,1),D(i5,2),'m.');

%Initialization of the structure:
addpath somtoolbox;
sData = som_data_struct(D,'name','Donnees2','labels',labs,'comp_names',cnames);
sData.comp_names
sData.labels

msize = [6 6];
insize = size(sData.data, 2);
lattice = 'rect'; 
shape = 'sheet'; 
sMap = som_map_struct(insize,'msize',msize, lattice, shape);
sMap

%Init the neuron
sMap = som_lininit(sData, sMap);
figure
plot(D(:,1),D(:,2),'b+');
hold on
som_grid(sMap,'Coord',sMap.codebook)
axis on
title('Data and structure of grid');

%TRAINING the map PHASE 1 (Auto organization):
figure
epochs = 50; % number of iteration of auto-organization phase
radius_ini = 5; %initial value of T (max value)
radius_fin = 1;  % finale value of T (min value)
Neigh = 'gaussian'; % choice of neighborhood function
%Neigh = 'gaussian', 'cutgauss', 'bubble' or 'ep'
tr_lev = 3;
[sMap,sT] = som_batchtrain(sMap, sData,'trainlen',epochs, 'radius_ini',radius_ini,'radius_fin',radius_fin, 'neigh',Neigh,'tracking',tr_lev);

% Visualization of data and map at the end of phase 1:
figure
plot(D(:,1),D(:,2),'b+')
hold on
som_grid(sMap,'Coord',sMap.codebook), hold off, axis on
title('At the end of the phase of auto-organization (phase 1)');

%TRAINING the map PHASE 2 (Convergence):
epochs = 100; radius_ini = 1; radius_fin = 0.1;
figure
[sMap,sT] = som_batchtrain(sMap, sData,'trainlen',epochs, 'radius_ini',radius_ini,'radius_fin',radius_fin, 'neigh',Neigh,'tracking',tr_lev);

% Visualization at the end of phase 2
figure
plot(D(:,1),D(:,2),'b+')
hold on
som_grid(sMap,'Coord',sMap.codebook)
title('At the end of phase of convergence (phase 2)');

%-------------------
Labl = cell(size(sMap.codebook,1),1);
Labl
for ii = 1:size(sMap.codebook,1), Labl{ii} = num2str(ii); end
Labl
sMap = som_label(sMap,'clear','all');
sMap.labels
sMap = som_label(sMap,'add', 'all', Labl);
sMap.labels
%Choose the label for the neuron by votation (choose the most represented label)
sMap = som_autolabel(sMap,sData,'vote');
sMap.labels

%Visualize the result of votation:
figure
som_show(sMap,'empty','numéro de chaque neurone et son étiquette');
som_show_add('label',sMap,'subplot',1);







