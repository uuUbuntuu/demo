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
                    sh 'docker login -u ${USERNAME} -p ${PASSWORD} 34.142.197.25:5000'
                    sh 'docker tag react-img 34.142.197.25:5000/react-img:${BUILD_NUMBER}'
                    sh 'docker push 34.142.197.25:5000/react-img:${BUILD_NUMBER}'
                    sh 'docker logout'
                }
            }
        }
        stage("Deploy Service"){
            steps{
                sh 'docker rm -f react-cont'
                sh 'docker run -d -p 3030:80 --name react-cont react-imgs'
            }
        }
    }
    post {
        always {
            script {
                def botToken = '6403891540:AAHHqVRX5m8RWfOnBBPi90E69up4QPQrA94'
                def chatId = '-915617724'
                def jobStatus = currentBuild.currentResult == 'SUCCESS' ? 'successful' : 'failed'
                def jobId = env.BUILD_TAG
                def duration = currentBuild.durationString
                def buildNumber = currentBuild.number
                def message = "Job ${env.JOB_NAME} (${jobId})\nStatus: ${jobStatus}\nDuration: ${duration}\nBuild Number: ${buildNumber}"

                // Send Telegram notification
                sendTelegramMessage(botToken, chatId, message)
            }
        }
    }
}
def sendTelegramMessage(botToken, chatId, message) {
    sh "curl -X POST -H 'Content-Type: application/json' -d '{\"chat_id\":\"${chatId}\", \"text\":\"${message}\", \"parse_mode\":\"Markdown\"}' https://api.telegram.org/bot${botToken}/sendMessage"
}
