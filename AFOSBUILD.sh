rm -rf /opt/ANDRAX/nim

wget https://nim-lang.org/download/nim-2.2.2.tar.xz

if [ $? -eq 0 ]
then
  # Result is OK! Just continue...
  echo "Download NIM Source Code... PASS!"
else
  # houston we have a problem
  exit 1
fi

tar -xJf nim-2.2.2.tar.xz

if [ $? -eq 0 ]
then
  # Result is OK! Just continue...
  echo "Extract NIM Source Code... PASS!"
else
  # houston we have a problem
  exit 1
fi

mkdir /opt/ANDRAX/nim

cd nim-2.2.2

sh build.sh

if [ $? -eq 0 ]
then
  # Result is OK! Just continue...
  echo "Run build.sh... PASS!"
else
  # houston we have a problem
  exit 1
fi

bin/nim c koch

if [ $? -eq 0 ]
then
  # Result is OK! Just continue...
  echo "NIM Compile koch... PASS!"
else
  # houston we have a problem
  exit 1
fi

./koch boot -d:release

if [ $? -eq 0 ]
then
  # Result is OK! Just continue...
  echo "RUN koch boot -d:release... PASS!"
else
  # houston we have a problem
  exit 1
fi

./koch tools

if [ $? -eq 0 ]
then
  # Result is OK! Just continue...
  echo "RUN koch tools... PASS!"
else
  # houston we have a problem
  exit 1
fi

cp -Rf * /opt/ANDRAX/nim/

cp -Rf ../andraxbin/* /opt/ANDRAX/bin
