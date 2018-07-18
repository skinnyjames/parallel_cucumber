echo 'hello from pipeline'
echo 'hello 3'

pipeline {
  agent {
    docker { image 'ruby:2.5' }
  }
  environment {
     GRID_IP = '192.168.140.20:4444'
     NODES = 2
  }
  stages {
    stage('Test') {
      steps {
        sh 'bundle install'
        //sh "bundle exec parallel_cucumber features/ -m ${env.NODES} -o IP=${env.GRID_IP}"
        sh "bundle exec cucumber features/ -o IP=${env.GRID_IP}"
      }
    }
  }
}
