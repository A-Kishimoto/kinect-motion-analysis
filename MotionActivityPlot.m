partiname = ["A" "B" "C" "D" "E" "F" "G" "H" "I"];
condition = ["Resting State (C1)" "Watching Music Performance Video (C2)" "Listening to Sound of Music Performance Video (C3)" "Watching Music Performance Video with Sound of Studio Version (C4)"];
parts = ["All Parts" "Head" "Upper Body" "Left Arm" "Right Arm" "Left Leg" "Right Leg"];
Dir = 'C:/Users/Kishimoto/Documents/MotionData3/';

Tile = tiledlayout(9,2);
Tile.TileSpacing = 'compact';
Tile.Padding = 'compact';

for p = 1:length(parts)
    for e = 1:2
        nexttile
        for c = 1:length(condition)
            AllMA = zeros(length(partiname),1601);
            for parti = 1:length(partiname)
                filename = append(Dir, partiname(parti), int2str(c), '_ContiMAMean',int2str(p),'Eq',int2str(e),'.txt');
                AllMA(parti,:) = readmatrix(filename);
            end
            AllMAMean = mean(AllMA);
            plot(linspace(0,160,1601),AllMAMean);
            title(parts(p));
            if p == 1
                xline([17 41 80 101 137],':',{'Intro','1st Verse','1st Chorus','2nd Verse','2nd Chorus'});
            else
                xline([17 41 80 101 137],':');
            end
            xlim([0 160]);
            if e == 1
                if p == 1
                    ylim([0 40]);
                elseif p == 2
                    ylim([0 50]);
                elseif p == 3
                    ylim([0 20]);
                elseif (p == 4) || (p == 5)
                    ylim([0 45]);
                else
                    ylim([0 23]);
                end
            else
                if (p == 1) || (p == 2)
                    ylim([0 10]);
                elseif p == 3
                    ylim([0 4]);
                elseif (p == 4) || (p == 5)
                    ylim([0 20]);
                else
                    ylim([0 7]);
                end
            end
        hold on
        if (p == 1) && (e == 1)
            lgd = legend(condition(1),'','','','','',condition(2),'','','','','',condition(3),'','','','','',condition(4),'','','','','');
            lgd.Location = 'northoutside';
        end
        end
    hold off
    end
end

[y1,Fs1] = audioread("NewDefault_Live.wav");
t1 = (0:length(y1)-1)/Fs1;
[y2,Fs2] = audioread("NewDefault_Studio.wav");
t2 = (0:length(y2)-1)/Fs2;

for s = 1:2
    for ss = 1:2
        nexttile
        StrPlot = ['plot(t',int2str(s),',y',int2str(s),')'];
        eval(StrPlot);
        xline([17 41 80 101 137],':');
        xlim([0 160]);
        if s == 1
            title('Performance.ver');
        else
            title('Studio.ver');
        end
    end
end

xlabel(Tile, 'Time (Second)');

saveas(gcf, append(Dir, 'MeanOfMotionActivity_Movmean8_2_alt.png'));
