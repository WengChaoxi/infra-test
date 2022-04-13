def gv

pipeline {
    agent any
    environment {
        _VAR = 'this is a env variable'
    }

    parameters {
        choice(name: 'VERSION', choices: ['1.0.0', '2.0.0'], description: 'version description')
        booleanParam(name: 'executeTests', defaultValue: true, description: 'exec test description')
    }

    stages {
        
        stage("Init") {
            steps {
                script {
                    gv = load "script.groovy"
                }
            }
        }

        stage("Push artifact") {
            steps {
                sh 'mkdir -p archive'
                sh 'echo "@##TEXT##@" > archive/test.txt'
                sh "tar zcf test.tar.gz archive"
                archiveArtifacts artifacts: 'test.tar.gz', fingerprint: true
            }
        }

        stage("Build") {
            steps {
                script {
                    gv.build()
                }
            }
        }

        stage("Test") {
            when {
                expression {
                    // BRANCH_NAME == 'wengchaoxi-jenkins-test' && params.executeTests
                    params.executeTests
                }
            }
            steps {
                script {
                    gv.test()
                }
            }
        }

        stage("Deploy") {
            steps {
                script {
                    gv.deploy()
                }
            }
        }

        stage("Pull artifact") {
            steps {
                copyArtifacts filter: 'test.tar.gz', fingerprintArtifacts: true, projectName: '${JOB_NAME}', selector: specific('${BUILD_NUMBER}')
                sh '[ -d archive_new ] || mkdir archive_new'
                sh 'tar zxf test.tar.gz --directory=archive_new'
                sh 'cat archive_new/archive/test.txt'
            }
        }
    }

    post {
        always {
            script {
                cleanWs()
            }
            sh 'echo post: always'
        }
        success {
            sh 'echo post: success'
        }
        failure {
            sh 'echo post: failure'
        }
    }
}