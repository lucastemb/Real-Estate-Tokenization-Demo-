const Migrations = artifacts.require("Migrations");
const Property = artifacts.require('Property');
const Market = artifacts.require("Market");

module.exports = function (deployer) {
  deployer.deploy(Migrations);
  deployer.deploy(Property);
  deployer.deploy(Market);
};
