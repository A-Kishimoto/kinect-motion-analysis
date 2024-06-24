partiname = [partiname = ["A" "B" "C" "D" "E" "F" "G" "H" "I"];];
condition = ["Resting State (C1)" "Watching Music Performance Video (C2)" "Listening to Sound of Music Performance Video (C3)" "Watching Music Performance Video with Sound of Studio Version (C4)"];
Dir = 'C:/Users/Kishimoto/Documents/MotionData3/';

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

            ContiMA = zeros(32,1601);
            k = 1;

            for T = 1:1601
                ContiMA(1:32,T) = MA(1:32,k);
                if (T-1)*100 >= MATimeDiff(k)
                    if k < TimeMax   
                        k = k+1;
                    end
                end
            end

            ContiMAMean1 = mean(ContiMA);
            ContiMAMean2 = mean(ContiMA([4 27:32],:));
            ContiMAMean3 = mean(ContiMA(1:3,:));
            ContiMAMean4 = mean(ContiMA(5:11,:));
            ContiMAMean5 = mean(ContiMA(12:18,:));
            ContiMAMean6 = mean(ContiMA(19:22,:));
            ContiMAMean7 = mean(ContiMA(23:26,:));
            writematrix(ContiMAMean1,append(Dir,partiname(parti),int2str(c),'_ContiMAMean1Eq',int2str(e),'.txt'));
            writematrix(ContiMAMean2,append(Dir,partiname(parti),int2str(c),'_ContiMAMean2Eq',int2str(e),'.txt'));
            writematrix(ContiMAMean3,append(Dir,partiname(parti),int2str(c),'_ContiMAMean3Eq',int2str(e),'.txt'));
            writematrix(ContiMAMean4,append(Dir,partiname(parti),int2str(c),'_ContiMAMean4Eq',int2str(e),'.txt'));
            writematrix(ContiMAMean5,append(Dir,partiname(parti),int2str(c),'_ContiMAMean5Eq',int2str(e),'.txt'));
            writematrix(ContiMAMean6,append(Dir,partiname(parti),int2str(c),'_ContiMAMean6Eq',int2str(e),'.txt'));
            writematrix(ContiMAMean7,append(Dir,partiname(parti),int2str(c),'_ContiMAMean7Eq',int2str(e),'.txt'));
        end
    end
end
