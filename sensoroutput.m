% READ MEASURED DATA
% CSV-file with 2 header lines and 2-5 columns: X=Time and 1-4 Y-channels
[FileA,PathA]=uigetfile('*.csv','Select data file from oscilloscope(csv)');
FullFileA = fullfile(PathA,FileA);
DataMat = csvread(FullFileA,2,0);
fclose('all');
% Rearrange data:
[Rows Cols] = size(DataMat);  % Determine # of samples and # of channels
measT = DataMat(:,1);
Ch1 = DataMat(:,2);
if Cols>=3
    Ch2 = DataMat(:,3);
end
if Cols>=4
    Ch3 = DataMat(:,4);
end
if Cols>=5
    Ch4 = DataMat(:,5);
end
if Cols==5
    Ch5 = DataMat(:,6);
end
if Cols>6
    Error = 'More than 4 traces'
end

% It may be needed to offset the measured time scale due to unknown trigger offset:
trigOffset = 0;
measT = measT+trigOffset;

% Plot calculated, simulated and measured responses:
figure(1);
plot(measT,Ch1,'b',measT,Ch2,'r',measT,Ch3,'y',measT,Ch4,'g');         
xlabel('Tid [ms]');
ylabel('Hastighed [interrupts/20ms]');
grid;
title('Hastighedgraf');
%legend('Hastighed');
set(gca,'Xlim',[0 1800]);