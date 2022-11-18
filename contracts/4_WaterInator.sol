pragma solidity >=0.7.0 <0.9.0;

contract WaterInator {
    string center_name;
    string center_address;

    Packet[] data;

    struct Packet {
        string temp;
        string ph;
        string tds;
        string flow_rate;
        uint256 timestamp;
    }

    constructor(string memory cname, string memory addr){
        center_name = cname;
        center_address = addr;
    }

    function record(string memory temp, string memory ph, string memory tds, string memory vol) public {
        data.push(Packet(temp, ph, tds, vol, block.timestamp));
    }

    function getLatestRecord() public returns (Packet memory){
        return data[data.length-1];
    }
}