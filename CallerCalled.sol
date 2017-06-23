pragma solidity ^0.4.11;

contract CallerContract {
    CalledContract toBeCalled = CalledContract(0xdc544654fefd1a458eb24064a6c958b14e579154);
    
    function getNumber() constant returns(uint){
        return toBeCalled.getNumber();
    }
    
    function getWords() constant returns(string){
        return bytes32ToString(toBeCalled.getWords());
    }
    
    function bytes32ToString(bytes32 x) constant returns (string) {
    bytes memory bytesString = new bytes(32);
    uint charCount = 0;
    for (uint j = 0; j < 32; j++) {
        byte char = byte(bytes32(uint(x) * 2 ** (8 * j)));
        if (char != 0) {
            bytesString[charCount] = char;
            charCount++;
        }
    }
    bytes memory bytesStringTrimmed = new bytes(charCount);
    for (j = 0; j < charCount; j++) {
        bytesStringTrimmed[j] = bytesString[j];
    }
    return string(bytesStringTrimmed);
}
}

contract CalledContract {
    uint public number = 42;
    bytes32 words = "Hello World";
    
    function getNumber() constant returns(uint){
        return number;
    }
    
    function setNumber(uint _number){
        number = _number;
    }
    
    function getWords() constant returns(bytes32){
        return words;
    }
}
