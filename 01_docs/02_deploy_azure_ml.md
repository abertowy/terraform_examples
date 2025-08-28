# How to deploy Azure ML
  
Deploying an Azure Machine Learning (Azure ML) model typically involves these key steps:
1. Prepare Your Model and Environment:  
    - Register the Model:  
    Upload your trained machine learning model to your Azure ML Workspace's model registry. This makes it available for deployment.  
    - Create an Entry Script:  
    Develop a Python script (often named score.py) that loads your model and defines a run() function. This function will receive input data, perform inference using your model, and return predictions.  
    - Define the Environment:  
    Create an Azure ML environment that specifies all the dependencies (Python packages, libraries) required by your model and entry script. This ensures the deployment environment matches your training environment. You can use a conda.yaml file or a Docker image.  
  
2. Choose a Compute Target:  
    Select a Compute Type: Decide where you want to deploy your model. Common choices include:  
    - Online Endpoints (Managed Online Endpoints): For real-time, low-latency inferencing, suitable for web services.
    - Batch Endpoints: For processing large volumes of data asynchronously.
    - Azure Kubernetes Service (AKS): For highly scalable and customizable deployments.
    - Azure Container Instances (ACI): For quick, serverless deployments for development or small-scale scenarios.
  
3. Create and Deploy the Endpoint:  
    - Create an Endpoint:  
        Establish an endpoint in your Azure ML Workspace. This acts as an entry point for your deployed model.  
    - Create a Deployment:  
        Associate your registered model, entry script, and environment with a specific compute target under the created endpoint. Configure resources like CPU/memory.  
    - Deploy:  
    Initiate the deployment process. Azure ML will containerize your model and dependencies and deploy them to the chosen compute target.  
  
4. Test and Manage:  
    - Test the Endpoint:  
        Once deployed, send test data to the endpoint to verify that your model is performing as expected and returning accurate predictions.  
    - Monitor and Manage:  
        Utilize Azure ML's monitoring capabilities to track the performance and health of your deployed model, including metrics like latency and error rates. You can also manage traffic allocation between different deployments for A/B testing or rolling updates.  

Further reading: https://learn.microsoft.com/en-us/azure/machine-learning/tutorial-deploy-model?view=azureml-api-2
  
**OCR**: https://learn.microsoft.com/en-us/azure/ai-services/computer-vision/overview-ocr 