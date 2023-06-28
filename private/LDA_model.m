% 公設
% 1. 類別標籤的起始值從1開始,並且類別標籤必須連號
% 2. 訓練資料必須是結構體,且該結構體的成員變數為樣本資料(data)和樣本資訊(info)
% 3. 樣本的特徵向量是row vector,不是column vector

function LDA = LDA_model(Strain)
    N = size(Strain.info, 1);   % 樣本總數量
    NC = max(Strain.info);  % 類別總數量
    LDA.mu = cell(3,1);
    LDA.Sigma = zeros(size(Strain.data, 2));
    LDA.pi = cell(3,1);
    for n = 1:NC
        % 取出類別資料
        data = Strain.data((Strain.info == n), :);
        Nk = size(data, 1);
        % 計算LDA的模型參數(類別的平均值,共變異數矩陣,先驗機率)
        LDA.pi{n} = Nk/N;
        LDA.mu{n} = mean(data);
        LDA.Sigma = LDA.Sigma + cov(data)*LDA.pi{n};
    end
end