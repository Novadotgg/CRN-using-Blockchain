// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
// import "hardhat/console.sol"; 

contract SimpleBlockchain {
    







    uint256 public numBlocks;

    // uint256[] public records;




    bytes32[] public data = [      
    bytes32(0x1001111111111111111111111110111111111111111111111111111111111111),        
    bytes32(0x1001111111111111111111111111111100000000000000000000000111111111),        
    bytes32(0x1001111111111111111111111111111100000000000000000000000111111111),        
    // bytes32(0x1001111111111111111111111111111111111111111111111111111111111111),        
    // bytes32(0x1001111111111111111111111111111111111111111111111111111111111111),
    // bytes32(0x1001111111111111111111111111111111111111111111111111111111111111),        
    bytes32(0x1001111111111111111111111111111111111111111111111111111111111111),        
    bytes32(0x1001111111111111111111111111111100000000000000000000000111111111),        
    bytes32(0x1001111111111111111111111111111111111111111111111111111111111111),
    bytes32(0x1001111111111111111111111111111111111110111111111111111111111111),        
    // bytes32(0x1001111111111111111111111111111111111111111111111111111111111111),        
    bytes32(0x1001111111111111111111111111111111111111111111111111111111111111),
    // bytes32(0x1001111111111111111111111111111111111111111111111111111111111111),
    bytes32(0x1001111111111111111111111111111100000000000000000000000111111111),
    // bytes32(0x1001111111111111111111111111111111111111111111111111111111111111),
    // bytes32(0x1001111111111111111111111111111111111111111111111111111111111111),
    bytes32(0x1001111111111111111111111111111100000000000000000000000111111111),
    bytes32(0x1001111111111111111111111111111100000000000000000000000111111111),
    bytes32(0x1001111111111111111111111111111100000000000000000000000111111111),
    bytes32(0x1001111111111111111111111111111100000000000000000000000111111111),
    bytes32(0x1001111111111111111111111111111111111111111111111111111111111111),
    bytes32(0x1001111111111111111111111111111100000000000000000000000111111111),
    bytes32(0x1001111111111111111111111111111100000000000000000000000111111111),
    // bytes32(0x1001111111111111111111111111111111111111111111111111111111111111),        
    // bytes32(0x1001111111111111111111111111111111111111111111111111111111111111),        
    // bytes32(0x1001111111111111111111111111111111111111111111111111111111111111),
    // bytes32(0x1001111111111111111111111111111111111111111111111111111111111111),
    // bytes32(0x1001111111111111111111111111111111111111111111111111111111111111),        
    // bytes32(0x1001111111111111111111111111111111111111111111111111111111111111),        
    // bytes32(0x1001111111111111111111111111111111111111111111111111111111111111),
    // bytes32(0x1001111111111111111111111111111111111111111111111111111111111111),
    // bytes32(0x1001111111111111111111111111111111111111111111111111111111111111),        
    // bytes32(0x1001111111111111111111111111111111111111111111111111111111111111),        
    // bytes32(0x1001111111111111111111111111111111111111111111111111111111111111),
    bytes32(0x1001111111111111111111111111111100000000000000000000000111111111),
    bytes32(0x1001111111111111111111111111111100000000000000000000000111111111),
    bytes32(0x1001111111111111111111111111111100000000000000000000000111111111),
    bytes32(0x1001111111111111111111111111111100000000000000000000000111111111),
    bytes32(0x1001111111111111111111111111111100000000000000000000000111111111),
    bytes32(0x1001111111111111111111111111111111111111111111111111111111111111)   ];
    uint256[] public maliciousUserBlockNumbers;

    






    struct Block {
        uint256 blockNumber;
        bytes32 data;
    }






    struct BlockInfo {
    uint256 blockNumber;
    bytes32 blockData;

}
// struct snap{
//     uint256 blocknumber;
    
// }







    Block[] public blockchain;
    bytes32 data1 = 0x1001111111111111111111111111111100000000000000000000000111111111;
    







    
    function createBlockchain(uint256 _numBlocks) public {
        numBlocks = _numBlocks;
        for (uint256 i = 0; i < numBlocks; i++) {
            blockchain.push(Block(i, keccak256(abi.encodePacked(i))));
        }
    }
    





    function addBlock(uint256 _blockNumber, bytes32 _data) public {
        require(_blockNumber >= numBlocks, "Block number already exists.");
        blockchain.push(Block(_blockNumber, _data));
        numBlocks++;
    }

    // function callBlock()public{

    // }






    function printBlock(uint256 blockNumber) public view returns (uint256, bytes32) {
        require(blockNumber < numBlocks, "Block number is out of range.");
        Block memory blockData = blockchain[blockNumber];
        return (blockData.blockNumber, blockData.data);
    }
    






    function printBlockchain() public view returns (Block[] memory) {
        return blockchain;
    }







    function stringToUint(string memory s) private pure returns (uint result) {
        bytes memory b = bytes(s);
        uint i;
        result = 0;
        for (i = 0; i < b.length; i++) {
            uint c = uint(uint8(b[i]));
            if (c >= 48 && c <= 57) {
                result = result * 10 + (c - 48);
            }
        }
    
    }








    function findMaliciousUser(bytes32 nonUniqueBlockData) public view returns (BlockInfo[] memory) {
    // Convert non-unique block data to binary string
    bytes memory nonUniqueBlockDataBytes = abi.encodePacked(nonUniqueBlockData);
    bytes memory nonUniqueBlockDataBinary = new bytes(nonUniqueBlockDataBytes.length * 8);
    for (uint256 i = 0; i < nonUniqueBlockDataBytes.length; i++) {
        bytes memory bits = byteToBinaryBytes(nonUniqueBlockDataBytes[i]);
        for (uint256 j = 0; j < 8; j++) {
            nonUniqueBlockDataBinary[i * 8 + j] = bits[j];
        }
    }

    // Iterate over each bit of the binary string and compare with unique blocks
    BlockInfo[] memory differentBlocks = new BlockInfo[](numBlocks);
    uint256 count = 0;
    // uint256 cnt=0;


    for (uint256 i = 0; i < numBlocks; i++) {
        bytes32 uniqueBlockData = blockchain[i].data;
        bytes memory uniqueBlockDataBytes = abi.encodePacked(uniqueBlockData);
        bytes memory uniqueBlockDataBinary = new bytes(uniqueBlockDataBytes.length * 8);
        for (uint256 j = 0; j < uniqueBlockDataBytes.length; j++) {
            bytes memory bits = byteToBinaryBytes(uniqueBlockDataBytes[j]);
            for (uint256 k = 0; k < 8; k++) {
                uniqueBlockDataBinary[j * 8 + k] = bits[k];
            }
        }

        uint256 bitDifference = 0;
        for (uint256 j = 0; j < nonUniqueBlockDataBinary.length && bitDifference <= 7; j++) {
            if (uniqueBlockDataBinary[j] != nonUniqueBlockDataBinary[j]) {
                bitDifference++;
            }
        }

        if (bitDifference > 7) {
            BlockInfo memory info = BlockInfo(++i, uniqueBlockData);
            // snap memory fo=BlockInfo(++i);
            
            // records[cnt]=fo;
            // differentBlocks[cnt]=fo




            differentBlocks[count] = info;
            count++;
            // cnt++;
        }
    }

    // Resize the output array
    BlockInfo[] memory result = new BlockInfo[](count);
    for (uint256 i = 0; i < count; i++) {
        result[i] = differentBlocks[i];
    }

    return result;
}














function byteToBinaryBytes(bytes1 b) private pure returns (bytes memory) {
    bytes memory bits = new bytes(8);
    for (uint256 i = 0; i < 8; i++) {
        bits[i] = b & bytes1(uint8(1) << uint8(i)) != 0 ? bytes1('1') : bytes1('0');

        // bits[i] = b & bytes1(uint8(1) << i) != 0 ? bytes1('1') : bytes1('0');
    }
    return bits;
}








   function errorBlocks() public view returns (Block[] memory) {
    Block[] memory uniqueBlocks = new Block[](numBlocks);
    uint256 uniqueBlockCount = 0;

    Block[] memory nonUniqueBlocks = new Block[](numBlocks);
    uint256 nonUniqueBlockCount = 0;

    for (uint256 i = 0; i < numBlocks; i++) {
        bool isUnique = true;
        for (uint256 j = 0; j < numBlocks; j++) {
            if (i != j && blockchain[i].data == blockchain[j].data) {
                isUnique = false;
                break;
            }
        }
        if (isUnique) {
            uniqueBlocks[uniqueBlockCount] = blockchain[i];
            uniqueBlockCount++;
        } else {
            nonUniqueBlocks[nonUniqueBlockCount] = blockchain[i];
            nonUniqueBlockCount++;
        }
    }

    Block[] memory uniqueResult = new Block[](uniqueBlockCount);
    for (uint256 i = 0; i < uniqueBlockCount; i++) {
        uniqueResult[i] = uniqueBlocks[i];
    }

    Block[] memory nonUniqueResult = new Block[](nonUniqueBlockCount);
    for (uint256 i = 0; i < nonUniqueBlockCount; i++) {
        nonUniqueResult[i] = nonUniqueBlocks[i];
    }

    return (uniqueResult);
}









 

    function add() public{
    //     bytes32[] memory data = new bytes32[](6);
    // data[0] = 0x1001111111111111111111111111111100000000000000000000000111111111;
    // data[1] = 0x1001111111111111111111111111111100000000000000000000000111111111;
    // data[2] = 0x1001111111111111111111111111111100000000000000000000000111111111;
    // data[3] = 0x1001111111111111111111111111111100000000000000000000000111111111;
    // data[4] = 0x1001111111111111111111111111111111111111111111111111111111111111;
    // data[5] = 0x1001111111111111111111111111111100000011000000000000011111111111;
    for (uint256 i=1;i<data.length;i++)
    {
        addBlock(i,data[i]);
    }

    }
    






    
   
   
    // bytes32 myBytes32 = 0x1001111111111111111111111111111100000000000000000000000111111111;
    
    
    
    // function malicious()public view {
    // //    bytes32 myBytes32 = bytes32(uint256(keccak256(abi.encodePacked("0x1001111111111111111111111111111100000000000000000000000111111111"))));
    // //    findMaliciousUser(myBytes32);
    // //    emit(myBytes32)
    // }






  function fusion() public view returns (bytes32) {
    bytes32 nonUniqueBlockData=0x1001111111111111111111111111111100000000000000000000000111111111;
    BlockInfo[] memory maliciousBlocks = findMaliciousUser(nonUniqueBlockData);
    bytes32 maxCommonData = blockchain[0].data;
    for (uint i = 0; i < blockchain.length; i++) {
        // Exclude malicious blocks by comparing block numbers
        bool excludeBlock = false;
        for (uint j = 0; j < maliciousBlocks.length; j++) {
            if (maliciousBlocks[j].blockNumber == i) {
                excludeBlock = true;
                break;
            }
        }
        if (excludeBlock) {
            continue;
        }

        maxCommonData &= blockchain[i].data;
    }
    return maxCommonData;
}



    // function ff() public view returns (bytes32){
    //     uint256 c=0;
    //     bytes32 maxCommonData = data[0];

    



    //     for(uint i=1;i<data.length;i++){
    //         for(uint j=0;j<records.length;j++){
    //             if(i-1==j){
    //                 c++;
    //             }
    //             else{
    //                 maxCommonData &= data[i];
    //             }    

    //         }

    //     }
    //     return maxCommonData;
    // }





function main()public{
        add();
        printBlockchain();
        errorBlocks();
        findMaliciousUser(0x1001111111111111111111111111111100000000000000000000000111111111);
        //yet to invalidate 
        printBlockchain();
        fusion();

    }
   



    // const instance=await SimpleBlockchain.deployed()// 
    //0x100 29 1's 23 0's 9 1's

}