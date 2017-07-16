describe("Alarm", function () {

  var alarm;

  beforeEach(function() {
    alarm = new Alarm(10, 20);
    jasmine.clock().install;
  });

  it("initializes a new date", function () {
    expect(alarm.date).not.toBeNull();
  });

  it("switch starts with a default value of false", function() {
    expect(alarm.alarmSwitch).toEqual(false);
  });

  it("time can be set by the user", function () {
    expect(alarm.hour).toEqual(10);
    expect(alarm.min).toEqual(20);
  });

  it("checks that the time entered by the user is valid", function () {
    expect(alarm.isValid()).toEqual(true);
  });

  it("can be switched on", function () {
    alarm.turnOn();
    expect(alarm.alarmSwitch).toEqual(true);
  });

  it("can be switched off", function () {
    alarm.turnOff();
    expect(alarm.alarmSwitch).toEqual(false);
  });

  it("checks whether time entered is equal to current time", function () {
    var baseTime = new Date(2017, 7, 16, 10, 20);
    jasmine.clock().mockDate(baseTime);
    expect(alarm.isTimeToSoundAlarm()).toBe(true);
  });

  it("makes the alarm sound", function () {
    spyOn(console, "log");
    alarm.soundAlarm();
    expect(console.log).toHaveBeenCalledWith("Riiiiiiing");
  });

  afterEach(function() {
    jasmine.clock().uninstall();
  });
});
