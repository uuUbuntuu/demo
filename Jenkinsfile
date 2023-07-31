pipeline{
    agent any
    tools{
        nodejs 'nodejs'
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
        stage("Deploy Service"){
            steps{
                sh 'docker rm -f react-cont'
                sh 'docker run -d react-img react-cont'
            }
        }
    }
}
