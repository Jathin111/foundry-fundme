// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import "../src/Fundme.sol";
import "./HelpConfig.s.sol";

contract DeployFundMe is Script {
    function run() external returns (FundMe) {
        HelpConfig helpConfig = new HelpConfig();
        address ethUSDPriceFeed = helpConfig.activeNetworkConfig();
        vm.startBroadcast();
        FundMe fundMe = new FundMe(ethUSDPriceFeed);
        vm.stopBroadcast();
        return fundMe;
    }
}
