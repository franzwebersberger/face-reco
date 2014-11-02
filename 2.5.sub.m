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

figure(1)
subplot(1,2,1), pcolor(flipud(reshape(Reco,h,w))), shading interp, colormap(gray);
subplot(1,2,2), bar(E), axis([0 m+1 0 1]);

