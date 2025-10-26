%% joint variable and probabilities 
% outcomes and probabilities for S and H
outcomes_S = [-3, -2, -1, 0, 1, 2, 3, 4, 5];
prob_S = [1/48, 2/48, 4/48, 6/48, 8/48, 10/48, 8/48, 6/48, 3/48];
outcomes_Q = [1, 2, 3, 4];
prob_Q = [1/4, 1/4, 1/4, 1/4];
outcomes_D = [1, 2, 3, 4, 5, 6];
prob_D = [1/12, 1/12, 2/12, 2/12, 3/12, 3/12];

%  store joint outcomes and probabilities
joint_outcomes = [];
joint_probabilities = [];

% calculating the joint outcomes and probabilities
for i = 1:length(outcomes_S)
    for j = 1:length(outcomes_D)
        for k = 1:length(outcomes_Q)
            %the higher outcome, H
            H = max(outcomes_D(j), outcomes_Q(k));
            %the joint outcome by combining S and H
            joint_outcome = [outcomes_S(i), H];
            
            %joint probability by multiplying the probabilities
            joint_probability = prob_S(i) * prob_D(j) * prob_Q(k);
            
            % append to the lists
            joint_outcomes = [joint_outcomes; joint_outcome];
            joint_probabilities = [joint_probabilities; joint_probability];
        end
    end
end

% show
fprintf('Joint Variable (S, H) with Probabilities:\n');
fprintf('----------------------------------------\n');
for idx = 1:length(joint_outcomes)
    S = joint_outcomes(idx, 1);
    H = joint_outcomes(idx, 2);
    probability = joint_probabilities(idx);
    fprintf('Outcome (S=%d, H=%d): Probability = %.6f\n', S, H, probability);
end

%% marginal probability that H is equal to 3 

marg_prob_H3 = sum(joint_probabilities(joint_outcomes(:, 2) == 3));

fprintf('Marginal Probability that H is equal to 3 is: %.6f\n', marg_prob_H3);

%Marginal Probability that H is equal to 3 is: 0.166667
