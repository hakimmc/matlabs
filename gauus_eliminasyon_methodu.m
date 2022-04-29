clc
old_info=0 % eğer satırlarda sıfır varsa kullanacağımız iki değişkenden ilki
new_info=0 % eğer satırlarda sıfır varsa kullanacağımız iki değişkenden ikincisi
change_count=0; % eğer satırları değiştirirsek matris – değer alacağı için bunu kontrol eden değişken
det=1; % (-1)^change_count * det( şuan 1) = det
for j=1:4
	for i=1:4
		matris(j,i) = input(sprintf('%d. satır %d. sütun:',j,i)); % input döngüsü
	end
end

x=1;
av=1;
			
while matris(x,x)==0 % 1,1  2,2  3,3  4,4 elemanlarının 0 olup olmamasını kontrol ediyor. 0’sa işleme sokuyor 
	while matris(av,x)==0 %aynı sütundaki 0 olmayan elemanı bulana kadar arıyor. Bulamazsa değişim oluyor
		av=av+1; %sütun sürekli artıyor
		if av==5 %5e ulaşırsa
			break; %direkt döngüyü bitiriyor demek ki tüm sütun 0 ile dolu
		end 
	end
	for i=1:4	
		old_info = matris(x,i); %eğer 2. whiledan sağ salim çıkarbilirse uygun satırla değişim yapılyor.
		new_info = matris(av,i); %eski değeri ve yeni değeri istenen satırlar arasından veri aktarımı yapıyoruz
		matris(x,i) = new_info; %ve ikisinin
		matris(av,i) = old_info; %yerlerini değiştiriyoruz
	end
	change_count = change_count+1; % yer değiştirildiyse change_count +1
	x = x+1; % ilk while hala 1,1  2,2  3,3  4,4  aramaya devam ediyor
	if x==5
		break; % 5 olduğunda döngü iptal
	end
end
			
% 0lamamam gereken değerler matris(0,1) matris(0,2) matris(0,3) matris(1,2) matris(1,3) matris(2,3)
carpan(2,1) = (matris(2,1)/matris(1,1));  % çarpanları belirliyorum (örn : r3= r3 – r2/r3*eleman)
carpan(3,1) = (matris(3,1)/matris(1,1)); %bu çarpanları for döngüsü içinde koymama sebebim 
carpan(4,1) = (matris(4,1)/matris(1,1)); % for un içinde bunların da değişmesi
%değişmemeleri için erkenden belli bir değere atadım
	for j=2:4 %2. Satırdan 4. Satıra kadar çarpanlarda belirtiğim işlemi yapıyorlar
		for i=1:4
			matris(j,i) = matris(j,i) - carpan(j,1)*matris(1,i) % yok etme işlemi (alt üçgen yapmaya çalışıyor)
		end
	end
			
x=2
av=2
			
while matris(x,x)==0 % ilk yaptığımız while ile aynı sadece x ve av değişkenlerimiz değişiyor
	while matris(av,x)==0
		av=av+1;
		if av==5
			break;
		end
	end
	for i=1:4	
		old_info = matris(x,i);
		new_info = matris(av,i);
		matris(x,i) = new_info;
		matris(av,i) = old_info;
	end
	change_count = change_count+1;
	x = x+1;
	if x==5
		break;
	end
end
			
carpan(3,2) = (matris(3,2)/matris(2,2)); %aynı mantık çarpanlar
carpan(4,2) = (matris(4,2)/matris(2,2));

for j=3:4
	for i=1:4
		matris(j,i) = matris(j,i) - carpan(j,2)*matris(2,i); %aynı mantık yok etme
	end
end
			
x=3
av=3
			
while matris(x,x)==0 % yine av ve x i değiştirip while ile 0 arıyoruz
	while matris(av,x)==0
		av=av+1;
		if av==5
			break;
		end
	end
	for i=1:4	
		old_info = matris(x,i);
		new_info = matris(av,i);
		matris(x,i) = new_info;
		matris(av,i) = old_info;
	end
	change_count = change_count+1;
	x = x+1;
	if x==5
		break;
	end
end
			
carpan(4,3) = (matris(4,3)/matris(3,3)); % aynı çarpan
			
for j=4:4
	for i=1:4
		matris(j,i) = matris(j,i) - carpan(j,3)*matris(3,i); % aynı yok etme
	end
end
			
while matris(x,x)==0 % aynı 0 kontrol whileı
	while matris(av,x)==0
		av=av+1;
		if av==5
			break;
		end
	end
	for i=1:4	
		old_info = matris(x,i);
		new_info = matris(av,i);
		matris(x,i) = new_info;
		matris(av,i) = old_info;
	end
	change_count = change_count+1;
	x = x+1;
	if x==5
		break;
	end
end
			
fprintf('\n\n');
for j=1:4 % matris çizdirme fonksiyonu
	for i=1:4
		fprintf('    ');
		fprintf('%.2f',matris(j,i));
		for k=0:(9-numel(num2str(sprintf('%.2f',matris(j,i)))))
			fprintf(' ');
		end
	fprintf('|');
	end
fprintf('\n');
end
	for i=1:4
		det = det* matris(i,i); % det üzerine köşegen çarpımlarını ekliyoruz
	end
	fprintf('\n\nDet:%.3f', ((-1)^change_count)*det ); % sonuç
