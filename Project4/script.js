//initialize
var numPlayers = 1;
var arrayOfUsers = [];
var names = ["","\n"];

if (numPlayers == 1){
    var score = 0;
    var playerScoreDiv = document.createElement('div');
    playerScoreDiv.setAttribute('class', 'player-score');
    playerScoreDiv.setAttribute('id', 'player-score'); //eg id=player1-score
    playerScoreDiv.textContent = "Score: " + score +" pts";
    document.getElementsByClassName('player-info')[0].appendChild(playerScoreDiv);
}



//models
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
        this.shuffleCards();
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
}

class SetGame {
    //functionalities for the set game
    constructor(deck, table){
        this.deck = deck;
        this.table = table;
        var tableContainer = document.getElementsByClassName('card');
        var tableContainerArray = Array.from(tableContainer);
        for(var i = 0; i < tableContainerArray.length; i++){
            //add cards info to table 
            var textNode = document.createTextNode(this.table[i].toString())
            tableContainer[i].appendChild(textNode);
        }
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
            number += array[i].number;
	    }
	    var answer = ((includes(valid, shape))&&(includes(valid, color))&&(includes(valid, pattern))&&(includes(valid, number)));
	    return answer;
    }

}





//utility functions

function getRandomInt(max) {
    return (Math.floor(Math.random() * Math.floor(max))) + 1;
}

function includes (array, element) {
    if (array.indexOf(element) !== -1) return true;
    return false;
}

function paintCard (number, color) {
    document.getElementById(number).style.backgroundColor = color;
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

function findSet(){
    var foundSet = [];
    for(let i = 0; i < 10; i++){
        for(let j = i + 1; j < 11; j++){
            for(let k = i + 2; k < 12; k++){
                hintCheckCards = [tableContainerArray[i], tableContainerArray[j], tableContainerArray[k]];
                if(checkForSet(hintCheckCards)){
                    foundSet.push(i + 1, j + 1,k + 1);
                    return foundSet;
                }
            }
        }
    }
    return foundSet;
}

function increaseScore (){
    numPlayers = document.getElementById("players-number").textContent * 1;
    if (numPlayers == 1){
        score ++;
        document.getElementById('player-score').textContent = "Score: " + score+" pts";
    }else{
        name = prompt("Player enter your Username for scoring (Please be honest)");
        while (!includes(names,name)){
            name = prompt("Username not found!<br>Player enter your Username for scoring (Please be honest)");
        }
        console.log(arrayOfUsers);
        for (let i = 0; i < arrayOfUsers.length; i++){
            if (arrayOfUsers[i].name == name) {
                arrayOfUsers[i].score ++;
                //update the view
                document.getElementById('player'+(i+1)+'-score').textContent = "Player " + (i+1) + " score: " + arrayOfUsers[i].score+" pts";
            }
        }
    }
}
function decreaseScore (){
    numPlayers = document.getElementById("players-number").textContent * 1;
    if (numPlayers == 1){
        if (score > 0) {
            score--;
            document.getElementById('player-score').textContent = "Score: " + score+" pts";
        }
    }else{
        name = prompt("Player enter your Username for scoring (Please be honest)");
        while (!includes(names,name)){
            name = prompt("Username not found!<br>Player enter your Username for scoring (Please be honest)");
        }
        console.log(arrayOfUsers);
        for (let i = 0; i < arrayOfUsers.length; i++){
            if (arrayOfUsers[i].name == name && arrayOfUsers[i].score > 0) {
                arrayOfUsers[i].score --;
                //update the view
                document.getElementById('player'+(i+1)+'-score').textContent = "Player " + (i+1) + " score: " + arrayOfUsers[i].score+" pts";
            }
        }
    }
}

//replace selected cards
function replaceSelectedcards(cardsToCheck){
    if (deck.cards.length > 0) {
        cardsToCheck.forEach(card=>{
           var oldCard = document.getElementById(card.id);
           var newCard = deck.drawcard();
           table[card.id - 1] = newCard;
           var imageName = findImage(newCard);
           oldCard.style.backgroundImage = "url(" + imageName + ")";
           oldCard.style.backgroundColor = 'white';   
      })
    }
    else {
        reset();
    }
}


//clear the card from the table ie set card to invisible
function clearSelectedCard(cardID){
    var cardToClear = document.getElementById(cardID);
    cardToClear.style.backgroundColor = 'PaleTurquoise'; // change background to lime when card is selected
}

function addCardToSet(card){
    cardsToCheck.add(card);
}
function checkForSet(cardsToCheck){
    var it = cardsToCheck.values();
    var card1 = it.next().value;
    var card2 = it.next().value;
    var card3 = it.next().value;
    //check if card is a set
    return newGame.isProperSet(card1, card2, card3);
}

function popup(stringElement){

    //var text = document.createTextNode(text);
    var popupContent = document.getElementById("popup-content");
   // popupContent.textContent = stringElement;
    popupContent.innerHTML = "";
    popupContent.innerHTML = stringElement;
        // Get the modal
    var modal = document.getElementById("myModal");

    // Get the <span> element that closes the modal
    var span = document.getElementsByClassName("close")[0];

    // When the user clicks the button, open the modal 
    modal.style.display = "block";
  

    // When the user clicks on <span> (x), close the modal
    span.onclick = function() {
        modal.style.display = "none";
    }

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }
}

function reset() {
    numPlayers = document.getElementById("players-number").textContent * 1;
    if (numPlayers == 1){
        popup("Deck is empty. You score is " + score + " pts. <br>Thank you for the game! New Game will start once you press OK");
        score = 0;
        document.getElementById('player-score').textContent = "Score: " + score+" pts";
    }else{
        arrayOfUsers.sort(function(a, b){return b.score-a.score}); 
        let msg = "Deck is empty. Thank you for the game!  New Game will start once you press OK.<br>Leaderboard: <br>";
        for (let i = 0; i < arrayOfUsers.length; i++){
            msg += arrayOfUsers[i].name +": "+arrayOfUsers[i].score +" pts\n";
            arrayOfUsers[i].score = 0;
            //update the view
            document.getElementById('player'+(i+1)+'-score').textContent = "Player " + (i+1) + " score: " + arrayOfUsers[i].score+" pts";
        }
        popup(msg);
    }
    deck = new Deck();
    table = deck.drawTwelve();
    newGame = new SetGame(deck, table);
    createView(table); 
    document.getElementById('cheat logs').innerHTML = "";
    
}





//button functions


function cheat(){
    if (deck.cards.length < 0) {
        reset;
    }else{
        var setFound = findSet();
        if (setFound.length > 0){
            console.log(setFound);
            increaseScore();
            document.getElementById('cheat logs').innerHTML += "CHEAT: found set at location " + setFound[0]+", "+setFound[1]+", "+setFound[2] + ". Replaced cards<br>";
            replaceSelectedcards([document.getElementById(setFound[0]), document.getElementById(setFound[1]), document.getElementById(setFound[2])]) ;
        }else{
            document.getElementById('cheat logs').innerHTML += "CHEAT: No sets found, replacing 3 cards.<br>";
            increaseScore();
            let cardsToReplace = [document.getElementById(getRandomInt(12)), document.getElementById(getRandomInt(12)), document.getElementById(getRandomInt(12))];
            replaceSelectedcards(cardsToReplace);
        }
    }
}




function versusSetup(){ 
    //add reset html page before fun 
    deck = new Deck();
    table = deck.drawTwelve();
    newGame = new SetGame(deck, table);
    createView(table); 
    document.getElementsByClassName('player-info')[0].innerHTML = '';
    arrayOfUsers = [];
    names = ["","\n"];
    
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
        var name = prompt("Player " +i+ " enter your Username: ");;
        while (includes(names,name)){
            name = prompt("User name taken! Please choose another one!\nPlayer " +i+ " enter your Username: ");
        }
        arrayOfUsers.push(new User(name));
        names.push(name);

        //create player divs with class and id attr        arrayOfUsers.push(new User(name));
        var playerNameDiv = document.createElement('div');
        playerNameDiv.setAttribute('class', 'player-name'); //class player-name
        playerNameDiv.setAttribute('id', 'player'+i+'-name'); //eg id=player1-name
        playerNameDiv.textContent = "Player " + i + ": " + name;

        var playerScoreDiv = document.createElement('div');
        playerScoreDiv.setAttribute('class', 'player-score');
        playerScoreDiv.setAttribute('id', 'player'+i+'-score'); //eg id=player1-score
        playerScoreDiv.textContent = "Player " + i + " score: " + arrayOfUsers[i-1].score +" pts";
        

        //append to div class = player-name & div class = player-score
        document.getElementsByClassName('player-info')[0].appendChild(playerNameDiv);
        document.getElementsByClassName('player-info')[0].appendChild(playerScoreDiv);

    }

    //premoving the "" and "\n"
    names.shift();
    names.shift();
    console.log(names);

    //write the number of players
    document.getElementById("players-number").textContent = numPlayers;
    
}


function hint(){
    var setFound = findSet();
    if (setFound.length > 0){
        decreaseScore();
        popup("Sets found! You got penalized 1 pts for this!(But you will get it back if you clicked on the hints right.");
        console.log(setFound);
        paintCard(setFound.pop(), 'yellow');
        paintCard(setFound.pop(), 'yellow');
        paintCard(setFound.pop(), 'yellow');
    }else{
        popup("No sets found, replacing 3 cards. You earned a bonus point!");
        
        increaseScore();
        cardsToReplace = [document.getElementById(getRandomInt(12)), document.getElementById(getRandomInt(12)), document.getElementById(getRandomInt(12))];
        replaceSelectedcards(cardsToReplace);
    }
}







//main function

//initialize game
var deck = new Deck();
var table = deck.drawTwelve();
var newGame = new SetGame(deck, table);
createView(table); 


//set to keep 3 cards selected, wont accept duplicates
var cardsToCheck = new Set();

//logic for each user after hitting hotKey should go here
//add Evenhandlers
var tableContainer = document.getElementsByClassName('card');
var tableContainerArray = Array.from(tableContainer);

var cardCount = 0;
tableContainerArray.forEach(card=>{
    card.addEventListener('click', () =>{
        console.log(numPlayers);
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
                increaseScore();
                //alert("You are right! score incremented!");
                popup("You are right! score incremented!");
                replaceSelectedcards(cardsToCheck);
                
            } else {
                // clear selected background color
                decreaseScore();
                //alert("Sorry, you are wrong! Score decremented (not below 0)! Please try again!");
                popup("Sorry, you are wrong! Score decremented (not below 0)! Please try again!"); 
            }
            // clear selected and suggested cards background
            for (var i = 1; i < 13; i++) {
                paintCard(i, 'white');
            }
            cardCount = 0;
            cardsToCheck.clear(); //clear set
        }
    })
})
