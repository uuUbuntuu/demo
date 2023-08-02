pipeline{
    agent any
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
                sh 'sudo docker build -t react-img .'
            }
        }
        stage("Deploy Service"){
            steps{
                sh 'sudo docker rm -f react-cont'
                sh 'sudo docker run -d -p 3030:80 --name react-cont react-img'
            }
        }
    }
}
