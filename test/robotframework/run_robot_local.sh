


echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
echo "first step: check python installation and install all necessary packages"
which python3
python3 --version
pip3 --version
pip3 install -r requirements.txt

echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
echo "second step: check robot installation and create a reports folder / cleanup of existing one"
export REPORTS_FOLDER=reports
echo ${REPORTS_FOLDER}
#mkdir -p ${REPORTS_FOLDER}
rm -fR ${REPORTS_FOLDER}
robot --version

#echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
#echo "third step: installing chromedriver"
#brew install chromedriver
#
chromedriver --version

echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
echo "last step: executing robot tests"
#echo robot --outputdir ${REPORTS_FOLDER} .
robot --outputdir ${REPORTS_FOLDER} .