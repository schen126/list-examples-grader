CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'
#CPATH = ".;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar"

rm -rf student-submission
rm -rf testing-directory

git clone $1 student-submission
echo 'Finished cloning'

cd student-submission

if [[ -f ListExamples.java ]]
then
    echo "Student submission found"
else
    echo "Need student-submission"
    exit 1
fi

cd ..
mkdir testing-directory
cp TestListExamples.java testing-directory
cp student-submission/ListExamples.java testing-directory
echo "Copied TestListExamples.java and ListExamples.java into testing-directory"
cp -r lib testing-directory
echo "Copied lib (JUnit) files into testing-directory"

#turn off set -e
#set +e
cd testing-directory
pwd 
javac -cp $CPATH *.java
echo "Compiled java files in testing-directory"
#java TestListExamples.java