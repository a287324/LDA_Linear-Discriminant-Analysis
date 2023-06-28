function C = LDA_test(LDA, Stest)
    NC = size(LDA.pi, 1);  % 類別總數量
    delta = zeros(NC, 1);
    x = Stest.data;
    for n = 1:NC
        delta(n) = LDA.mu{n}*inv(LDA.Sigma)*(x.')-0.5*LDA.mu{n}*inv(LDA.Sigma)*(LDA.mu{n}.')+log(LDA.pi{n});
    end
    [~, C] = max(delta);
end