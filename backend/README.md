
# NFT Minting Endpoint (Backend)
The server runs on Google Cloud Products Cloud in a Cloud Run Container. It is built with a denoland/deno:latest Dockerfile stored in a private GCP docker repository(Artifact Registry). Cloud Run is only up when there is a request and you are only charged for uptime. The endpoint is https://cdao-mint-tm7praakga-uc.a.run.app/mint

The end point expects a tx and a witness. It then generates the contracts DAO singing key from env variable mnemonic phrase. Then partial sign, assemble, and submit. It returns the tx hash to the front end.

The app uses GCP Firebase Cloud Storage for file storage/cdn, Firestore(noSql) for storing orders, and Realtime Database(sql) for NFT details(id,displayUrl, IPFSUrl, availability). 

Refinements needed: 
Better env variable security
Stricter access 
Calls to the Database to ensure nft availability and update the database when the tx is complete. Currently the front end is handling this.
Better error handling and logging
