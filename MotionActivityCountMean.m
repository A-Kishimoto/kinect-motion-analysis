partiname = ["Gao" "Jiang" "Kobayashi" "Ohkawa" "Ohta" "Sakaguchi" "Teraoka" "Torii" "Watanabe" "Yamazaki"];
condition = ["Resting State (C1)" "Watching Music Performance Video (C2)" "Listening to Sound of Music Performance Video (C3)" "Watching Music Performance Video with Sound of Studio Version (C4)"];
Dir = 'C:/Users/Kishimoto/Documents/MotionData3/';

for e = 1:2
    MACountMean = zeros(length(condition),32);
    for c = 1:length(condition)
        MACountList = zeros(length(partiname),32);
        for parti = 1:length(partiname)
            filename = append(Dir, partiname(parti),'Eq',int2str(e),'_Count.txt');
            MACount = readmatrix(filename);
            MACountList(parti,:) = MACount(c,:);        
        end
        MACountMean(c,:) = mean(MACountList,1);
    end
    writematrix(MACountMean,append(Dir,'Eq',int2str(e),'_CountMean.csv'));
end