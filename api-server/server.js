var express = require('express');
var bodyParser = require('body-parser');

var app = express();
app.use(bodyParser.json());
require('./routes.js')(app);

// Setting for Hyperledger Fabric
const { FileSystemWallet, Gateway } = require('fabric-network');
const path = require('path');
const ccpPath = path.resolve(__dirname, '.',  'connection-org1.json');



app.listen(8081);

