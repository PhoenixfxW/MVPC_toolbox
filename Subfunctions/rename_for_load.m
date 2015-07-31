% rename file path. Useful when analysis file server is changed
% (ex. move your file to new directory).
% input: fname
% output: fname_new
%
% 2013/04/11 SH edited

function fname_new = rename_for_load(fname)
ex_check    = {   '/home/nobita/hirose',  '/Volumes/nobita/hirose'  , '/project/doraemon/jaian/hirose/nobita'};
rename      = {   '/home/nobita/hirose',  '/Volumes/nobita/hirose'  , '/project/doraemon/jaian/hirose/nobita'
    '/home/jaian/hirose','/Volumes/jaian/hirose'                    , '/project/doraemon/jaian/hirose'
    '/home/data_hirose'  ,  '/Volumes/data_hirose'                  , ''   };

%% check system ID
system_ID = 0;
for i =1:length(ex_check)
    if exist(ex_check{i},'dir');
        system_ID = i;
        break
    end
end

if system_ID~=0
    for a = 1:size(rename,2)
        if a~=system_ID
            for b = 1:size(rename,1)
                fname = strrep(fname,rename{b,a},rename{b,system_ID});
            end
        end
    end
    
else % does not rename
    warning('unknown system');
    
end
fname_new = deblank(fname);

