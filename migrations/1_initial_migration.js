const Migrations = artifacts.require("Migrations");
const AgroFarmer = artifacts.require("AgroFarmer");

module.exports = function(deployer) {
  deployer.deploy(Migrations);
  deployer.deploy(AgroFarmer);
};
