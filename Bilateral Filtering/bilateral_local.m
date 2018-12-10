function data_filtered = bilateral_local(data_, local_window_)

[Y X] =size(data_);
Nx = X;

sigma1 = 1;
sigma2 = 15;
data_filtered=zeros(Nx,1);
Ncy = ceil(local_window_(1)/2);
Ncx = ceil(local_window_(2)/2);

for i = 1:Nx
patch = reshape(data_(:, i), local_window_);
[x, y] = find(patch == patch);
x = reshape(x, local_window_);
y = reshape(y, local_window_);

dist = sqrt((Ncx - x).^2 + (Ncy - y).^2);
gamma1 = exp(((-1)*(dist .* dist))/(2*sigma1*sigma1));

abspx = abs(patch - patch(Ncy,Ncx));
gamma2 = exp(((-1)*(abspx .* abspx))/(2*sigma2*sigma2));

data_filtered(i) = sum(sum(gamma1 .* gamma2 .* patch)) / sum(sum(gamma1 .* gamma2));
end



end

