describe("Tamamon", function () {

  var tamamon;

  beforeEach(function () {
    tamamon = new Tamamon();
    tamamon.energy = 10
  });

  describe("#energy", function () {
    it("it has a default energy of 10", function () {
      expect(tamamon.energy).toEqual(10);
    });
  });

  describe("#MAX_ENERGY", function () {
    it("has a maximum energy of 20", function () {
      expect(tamamon.MAX_ENERGY).toEqual(20);
    });

    it("throws an error if the user tries to go beyond the max energy", function() {
      for(var i = 10; i < 20; i += 2) {
        tamamon.feed();
      };
      expect( function() { tamamon.checkMax() } ).toThrow(new Error("Full energy"));
    });
  });

  describe("#feed", function () {
    it("feeds the pet and increases its energy by 2", function () {
      tamamon.feed();
      expect(tamamon.energy).toEqual(12);
    });
  });

  describe("#showEnergyNotifications", function () {
    it("tells the user when the pet has full energy", function() {
      for(var i = 10; i < 20; i += 2) {
        tamamon.feed();
      };
      tamamon.showEnergyNotifications();
      expect(tamamon.energyMessage).toEqual("At full energy");
    });

    it("tells the user when the pet is happy/at a good energy level", function() {
      for(var i = 10; i < 18; i += 2) {
        tamamon.feed();
      };
      tamamon.showEnergyNotifications();
      expect(tamamon.energyMessage).toEqual("Happy happy happy");
    });

    it("tells the user when the pet is tired/hungry/low on energy", function() {
      for(var i = 10; i > 2; i -= 2) {
        tamamon.playtime();
      };
      tamamon.showEnergyNotifications();
      expect(tamamon.energyMessage).toEqual("Tired...hungry...zZz");
    });

    it("tells the user when the pet is has no more energy", function() {
      for(var i = 10; i > 0; i -= 2) {
        tamamon.playtime();
      };
      tamamon.showEnergyNotifications();
      expect(tamamon.energyMessage).toEqual("No energy left");
    });
  });

  describe("#MIN_ENERGY", function () {
    it("has a minimum energy of 0", function () {
      expect(tamamon.MIN_ENERGY).toEqual(0);
    });

    it("throws an error if the user tries to go beyond the min energy", function() {
      for(var i = 10; i > 0; i -= 2) {
        tamamon.playtime();
      };
      expect( function() { tamamon.checkMin() } ).toThrow(new Error("No more energy"));
    });
  });

  describe("#playtime", function () {
    it("plays with the pet and decreases its energy by 2", function () {
      tamamon.playtime();
      expect(tamamon.energy).toEqual(8);
    });
  });
});
