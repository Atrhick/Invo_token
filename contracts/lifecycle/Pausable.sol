// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "../ownership/Ownable.sol";

contract Pausable is Ownable {

    event Paused(address account);
    event Unpaused(address account);

    bool private _paused;

    modifier whenNotPaused() 
    {
        require(!_paused, "Pausable: paused");
        _;
    }

    modifier whenPaused() {
        require(_paused, "Pausable: not paused");
        _;
    }

    constructor() {}

    function paused(
    ) public view returns (bool) 
    {
        return _paused;
    }

    function pause(
    ) public 
        onlyOwner 
        whenNotPaused 
    {
        _paused = true;
        emit Paused(msg.sender);
    }

    function unpause(
    ) public 
        onlyOwner 
        whenPaused 
    {
        _paused = false;
        emit Unpaused(msg.sender);
    }
}