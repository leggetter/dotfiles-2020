#!/usr/bin/env node
const litra = require("litra");
const { findDevices, setBrightnessPercentage } = litra;

const devices = findDevices();

console.dir(devices);