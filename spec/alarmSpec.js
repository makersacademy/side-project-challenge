describe("Alarm", function () {

  var alarm;

  beforeEach(function() {
    alarm = new Alarm();
  });

  it('ON starts with a default value of false', function() {
    expect(alarm.on).toEqual(false);
  });

  
});
