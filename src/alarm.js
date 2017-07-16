function Alarm(hour, min) {
  this.alarmSwitch = false;
  this.hour = hour;
  this.min = min;
  this.date = new Date();
}

Alarm.prototype.isValid = function () {
  return this.hour > 0
  && this.hour < 25
  && this.min > -1
  && this.min < 60
};
