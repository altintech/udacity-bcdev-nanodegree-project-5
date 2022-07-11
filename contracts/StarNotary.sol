//SPDX-License-Identifier: CC BY-NC-ND 4.0

pragma solidity ^0.8.13;

//Importing openzeppelin-solidity ERC-721 implemented Standard
//import "../node_modules/openzeppelin-solidity/contracts/token/ERC721/ERC721.sol";   <-- This is outdated, replaced with line below
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

// StarNotary Contract declaration inheritance the ERC721 openzeppelin implementation
contract StarNotary is ERC721 {

    // Star data
    struct Star {
        string name;
    }

    //Array to keep star IDs
    uint256[] private starIds;

    // Implement Task 1 Add a name and symbol properties
    // name: Is a short name to your token
    // symbol: Is a short string like 'USD' -> 'American Dollar'

    //Declare a constructor to implement Task 1, passing in "StarNotary" and "SN" as the parameters to set the _name and _symbol private variables of the parent ERC721 contract
    constructor() ERC721("StarNotary", "SN") {}

    // mapping the Star with the Owner Address
    mapping(uint256 => Star) public tokenIdToStarInfo;
    // mapping the TokenId and price
    mapping(uint256 => uint256) public starsForSale;

    // Create Star using the Struct
    function createStar(string memory _name, uint256 _tokenId) public { // Passing the name and tokenId as a parameters
        if(bytes(_name).length == bytes("").length){
            require(false, "StarNotary.sol: You cannot create a star without a name");
        }
        uint256 i;
        uint256 tokenId;
        for(i = 0; i < starIds.length; i++){
            tokenId = starIds[i];
            if(bytes((tokenIdToStarInfo[tokenId]).name).length == bytes(_name).length){
                if(keccak256(abi.encodePacked((tokenIdToStarInfo[tokenId]).name)) == keccak256(abi.encodePacked(_name))){
                    require(false, "StarNotary.sol: You cannot create a star with the same name as an existing star");
                }
            }
        }
        Star memory newStar = Star(_name); // Star is an struct so we are creating a new Star
        tokenIdToStarInfo[_tokenId] = newStar; // Creating in memory the Star -> tokenId mapping
        _mint(msg.sender, _tokenId); // _mint assign the the star with _tokenId to the sender address (ownership)
        starIds.push(_tokenId);
    }

    // Putting an Star for sale (Adding the star tokenid into the mapping starsForSale, first verify that the sender is the owner)
    function putStarUpForSale(uint256 _tokenId, uint256 _price) public {
        require(ownerOf(_tokenId) == msg.sender, "StarNotary.sol: You can't sell the Star you don't own");
        starsForSale[_tokenId] = _price;
    }


    // Function that allows you to convert an address into a payable address
    function _make_payable(address x) internal pure returns (address payable) {
        return payable(address(uint160(x)));
    }

    function buyStar(uint256 _tokenId) public  payable {
        require(starsForSale[_tokenId] > 0, "StarNotary.sol: The Star should be up for sale");
        require(ownerOf(_tokenId) != msg.sender, "StarNotary.sol: There is no sense in buying a star the transaction sender already owns");
        uint256 starCost = starsForSale[_tokenId];
        address ownerAddress = ownerOf(_tokenId);
        require(msg.value > starCost, "StarNotary.sol: You need to have enough Ether");
        _transfer(ownerAddress, payable(msg.sender), _tokenId); // We can't use _addTokenTo or_removeTokenFrom functions, now we have to use _transfer
        address payable ownerAddressPayable = _make_payable(ownerAddress); // We need to make this conversion to be able to use transfer() function to transfer ethers
        ownerAddressPayable.transfer(starCost);
        if(msg.value > starCost) {
            payable(msg.sender).transfer(msg.value - starCost);
        }
    }

    // Implement Task 1 lookUptokenIdToStarInfo
    function lookUptokenIdToStarInfo (uint _tokenId) public view returns (string memory) {
        //1. You should return the Star saved in tokenIdToStarInfo mapping
        Star memory aStar = tokenIdToStarInfo[_tokenId];
        return aStar.name;
    }

    // Implement Task 1 Exchange Stars function
    function exchangeStars(uint256 _tokenId1, uint256 _tokenId2) public {
        //1. Passing to star tokenId you will need to check if the owner of _tokenId1 or _tokenId2 is the sender
        require(ownerOf(_tokenId1) == msg.sender || ownerOf(_tokenId2) == msg.sender, "StarNotary.sol: Sender address must be the owner of at least one of the tokens passed");

        //2. You don't have to check for the price of the token (star)
        // ### Do nothing here

        //3. Get the owner of the two tokens (ownerOf(_tokenId1), ownerOf(_tokenId2)
        address tokenSender = ownerOf(_tokenId1);
        address tokenReceiver = ownerOf(_tokenId2);
        if(ownerOf(_tokenId1) != msg.sender){
            tokenSender = ownerOf(_tokenId2);
            tokenReceiver = ownerOf(_tokenId1);
        }

        //4. Use _transferFrom function to exchange the tokens.
        // ### There is no _transferFrom function in the parent ERC721 contract, so I'll use safeTransferFrom() instead
        // First, require that the exchange is not done with both tokens owned by the sender
        require(ownerOf(_tokenId1) != ownerOf(_tokenId2), "StarNotary.sol: There is no sense in exchanging 2 tokens that are already owned by the same transaction sender");
        _approve(tokenReceiver, _tokenId1);
        _approve(tokenSender, _tokenId2);
        safeTransferFrom(tokenSender, tokenReceiver, _tokenId1);
        safeTransferFrom(tokenReceiver, tokenSender, _tokenId2);
    }

    // Implement Task 1 Transfer Stars
    function transferStar(address _to1, uint256 _tokenId) public {
        //1. Check if the sender is the ownerOf(_tokenId)
        require(ownerOf(_tokenId) == msg.sender, "StarNotary.sol: Onwer of the token is not the sender of the transaction.");
        //2. Use the transferFrom(from, to, tokenId); function to transfer the Star
        // ### There is no _transferFrom function in the parent ERC721 contract, so I'll use safeTransferFrom() instead
        // First, require that the transfer is not done with a token taht is already owned by the sender
        require(_to1 != msg.sender, "StarNotary.sol: There is no sense in transfering a token that is already owned by the transaction sender to the transaction sender.");
        safeTransferFrom(msg.sender, _to1, _tokenId);
    }

}