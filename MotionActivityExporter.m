partiname = ["A" "B" "C" "D" "E" "F" "G" "H" "I"];
Dir = 'C:/Users/Kishimoto/Documents/MotionData3/';
duration = 8;
TimeC1Start = -1000;
TimeC1End = TimeC1Start + 160000;
TimeC2Start = TimeC1End + 30000;
TimeC2End = TimeC2Start + 160000;
TimeC3Start = TimeC2End + 10000;
TimeC3End = TimeC3Start + 160000;
TimeC4Start = TimeC3End + 10000;
TimeC4End = TimeC4Start + 160000;

for e = 1:2
    for parti = 1:length(partiname)
        disp(partiname(parti))
        filename = append(Dir, partiname(parti));
        StrMA = ['MA',int2str(e),' = MACalculation',int2str(e),'(filename);'];
        StrMAMovmeanDef = ['MA',int2str(e),'Movmean = zeros(33,length(MA',int2str(e),'));'];
        StrMAMovmean = ['MA',int2str(e),'Movmean(33,:) = MA',int2str(e),'(33,:);'];
        eval(StrMA);
        eval(StrMAMovmeanDef);
        eval(StrMAMovmean);
    
        for m = 1:32
            StrMAMovmeanCal = ['MA',int2str(e),'Movmean(m,:) = movmean(MA',int2str(e),'(m,:),duration);'];
            eval(StrMAMovmeanCal);
        end

        StrMAMovmeanEval = ['MAMov = MA',int2str(e),'Movmean;'];
        eval(StrMAMovmeanEval);

        if MAMov(33,length(MAMov)) > TimeC4End
            for t = 1:4
                StrStart = ['Start = TimeC',int2str(t),'Start;'];
                StrEnd = ['End = TimeC',int2str(t),'End;'];
                eval(StrStart);
                eval(StrEnd);
                A = zeros(1,33);
                for k = 1:length(MAMov)
                    if (MAMov(33,k) >= Start) && (MAMov(33,k) <= End)
                        if A == 0
                            A = MAMov(:,k);
                        elseif (k ~= 1) && (MAMov(33,k) ~= 0)
                            MADivided = cat(2,A,MAMov(:,k));
                            A = MADivided;
                        end
                    end
                end
            writematrix(MADivided,append(Dir,partiname(parti),int2str(t),'_MAMovmeanEq',int2str(e),'.txt'));   
            end 
        else
            disp('ERROR! TimeC4End is higher than time of experience end.');
        end
    end
end

function MotionActivity1WithTime = MACalculation1(file)
    cd(file);
    filelist = dir('**/*.mat');
    framemax = length(filelist);
    TimeStamps = zeros(1,framemax-1);
    MotionActivity = zeros(32,framemax-1);
    for n = 1:framemax
        fullpath = fullfile(filelist(n).folder, filelist(n).name);
        if exist(fullpath) ~= 0
            load(sprintf('%d.mat', n-1));
            fid = fopen(append(int2str(n-1),'.txt')); 
            strtime = fgetl(fid);
            fclose(fid);
            t = str2double(strtime(15))*100 + str2double(strtime(16))*10 + str2double(strtime(17));
            if isempty(bodies) == false
                if n == 1 
                    MotionMat = bodies.Position3d;
                else
                    MotionMat2 = bodies.Position3d;
                    MotionDiffMat = MotionMat2 - MotionMat;
                    MotionNormMat = vecnorm(MotionDiffMat);
                    MotionActivity(:,n-1) = Eq1(MotionNormMat);
                    MotionMat = MotionMat2;
                    if n == 2
                        Time = t;
                        TimeSum = 0;
                        TimeStamps(n-1) = TimeSum;
                    else
                        Time2 = t;
                        TimeDiff = Time2 - Time;
                        if TimeDiff < 0
                            TimeDiff = TimeDiff + 1000;
                        end
                        TimeSum = TimeSum + TimeDiff;
                        TimeStamps(n-1) = TimeSum;
                        Time = Time2;
                    end
                end
            end
        end
    end
    MotionActivity1WithTime = cat(1,MotionActivity,TimeStamps);
end

function eq1mat = Eq1(normmat)
    eq1mat = zeros(32,1);
    vmax = max(normmat);
    for j = 1:32
        if vmax == 0
            eq1mat(j) = 0;
        else
            eq1mat(j) = 100*normmat(j)/vmax;
        end
    end
end

function MotionActivity2WithTime = MACalculation2(file)
    cd(file);
    filelist = dir('**/*.mat');
    framemax = length(filelist);
    TimeStamps = zeros(1,framemax-1);
    MotionActivity = zeros(32,framemax-1);
    for n = 1:framemax
        fullpath = fullfile(filelist(n).folder, filelist(n).name);
        if exist(fullpath) ~= 0
            load(sprintf('%d.mat', n-1));
            fid = fopen(append(int2str(n-1),'.txt')); 
            strtime = fgetl(fid);
            fclose(fid);
            t = str2double(strtime(15))*100 + str2double(strtime(16))*10 + str2double(strtime(17));
            if isempty(bodies) == false
                if n == 1 
                    MotionMat = bodies.Position3d;
                else
                    MotionMat2 = bodies.Position3d;
                    MotionDiffMat = MotionMat2 - MotionMat;
                    MotionNormMat = vecnorm(MotionDiffMat);
                    MotionActivity(:,n-1) = MotionNormMat;
                    MotionMat = MotionMat2;
                    if n == 2
                        Time = t;
                        TimeSum = 0;
                        TimeStamps(n-1) = TimeSum;
                    else
                        Time2 = t;
                        TimeDiff = Time2 - Time;
                        if TimeDiff < 0
                            TimeDiff = TimeDiff + 1000;
                        end
                        TimeSum = TimeSum + TimeDiff;
                        TimeStamps(n-1) = TimeSum;
                        Time = Time2;
                    end
                end
            end
        end
    end
    MotionActivity2WithTime = cat(1,MotionActivity,TimeStamps);
end
