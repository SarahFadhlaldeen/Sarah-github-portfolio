
s = [-3, -2, -1, 0, 1, 2, 3, 4, 5];
ps = [1/48, 2/48, 4/48, 6/48, 8/48, 10/48, 8/48, 6/48, 3/48 ];

E = sum(s .* ps);
fprintf('Expected Value of S: %.4f\n', E);
%Expected Value of S: 1.6667

std = sqrt(sum((s - E).^2 .* ps));
fprintf('Standard Deviation of S: %.4f\n', std);
%Standard Deviation of S: 1.9293
%%
% Define the outcomes and probabilities for S
outcomes_S = [-3, -2, -1, 0, 1, 2, 3, 4, 5];
probabilities_S = [1/48, 2/48, 4/48, 6/48, 8/48, 10/48, 8/48, 6/48, 3/48];

% Define the outcomes and probabilities for D and Q
outcomes_D = [1, 2, 3, 4, 5, 6];
probabilities_D = [1/12, 1/12, 2/12, 2/12, 3/12, 3/12];
outcomes_Q = [1, 2, 3, 4];
probabilities_Q = [1/4, 1/4, 1/4, 1/4];

% Initialize arrays to store outcomes and probabilities for (S, H)
outcomes_SH = [];
probabilities_SH = [];

% Calculate the joint variable (S, H)
for i = 1:length(outcomes_S)
    S = outcomes_S(i);
    for j = 1:length(outcomes_D)
        D = outcomes_D(j);
        for k = 1:length(outcomes_Q)
            Q = outcomes_Q(k);
            H = max(D, Q);
            joint_outcome = [S, H];
            joint_probability = probabilities_S(i) * probabilities_D(j) * probabilities_Q(k);
            outcomes_SH = [outcomes_SH; joint_outcome];
            probabilities_SH = [probabilities_SH; joint_probability];
        end
    end
end

% Display the outcomes and probabilities for (S, H)
disp('Outcomes for (S, H):');
disp(outcomes_SH);
disp('Probabilities for (S, H):');
disp(probabilities_SH);
%%
% Define the outcomes and probabilities for S
outcomes_S = [-3, -2, -1, 0, 1, 2, 3, 4, 5];
probabilities_S = [1/48, 2/48, 4/48, 6/48, 8/48, 10/48, 8/48, 6/48, 3/48];

% Define the outcomes and probabilities for D and Q
outcomes_D = [1, 2, 3, 4, 5, 6];
probabilities_D = [1/12, 1/12, 2/12, 2/12, 3/12, 3/12];
outcomes_Q = [1, 2, 3, 4];
probabilities_Q = [1/4, 1/4, 1/4, 1/4];

% Initialize arrays to store outcomes and probabilities for (S, H)
outcomes_SH = [];
probabilities_SH = [];

% Calculate the joint variable (S, H)
for i = 1:length(outcomes_S)
    S = outcomes_S(i);
    D = S + outcomes_Q; % Calculate possible values of D
    H = max(D); % Find the maximum value
    joint_outcome = [S, H];
    joint_probability = sum(probabilities_D(D - min(outcomes_D) + 1) .* probabilities_Q);
    outcomes_SH = [outcomes_SH; joint_outcome];
    probabilities_SH = [probabilities_SH; joint_probability];
end

% Display the outcomes and probabilities for (S, H)
disp('Outcomes for (S, H):');
disp(outcomes_SH);
disp('Probabilities for (S, H):');
disp(probabilities_SH);
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Define the outcomes and probabilities for S
outcomes_S = [-3, -2, -1, 0, 1, 2, 3, 4, 5];
probabilities_S = [1/48, 2/48, 4/48, 6/48, 8/48, 10/48, 8/48, 6/48, 3/48];

% Define the outcomes and probabilities for D and Q
outcomes_D = [1, 2, 3, 4, 5, 6];
probabilities_D = [1/12, 1/12, 2/12, 2/12, 3/12, 3/12];
outcomes_Q = [1, 2, 3, 4];
probabilities_Q = [1/4, 1/4, 1/4, 1/4];

% Initialize arrays to store outcomes and probabilities for (S, H)
outcomes_SH = [];
probabilities_SH = [];

% Calculate the joint variable (S, H)
for i = 1:length(outcomes_S)
    S = outcomes_S(i);
    H = -Inf;  % Initialize H to negative infinity
    for j = 1:length(outcomes_D)
        for k = 1:length(outcomes_Q)
            D = outcomes_D(j);
            Q = outcomes_Q(k);
            if D - Q == S
                H = max(H, max(D, Q));
            end
        end
    end
    if H > -Inf
        joint_outcome = [S, H];
        joint_probability = sum(probabilities_D(D == max(D, Q)) .* probabilities_Q(Q == max(D, Q)));
        outcomes_SH = [outcomes_SH; joint_outcome];
        probabilities_SH = [probabilities_SH; joint_probability];
    end
end

% Display the outcomes and probabilities for (S, H)
format long;
disp('Outcomes for (S, H):');
disp(outcomes_SH);
disp('Probabilities for (S, H):');
disp(probabilities_SH);
%%
% Define the outcomes and probabilities for S
outcomes_S = [-3, -2, -1, 0, 1, 2, 3, 4, 5];
probabilities_S = [1/48, 2/48, 4/48, 6/48, 8/48, 10/48, 8/48, 6/48, 3/48];

% Define the outcomes and probabilities for D and Q
outcomes_D = [1, 2, 3, 4, 5, 6];
probabilities_D = [1/12, 1/12, 2/12, 2/12, 3/12, 3/12];
outcomes_Q = [1, 2, 3, 4];
probabilities_Q = [1/4, 1/4, 1/4, 1/4];

% Initialize arrays to store outcomes and probabilities for (S, H)
outcomes_SH = [];
probabilities_SH = [];

% Calculate the joint variable (S, H)
for i = 1:length(outcomes_S)
    S = outcomes_S(i);
    joint_outcome = [S, NaN]; % Initialize H to NaN (unknown)
    joint_probability = 0;
    
    for j = 1:length(outcomes_D)
        D = outcomes_D(j);
        for k = 1:length(outcomes_Q)
            Q = outcomes_Q(k);
            if D - Q == S
                if (isnan(joint_outcome(2)) || max(D, Q) > joint_outcome(2))
                    joint_outcome(2) = max(D, Q);
                    joint_probability = probabilities_D(j) * probabilities_Q(k);
                elseif max(D, Q) == joint_outcome(2)
                    joint_probability = joint_probability + probabilities_D(j) * probabilities_Q(k);
                end
            end
        end
    end
    
    if ~isnan(joint_outcome(2))
        outcomes_SH = [outcomes_SH; joint_outcome];
        probabilities_SH = [probabilities_SH; joint_probability];
    end
end

% Display the outcomes and probabilities for (S, H)
disp('Outcomes for (S, H):');
disp(outcomes_SH);
disp('Probabilities for (S, H):');
disp(probabilities_SH);

%%
% Define the outcomes and probabilities for S
outcomes_S = [-3, -2, -1, 0, 1, 2, 3, 4, 5];
probabilities_S = [1/48, 2/48, 4/48, 6/48, 8/48, 10/48, 8/48, 6/48, 3/48];

% Define the outcomes and probabilities for D
outcomes_D = [1, 2, 3, 4, 5, 6];
probabilities_D = [1/12, 1/12, 2/12, 2/12, 3/12, 3/12];

% Initialize arrays to store outcomes and probabilities for (S, H)
outcomes_SH = [];
probabilities_SH = [];

% Calculate the joint variable (S, H)
for i = 1:length(outcomes_S)
    S = outcomes_S(i);
    joint_outcome = [S, NaN]; % Initialize H to NaN (unknown)
    joint_probability = 0;
    
    for j = 1:length(outcomes_D)
        D = outcomes_D(j);
        Q = D - S; % Calculate Q based on S and D
        if Q >= 1 && Q <= 4 % Check if Q is within its possible outcomes
            H = max(D, Q); % Calculate H
            joint_probability = joint_probability + probabilities_D(j) * probabilities_S(i);
            
            % Update joint_outcome if H is greater than the current value
            if isnan(joint_outcome(2)) || H > joint_outcome(2)
                joint_outcome(2) = H;
            end
        end
    end
    
    if ~isnan(joint_outcome(2))
        outcomes_SH = [outcomes_SH; joint_outcome];
        probabilities_SH = [probabilities_SH; joint_probability];
    end
end

% Display the outcomes and probabilities for (S, H)
disp('Outcomes for (S, H):');
disp(outcomes_SH);
disp('Probabilities for (S, H):');
disp(probabilities_SH);