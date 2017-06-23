pragma solidity ^0.4.11;

contract PayableContract{
    address client;
    bool public _switch = false;
    
    event UpdateStatus(string _msg);
    event UserStatus(string _msg, address user, uint _amount);
    
    function PayableContract() {
        client = msg.sender;
    }
    
    modifier ifclient() {
        if(msg.sender != client){
            throw;
        }
        _;
    }
    
    function depositFunds() payable {
        UserStatus('User has deposited some money', msg.sender, msg.value);
    }
    
    function withdrawFunds(uint amount) ifclient {
        if (client.send(amount)) {
            UpdateStatus('User has transfered some money');
            _switch = true;
        }
        else {
            _switch = false;
        }
    }
    
    function getFunds() ifclient constant returns(uint){
        return this.balance;
    }
}
