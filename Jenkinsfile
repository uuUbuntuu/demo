pipeline{
    agent {
        label 'worker2'
    }
    tools{
        nodejs-v16.18.1
    }
    stages{
        stage("Build Project"){
            steps{
                sh 'npm install'
                sh 'npm run build'
            }
        }
    }
}
