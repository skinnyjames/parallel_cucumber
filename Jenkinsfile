echo 'hello from pipeline'
echo 'hello 3'

pipeline {
  agent {
    docker { image 'ruby:2.5' }
  }
  environment {
     GRID_IP = 'localhost:4444'
     NODES = 2
  }
  stages {
    stage('Test') {
      steps {
        sh 'bundle install'
        sh "bundle exec parallel_cucumber features/ -m ${env.NODES} -o IP=${env.GRID_IP}"
      }
    }
  }
}
