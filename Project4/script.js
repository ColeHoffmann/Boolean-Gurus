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
    let view = document.getElementById("table");
    view.innerHTML = "";
    for(var i = 1; i <= table.length; i++){ 

        var imageName = findImage(table[i -1]);
        var cardID = i.toString();
        let card = document.createElement("BUTTON");
        card.setAttribute("class", "card");
        card.setAttribute("id", i);
        card.style.backgroundImage = "url(" + imageName + ")";
        card.style.backgroundRepeat = "no-repeat";
        view.appendChild(card);
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

function nameChosen () {
    let selectName = document.getElementById("selectName");
    let increment = selectName.getAttribute("data") == "increment";
    name = selectName.value;
    if (increment) {
        for (let i = 0; i < arrayOfUsers.length; i++){
              if (arrayOfUsers[i].name == name) {
                   arrayOfUsers[i].score ++;
                     //update the view
                    document.getElementById('player'+(i+1)+'-score').textContent = "Player " + (i+1) + " score: " + arrayOfUsers[i].score+" pts";
         
            }
        }
    }
    else {
            for (let i = 0; i < arrayOfUsers.length; i++){
                 if (arrayOfUsers[i].name == name && arrayOfUsers[i].score > 0) {
                     arrayOfUsers[i].score --;
                     //update the view
                    document.getElementById('player'+(i+1)+'-score').textContent = "Player " + (i+1) + " score: " + arrayOfUsers[i].score+" pts";
              }
         }
    } 
    let message = selectName.getAttribute("message");
    var modal = document.getElementById("myModal");
    modal.style.display = "none";
    changeScorePopup(increment, message);
}

function changeScorePopup(increment, message) {
    let text = document.createElement("p");
    message = parseInt(message);
    switch (message) {
        case 0: 
            if (increment) {
                text.innerHTML = "You are right! score incremented!";
                popupObject(text, "&#128512");
            }
            else {
                text.innerHTML = "Sorry, you are wrong! Score decremented (not below 0)! Please try again!";
                popupObject(text, "&#128542");
            }
            break;
        case 1: 
            if (increment) {
                text.innerHTML = "You are right! No sets found!<br>Replacing 3 cards.<br>You earned a bonus point!";
                popupObject(text, "No sets?");
            }
            else {
                text.innerHTML = "Sets found! You got penalized 1 pts for this!<br>(But you will get it back if you clicked on the hints right.)";
                popupObject(text, "No sets?");
            }
            break;
        
    }
}

 function changeScore (increment, message){
    numPlayers = document.getElementById("players-number").textContent * 1;
    if (numPlayers == 1){
        if (increment) {
        score ++;
        }
        else {
            if (score > 0) {
            score--;
            }
        }
        document.getElementById('player-score').textContent = "Score: " + score + " pts";
        changeScorePopup(increment, message);
    }else{
        var namePrompt = document.createElement("div");
        var nameDrop = document.createElement("SELECT");
        nameDrop.setAttribute("id", "selectName");
        nameDrop.setAttribute("message", message);
        if (increment) {
            nameDrop.setAttribute("data", "increment");
        }
        else {
            nameDrop.setAttribute("data", "decrement");
        }
        let submitName = document.createElement("BUTTON");
        submitName.innerHTML = "That's me";
        submitName.setAttribute("onclick", "nameChosen()");
        for (currentName of names) {
            let option = document.createElement("OPTION");
            option.setAttribute("value", currentName);
            option.innerHTML = currentName;
            nameDrop.appendChild(option);
        }
        namePrompt.appendChild(nameDrop);
        namePrompt.appendChild(submitName);
        popupObject(namePrompt, "Find your name in the list");
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

function popupObject(object, title){

    //var text = document.createTextNode(text);
    var popupContent = document.getElementById("popup-content");
   // popupContent.textContent = stringElement;
   popupContent.innerHTML = "";
   popupContent.appendChild(object);

    //add title
    var header = document.getElementsByClassName("modal-header")[0].lastElementChild;
    header.innerHTML = "";
    header.innerHTML = title;
        var modal = document.getElementById("myModal");

    // Get the <span> element that closes the modal
    var span = document.getElementsByClassName("close")[0];

    // When the user clicks the button, open the modal 
    modal.style.display = "block";
  

    // When the user clicks on <span> (x), close the modal
    if (!((object.children.length > 0)&&(object.children[0].getAttribute("id") === "selectName"))) {
        console.log("reached here");
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
    else {
        span.onclick = function() {};
        window.onclick = function() {};
        
        
    }
    console.log(object.children[0].getAttribute("id"));
}



function reset() {
    let text = document.createElement("p");
    numPlayers = document.getElementById("players-number").textContent * 1;
    if (numPlayers == 1){
    text.innerHTML = "Deck is empty. You score is " + score + " pts. <br>Thank you for the game! New Game will start opon closing this window";
        popupObject(text, "Good job!");
        score = 0;
        document.getElementById('player-score').textContent = "Score: " + score+" pts";
    }else{
        arrayOfUsers.sort(function(a, b){return b.score-a.score}); 
        let msg = "Deck is empty. Thank you for the game!  New Game will start opon closing this window.<br>Leaderboard: <br>";
        for (let i = 0; i < arrayOfUsers.length; i++){
            msg += arrayOfUsers[i].name +": "+arrayOfUsers[i].score +" pts<br>";
            arrayOfUsers[i].score = 0;
            //update the view
            document.getElementById('player'+(i+1)+'-score').textContent = "Player " + (i+1) + " score: " + arrayOfUsers[i].score+" pts";
        }
        text.innerHTML = msg;
        popupObject(text, "Scores");
    }
    deck = new Deck();
    table = deck.drawTwelve();
    newGame = new SetGame(deck, table);
    createView(table); 
    document.getElementById('cheat logs').innerHTML = "";
    
}





//button functions

function tut(){
    let text = document.createElement("p");
    text.innerHTML = "This game involving matching and selecting three cards with the same or all different amount of shapes, colors, infills and numbers.<br>"+
    "There are twelve cards on the screen all the time. The deck will have 69 cards remaining in the begining.<br>"+
    "The game defaults into single player mode.<br>"+
    "The game is playable in single player mode and it will count the overall score of the player.<br>"+
    "The game can also be played in multiplayer local versus mode.<br>"+
    "After clicking the start a versus game button, the web page will go into versus mode. It will first reset/restart all the current deck,<br>"+
    "  table,scores etc, then the users are prompt to input how many players there will be.<br>"+
    "And all the users need to input their user name as a tracker.<br>"+
    "After input is complete, the game will start.<br>"+
    "Upon selecting a set, the game will check if it is a set or not.<br>"+
    "If in multiplyer mode, the game will ask for the current player's username before displaying the result and modifing the score.<br>"+
    "User get one point if they get it right. User lose one point if they get it wrong.<br>"+
    "User score cannot go below zero. This means the user can guess as many time as they want if their score is zero. (New player friendly)<br>"+
    "Once the deck is empty and the user found a set, the game ends. And scores will be displayed.<br>"+
    "After user closing the window, a new game will be started and the user can start again.<br>"+
    "The maximum possible point avaiable for a player is 24 points.<br>"+
    "If you want to restart the game, simply refresh the page.<br>"+
    "For more informations, please refer to readme.md";
    popupObject(text,"How to play");
}


function cheat(){
    if (deck.cards.length < 0) {
        reset;
    }else{
        var setFound = findSet();
        if (setFound.length > 0){
            console.log(setFound);
            changeScore(true, 2);
            document.getElementById('cheat logs').innerHTML += "CHEAT: found set at location " + setFound[0]+", "+setFound[1]+", "+setFound[2] + ". Replaced cards<br>";
            replaceSelectedcards([document.getElementById(setFound[0]), document.getElementById(setFound[1]), document.getElementById(setFound[2])]) ;
        }else{
            document.getElementById('cheat logs').innerHTML += "CHEAT: No sets found, replacing 3 cards.<br>";
            changeScore(true, 2);
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


function noSetsOption(){
    var setFound = findSet();
    if (setFound.length > 0){
        changeScore(false, 1);
    //    popup("Sets found! You got penalized 1 pts for this!<br>(But you will get it back if you clicked on the hints right.)", "No sets?");
       // console.log(setFound);
        paintCard(setFound.pop(), 'yellow');
        paintCard(setFound.pop(), 'yellow');
        paintCard(setFound.pop(), 'yellow');
    }else{
     //   popup("You are right! No sets found!<br>Replacing 3 cards.<br>You earned a bonus point!", "No sets?");
        
        changeScore(true, 1);
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
                changeScore(true, 0);
                //alert("You are right! score incremented!");
              //  popup("You are right! score incremented!", "&#128512");
                replaceSelectedcards(cardsToCheck);
                
            } else {
                // clear selected background color
                changeScore(false, 0);
                //alert("Sorry, you are wrong! Score decremented (not below 0)! Please try again!");
               // popup("Sorry, you are wrong! Score decremented (not below 0)! Please try again!", "&#128542"); 
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
