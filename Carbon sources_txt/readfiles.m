clear all;

folder_name = uigetdir();
fildextension = '.txt';
startRow = 2;
formatSpec = '%n%n%n%n%n%n%n%[^\n\r]';
gaussEqn = 'a1*exp(-((x-b1)/c1)^2) + a2*exp(-((x-b2)/c2)^2)';

for i=1:6
   filename =  [folder_name, '\BSU', int2str(i), fildextension];
   fileID = fopen(filename,'r');
   tempdata = textscan(fileID, formatSpec, 'Delimiter', '\t', 'WhiteSpace', '', 'HeaderLines' ,1);
   fclose(fileID); 
   x=tempdata{1};
   y=tempdata{2};
   startPoints = [x(1) y(1) x(4) y(4) x(8) y(8)];
   f1 = fit(x,y,gaussEqn,'Start', startPoints);
   c=coeffvalues(f1);
   %plot(f1,x,y);
end