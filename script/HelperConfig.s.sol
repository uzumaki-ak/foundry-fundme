//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";

contract HelperConfig is Script {
    //defining a type using struct, this is a custom type that we can use to group together related data. In this case, we're defining a struct called NetworkConfig that has a single field called priceFeed, which is an address. This struct will be used to store the configuration for different networks, such as the address of the price feed contract on each network.

    struct NetworkConfig {
        address priceFeed;
    }

    NetworkConfig public activeNetworkConfig;

    // we want to set the activeNetworkConfig variable to the appropriate configuration based on the chain ID of the network we're deploying to. The constructor checks the chain ID using block.chainid and sets activeNetworkConfig to the appropriate configuration for either the Sepolia testnet or a local Anvil environment.

    constructor() {
        if (block.chainid == 11155111) {
            activeNetworkConfig = getSepoliaEthConfig();
        } else {
            activeNetworkConfig = getAnvilEthConfig();
        }
    }

    function getSepoliaEthConfig() public pure returns (NetworkConfig memory) {
        // Sepolia ETH/USD price feed address
        NetworkConfig memory sepoliaConfig = NetworkConfig({
            priceFeed: 0x694AA1769357215DE4FAC081bf1f309aDC325306
        });
        return sepoliaConfig;
    }

    function getAnvilEthConfig() public pure returns (NetworkConfig memory) {
        // For local Anvil testing, we'll use a mock price feed address (this will be replaced in tests)
        NetworkConfig memory anvilConfig = NetworkConfig({
            priceFeed: 0x1804c8AB1F12E6bbf3894d4083f33e07309d1f38
        });
        return anvilConfig;
    }
}
