#!/usr/bin/env node

const litra = require("litra");
const { findDevices, turnOn } = litra;

const devices = findDevices();

if (devices.length > 0) {
  console.log(`Turning on ${devices.length} devices`);
  for (const device of devices) {
    turnOn(device);
  }
} else {
  // Blow up
}
