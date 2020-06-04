# capstone-project-cloud-devops

<h2>Project Overview</h2>

<p> In this project, I applied the skills and knowledge which was developed throughout the Cloud DevOps Nanodegree program. These include:</p>

<ul>
	<li>Working in AWS</li>
	<li>Using Jenkins to implement Continuous Integration and Continuous Deployment</li>
	<li>Building pipelines</li>
	<li>Working with Ansible and CloudFormation to deploy clusters</li>
	<li>Building Kubernetes clusters</li>
	<li>Building Docker containers in pipelines</li>
</ul>

***

<p>I developed a CI/CD pipeline for microservices applications with rolling deployment. I developed Continuous Integration steps, such as typographical checking (aka “linting”). I also developed Contiguous Deployment steps. These includes:</p>

<ul>
	<li>Pushing the built Docker containers to the Docker repository</li>
	<li>Deploying these Docker containers to a small Kubernetes cluster. For Kubernetes cluster I used AWS EKS. To deploy my Kubernetes cluster using Cloudformation. I ran these from Jenkins as an independent pipeline.</li>
</ul>

***

<h2>Environment Setup</h2>

<ul>
  <li>Create a <code>Makefile</code></li>
  <li>Create a <code>Dockerfile</code></li>
  <li>Create a <code>Jenkinsfile</code> including all the necessary steps</li>
  <li>Create CloudFormation Script using <code>create-stack.sh</code> command</li>
  <li>Install Jenkins and all the necessary plugins in the EC2 Instance</li>
</ul>

<h2>Linting App</h2>

<ul>
  <li>Run <code>make lint</code> to lint the app locally</li>
</ul>

<h2>Running App</h2>

<ul>
  <li>Run Docker: <code>./run_docker.sh</code></li>
  <li>Run Kubernetes: <code>./run_kubernetes.sh</code></li>
</ul>

<h2>Uploading to the Docker Hub</h2>

<ul>
  <li>Run <code>./upload_docker.sh</code> to upload the api to the Docker Hub</li>
</ul>

<h2>Deploying App to AWS</h2>

<pre>
	<code>
  		aws eks --region us-west-2 update-kubeconfig --name EKS-Name
  		kubectl apply -f aws/aws-auth-cm.yaml
  		kubectl apply -f deployment/deployment.yml
  		kubectl get nodes
  		kubectl get pods -o wide
	</code>
</pre>

<h2>Cleaning App</h2>

<ul>
  <li>Run <code>docker system prune</code> to clean up </li>
</ul>
