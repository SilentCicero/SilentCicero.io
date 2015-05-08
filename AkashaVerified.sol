contract AkashaVerified {
    mapping(address => mapping(bytes32 => bool)) public isVerified;
    
    function verify(bytes32 data) {
        isVerified[msg.sender][data] = true;
    }
    
    function unverify(bytes32 data) {
        delete isVerified[msg.sender][data];
    }
}         