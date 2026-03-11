// SPDX-lICENSE-Identifier: MIT
pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {FundMe} from "../src/Fundme.sol";
import {DeployFundme} from "../script/DeployFundme.s.sol";

contract FundmeTest is Test {
    FundMe fundMe;
    address deployer;

    function setUp() external {
        // fundMe = new FundMe(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        DeployFundme deployFundMe = new DeployFundme();
        fundMe = deployFundMe.run();
        deployer = vm.addr(vm.envUint("PRIVATE_KEY"));
    }

    function testMinimumFiveUsd() public view {
        assertEq(fundMe.MINIMUM_USD(), 5 * 10 ** 18);
    }

    function testOwnerIsMessageSender() public view {
        // console.log(fundMe.i_owner());
        // console.log(msg.sender);
        // assertEq(fundMe.i_owner(), msg.sender);
        assertEq(fundMe.getOwner(), deployer);
    }

    function testPriceFeedVersion() public view {
        uint256 version = fundMe.getVersion();
        assertEq(version, 4);
    }
}

