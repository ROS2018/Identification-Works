%% Using the methode of identc:
F_identc=identc(data,[3 1 0], [3 1 0],'gpmfn', 100, 'final');
% B(s) = 7524 s + 228.2
% F(s) = s^3 + 312 s^2 + 2.068e04 s + 1.383e06
aa_=2.068e04;
b0_ = 228.2/aa_;
b1_ = 7524/aa_;
a3_ = 1/aa_; a2_ = 312 /aa_; a1_ = 1; a0_ = 1.383e06/aa_;
F_ = tf([b1_ b0_*0],[a3_ a2_ a1_ a0_])
% Validation:
figure(3);
compare(data,F_identc,F_);
