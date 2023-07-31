pipeline{
    agent {
        label 'worker2'
    }
    tools{
        nodejs 'nodejs'
    }
    stages{
        stage("Install Project"){
            steps{
                sh 'npm install --force'
            }
        }
    }
    stages{
        stage("Build Project"){
            steps{
                sh 'npm run build'
            }
        }
    }
    stages{
        stage("Build Image"){
            steps{
                sh 'docker build -t react-img .'
            }
        }
    }
    stages{
        stage("Deploy Service"){
            steps{
                sh 'docker rm -f react-cont'
                sh 'docker run -d -p 8080:80 react-img react-cont'
            }
        }
    }
}
