var async = require('async');
var chaiAsPromised = require('chai-as-promised');
var chai = require('chai');
var mochaLogger = require('mocha-logger');
var mlog = mochaLogger.mlog;
var expect = chai.expect; // we are using the "expect" style of Chai
chai.use(chaiAsPromised);
var Web3 = require('web3');
var web3 = new Web3();
web3.setProvider(new web3.providers.HttpProvider('http://localhost:8545'));

var accounts = web3.eth.accounts;

var database;
var productFactory;

var productABI = require('../abi/productABI.js')
var productContract = web3.eth.contract(productABI);
var additionalInformation = "Additional Information";