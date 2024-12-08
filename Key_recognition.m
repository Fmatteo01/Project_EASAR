function v = Key_recognition(Voice,fs)
    % Key_recognition: Compare the recordered voice with the keyword
    % Input: Voice, fs 
    % Output: flag for the result
    
    disp("Word detected:  ")
    disp(speech2text(Voice, fs))
    %  vvvvv----                        vvvvv---so it's not case sensitive
    if lower(speech2text(Voice, fs)) == lower("Forward")
        disp("Correct KEYWORD!")
        v=1;
    else 
        disp("GO AWAY!")
        v=0;
    
    end

end