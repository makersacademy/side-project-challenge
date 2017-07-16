function Alarm(hour, min) {
  this.alarmSwitch = false;
  this.hour = hour;
  this.min = min;
  this.date = new Date();
  this.date.setHours(hour);
  this.date.setMinutes(min);
}

Alarm.prototype.isValid = function () {
  return this.hour > 0
  && this.hour < 25
  && this.min > -1
  && this.min < 60;
};

Alarm.prototype.isEqual = function () {
  dateNow = new Date();
  return dateNow.getMinutes() === this.date.getMinutes()
         && dateNow.getHours() === this.date.getHours();
}
