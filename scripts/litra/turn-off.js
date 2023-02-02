#!/usr/bin/env node
const litra = require("litra");
const { findDevices, turnOff } = litra;

const devices = findDevices();

if (devices.length > 0) {
  console.log(`Turning off ${devices.length} devices`);
  for (const device of devices) {
    turnOff(device);
  }
} else {
  console.error("No Litra devices found!");
}
