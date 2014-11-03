% please execute 2.5.m once first 

imgName=input('test-image=','s');
testImg=double(imread(imgName));
Ctest=reshape(testImg,1,M);
Ptest=Ctest*V;
Reco=V*Ptest';

E=zeros(1,m);
for i=1:m
	E(i)=norm(P(i,:)-Ptest)/norm(P(i,:));
end;
[emin,ix]=min(E);

figure(1)
subplot(1,4,1), pcolor(flipud(reshape(Ctest,h,w))), shading interp, colormap(gray);
set(gca,'Xtick',[],'Ytick',[]);
title("test image");
subplot(1,4,2), bar(E), axis([0 m+1 0 1]);
title("errors");
subplot(1,4,3), pcolor(flipud(reshape(Reco,h,w))), shading interp, colormap(gray);
set(gca,'Xtick',[],'Ytick',[]);
title("ev space proj");
subplot(1,4,4), pcolor(flipud(reshape(A(ix,:),h,w))), shading interp, colormap(gray);
set(gca,'Xtick',[],'Ytick',[]);
title("best match");

