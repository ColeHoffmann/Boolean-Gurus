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
        this.size = 0;
        for (var i = 1; i < 4; i++) {
            for (var j = 1; j < 4; j++) {
                for (var k = 1; k < 4; k++) {
                    for (var l = 1; l < 4; l++) {
                        this.cards.push(new Card(i,j,k,l));
                        this.size = this.size + 1;
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
        this.size = this.size - 12;
        //update deck size
        var cardsLeft = document.getElementById('cards-left');
        cardsLeft.childNodes[0].textContent = deck.size; 

        return table;
    }

    drawcard(){

        this.size --;
         // update cards left
         var cardsLeft = document.getElementById('cards-left');
         cardsLeft.childNodes[0].textContent = deck.size;
        return this.cards.pop();
        
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
        var toCheck = new Array();
        var answer = true;
        for (var temp in toIterate) {
            var i = 0;
            for (var p in temp) {
                toCheck[i] += temp.p;
                i++;
            }
        }
        for (var temp2 in toCheck) {
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



function run(){ 

    //This will prompt for the number of players.
    var numPlayers = window.prompt("How many players will be playing?", "Select (1,2,3,4)");
    var possiblePlayerNumber = ["1", "2", "3", "4"];

    //If the responce is invalid, keep asking for number of Players.
    while(!possiblePlayerNumber.includes(numPlayers)){
        var numPlayers = window.prompt("Oops. You chose an incorrect Value. How many players will be playing?", "Select (1,2,3,4)");
    }
    //turn it from a string to an int. (i.e. "1" * 1.0 = 1.0)
    numPlayers = numPlayers * 1;

    var cardCount = 0;
    var deck = new Deck();


}








var cardCount = 0;
var deck = new Deck();
deck.shuffleCards();
var table = deck.drawTwelve();
var user = new User("Franklin", 'i');
var newGame = new SetGame(deck, table, user);
newGame.initTable();
//set to keep 3 cards selected, wont accept duplicates
var cardsToCheck = new Set();

//logic for each user after hitting hotKey should go here
//add Evenhandlers
var tableContainer = document.getElementsByClassName('card');
var tableContainerArray = Array.from(tableContainer);

tableContainerArray.forEach(card=>{
    card.addEventListener('click', () =>{
        cardCount = cardCount + 1;
        addCardToSet(card)
        var c = card.childNodes;
        console.log(c[1].textContent); //debugging
        alert("you chose: " + card.id + "\n " + c[1].textContent); //for debugging 
        clearSelectedCard(card.id);
        //if 3 cards are have been selected
        if(cardCount == 3){
            alert("You have selected 3 cards.")
            //replaceSelectedcards(cardsToCheck);
            var isASet = checkForSet(cardsToCheck); 
            if(isASet){
                replaceSelectedcards(cardsToCheck);
            } else {
                // clear selected background color
                cardsToCheck.forEach(card=>{
                    document.getElementById(card.id).style.backgroundColor = 'white';
                })
            }
            alert(isASet);
            cardCount = 0; 
            cardsToCheck.clear(); //clear set
        }
    })
})

//replace selected cards
function replaceSelectedcards(cardsToCheck){
    cardsToCheck.forEach(card=>{
        var oldCard = document.getElementById(card.id);
        var newCard = deck.drawcard();
        oldCard.childNodes[1].textContent = newCard.toString();
        oldCard.style.backgroundColor = 'white';
        //exit if deck size is zero
        if(deck.length == 0){
            //set olcard content no more cards in deck
            oldCard.childNodes[1].textContent = "No more cards."
        }
       
    })
}


//clear the card from the table ie set card to invisible
function clearSelectedCard(cardID){
    var cardToClear = document.getElementById(cardID);
    cardToClear.style.backgroundColor = 'lime'; // change background to lime when card is selected
}

function addCardToSet(card){
    cardsToCheck.add(card);
}
function checkForSet(cardsToCheck){
    var it = cardsToCheck.values();
    var card1 = it.next();
    var card2 = it.next();
    var card3 = it.next();
    //check if card is a set
    return newGame.isProperSet(card1, card2, card3);
}
