:onCrash
echo [%date% %time%] Restarting BROKER...

F:
cd F:\pydarkstar\bin

set root=C:\Users\Kelly\anaconda3
call %root%\Scripts\activate.bat pydarkstar

python .\broker.py

echo BROKER was stopped or crashed!
GOTO onCrash