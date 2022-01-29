@Echo Off
REM -------------------------
REM ENG :
REM -------------------------
REM This script create :
REM   - 1 repository origin, with some sample files
REM   - 3 local repositories (Jean, Pierre and Paul)
REM The goal is to simulate 3 users and a remote repository (but the remote reprository is also local : folder origin).
REM This allows you to do many tests of git with 3 different users.
REM -------------------------
REM FR :
REM -------------------------
REM Ce script créé :
REM   - 1 repository origin, avec quelques fichiers exemples
REM   - 3 repository locaux (Jean, Pierre et Paul)
REM Cela simulera 3 utilisateurs ainsi qu'un repository "distant" (mais qui sera local : dossier origin).
REM Cela permet de faire de nombreux tests de git avec 3 utilisateurs differents.
REM -------------------------

REM Repository origin
REM -------------------------
rmdir /S /Q .\origin
mkdir .\origin
cd .\origin
Rem --bare to create a repository that will do not have a working directory (to simulate a remote repository)
Rem --bare pour créer un repository qui n'aura pas de working directory (pour simulter un repository distant)
git --bare init 
git config --local user.email user_origin@nomail
git config --local user.name user_origin
cd ..

REM Repository Jean
REM -------------------------
rmdir /S /Q .\jean
mkdir .\jean
cd .\jean
git clone ..\origin .
git config --local user.email jean@nomail
git config --local user.name Jean
Rem First user will fill the repository using sample file data
Rem Le 1er utilisateur va remplir le repository avec des fichiers example
xcopy ..\_SampleData\*.* .
git add -A
git commit -am "First commit"
git push
Rem Sample file data end
Rem Fichiers d'examples terminés
cd ..

REM Repository Pierre
REM -------------------------
rmdir /S /Q .\pierre
mkdir .\pierre
cd .\pierre
git clone ..\origin .
git config --local user.email pierre@nomail
git config --local user.name Pierre
cd ..

REM Repository Paul
REM -------------------------
rmdir /S /Q .\paul
mkdir .\paul
cd .\paul
git clone ..\origin .
git config --local user.email paul@nomail
git config --local user.name Paul
cd ..






