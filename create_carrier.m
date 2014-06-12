for i=1:128
  carrier(i) = (100*sin(2*pi*(i-1)*2000/8000)); %sine 10KHz
end


fid=fopen('carrier.h','w');					              %desired + noise
fprintf(fid,'short carrier[128]={');
fprintf(fid,'%d, ' ,carrier(1:127));
fprintf(fid,'%d' ,carrier(128));
fprintf(fid,'};\n');   
fclose(fid);