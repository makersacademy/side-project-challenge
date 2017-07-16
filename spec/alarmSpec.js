describe("Alarm", function () {

  var alarm;

  beforeEach(function() {
    alarm = new Alarm(10, 20);
  });

  it("initializes a new date", function () {
    expect(alarm.date).not.toBeNull();
  });

  it("switch starts with a default value of false", function() {
    expect(alarm.alarmSwitch).toEqual(false);
  });

  // it("can be switched on", function () {
  //   alarm.switchOn();
  //   expect(alarm.on).toEqual(true);
  // });

  it("time can be set by the user", function () {
    expect(alarm.hour).toEqual(10);
    expect(alarm.min).toEqual(20);
  });

  it("checks that the time entered by the user is valid", function () {
    expect(alarm.isValid()).toEqual(true);
  });
});
