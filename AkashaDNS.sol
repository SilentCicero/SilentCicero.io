contract AkashaDNS {
  	event Registered(bytes32 indexed name, address owner);
  	event Renew(uint indexed did, address indexed addr, uint expiry);
  	event Transfer(uint indexed did, address from, address to);
  	event Deregistered(uint did, address owner);
  	
  	struct Domain {
  	    bytes32 name;
  	    address owner;
  	    bytes32 data;
  	    bytes32 extra;
  	    uint expiry;
  	}
  	
  	uint public numDomains = 1;
  	mapping(uint => Domain) public domains;
  	mapping(bytes32 => uint) public fromName;

	function register(bytes32 _name, bytes32 _data, bytes32 _extra) external {
	    Domain getDomain = domains[fromName[_name]];
	    uint did;
	    
	    if(getDomain.owner != address(0)
	    && getDomain.expiry > now)
	        return;
	        
	    if(fromName[_name] != 0 
	    && (getDomain.owner == msg.sender || getDomain.expiry < now))
	        did = fromName[_name];
	    else
	        did = numDomains++;
	        
	    Domain b = domains[did];
	    b.name = _name;
	    b.data = _data;
	    b.extra = _extra;
	    b.owner = msg.sender;
	    b.expiry = now + (1 years);
	    fromName[b.name] = did;
		Registered(_name, msg.sender);
	}
	
	function renew(uint did) {
	    if((domains[did].expiry - (6 months)) > now)
	        domains[did].expiry = now + (1 years);
	        
	    Renew(did, msg.sender, domains[did].expiry);
	}
	
	function transfer(uint did, address toAddr) {
	    if(domains[did].owner != msg.sender)
	        return;
	        
	    domains[did].owner = toAddr;
	    Transfer(did,  msg.sender, toAddr);
	}

	function unregister(uint did) public {
	    if(domains[did].owner != msg.sender)
	        return;
	        
	    domains[did].expiry = 0;
		Deregistered(did, msg.sender);
	}
}                          