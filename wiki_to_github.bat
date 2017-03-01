set datetimef=%date:~-4,4%%date:~-7,2%%date:~-10,2%_%time:~-11,2%%time:~-8,2%%time:~-5,2%


set gitdir=C:\Users\tw\app\win\PortableGit\cmd\git.exe

cd %~dp0
lib/matlab/functions/createHTMLTable.bat
cd %~dp0
%gitdir%  add --all & %gitdir% commit -m "Note %datetimef%" & %gitdir% push
