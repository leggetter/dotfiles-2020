#!/usr/bin/env node

// Dependency: This script requires Nodejs.
// Install Node: https://nodejs.org/en/download/

// Required parameters:
// @raycast.schemaVersion 1
// @raycast.title litra:off
// @raycast.packageName Litra
// @raycast.mode silent

// Optional parameters:
// @raycast.icon 🧱

// Documentation:
// @raycast.description Turns off all Logitech Litra devices
// @raycast.author Phil Leggetter
// @raycast.authorURL https://leggetter.co.uk

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
