// SPDX-lICENSE-Identifier: MIT
pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {FundMe} from "../src/Fundme.sol";

contract FundmeTest is Test {
    FundMe fundMe;

    function setUp() public {
        fundMe = new FundMe();
    }

    function testMinimumFiveUsd() public {
        assertEq(fundMe.MINIMUM_USD(), 5 * 10 ** 18);
    }
    function testOwnerIsMessageSender()public {
        // console.log(fundMe.i_owner());
        // console.log(msg.sender);
        // assertEq(fundMe.i_owner(), msg.sender);
        assertEq(fundMe.i_owner(),address(this));
    }
}
