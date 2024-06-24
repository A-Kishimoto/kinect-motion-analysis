partiname = ["A" "B" "C" "D" "E" "F" "G" "H" "I"];
condition = ["Resting State (C1)" "Watching Music Performance Video (C2)" "Listening to Sound of Music Performance Video (C3)" "Watching Music Performance Video with Sound of Studio Version (C4)"];
Dir = 'C:/Users/Kishimoto/Documents/MotionData3/';

for e = 1:2
    MAMaxListAll = zeros(length(condition),32);
    for parti = 1:length(partiname)
        for c = 1:length(condition)
            filename = append(Dir, partiname(parti), int2str(c), '_MAMovmeanEq',int2str(e),'.txt');
            MA = readmatrix(filename);
            MAMaxList = zeros(1,32);
            count = 0;
            for k = 1:length(MA)
                count = count + 1;
                [Max, Index] = max(MA(1:32,k));
                MAMaxList(Index) = MAMaxList(Index) + 1;
            end
            MAMaxListAll(c,:) = MAMaxList/count;
        end
        writematrix(MAMaxListAll,append(Dir,partiname(parti),'Eq',int2str(e),'_Count.txt'));
    end
end
