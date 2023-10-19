# CRN-using-Blockchain
Blockchain and cognitive radio networks based project where the Blockchain technology used to secure the Cognitive radio network from SSDF attack...
I used ganache here as my ehtherium network.
All the gases used and all the demo etherium used to be deducted from ganache, it gave me a kind of UI that shows me the blocks deployed and created.
Each time I create new blocks the blocks get connected to any of the chains present in the Blockchain network..
## Setup
To get started with you need to have ganache installed on the computer that deploys the project and provide the free ethereum connection and the gas prices are been deducted from ganache itself although ganache forms a blockchain as a whole but it can't say everytime you deploy the model you will be connected to the previous block or not.
<br><br><br>
You even need to have truffle installed on your system.
Then for the deployment you need to use the `npx truffle mgrate` in order to migrate and deploy the blockchain in your ganache.
Then use the `npx truffle console` to enter the console of the truffle.
<br><br>
### Deploy 
Finally to deploy the model type `const instance=await SimpleBlockchain.deployed()` in the terminal, where my contract name was SimpleBlockchain() that was to be deployed...
### call the functions required
`instance.add()` will add all the blocks that are predefined by us to the blockchain in ganache...
`instance.findMaliciousUser("0x1001111111111111111111111111111100000000000000000000000111111111")` This will return all the malicious users in the chain where `0x1001111111111111111111111111111100000000000000000000000111111111` this is a user that is considered as a good secondary user...
`instance.fusion()` this function call will fuse all the date and give a single data as output that is to be sent to the fusion center.

