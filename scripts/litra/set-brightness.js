#!/usr/bin/env node
const litra = require("litra");
const { findDevices, setBrightnessPercentage } = litra;

const devices = findDevices();
const brightnessPercent = parseInt(process.argv[2], 10);
console.log(`Attempting to set brightness to ${brightnessPercent}%`);

if (brightnessPercent > 100) {
  console.error("Cannot set brightness above 100%");
  process.exit(1);
}
if (brightnessPercent < 0) {
  console.error("Cannot set brightness below 0%");
  process.exit(1);
}

if (devices.length > 0) {
  console.log(`Setting brightness for ${devices.length} devices`);
  for (const device of devices) {
    setBrightnessPercentage(device, brightnessPercent);
  }
} else {
  // Blow up
}
