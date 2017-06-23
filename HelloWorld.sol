pragma solidity ^0.4.0;
contract HelloWorld {
        
    string word = "Hello world!";
    address issuer;
    
    function HelloWorld() {
        issuer = msg.sender;
    }
    
    modifier ifissuer(){
        if (issuer != msg.sender){
            throw;
        }
        else{
            _;
        }
    }
    
    function getWord() constant returns(string) {
        return word;
    }
    
    function setWord(string newWord) ifissuer returns(string) {
        word = newWord;
        return "This is the creator";
    }
}
