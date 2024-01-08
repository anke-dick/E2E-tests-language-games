


echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
echo "first step: check python installation and install all necessary packages"
which python3
python3 --version
pip3 --version
pip3 install -r requirements.txt


echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
echo "second step: check robot installation and create a reports folder / cleanup of existing one"
mkdir -p reports
robot --version
robot --outputdir reports .