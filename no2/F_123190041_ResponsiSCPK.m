%memasukkan dataset
ds = dataset('XLSFile','Real estate valuation data set.xlsx');
ds.No = [];
ds.X1TransactionDate = [];
ds.X5Latitude = [];
ds.X6Longitude = [];

%memasukkan nilai atribut -> 0=cost, 1=benefit
k = [0,1,1,0];

%memasukkan bobot kriteria
w = [3,5,4,1];

%TAHAP 1: perbaikan bobot
[m n] = size(ds);
w = w./sum(w); %membagi bobot per kriteria dengan jumlah total seluruh bobot

%TAHAP 2: perhitungan vektor S per baris
for j=1:n
    if k(j)==0
        w(j) = -1*w(j);
    end
end
for i=1:m
    S(i) = prod(ds(i,:).^w);
end

%TAHAP 3: proses perankingan
V = S/sum(S);
disp(V);