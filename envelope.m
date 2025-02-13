function [enveloped] = envelope(data)
    enveloped = data;
    b = fir1(700, 1/8000);
    for i=1:numel(data)
        for j=1:numel(data{i})
            enveloped{i}{j} = 3*filter(b,1,data{i}{j});
        end
    end
    for i=1:numel(enveloped)
        for j=1:numel(enveloped{i})
            enveloped{i}{j} = enveloped{i}{j} / norm(enveloped{i}{j},2);
        end
    end
    
    figure,plot(data{1}{1})
    hold on
    plot(enveloped{1}{1},'r')
    hold off
    figure,plot(data{2}{1})
    hold on
    plot(enveloped{2}{1},'r')
    hold off
    figure,plot(data{3}{1})
    hold on
    plot(enveloped{3}{1},'r')
    hold off
    figure,plot(data{4}{1})
    hold on
    plot(enveloped{4}{1},'r')
    hold off
    figure,plot(data{5}{1})
    hold on
    plot(enveloped{5}{1},'r')
    hold off
    figure,plot(data{6}{1})
    hold on
    plot(enveloped{6}{1},'r')
    hold off
end

% NEXT STEPS:

% take taps out from dataset...

% cut off low amplitude like before (literal subtraction)...maybe not

% use 8000 dataset it is better

% USE A BETTER ENVELOPE FUNCTION (!)

% Holy crap using a screw driver is much better, I don't have to boost by
% 30DB

% I have much better data now...so maybe I can do better than 37% acc

% One concern is that envelope cuts off the last bit of data...why? can I
% avoid this?