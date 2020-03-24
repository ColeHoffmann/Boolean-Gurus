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
        document.getElementById('cards-left').childNodes[0].textContent = deck.size; 

        return table;
    }

    drawcard(){

        this.size --;
         // update cards left
         document.getElementById('cards-left').childNodes[0].textContent = deck.size;
        return this.cards.pop();
        
    }

}


    
class User {
    //user functionalities
    constructor(name){
        this.name = name;
        this.score = 0;
    }
        
    incrementScore(){
        //increment the score
        this.score++;
        //var currentScore = document.getElementById('score');
        //update it
       // currentScore.childNodes[0].textContent = this.score;
        //return score
        return this.score;
    }

    decrementScore(){
        if(this.score != 0){
            this.score--;
            /*
            var currentScore = document.getElementById('score');
            //update it
            currentScore.childNodes[0].textContent = this.score;
            */
        }
        //return score
        return this.score;
    }

    getScore(){
        return this.score;
    }

    
}

function includes (array, element) {
    var answer = false;
    for (var i = 0; i < array.length; i++) {
        if (array[i]===element) answer = true;
    }
    return answer;
}

class SetGame {
    //functionalities for the set game
    constructor(deck, table, users){
        this.deck = deck;
        this.table = table;
        this.users = users
    }



    isProperSet(card1, card2, card3) {
        var array = [table[card1.id - 1], table[card2.id - 1], table[card3.id - 1]];
        //  console.log(array[1].color);
	    var valid = [3, 6, 9];
	    var shape = 0;
	    var color = 0;
	    var pattern = 0;
	    var number = 0;
	    for (var i = 0; i < array.length; i++) {
	    	shape += array[i].shape;
            color += array[i].color;
            pattern += array[i].pattern;
        //    console.log(array[i].pattern);
            number += array[i].number;
	    }
        //	console.log(color);
	    var answer = ((includes(valid, shape))&&(includes(valid, color))&&(includes(valid, pattern))&&(includes(valid, number)));
        /*	console.log(answer);
	    console.log(pattern);
	    console.log(includes(valid, shape));
	    console.log(includes(valid, color));
	    console.log(includes(valid, pattern));
	    console.log(includes(valid, number)); */
	    return answer;
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


function findImage(card){
    var filepath = "SetCards/";
    var shape = card.shape.toString();
    var color = card.color.toString();
    var pattern = card.pattern.toString();
    var number = card.number.toString();
    var extension =  (".svg");

    var fullPath = filepath.concat(shape,color, pattern, number, extension);
    return fullPath;

}

function createView(table){
    for(var i = 1; i <= table.length; i++){ 

        var imageName = findImage(table[i -1]);
        var cardID = i.toString();
        document.getElementById(cardID).style.backgroundImage = "url(" + imageName + ")";
        document.getElementById(cardID).style.backgroundRepeat = "no-repeat";
    }

}




var numPlayers = 0;
var arrayOfUsers = [];

function run(){ 
    //add reset html page before fun 

    
    //This will prompt for the number of players.
    numPlayers = prompt("How many players will be playing?", "Select (2,3,4)");
    var possiblePlayerNumber = ["2", "3", "4"];
    
    //If the responce is invalid, keep asking for number of Players.
    while(!possiblePlayerNumber.includes(numPlayers)){
        var numPlayers = window.prompt("Oops. You chose an incorrect Value. How many players will be playing?", "Select (2,3,4)");
    }
    //turn it from a string to an int. (i.e. "1" * 1.0 = 1.0)    //    console.log(array[i].pattern);
    numPlayers = numPlayers * 1;
    console.log(numPlayers);

    for(var i = 1; i <= numPlayers; i++){
        var name = prompt("Player " +i+ " enter your Username: ");
        arrayOfUsers.push(new User(name));
        //create player divs with class and id attr
        var playerNameDiv = document.createElement('div');
        playerNameDiv.setAttribute('class', 'player-name'); //class player-name
        playerNameDiv.setAttribute('id', 'player'+i+'-name'); //eg id=player1-name
        playerNameDiv.textContent = "Player " + i + ": " + name;

        var playerScoreDiv = document.createElement('div');
        playerScoreDiv.setAttribute('class', 'player-score');
        playerScoreDiv.setAttribute('id', 'player'+i+'-score'); //eg id=player1-score
        playerScoreDiv.textContent = "Player " + i + " score: " + arrayOfUsers[i-1].getScore();
        

        //append to div class = player-name & div class = player-score
        document.getElementsByClassName('player-info')[0].appendChild(playerNameDiv);
        document.getElementsByClassName('player-info')[0].appendChild(playerScoreDiv);

    }

    //write the number of players
    document.getElementById("players-number").textContent = numPlayers;

}

function paintCard (number, color) {
    document.getElementById(number).style.backgroundColor = color;
}

function hint(){
    var foundSet = false;
    for(var i = 0; i < 10; i++){
        for(var j = i + 1; j < 11; j++){
            for(var k = i + 2; k < 12; k++){
                hintCheckCards = [tableContainerArray[i], tableContainerArray[j], tableContainerArray[k]];
                if(checkForSet(hintCheckCards)){
                   // alert(tableContainerArray[i].id + " and " + tableContainerArray[j].id + " and " + tableContainerArray[k].id + " are a set");
                   foundSet = true;
                   paintCard(i + 1, 'yellow');
                   paintCard(j + 1, 'yellow');
                   paintCard(k + 1, 'yellow');
                    return;
                }
            }
        }
    }
    if (!foundSet) {
        alert("No sets found, sorry, you lose. Life is unfair.");
    }
}



var cardCount = 0;
var deck = new Deck();
deck.shuffleCards();
var table = deck.drawTwelve();
var user = new User("default");
var newGame = new SetGame(deck, table, user);
newGame.initTable();
createView(table); 
//set to keep 3 cards selected, wont accept duplicates
var cardsToCheck = new Set();

//logic for each user after hitting hotKey should go here
//add Evenhandlers
var tableContainer = document.getElementsByClassName('card');
var tableContainerArray = Array.from(tableContainer);

tableContainerArray.forEach(card=>{
    card.addEventListener('click', () =>{
        if(!cardsToCheck.has(card)){
            cardCount = cardCount + 1;
            addCardToSet(card)
            var c = card.childNodes;
            console.log(c[1].textContent); //debugging
          //  alert("you chose: " + card.id + "\n " + c[1].textContent); //for debugging
            clearSelectedCard(card.id);
        }
        else{
            cardCount = cardCount - 1;
            cardsToCheck.delete(card);
            document.getElementById(card.id).style.backgroundColor = 'white';
        }
        
        //if 3 cards are have been selected
        if(cardCount == 3){
          //  alert("You have selected 3 cards.")
            //replaceSelectedcards(cardsToCheck);
            var isASet = checkForSet(cardsToCheck);
            if(isASet){
                user.incrementScore();
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
        console.log(card.id);
        var newCard = deck.drawcard();
        table[card.id - 1] = newCard;
        var imageName = findImage(newCard);
        oldCard.style.backgroundImage = "url(" + imageName + ")";
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
    var card1 = it.next().value;
    var card2 = it.next().value;
    var card3 = it.next().value;
    //console.log(card1.color);
    //console.log(card2.color);
    //check if card is a set
    return newGame.isProperSet(card1, card2, card3);
}
