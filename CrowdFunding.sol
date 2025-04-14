// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract CrowdFunding {
    address creator=msg.sender;
    struct Compaign {
        uint id;
        string name;
        string description;
        uint256 goalAmount;
        uint256 deadline;
        bool active;
        address owner;
    }
    struct AllCompaigns{
        string political;
        string medical;
        string educational;
    }
    struct Donor{
        uint amount;
        string name;
        string email;
    } 
        address account;
        uint balance;
        uint donorId;
    modifier creatorOnly(address _creator){
        require (msg.sender == _creator,"You are not authorized to do this");
        _;
    }
    mapping (address=> Compaign) public c1;
    Compaign[] public comp;
    function createCompaign(uint _id,string memory _name,string memory _description,uint256 _goalAmount,uint256 _deadline) public{
    comp.push (Compaign(_id, _name, _description, _goalAmount, _deadline, true,msg.sender));
}

    function updateCompaign(string memory _name,string memory _description,uint256 _goalAmount,uint256 _deadline) public{
    require(c1 [msg.sender].owner== msg.sender, "You are not allowed to do this");
        c1 [msg.sender].name =_name;
        c1 [msg.sender].description =_description;
        c1 [msg.sender].goalAmount= _goalAmount;
        c1 [msg.sender].deadline =  _deadline;
        c1 [msg.sender].active = true;
        c1 [msg.sender].owner=  msg.sender;
}

    function deleteCompaign(string memory _name,string memory _description,uint256 _goalAmount,uint256 _deadline) public{
    require(c1 [msg.sender].owner== msg.sender, "You are not allowed to do this");
        c1 [msg.sender].name= _name;
        c1 [msg.sender].description =_description;
        c1 [msg.sender].goalAmount= _goalAmount;
        c1 [msg.sender].deadline =  _deadline;
        c1 [msg.sender].active = true;
        c1 [msg.sender].owner=  msg.sender;
}

    AllCompaigns public c2;
    function setAllComp(string memory _political, string memory _medical , string memory _educational  )public{
        c2.political=_political;
        c2.medical = _medical ;
        c2.educational=  _educational   ;
    }

    function getAllComp()public view returns(string memory , string memory,  string memory ){
        return (c2.political,c2.medical, c2.educational);
}
  
    function getCompaignById() public view returns(uint){
        return c1 [msg.sender].id;
    }

    function donateCompaign() public payable{
        balance= msg.value;
    }
     Donor public d1;
    function setAllDonor( address _account, uint _amount, string memory _name, string memory _email) public{
        account=_account;
        d1.name = _name ;
        d1.email=  _email   ;
        d1.amount = _amount;
    }
    
    function getAllDonors() public view returns(address, uint,string memory ,string memory ){
        return (account, d1.amount, d1.name, d1.email);
    }
     
    function setDonations(uint _donorId, address _account) public{
        donorId= _donorId;
        account= _account;
    }

    function getDonations() public view returns (uint,address){
        return (donorId,account);
    }
    
    function setAmount(uint _amount) public {
        d1.amount=_amount;
    }
    function getWithdrawalAmount( ) public view returns(uint) {
        return d1.amount;
}
}