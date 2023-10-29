cat > cloudbuild.yaml << EOD
steps:
- name: 'gcr.io/cloud-builders/docker'
  args: [ 'build', '-t', 'gcr.io/exp-pg/search-api', '.' ]
- name: 'gcr.io/cloud-builders/docker'
  args: [ 'push', 'gcr.io/exp-pg/search-api' ]
images:
- 'gcr.io/exp-pg/search-api'
EOD

gcloud builds submit --config cloudbuild.yaml .

gcloud run deploy search-api \
	--image=gcr.io/exp-pg/search-api:latest \
	--platform=managed \
	--region=asia-northeast1 \
	--allow-unauthenticated \
	--cpu 8 \
	--memory 32Gi

