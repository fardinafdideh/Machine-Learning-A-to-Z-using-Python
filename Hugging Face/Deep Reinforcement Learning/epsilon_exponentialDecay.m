n_training_episodes = [1000,10000,100000, 1000000]; % # Total training episodes

max_epsilon = 1.0;           %  # Exploration probability at start
min_epsilon = 0.05;          %  # Minimum exploration probability
decay_rate = 0.0005;         %   # Exponential decay rate for exploration prob
%
figure

for i = 1 : length(n_training_episodes)
    subplot(1,length(n_training_episodes),i)
    episode = 0:n_training_episodes(i)-1;
    
    epsilon1 = min_epsilon + (max_epsilon - min_epsilon)*exp(-decay_rate*episode);
    epsilon2 = max_epsilon * ((min_epsilon/max_epsilon).^(1/(n_training_episodes(i)-1))).^ episode;
    plot(episode, epsilon1, 'LineWidth', 2)
    hold on
    plot(episode, epsilon2, 'LineWidth', 2)
    title(['',num2str(n_training_episodes(i)),' steps'])
    grid on
    if i == 1
        ylabel('epsilon')
    end
    xlabel('step')
end
legend('steps-independent', 'steps-dependent')
