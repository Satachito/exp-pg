cat > cloudbuild.yaml << EOD
steps:
- name: 'gcr.io/cloud-builders/docker'
  args: [ 'build', '-t', 'gcr.io/$PROJECT_ID/searchAPI', '.' ]
- name: 'gcr.io/cloud-builders/docker'
  args: [ 'push', 'gcr.io/$PROJECT_ID/searchAPI' ]
images:
- 'gcr.io/$PROJECT_ID/searchAPI'
EOD

gcloud builds submit --config cloudbuild.yaml .

gcloud run deploy searchAPI \
	--image=gcr.io/exp-pg/searchAPI:latest \
	--platform=managed \
	--region=asia-northeast1 \
	--allow-unauthenticated \
	--cpu 8 \
	--memory 32Gi

