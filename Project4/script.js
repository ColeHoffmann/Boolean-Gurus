class Card {
    constructor(shape, color, pattern, number){
        this.shape = shape;
        this.color = color;
        this.pattern = pattern;
        this.number = number;
    }

    toString(){
        return "Shape: " + this.shape + "\nColor: "+ this.color + "\nPattern: " + this.pattern+ "\nNumber:  "+ this.number; 
    }
}

class Deck {
    constructor(){
        this.cards = new Array();
        for (var i = 1; i < 4; i++) {
            for (var j = 1; j < 4; j++) {
                for (var k = 1; k < 4; k++) {
                    for (var l = 1; l < 4; l++) {
                        this.cards.push(new Card(i,j,k,l));
                    }
                }
            }
        }
    }

    shuffleCards(){
        let i = this.cards.length;
        while (i--) {
          const x = Math.floor(Math.random() * (i + 1));
          [this.cards[i], this.cards[x]] = [this.cards[x], this.cards[i]];
        }
    }

    drawTwelve(){
        var table = new Array();
        for(var i = 0; i < 12; i++){
            table.push(this.cards.pop());
        }

        return table;
    }

}

class User {
    //user functionalities
    constructor(name, hotkey){
        this.name = name;
        this.hotkey = hotkey;
    }
}

class SetGame {
    //functionalities for the set game
    constructor(deck, table, users){
        this.deck = deck;
        this.table = table;
        this.users = users
    }

    isProperSet(card1, card2, card3){
        var valid = new Array(3,6,9);
        var toIterate = new Array(card1, card2, card3);
        var toCheck = newArray();
        var answer = true;
        for (temp in toIterate) {
            var i = 0;
            for (p in temp) {
                toCheck[i] += temp.p;
                i++;
            }
        }
        for (temp2 in toCheck) {
            answer = answer && valid.includes(temp2);
        }
        return answer
    }

    //initialize table ie. populate it with cards
    initTable(){
        var tableContainer = document.getElementsByClassName('card');
        var tableContainerArray = Array.from(tableContainer);
        for(var i = 0; i < tableContainerArray.length; i++){
            //add cards info to table 
            var textNode = document.createTextNode(this.table[i].toString())
            tableContainer[i].appendChild(textNode);
        }
    }
}

//add click-on cards to arr



//run



var deck = new Deck();
deck.shuffleCards();
var table = deck.drawTwelve();
var user = new User("Franklin", 'i');
var newGame = new SetGame(deck, table, user);
newGame.initTable();

//add Evenhandlers
var tableContainer = document.getElementsByClassName('card');
var tableContainerArray = Array.from(tableContainer);
tableContainerArray.forEach(card=>{
    card.addEventListener('click', ()=>{

    }) //add click on card function here
})



