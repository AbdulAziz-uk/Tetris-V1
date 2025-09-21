## ReactJs: Tetris Game V1 &amp; V2 Deployed on EKS using ArgoCD, Git-Terraform-sonarqube-npm-trivy-OWASP-Docker
<ul>
<li>Tetris-V1
<ul>
<li><a href="https://stardistributors.co.uk/devops/devops_tools/projects/tetris_game/aws/tetris_aws1.jpg" target="_blank" rel="noopener"><img src="https://stardistributors.co.uk/devops/devops_tools/projects/tetris_game/aws/tetris_aws1.jpg" alt="" width="425" height="267" /></a></li>
</ul>
</li>
<li>Tetrs-V2
<ul>
<li><a href="https://stardistributors.co.uk/devops/devops_tools/projects/tetris_game/aws/tetris_aws2.jpg" target="_blank" rel="noopener"><img src="https://stardistributors.co.uk/devops/devops_tools/projects/tetris_game/aws/tetris_aws2.jpg" alt="" width="587" height="232" /></a></li>
</ul>
</li>
<li>CI/CD Stages
<ul>
<li><img src="https://stardistributors.co.uk/devops/devops_tools/projects/tetris_game/aws/tetris_aws23.jpg" alt="" width="1033" height="268" /></li>
</ul>
</li>
<li>Tools &amp; Services used:
<ul>
<li><a href="https://stardistributors.co.uk/devops/devops_tools/projects/tetris_game/aws/tetris_aws3.jpg" target="_blank" rel="noopener"><img src="https://stardistributors.co.uk/devops/devops_tools/projects/tetris_game/aws/tetris_aws3.jpg" alt="" width="583" height="315" /></a></li>
<li></li>
</ul>
</li>
<li><details><summary>Clone Repositories (4)</summary>
<ul>
<li>The following 4 repositoires are integrated or has connection.</li>
<li>Tetris-V1 Version: $git clone&nbsp;<a href="https://github.com/AbdulAziz-uk/Tetris-V1.git">https://github.com/AbdulAziz-uk/Tetris-V1.git</a></li>
<li>Tetris-V2 Version:&nbsp;$git clone&nbsp;<a href="https://github.com/AbdulAziz-uk/Tetris-V2.git">https://github.com/AbdulAziz-uk/Tetris-V2.git</a>&nbsp;</li>
<li>Tetris-manifest:&nbsp;$git clone&nbsp;<a href="https://github.com/AbdulAziz-uk/Tetris-manifest.git">https://github.com/AbdulAziz-uk/Tetris-manifest.git</a>&nbsp;</li>
<li>Tetris-Game:&nbsp;$git clone&nbsp;<a href="https://github.com/AbdulAziz-uk/tetris-game.git">https://github.com/AbdulAziz-uk/tetris-game.git</a>&nbsp;</li>
</ul>
</details></li>
<li><details><summary>Project Architect</summary>
<ul>
<li><a href="https://stardistributors.co.uk/devops/devops_tools/projects/tetris_game/aws/tetris_aws3.jpg" target="_blank" rel="noopener"><img src="https://stardistributors.co.uk/devops/devops_tools/projects/tetris_game/aws/tetris_aws3.jpg" alt="" width="583" height="315" /></a></li>
</ul>
</details></li>
<li><details><summary>Deploy Locally</summary>
<ul>
<li>Code</li>
</ul>
</details></li>
<li><details><summary>Infra creation for Jenkins, sonarqube, Trivy, kubectl , AWS CLI, Terraform through terraform file</summary>
<ul>
<li>with the help of jenkins-terraform script, install jenkins along with plugins.</li>
<li>Create a IAM user with AdministratorAccess policy assigned, get access key and secret key.</li>
<li>Install git, AWS CLI, terraform on local laptop and connect to AWS using access key and secret key with $aws configure.&nbsp; Install with script&nbsp;<a href="https://github.com/AbdulAziz-uk/script_for_installing_devops_tools.git">https://github.com/AbdulAziz-uk/script_for_installing_devops_tools.git</a>&nbsp;</li>
<li>Clone Tetris-V1 repository: $git clone&nbsp;<a href="https://github.com/AbdulAziz-uk/Tetris-V1.git">https://github.com/AbdulAziz-uk/Tetris-V1.git</a></li>
<li><a href="https://stardistributors.co.uk/devops/devops_tools/projects/tetris_game/aws/tetris_aws4.jpg" target="_blank" rel="noopener"><img src="https://stardistributors.co.uk/devops/devops_tools/projects/tetris_game/aws/tetris_aws4.jpg" alt="" width="583" height="251" /></a></li>
<li>In Jenkins-terraform folder, you have
<ul>
<li>backend.tf
<ul>
<li><img src="https://stardistributors.co.uk/devops/devops_tools/projects/tetris_game/aws/tetris_aws5.jpg" alt="" width="544" height="184" /></li>
<li>Create a bucket name = star_bucket in AWS</li>
<li>Store terraform.tfstate file to bucket (star_bucket).</li>
</ul>
</li>
<li>install_jenkins.sh
<ul>
<li><a href="https://stardistributors.co.uk/devops/devops_tools/projects/tetris_game/aws/tetris_aws6.jpg" target="_blank" rel="noopener"><img src="https://stardistributors.co.uk/devops/devops_tools/projects/tetris_game/aws/tetris_aws6.jpg" alt="" width="565" height="367" /></a></li>
<li>Install jenkins on EC2 instance.</li>
<li>Install docker container</li>
<li>Install trivy</li>
<li>Install terraform</li>
<li>Install kubectl on jenkins</li>
<li>Install AWS CLI</li>
</ul>
</li>
<li>main.tf
<ul>
<li><a href="https://stardistributors.co.uk/devops/devops_tools/projects/tetris_game/aws/tetris_aws8.jpg" target="_blank" rel="noopener"><img src="https://stardistributors.co.uk/devops/devops_tools/projects/tetris_game/aws/tetris_aws8.jpg" alt="" width="285" height="486" /></a></li>
<li>creating IAM role, it is required while creating EKS cluster.</li>
<li>Attaching AdministratorAccess policy</li>
<li>Creating security group with ports 22,80,443,8080,9000,3000 open</li>
<li>Creating EC2 instance (t2.large), keypair- , attache secrity group, use install_jenkins.sh to install jenkins.&nbsp; attache iam role.</li>
</ul>
</li>
<li>providers.tf
<ul>
<li><img src="https://stardistributors.co.uk/devops/devops_tools/projects/tetris_game/aws/tetris_aws7.jpg" alt="" width="348" height="284" /></li>
<li>AWS provider details</li>
</ul>
</li>
</ul>
</li>
<li>tetris-V1\Jenkins-terraform$terraform init</li>
<li>tetris-V1\Jenkins-terraform$terraform validate</li>
<li>tetris-V1\Jenkins-terraform$terraform plan</li>
<li>tetris-V1\Jenkins-terraform$terraform apply&nbsp; --auto-approve&nbsp;</li>
<li>It will create 5 resources,&nbsp;</li>
<li>Login to Jenkins, install folowing plugins and perform integration.
<ul>
<li>tools --&gt; terraform (it is installed locally in the instance, we need to define location of terraform in tools section)&nbsp; run $which terraform to get path, Go to plugins and install terraform arestart jenkins, once restarted g to tools--&gt;terraform --&gt;add Terraform and name=terraform and remove install automatically as it has been installed locally, just&nbsp; define install directory /usr/bin/&nbsp; than apply and save.</li>
<li></li>
</ul>
</li>
<li>Login to sonarqube and perform integration with jenkins.</li>
<li>check it install trivy, aws cli and terraform, kubectl</li>
</ul>
</details></li>
<li><details><summary>CI/CD Deploy on Docker Containers with Parameterised</summary>
<ul>
<li>Login to Jenkins.</li>
<li>Create New item, name = tetris_V1, select pipeline and ok</li>
<li>Select This project is parameterised --&gt; Add parameter --&gt;choice parameter, Name=action, choices = apply destroy
<ul>
<li>apply = apply resources while using terraform file</li>
<li>destory= to delete resources.</li>
</ul>
</li>
<li><a href="https://stardistributors.co.uk/devops/devops_tools/projects/tetris_game/aws/tetris_V1.yaml" target="_blank" rel="noopener">pipeline yaml script</a>.</li>
<li>
<div>pipeline{</div>
<div>&nbsp; &nbsp; agent any</div>
<div>&nbsp; &nbsp; tools{</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; jdk 'jdk17'</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; nodejs 'node16'</div>
<div>&nbsp; &nbsp; }</div>
<div>envoronment{&nbsp;&nbsp;
<div>
<div>&nbsp; &nbsp; &nbsp;SCANNER_HOME= tool 'sonar-scanner'</div>
<div>&nbsp; &nbsp; }</div>
</div>
</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; stages{</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; stage('clean Workspace'){</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; steps{</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; cleanWs()</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; stage('checkout from Git'){</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; steps{</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; git branch:'main', url:'https://github.com/AbdulAziz-uk/Tetris-V1.git'</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; stage("Sonarqube Analysis "){</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; steps{</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; withSonarQubeEnv('sonar') {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; sh ''' $SCANNER_HOME/bin/sonar-scanner -Dsonar.projectName=tetrisv1 \</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; -Dsonar.projectKey=tetrisv1 '''</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; stage("quality gate"){</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;steps {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; script {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; waitForQualityGate abortPipeline:false, credentialsId: 'sonar-token'</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; stage("NPM") {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; steps {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; sh "npm install"</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; stage('TRIVY FS SCAN') {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; steps {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; sh "trivy fs . &gt; trivyfs.txt"</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; stage('OWASP FS SCAN') {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; steps {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; dependencyCheck additionalArguments:'--scan ./ --disableYarnAudit --disableNodeAudit', odcInstallation:'DC'</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; dependencyCheckPublisher pattern:'**/dependency-check-report.xml'</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; stage('Docker Build &amp; Push Image') {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; steps {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;script {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; withDockerRegistry(credentialsId:'docker-cred', toolName:'docker'){</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; sh "docker build -t tetrisv1 ."</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; sh "docker tag tetrisv1 aziz27uk/tetrisv1:latest"</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; sh"docker push aziz27uk/tetrisv1:latest"</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; stage('TRIVY Image SCAN') {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; steps {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;sh "trivy image aziz27uk/tetrisv1:latest &gt; trivyimage.txt"</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; }</div>
<div>}</div>
<div>&nbsp;</div>
</li>
<li>Run Build.</li>
</ul>
</details></li>
<li><details><summary>Image Update on Deployment.yaml file with CI/CD.</summary>
<ul>
<li>Tetris-manifest repository:&nbsp;&nbsp;<a href="https://github.com/AbdulAziz-uk/Tetris-manifest.git">https://github.com/AbdulAziz-uk/Tetris-manifest.git</a>&nbsp;</li>
<li><a href="https://stardistributors.co.uk/devops/devops_tools/projects/tetris_game/aws/tetris_aws12.jpg" target="_blank" rel="noopener"><img src="https://stardistributors.co.uk/devops/devops_tools/projects/tetris_game/aws/tetris_aws12.jpg" alt="" width="465" height="305" /></a></li>
<li>open Tetris-manifest file in github and see deployment.yaml file where image: image update will be updated automatically after CI/CD pipeline executed with the image name defined in yaml code.</li>
<li><a href="https://stardistributors.co.uk/devops/devops_tools/projects/tetris_game/aws/tetris_aws11.jpg" target="_blank" rel="noopener"><img src="https://stardistributors.co.uk/devops/devops_tools/projects/tetris_game/aws/tetris_aws11.jpg" alt="" width="599" height="501" /></a></li>
<li>Yaml code check in Tetris_v1 repository/README:&nbsp;https://github.com/AbdulAziz-uk/Tetris-V1.git</li>
<li>Either add this stage in CI/CD Deploy on Docker Containers yaml code and execute or create a new CI/CD pipeline adn execute to update image name in Tetris-manifest repository/Deployment.yaml.</li>
<li>Adding stage in the above CI/CD pipeline:
<ul>
<li><a href="https://stardistributors.co.uk/devops/devops_tools/projects/tetris_game/aws/tetris_v1_manifes_update.yaml" target="_blank" rel="noopener">Yaml Code</a></li>
<li>
<div>
<div>
<div>pipeline{</div>
<div>&nbsp; &nbsp; agent any</div>
<div>&nbsp; &nbsp; tools{</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; jdk 'jdk17'</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; nodejs 'node16'</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; terraform 'terraform'</div>
<div>&nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; environment {</div>
<div>&nbsp; &nbsp; &nbsp; SCANNER_HOME= tool 'sonar-scanner'</div>
<div><strong><span style="color: #008000;">&nbsp; &nbsp; &nbsp; GIT_REPO_NAME = "Tetris-manifest"</span></strong></div>
<div><strong><span style="color: #008000;">&nbsp; &nbsp; &nbsp; GIT_USER_NAME = "AbdulAziz-uk"</span></strong></div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; stages{</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; stage('clean Workspace'){</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; steps{</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; cleanWs()</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; stage('checkout from Git'){</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; steps{</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; git branch:'main', url:'https://github.com/AbdulAziz-uk/Tetris-V1.git'</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; stage("Sonarqube Analysis "){</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; steps{</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; withSonarQubeEnv('sonar') {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; sh ''' $SCANNER_HOME/bin/sonar-scanner -Dsonar.projectName=tetrisv1 \</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; -Dsonar.projectKey=tetrisv1 '''</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; stage("quality gate"){</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;steps {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; script {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; waitForQualityGate abortPipeline:false, credentialsId: 'sonar-token'</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; stage("NPM") {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; steps {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; sh "npm install"</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; stage('TRIVY FS SCAN') {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; steps {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; sh "trivy fs . &gt; trivyfs.txt"</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; stage('OWASP FS SCAN') {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; steps {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; dependencyCheck additionalArguments:'--scan ./ --disableYarnAudit --disableNodeAudit', odcInstallation:'DC'</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; dependencyCheckPublisher pattern:'**/dependency-check-report.xml'</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; stage('Docker Build &amp; Push Image') {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; steps {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;script {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; withDockerRegistry(credentialsId:'docker-cred', toolName:'docker'){</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; sh "docker build -t tetrisv1 ."</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; sh "docker tag tetrisv1 aziz27uk/tetrisv1:latest"</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; sh"docker push aziz27uk/tetrisv1:latest"</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; stage('TRIVY Image SCAN') {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; steps {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;sh "trivy image --scanners vuln --offline-scan aziz27uk/tetrisv1:latest &gt; trivyresults.txt"</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;<strong><span style="color: #008000;"> stage('Git Checkout') {</span></strong></div>
<div><strong><span style="color: #008000;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; steps {</span></strong></div>
<div><strong><span style="color: #008000;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; git branch:'main', url: 'https://github.com/AbdulAziz-uk/Tetris-manifest.git'</span></strong></div>
<div><strong><span style="color: #008000;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }</span></strong></div>
<div><strong><span style="color: #008000;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }</span></strong></div>
<div><strong><span style="color: #008000;">&nbsp; &nbsp; &nbsp; &nbsp; stage('Update Deployment File') {</span></strong></div>
<div><strong><span style="color: #008000;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; steps {</span></strong></div>
<div><strong><span style="color: #008000;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; script {</span></strong></div>
<div><strong><span style="color: #008000;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;withCredentials([string(credentialsId:'github-cred', variable:'GITHUB_TOKEN')]) {</span></strong></div>
<div><strong><span style="color: #008000;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; // Determine the image name dynamically based on your versioning strategy</span></strong></div>
<div><strong><span style="color: #008000;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; NEW_IMAGE_NAME = "aziz27uk/tetrisv1:latest"</span></strong></div>
<div><strong><span style="color: #008000;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; // Replace the image name in the deployment.yaml file</span></strong></div>
<div><strong><span style="color: #008000;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; sh "sed -i 's|image: .*|image:$NEW_IMAGE_NAME|' deployment.yml"</span></strong></div>
<div><strong><span style="color: #008000;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; // Git commands to stage, commit, and push the changes</span></strong></div>
<div><strong><span style="color: #008000;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; sh 'git add deployment.yml'</span></strong></div>
<div><strong><span style="color: #008000;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; sh "git config --global user.email aziz27uk@yahoo.co.uk"</span></strong></div>
<div><strong><span style="color: #008000;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; sh "git config --global user.name AbdulAziz-uk"</span></strong></div>
<div><strong><span style="color: #008000;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; sh "git commit -m 'Update deployment image to $NEW_IMAGE_NAME'"</span></strong></div>
<div><strong><span style="color: #008000;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; sh "git push https://${GITHUB_TOKEN}@github.com/${GIT_USER_NAME}/${GIT_REPO_NAME} HEAD:main"</span></strong></div>
<div><strong><span style="color: #008000;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }</span></strong></div>
<div><strong><span style="color: #008000;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }</span></strong></div>
<div><strong><span style="color: #008000;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</span></strong></div>
<div><strong><span style="color: #008000;">&nbsp; &nbsp; &nbsp; &nbsp;}</span></strong></div>
<div>&nbsp; &nbsp; }</div>
<div>}</div>
</div>
</div>
<div>&nbsp; &nbsp;&nbsp;</div>
</li>
<li>Run Pipeline</li>
</ul>
</li>
<li>Create a new CI/CD pipeline and execute to update image name in Tetris-manifest repository/deployment.yaml.
<ul>
<li>Yaml Code</li>
<li>
<div>
<div>pipeline{</div>
<div>&nbsp; &nbsp; agent any</div>
<div>&nbsp; &nbsp; tools{</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; jdk 'jdk17'</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; nodejs 'node16'</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; environment {</div>
<div>&nbsp; &nbsp; &nbsp; GIT_REPO_NAME = "Tetris-manifest"</div>
<div>&nbsp; &nbsp; &nbsp; GIT_USER_NAME = "AbdulAziz-uk"</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; stages {</div>
<div>&nbsp; &nbsp; stage('Git Checkout') {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; steps {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; git branch:'main', url: 'https://github.com/AbdulAziz-uk/Tetris-manifest.git'</div>
<div>&nbsp; &nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; stage('Update Deployment File') {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; steps {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; script {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;withCredentials([string(credentialsId:'github-cred', variable:'GITHUB_TOKEN')]) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; NEW_IMAGE_NAME = "aziz27uk/tetrisv1:latest"</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; sh "sed -i 's|image: .*|image: $NEW_IMAGE_NAME|' deployment.yml"</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; sh 'git add deployment.yml'</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; sh "git config --global user.email aziz27uk@yahoo.co.uk"</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; sh "git config --global user.name AbdulAziz-uk"</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; sh "git commit -m 'Update deployment image to $NEW_IMAGE_NAME'"</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; sh "git push https://${GITHUB_TOKEN}@github.com/${GIT_USER_NAME}/${GIT_REPO_NAME} HEAD:main"</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; }</div>
<div>}</div>
</div>
</li>
<li>Run Pipeline, it will update the image name in deployment.yaml file.</li>
</ul>
</li>
</ul>
</details></li>
<li><details><summary>Create EKS cluster with terraform using Jenkins CI/CD pipeline</summary>
<ul>
<li>Creating EKS cluster&nbsp;</li>
<li>Method1:</li>
<li>Install /configure AWS EKS using script.&nbsp; store terraform state file in S3 Bucket.</li>
<li>In Infra Setup for CI/CD we already clone the Tetris-V1 repository.</li>
<li>Go to folder EKS-terraform.</li>
<li><a href="https://stardistributors.co.uk/devops/devops_tools/projects/tetris_game/aws/tetris_aws9.jpg" target="_blank" rel="noopener"><img src="https://stardistributors.co.uk/devops/devops_tools/projects/tetris_game/aws/tetris_aws9.jpg" alt="" width="571" height="246" /></a></li>
<li>backend/tf
<ul>
<li><img src="https://stardistributors.co.uk/devops/devops_tools/projects/tetris_game/aws/tetris_aws10.jpg" alt="" width="638" height="167" /></li>
</ul>
</li>
<li>main.tf
<ul>
<li>It will create iam role</li>
<li>create vpc</li>
<li>create EKs cluster with IAM role attachment</li>
<li>Create IAM for node group.</li>
<li>Policies</li>
<li>Create node group (change to t2_medium atleast)</li>
</ul>
</li>
<li>provider.tf</li>
<li>Method2:</li>
<li>Click for Github repository: <a href="https://github.com/AbdulAziz-uk/EKS_with_Terraform.git" target="_blank" rel="noopener">EKS_with Terraform</a></li>
<li>Install AWS CLI:&nbsp; Create a VM or perform on your local computer:&nbsp;
<ul>
<li>on your laptop / local VM / AWS VM through we can configure EKS cluster on AWS</li>
<li>Get Security Credentials (AWS Security Key, Security Access Key) of a user from AWS(click on user top right corner on aws console and security credentials/ AWS command CLI/ and create keys)</li>
<li>ubuntu@ip-172-31-37-97:~$ sudo apt up</li>
<li>$curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"<br />sudo apt-get install unzip -y<br />unzip awscliv2.zip<br />sudo ./aws/install</li>
<li>$aws configure</li>
<li>Enter access key and secret access key, Region (eu-west-2)</li>
</ul>
</li>
<li>Clone Repository of EKS with Terraform:
<ul>
<li>$git clone&nbsp;<a href="https://github.com/AbdulAziz-uk/EKS_with_Terraform.git">https://github.com/AbdulAziz-uk/EKS_with_Terraform.git</a></li>
<li>$cd EKS_with_terraform:&nbsp; This folder contain</li>
<li>RBAC</li>
<li>main.tf: It contains all the codes to create VPC and EKS</li>
<li>output.tf:&nbsp; It outputs cluster id, nodegroup id, vpc id, subnet id.</li>
<li>variable.tf: It contains ssh key of AWS</li>
</ul>
</li>
<li>Install Terraform:
<ul>
<li>$sudo vim terraform.sh</li>
<li>paste the below script
<ul>
<li>
<p>#!/bin/bash<br /># Script to install Terraform on an instance</p>
<p># Update package list and install dependencies<br />sudo apt-get update &amp;&amp; sudo apt-get install -y gnupg software-properties-common</p>
<p># Add HashiCorp GPG key<br />wget -O- https://apt.releases.hashicorp.com/gpg | \<br />gpg --dearmor | \<br />sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg &gt; /dev/null</p>
<p># Verify the key fingerprint<br />gpg --no-default-keyring \<br />--keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \<br />--fingerprint</p>
<p># Add HashiCorp repository to sources list<br />echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \<br />https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \<br />sudo tee /etc/apt/sources.list.d/hashicorp.list</p>
<p># Update package lists<br />sudo apt update</p>
<p># Install Terraform<br />sudo apt-get install terraform -y</p>
<p>## Verify installation<br />terraform -v</p>
</li>
</ul>
</li>
<li>make script executable</li>
<li>$sudo chmod +x terraform.sh</li>
<li>Run Script</li>
<li>$sudo sh terraform.sh (it will install terraform)</li>
<li>$terraform --version</li>
</ul>
</li>
<li>Configure EKS on AWS:
<ul>
<li>Initialize the terraform.</li>
<li>ubuntu@ip-172-31-37-97:~/EKS_with_Terraform$ terraform init</li>
<li>Run terraform plan:</li>
<li>ubuntu@ip-172-31-37-97:~/EKS_with_Terraform$ terraform plan</li>
<li>&nbsp;Run Terraform apply:</li>
<li>ubuntu@ip-172-31-37-97:~/EKS_with_Terraform$ terraform apply&nbsp; --auto-approve</li>
<li>It will create 19 resources:</li>
</ul>
</li>
<li>Configure Kubeconfig:&nbsp; We will be able to access the cluster.
<ul>
<li>ubuntu@ip-172-31-37-97:~/EKS_with_Terraform$aws&nbsp;eks --region eu-west-2 update-kubeconfig --name star-cluster</li>
<li>Added new context arn:aws:eks:eu-west-2:034646250868:cluster/star-cluster to /home/ubuntu/.kube/config</li>
</ul>
</li>
<li>Install kubectl:&nbsp; We can communicate with cluster and perform commands&nbsp;
<ul>
<li>ubuntu@ip-172-31-37-97:~/EKS_with_Terraform$curl -LO https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl<br />sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl<br />kubectl version --client</li>
</ul>
</li>
<li>Install eksctl:
<ul>
<li>ubuntu@ip-172-31-37-97:~/EKS_with_Terraform$curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp<br />sudo mv /tmp/eksctl /usr/local/bin<br />kubectl version --client</li>
</ul>
</li>
<li>Associate iam-oidc-provider:
<ul>
<li>ubuntu@ip-172-31-37-97:~$ eksctl utils associate-iam-oidc-provider --region eu-west-2 --cluster star-cluster --approve</li>
</ul>
</li>
<li>Create IAM Service Account for EBS CSI Driver:
<ul>
<li>ubuntu@ip-172-31-37-97:~$eksctl create iamserviceaccount \<br /> --region eu-west-2 \<br /> --name ebs-csi-controller-sa \<br /> --namespace kube-system \<br /> --cluster star-cluster \<br /> --attach-policy-arn arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy \<br /> --approve \<br /> --override-existing-serviceaccounts</li>
</ul>
</li>
<li>Deploy Add-Ons
<ul>
<li>EBS CSI Driver:</li>
<li>ubuntu@ip-172-31-37-97:~$kubectl apply -k "github.com/kubernetes-sigs/aws-ebs-csi-driver/deploy/kubernetes/overlays/stable/ecr/?ref=release-1.11"</li>
<li>NGINX Ingress Controller:</li>
<li>ubuntu@ip-172-31-37-97:~$kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/cloud/deploy.yaml</li>
<li>cert-manager:</li>
<li>ubuntu@ip-172-31-37-97:~$kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.12.0/cert-manager.yaml</li>
</ul>
</li>
<li>Create CI/CD pipeline project.
<ul>
<li>create parameterized: choice parameter Name=action,</li>
<li>choices = apply destroy</li>
<li>pipeline script.</li>
<li>Run build.</li>
</ul>
</li>
</ul>
</details></li>
<li><details><summary>CI/CD Deploy Tetris V1 on Kubernetes Cluster using Gitops with ArgoCD</summary>
<ul>
<li>Installing ArgoCD on EKS, click on link:&nbsp;<a href="https://archive.eksworkshop.com/intermediate/290_argocd/install/" rel="nofollow">https://archive.eksworkshop.com/intermediate/290_argocd/install/</a></li>
<li>Installing ArgoCD on KinD:
<ul>
<li>$kubectl get nodes.</li>
<li><img src="https://stardistributors.co.uk/devops/devops_tools/projects/tetris_game/aws/tetris_aws13.jpg" alt="" width="666" height="146" /></li>
<li>$kubectl create namespace argocd</li>
<li>$kubectl get namespace</li>
<li>$wget&nbsp;<a class="ah mt" href="https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yam" target="_blank" rel="noopener ugc nofollow">https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yam</a>l</li>
<li>$vi install.yaml (enter port number as we have used custom port number (58350) while creating Kind)</li>
<li>search by typing /kind: Service&nbsp; and look for port : 80, Port 443 and add the custom port number, save &amp; exit</li>
<li><a href="https://stardistributors.co.uk/devops/devops_tools/projects/tetris_game/aws/tetris_aws14.jpg" target="_blank" rel="noopener"><img src="https://stardistributors.co.uk/devops/devops_tools/projects/tetris_game/aws/tetris_aws14.jpg" alt="" width="450" height="410" /></a></li>
<li>$ kubectl apply -f install.yaml -n argocd&nbsp; (make sure you define namespace -n argocd)</li>
<li>$ kubectl get svc -n argocd</li>
<li><img src="https://stardistributors.co.uk/devops/devops_tools/projects/tetris_game/aws/tetris_aws15.jpg" alt="" width="1361" height="259" /></li>
<li>Get VM IP where KindD is installed (ifconfig)</li>
<li><a href="https://stardistributors.co.uk/devops/devops_tools/projects/tetris_game/aws/tetris_aws16.jpg" target="_blank" rel="noopener"><img src="https://stardistributors.co.uk/devops/devops_tools/projects/tetris_game/aws/tetris_aws16.jpg" alt="" width="567" height="357" /></a></li>
<li>Access Argocd: <a href="http://VM_IP:32100">http://VM_IP:32100</a></li>
<li>user name= admin</li>
<li>For pasword run $kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d &amp;&amp; echo&nbsp; &nbsp;(-98yYwJW8kPF9Arc)</li>
<li>Connect Repository:&nbsp;
<ul>
<li>Go to Settings--&gt;Repositories--&gt;+connect REPO--&gt;</li>
<li>choose your connection method: VIA HTTP/HTTPS</li>
<li>Type = git</li>
<li>Name (optional):</li>
<li>Project: default</li>
<li>Repository URL:&nbsp;<a href="https://github.com/AbdulAziz-uk/Tetris-manifest.git">https://github.com/AbdulAziz-uk/Tetris-manifest.git</a>&nbsp;(it contains deployment.yml) manifest file.</li>
<li>username (optional), Password (optional): leave it blank if repository is public</li>
<li>connect</li>
<li><img src="https://stardistributors.co.uk/devops/devops_tools/projects/tetris_game/aws/tetris_aws18.jpg" alt="" width="1098" height="117" /></li>
</ul>
</li>
<li>Add Application:
<ul>
<li>Click Application--&gt;+New App</li>
<li>Application Name: tetrisv1 (lower case)</li>
<li>Project Name: default</li>
<li>SYNC POLICY: selet automatic</li>
<li>Prune Propagation Policy: Forground</li>
<li>Source:</li>
<li>Repository URL:&nbsp;<a href="https://github.com/AbdulAziz-uk/Tetris-manifest.git">https://github.com/AbdulAziz-uk/Tetris-manifest.git</a></li>
<li>Revision: HEAD</li>
<li>Branches: select branch</li>
<li>Path: enter the location of manifest.yaml: ./</li>
<li>Destination:&nbsp;</li>
<li>Cluster URL:&nbsp;<a href="https://kubernetes.default.svc">https://kubernetes.default.svc</a>&nbsp;(it will popup)</li>
<li>Namespace: default (or any creaed )</li>
<li>Create</li>
<li><img src="https://stardistributors.co.uk/devops/devops_tools/projects/tetris_game/aws/tetris_aws19.jpg" alt="" width="428" height="343" /></li>
<li>Click on tetrisv1 for further details and monitoring.</li>
<li><a href="https://stardistributors.co.uk/devops/devops_tools/projects/tetris_game/aws/tetris_aws20.jpg" target="_blank" rel="noopener"><img src="https://stardistributors.co.uk/devops/devops_tools/projects/tetris_game/aws/tetris_aws20.jpg" alt="" width="502" height="199" /></a></li>
<li>In manifest file LoadBalancer service has been defined.&nbsp;&nbsp;</li>
<li>Access the application with LB IP.</li>
</ul>
</li>
</ul>
</li>
</ul>
</details></li>
<li><details><summary>Infra Setup for Monitoring</summary>
<ul>
<li>Code</li>
</ul>
</details></li>
<li><details open=""><summary>Monitoring of Appliction</summary>
<ul>
<li>Code</li>
</ul>
</details></li>
<li><details open=""><summary>Monitoring of Kubernetes Cluster</summary>
<ul>
<li>Code</li>
</ul>
</details></li>
<li><details><summary>CI/CD Deploy Tetris V2 on Kubernetes Cluster using Gitops with ArgoCD</summary>
<ul>
<li><img src="https://stardistributors.co.uk/devops/devops_tools/projects/tetris_game/aws/tetris_aws23.jpg" alt="" width="1033" height="268" /></li>
<li>We have deployed Version 1 in earlier step, deploy version 2 using the Tetris-V2 repository.&nbsp;&nbsp;</li>
<li>Change repository image to v2 in manifest_update pipeline.</li>
<li>Define a stage to execute manifest pipeline.</li>
<li>
<div>
<div><strong><span style="color: #008000;">stage('Execute manifest_update pipeline') {</span></strong></div>
<div><strong><span style="color: #008000;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; steps {</span></strong></div>
<div><strong><span style="color: #008000;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; build job: 'manifest', wait:true</span></strong></div>
<div><strong><span style="color: #008000;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }</span></strong></div>
<div><strong><span style="color: #008000;">&nbsp; &nbsp; &nbsp; &nbsp; }</span></strong></div>
</div>
</li>
<li><a href="https://stardistributors.co.uk/devops/devops_tools/projects/tetris_game/aws/tetris_aws21.jpg" target="_blank" rel="noopener"><img src="https://stardistributors.co.uk/devops/devops_tools/projects/tetris_game/aws/tetris_aws21.jpg" alt="" width="655" height="295" /></a></li>
<li><a href="https://stardistributors.co.uk/devops/devops_tools/projects/tetris_game/aws/tetris_V2.yaml" target="_blank" rel="noopener">yaml code:</a></li>
<li>
<div>
<div>pipeline{</div>
<div>&nbsp; &nbsp; agent any</div>
<div>&nbsp; &nbsp; tools{</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; jdk 'jdk17'</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; nodejs 'node16'</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; terraform 'terraform'</div>
<div>&nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; environment {</div>
<div>&nbsp; &nbsp; &nbsp; SCANNER_HOME= tool 'sonar-scanner'</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; stages{</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; stage('clean Workspace'){</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; steps{</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; cleanWs()</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; stage('checkout from Git'){</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; steps{</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; git branch:'main', url:'https://github.com/AbdulAziz-uk/Tetris-V2.git'</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; stage("Sonarqube Analysis "){</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; steps{</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; withSonarQubeEnv('sonar') {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; sh ''' $SCANNER_HOME/bin/sonar-scanner -Dsonar.projectName=tetrisv2 \</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; -Dsonar.projectKey=tetrisv2 '''</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; stage("quality gate"){</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;steps {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; script {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; waitForQualityGate abortPipeline:false, credentialsId: 'sonar-token'</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; stage("NPM") {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; steps {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; sh "npm install"</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; stage('TRIVY FS SCAN') {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; steps {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; sh "trivy fs . &gt; trivyfs.txt"</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; stage('OWASP FS SCAN') {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; steps {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; dependencyCheck additionalArguments:'--scan ./ --disableYarnAudit --disableNodeAudit', odcInstallation:'DC'</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; dependencyCheckPublisher pattern:'**/dependency-check-report.xml'</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; stage('Docker Build &amp; Push Image') {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; steps {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;script {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; withDockerRegistry(credentialsId:'docker-cred', toolName:'docker'){</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; sh "docker build -t tetrisv2 ."</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; sh "docker tag tetrisv1 aziz27uk/tetrisv2:latest"</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; sh"docker push aziz27uk/tetrisv2:latest"</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; stage('TRIVY Image SCAN') {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; steps {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;sh "trivy image&nbsp; aziz27uk/tetrisv2:latest &gt; trivyimage.txt"</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
<div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<strong><span style="color: #008000;">stage ("Execute manifest_update pipeline") {</span></strong></div>
<div><strong><span style="color: #008000;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; steps {</span></strong></div>
<div><strong><span style="color: #008000;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; build job:'manifest_update', wait:true</span></strong></div>
<div><strong><span style="color: #008000;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</span></strong></div>
<div><strong><span style="color: #008000;">&nbsp; &nbsp; &nbsp; &nbsp; }</span></strong></div>
</div>
</div>
<div>&nbsp; &nbsp; &nbsp;}</div>
<div>}</div>
</div>
</li>
<li>Update the manifest_update pipeline code at NEW_IMAGE_NAME = "aziz27uk/tetrisv2:latest"</li>
<li>Copy the name of manifest_update pipeline as we will define in Tetris_V2 pipeline code to execute this pipeline.</li>
<li>Run pipeline.</li>
<li><a href="https://stardistributors.co.uk/devops/devops_tools/projects/tetris_game/aws/tetris_aws22.jpg" target="_blank" rel="noopener"><img src="https://stardistributors.co.uk/devops/devops_tools/projects/tetris_game/aws/tetris_aws22.jpg" alt="" width="775" height="311" /></a></li>
<li>tetris_v2 project created in sonar server.</li>
<li>manifest_update file has been updated with aziz27uk/tetrisV2:latest image.</li>
<li><a href="https://stardistributors.co.uk/devops/devops_tools/projects/tetris_game/aws/tetris_aws24.jpg" target="_blank" rel="noopener"><img src="https://stardistributors.co.uk/devops/devops_tools/projects/tetris_game/aws/tetris_aws24.jpg" alt="" width="774" height="357" /></a></li>
<li>click on the link and you will se tetrisV2:latest</li>
<li><a href="https://stardistributors.co.uk/devops/devops_tools/projects/tetris_game/aws/tetris_aws25.jpg" target="_blank" rel="noopener"><img src="https://stardistributors.co.uk/devops/devops_tools/projects/tetris_game/aws/tetris_aws25.jpg" alt="" width="616" height="409" /></a></li>
<li>Go to ArgoCD as it is progressing, wait until it finished.</li>
<li>Access the tetris game.</li>
<li></li>
</ul>
</details></li>
<li>Blog:&nbsp; <a href="https://mrcloudbook.com/automating-tetris-deployments-devsecops-with-argocd-terraform-and-jenkins-for-two-game-versions/">https://mrcloudbook.com/automating-tetris-deployments-devsecops-with-argocd-terraform-and-jenkins-for-two-game-versions/</a>&nbsp;</li>
</ul>
</details></li>

# Image updater stage
```
 environment {
    GIT_REPO_NAME = "Tetris-manifest"
    GIT_USER_NAME = "AbdulAziz-uk"
  }
    stage('Checkout Code') {
      steps {
        git branch: 'main', url: 'https://github.com/AbdulAziz-uk/Tetris-manifest.git'
      }
    }

    stage('Update Deployment File') {
      steps {
        script {
          withCredentials([string(credentialsId: 'github-cred', variable: 'GITHUB_TOKEN')]) {
            // Determine the image name dynamically based on your versioning strategy
            NEW_IMAGE_NAME = "aziz27uk/tetrisv1:latest"

            // Replace the image name in the deployment.yaml file
            sh "sed -i 's|image: .*|image: $NEW_IMAGE_NAME|' deployment.yml"

            // Git commands to stage, commit, and push the changes
            sh 'git add deployment.yml'
            sh "git commit -m 'Update deployment image to $NEW_IMAGE_NAME'"
            sh "git push https://${GITHUB_TOKEN}@github.com/${GIT_USER_NAME}/${GIT_REPO_NAME} HEAD:main"
          }
        }
      }
    }

```
