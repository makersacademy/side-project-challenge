$(document).ready(function startAnimation() {

    var tamamon = new Tamamon;

    var frames = document.getElementById("animation").children;
    var frameCount = frames.length;
    var i = 0;
    setInterval(function() {
      frames[i % frameCount].style.display = "none";
      frames[++i % frameCount].style.display = "block";
    }, 500);
    setInterval(reduceEnergy, 600000);

  function reduceEnergy() {
    tamamon.playtime();
    tamamon.showEnergyNotifications();
    energyColors();
    updateEnergy();
    $('#energyMessage').text(tamamon.energyMessage);
  };

  function energyColors() {
    if (tamamon.energy === 20){
      $("#default-energy").css("color", "lime");
    } else if (tamamon.energy > 8 && tamamon.energy < 20) {
      $("#default-energy").css("color", "green");
    } else if (tamamon.energy > 0 && tamamon.energy <= 8){
      $("#default-energy").css("color", "orange");
    } else {
      $("#default-energy").css("color", "red");
    }
  };

  function updateEnergy() {
    $('#default-energy').text(tamamon.energy);
  };

  function returnToDefaultImage() {
    setTimeout(function() {
      $("#default01").prop('src', "Images/Pet/Tamamon01.png");
      $("#default02").prop('src', "Images/Pet/Tamamon02.png");
    }, 3000);
  };

  function shakeHead() {
    $("#default01").prop('src', "Images/Pet/TamamonShakeHead01.png");
    $("#default02").prop('src', "Images/Pet/TamamonShakeHead02.png");
  };

  function feedPet() {
    $("#default01").prop('src', "Images/Pet/TamamonFeed02.png");
    $("#default02").prop('src', "Images/Pet/TamamonFeed01.png");
  };

  function playPet() {
    $("#default01").prop('src', "Images/Pet/TamamonPlay01.png");
    $("#default02").prop('src', "Images/Pet/TamamonPlay02.png");
  };

  updateEnergy();
  $("#energyMessage").text(tamamon.energyMessage);
  energyColors();

  $('#feed').on('click', function startAnimationFeed() {
    if (tamamon.energy === tamamon.MAX_ENERGY) {
      shakeHead();
      returnToDefaultImage();
    } else {
      feedPet();
      returnToDefaultImage();
    };
    tamamon.feed();
    tamamon.showEnergyNotifications();
    energyColors();
    updateEnergy();
    $('#energyMessage').text(tamamon.energyMessage);
  });

  $('#playtime').on('click', function startAnimationPlay() {
    if (tamamon.energy === tamamon.MIN_ENERGY) {
      shakeHead();
      returnToDefaultImage();
    } else {
      playPet();
      returnToDefaultImage();
    };
    reduceEnergy();
  });
});
