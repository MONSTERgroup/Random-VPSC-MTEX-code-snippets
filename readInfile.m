%% Code snippet to read VPSC infile. 

pname = 'C:\Users\victoria.miller\Documents\GitHub\Random-VPSC-MTEX-code-snippets\Sample Files to Read';
fname_in = [pname filesep 'vpsc7.in'];

infile = fopen(fname_in);


%% get header information
tline = fgetl(infile);
nElement = sscanf(tline, '%f %*s', 1);
tline = fgetl(infile);
nPhase = sscanf(tline, '%f %*s', 1);
tline = fgetl(infile);
phaseFrac = sscanf(tline,varLengthStrFormat(nPhase));


%% Phase info
%Initialize the phase-specific variables
gShapeControl = repmat(0,[nPhase 1]);
fragmentation = repmat(0,[nPhase 1]);
critAspectRatio = repmat(25,[nPhase 1]);
ellipsoidAspect = repmat([1 1 1],[nPhase 1]);
ellipsoidAxesAngles = repmat([0 0 0],[nPhase 1]);
fnameTEX = cell(nPhase,1);
fnameSX = cell(nPhase,1);
fnameMORPH = cell(nPhase,1); 

for i = 1:nPhase %get all the parameters for each phase
    
    tline = fgetl(infile); %L4
    tline = fgetl(infile); %L5
    [gShapeControl(i) fragmentation(i) critAspectRatio(i)] = sscanf(tline, '%f %f %f %*s', 3);
    tline = fgetl(infile); %L6
    ellipsoidAspect(i,:) = sscanf(tline, '%f %f %f %*s', 3);
    tline = fgetl(infile); %L7
    ellipsoidAxesAngles(i,:) = sscanf(tline, '%f %f %f %*s', 3);
    tline = fgetl(infile); %L8
    tline = fgetl(infile); %L9
    fnameTEX(i) = tline;
    tline = fgetl(infile); %L10
    tline = fgetl(infile); %L11
    fnameSX(i) = tline;
    tline = fgetl(infile); %L12
    tline = fgetl(infile); %L13
    fnameMORPH(i) = tline;
    
end


%% Convergence parameters
tline = fgetl(infile); %L14 (assuming single phase)
tline = fgetl(infile); %L15
[errStress errStrRateD errModuli errSecondOrder] = sscanf(tline, '%f %f %f %f %*s', 4);

tline = fgetl(infile); %L16
[itMaxTot itMaxExternal itMaxInternalSO] = sscanf(tline, '%f %f %f %*s', 3);

tline = fgetl(infile); %L17


tline = fgetl(infile); %L18


%% i/o settings
tline = fgetl(infile); %L19
tline = fgetl(infile); %L20
iRecover = sscanf(tline, '%f %*s', 1);

tline = fgetl(infile); %L21
iSave = sscanf(tline, '%f %*s', 1);

tline = fgetl(infile); %L22
iCubeComp = sscanf(tline, '%f %*s', 1);

tline = fgetl(infile); %L23
nWrite = sscanf(tline, '%f %*s', 1);


%% modeling conditions
tline = fgetl(infile); %L24
tline = fgetl(infile); %L25
interactionType = sscanf(tline, '%f %*s', 1);


tline = fgetl(infile); %L26
[iUpdateOri iUpdateMorph iUpdateHardening] = sscanf(tline, '%f %f %f %*s', 3);

tline = fgetl(infile); %L27
nNeighbor = sscanf(tline, '%f %*s', 1);

tline = fgetl(infile); %L28
iFluctuation = sscanf(tline, '%f %*s', 1);



%% deformation processes
tline = fgetl(infile); %L29
tline = fgetl(infile); %L30






