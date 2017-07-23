function Tamamon() {
  this.energy = parseInt(localStorage.getItem('energy')) || 10;
  this.MAX_ENERGY = 20
  this.MIN_ENERGY = 0
  this.energyMessage = localStorage.getItem('energyMessage') || "Happy happy happy";
};

Tamamon.prototype.feed = function () {
  this.checkMax();
  var newEnergy = (this.energy += 2);
  localStorage.setItem('energy', newEnergy);
  return newEnergy;
};

Tamamon.prototype.playtime = function () {
  this.checkMin();
  var newEnergy = (this.energy -= 2);
  localStorage.setItem('energy', newEnergy);
  return newEnergy;
};

// use this to get rid of having updates on both energy and local storage

// Tamamon.prototype.updateEnergy = function () {
//   this.energy = new Energy;
//   localStorage.setItem('energy', newEnergy);
// };

Tamamon.prototype.checkMax = function () {
  if (this.energy >= this.MAX_ENERGY ) {
    throw new Error("Full energy");
  };
};

Tamamon.prototype.checkMin = function () {
  if (this.energy <= this.MIN_ENERGY ) {
    throw new Error("No more energy");
  };
};

Tamamon.prototype.showEnergyNotifications = function () {
  if (this.energy === this.MAX_ENERGY) {
    this.energyMessage = "At full energy"
  } else if (this.energy >= 10 && this.energy <= 18) {
    this.energyMessage = "Happy happy happy"
  } else if (this.energy > 0 && this.energy < 10) {
    this.energyMessage = "Tired...hungry...zZz"
  } else {
    this.energyMessage = "No energy left"
  };
  var newEnergyMessage = this.energyMessage;
  localStorage.setItem('energyMessage', newEnergyMessage);
  return newEnergyMessage;
};
