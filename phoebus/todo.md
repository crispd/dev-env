# Write install script for installing
java-17-openjdk
maven-openjdk17 (too old, 3.6 or something)
may need to do the following instead:
    wget https://downloads.apache.org/maven/maven-3/3.9.5/binaries/apache-maven-3.9.5-bin.tar.gz
    sudo tar -xvf apache-maven-3.9.5-bin.tar.gz -C /opt
    sudo ln -s /opt/apache-maven-3.9.5 /opt/maven
    sudo vim /etc/profile.d/maven.sh
        export JAVA_HOME=/usr/lib/jvm/jre-openjdk
        export M2_HOME=/opt/maven
        export MAVEN_HOME=/opt/maven
        export PATH=${M2_HOME}/bin:${PATH}
    sudo chmod +x /etc/profile.d/maven.sh
    source /etc/profile.d/maven.sh
    mvn -v (to see that you have 3.9.5)
https://github.com/ControlSystemStudio/phoebus.git lib/phoebus (shouldn't this be /usr/lib/phoebus?)
