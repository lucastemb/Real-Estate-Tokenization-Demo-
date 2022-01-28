// SPDX-LIcense-Indentifier: MIT
pragma solidity ^0.8.11; 

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract Property is ERC721 {


    constructor() ERC721("Property", "PROP") public {}

    struct Metadata { // create structure that represents the metadata that the property token will store
        uint8 bed; 
        uint8 bath; 
        uint16 sqft;
        uint16 zipCode;


    }

    string[] public properties; 
    mapping(string => bool) _propExists;
    mapping(uint256 => Metadata) prop;

    
    

    function mint(string memory _propAddress, uint8 bed, uint8 bath, uint16 sqft, uint16 zipCode) external {
       require(!_propExists[_propAddress]); //require that the property not already exist. 
       properties.push(_propAddress); //add new address to full array 
        uint _id = properties.length - 1; 
       prop[_id] = Metadata(bed, bath, sqft, zipCode); 
    
        _mint(msg.sender, _id);
        _propExists[_propAddress] = true;

    }



    function get(uint256 _id) external view returns (uint8 bed, uint8 bath, uint16 sqft, uint16 zipCode){
        require(_exists(_id), "Property does not exist");
        Metadata memory property = prop[_id];
        bed = property.bed;
        bath = property.bath;
        sqft = property.sqft;
        zipCode = property.zipCode;

    }

    
}