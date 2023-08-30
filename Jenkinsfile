pipeline{
    agent{
        label 'node2'
    }
    stages{
        /*
        stage("Install Project"){
            steps{
                sh 'npm install --force'
            }
        }
        stage("Build Project"){
            steps{
                sh 'npm run build'
            }
        }
        */
        stage("Build Image"){
            steps{
                sh 'docker build -t react-img .'
            }
        }
        stage("Push Image"){
            steps{
                withCredentials([usernamePassword(credentialsId: 'nexus', passwordVariable: 'PASSWORD', usernameVariable: 'USERNAME')]) {
                    sh 'docker login -u ${USERNAME} -p ${PASSWORD}'
                    sh 'docker push 34.142.197.25:5000/react-img:${BUILD_NUMBER}'
                    sh 'docker logout'
                }
            }
        }
        stage("Deploy Service"){
            steps{
                sh 'docker rm -f react-cont'
                sh 'docker run -d -p 3030:80 --name react-cont react-img'
            }
        }
    }
}
