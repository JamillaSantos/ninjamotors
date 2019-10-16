pipeline {
    agent {
        docker {
            image 'ruby',
            args '--link selenium_server'
        }
    }

    stages {
        stage('Preparation') {
            steps {
                sh "bundle install"
            }
        }

        stage('Run Tests') {
            steps {
                sh "bundle exec cucumber -p ci -t @temp"
            }
        }
    }
}