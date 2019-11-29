n = 300;
D = randn(n, 2);
save Data1 D

addpath somtoolbox

load Data1
sData = som_data_struct(D,'name','donnees1');
sData

%Initialization of the structure of map
msize = [6 6];
insize = size(sData.data, 2);
lattice = 'rect'; 
shape = 'sheet'; 

sMap = som_map_struct(insize,'msize',msize, lattice, shape);
sMap

sMap = som_randinit(sData, sMap); 

figure
plot(D(:,1),D(:,2),'b+');
hold on
som_grid(sMap,'Coord',sMap.codebook)
axis on
title('Data and structure of grid');


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

%Visualisation of examples represented by one neuron
[Bmus, Qerrors] = som_bmus(sMap, sData);
neur=17; % choose a neuron
exemples_captes = find(Bmus == neur); % data represented by that neuron
figure
som_grid(sMap,'Coord',sMap.codebook) % visualization of the map
hold on
plot(D(:,1),D(:,2),'b+') % data on blue
plot(D(exemples_captes,1),D(exemples_captes,2),'r+') % data represented by neuron in red
plot(sMap.codebook(neur,1),sMap.codebook(neur,2),'go') % neuron in green
title(['examples represented by neuron ' num2str(neur)]) 

[qe_conv,te_conv]=som_quality(sMap,sData)
