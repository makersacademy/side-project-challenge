function Alarm(hour, min) {
  this.alarmSwitch = false;
  this.hour = hour;
  this.min = min;
  this.date = new Date();
  if (this.isValid()) {
    this.date.setHours(hour);
    this.date.setMinutes(min);
  }
};

Alarm.prototype.isValid = function () {
  return this.hour > 0
  && this.hour < 25
  && this.min > -1
  && this.min < 60;
};

Alarm.prototype.turnOn = function () {
  this.alarmSwitch = true;
};

Alarm.prototype.turnOff = function () {
  this.alarmSwitch = false;
};

Alarm.prototype.isTimeToSoundAlarm = function () {
  dateNow = new Date();
  return dateNow.getMinutes() === this.date.getMinutes()
         && dateNow.getHours() === this.date.getHours();
};

Alarm.prototype.soundAlarm = function() {
  console.log("Riiiiiiing");
};
