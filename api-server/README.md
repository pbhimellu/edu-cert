After issuing a certificate from magnetocorp and creating user from digicomp(enrollUser.js), you can start the api server as follows:
npm install
 cp -r ../organization/digibank/gateway/connection-org1.yaml ./
 cp ../organization/magnetocorp/gateway/connection-org2.yaml ./
 cp -r ../organization/magnetocorp/identity/balaji user
 cp -r ../organization/magnetocorp/identity/user/isabella/ user
 cp -r ../organization/digibank/identity/user/balaji/ user
  node server.js 

Open a browser window and access the service by typing

http://localhost:8081/list
Or
http://localhost:8081/issue



