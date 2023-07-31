pipeline{
    agent {
        label 'worker2'
    }
    tools{
        nodejs 'nodejs'
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
