

window.addEventListener("message", function(event) {
    var v = event.data
    if (v.open == true) {
        $('.hud').css({"bottom": "1%", "left": "1%"})
        $('.hexagono').css({"display": "inline-block", "left" : "1%", "margin": "0vw"})
        if (v.voice == true) {
            $('.progressvoice').css('width', '100%')
        } else {
            $('.progressvoice').css('width', '0%')
        }
        
        $('.progresshealth').css('width', v.health+'%')
        $('.progressshield').css('width', v.armour+'%')
        $('.progressfood').css('width', v.food+'%')
        $('.progresswater').css('width', v.thirst+'%')
        $('.progressstress').css('width', v.stress+'%')
    } else if (v.open == 'car') {
        $('.hexagono').css({"display": "block", "left": "15vw", "margin": ".5vw"})
        if (v.voice == true) {
            $('.progressvoice').css('width', '100%')
        } else {
            $('.progressvoice').css('width', '0%')
        }
        
        $('.progresshealth').css('width', v.health+'%')
        $('.progressshield').css('width', v.armour+'%')
        $('.progressfood').css('width', v.food+'%')
        $('.progresswater').css('width', v.thirst+'%')
        $('.progressstress').css('width', v.stress+'%')
    }

});




