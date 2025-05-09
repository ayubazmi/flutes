Steps To Run ...

To Run it using jenkins pipeline..

pipeline {
    agent any

    environment {
        SONAR_HOME = tool "Sonar"
        PATH = "/opt/flutter/bin:$PATH"
    }

    stages {
        stage('Clone Repository') {
            steps {
                git url: 'https://github.com/ayubazmi/flutes.git', branch: 'main'
            }
        }


This will checkout code from repo  ..

stage('Install Flutter Dependencies') {
            steps {
                sh 'flutter pub get'
            }
        }


This will Install dependencies 


stage('Run Flutter Tests') {
            steps {
                sh 'flutter test test/widget_test.dart'
            }
        }  


This will run test which is under test/widgest_test.dart



 stage('Code Scan with SonarQube') {
            steps {
                withSonarQubeEnv("Sonar") {
                    sh "$SONAR_HOME/bin/sonar-scanner -Dsonar.projectName=Sonar -Dsonar.projectKey=SonarQube"
                }
            }
        } 

This will scan code with sonarqube...


stage('Build Web') {
            steps {
                sh 'flutter build web'
            }
        }

This will build web for app to access through browser.

stage('Serve Web App with Python') {
            steps {
                sh 'cd build/web && python3 -m http.server 8000 &'
                sleep time: 2, unit: 'MINUTES' 
            }
        }
    }  

And this is final step to run it via python server and it last for 2 minutes.







