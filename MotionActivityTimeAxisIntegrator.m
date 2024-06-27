partiname = ["A" "B" "C" "D" "E" "F" "G" "H" "I"];
condition = ["Resting State (C1)" "Watching Music Performance Video (C2)" "Listening to Sound of Music Performance Video (C3)" "Watching Music Performance Video with Sound of Studio Version (C4)"];
Dir = 'C:/Users/Kishimoto/Documents/MotionData/';

for e = 1:2
    for c = 1:length(condition)
        for parti = 1:length(partiname)
            disp(partiname(parti),int2str(c));
            filename = append(Dir, partiname(parti), int2str(c), '_MAMovmeanEq',int2str(e),'.txt');
            MA = readmatrix(filename);
            MATime = MA(33,:);
            TimeMax = length(MATime);
            MATimeIni = ones(1,TimeMax)*MATime(1);
            MATimeDiff = MATime - MATimeIni;

            IntegMA = zeros(32,1601);
            k = 1;

            for T = 1:1601
                IntegMA(1:32,T) = MA(1:32,k);
                if (T-1)*100 >= MATimeDiff(k)
                    if k < TimeMax   
                        k = k+1;
                    end
                end
            end

            IntegMAMean1 = mean(IntegMA);
            IntegMAMean2 = mean(IntegMA([4 27:32],:));
            IntegMAMean3 = mean(IntegMA(1:3,:));
            IntegMAMean4 = mean(IntegMA(5:11,:));
            IntegMAMean5 = mean(IntegMA(12:18,:));
            IntegMAMean6 = mean(IntegMA(19:22,:));
            IntegMAMean7 = mean(IntegMA(23:26,:));
            writematrix(IntegMAMean1,append(Dir,partiname(parti),int2str(c),'_IntegMAMean1Eq',int2str(e),'.txt'));
            writematrix(IntegMAMean2,append(Dir,partiname(parti),int2str(c),'_IntegMAMean2Eq',int2str(e),'.txt'));
            writematrix(IntegMAMean3,append(Dir,partiname(parti),int2str(c),'_IntegMAMean3Eq',int2str(e),'.txt'));
            writematrix(IntegMAMean4,append(Dir,partiname(parti),int2str(c),'_IntegMAMean4Eq',int2str(e),'.txt'));
            writematrix(IntegMAMean5,append(Dir,partiname(parti),int2str(c),'_IntegMAMean5Eq',int2str(e),'.txt'));
            writematrix(IntegMAMean6,append(Dir,partiname(parti),int2str(c),'_IntegMAMean6Eq',int2str(e),'.txt'));
            writematrix(IntegMAMean7,append(Dir,partiname(parti),int2str(c),'_IntegMAMean7Eq',int2str(e),'.txt'));
        end
    end
end
