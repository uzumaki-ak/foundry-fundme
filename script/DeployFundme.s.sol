// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script, console} from "forge-std/Script.sol";
import {FundMe} from "../src/Fundme.sol";
import {HelperConfig} from "./HelperConfig.s.sol";

contract DeployFundme is Script {
    function run() external returns (FundMe) {
        //anything before vm.startBroadcast() is run on the local chain, and anything after is run on the testnet or mainnet, so we can use this to deploy our contract to the appropriate network based on the chain ID.
        HelperConfig helperConfig = new HelperConfig();
        HelperConfig.NetworkConfig memory config = helperConfig
            .activeNetworkConfig;
        address ethUsdPriceFeed = config.priceFeed;

        vm.startBroadcast();
        FundMe fundMe = new FundMe(ethUsdPriceFeed);
        vm.stopBroadcast();
        return fundMe;
    }
}
