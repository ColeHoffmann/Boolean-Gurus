
function test() {

    function Card(shape, color, pattern, number) {
        this.shape = shape;
        this.color = color;
        this.pattern = pattern;
        this.number = number;
    };

    function Deck() {
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
    };

    function putCard(card) {
        document.writeln(card.shape.toString() + card.color.toString() + card.pattern.toString() + card.number.toString());
    };

    function shuffle (deck) {
        for(i = 0; i < deck.cards.length; i++){
            var x = Math.floor((Math.random() * deck.length) + 1);
            var y = Math.floor((Math.random() * deck.length) + 1);
            var temp = deck.cards[x];
            deck.cards[x] = deck.cards[y];
            deck.cards[y] = temp;
        }
    };

    function drawTwelve (table) {
       
        for (var i = 0; i < 12; i++) {
            table.onTable.push(table.deck.cards.pop());
        }
        return table;
    };

    function Table(deck) {
        this.deck = deck;
        this.onTable = new Array();
        drawTwelve(this);
       
    };

    function toString(card){
        return "Shape: " + card.shape + "\nColor: "+ card.color + "\nPattern: " + card.pattern+ "\nNumber:  "+ card.number; 
    }

    
    var deck = new Deck();
    console.log(deck);
    shuffle(deck);
    console.log(deck);
    var table = new Table(deck);

    var card = document.getElementsByClassName('card')
    var tableCards = Array.from(card); 
    

    //initialize table cards.
    for(var i = 0; i < tableCards.length; i++){
        //card.document
        var textNode = document.createTextNode(toString(table.onTable[i]));
        tableCards[i].appendChild(textNode);
    }
}

if (document.readyState == 'loading') {
    document.addEventListener('DOMContentLoaded', ready);
} else {
    ready();
}

//add your game logic here or in the test function which is called in read()
//use whichever is convenient
function ready(){
    test();
    var i = 0;
    var tableCards = Array.from(document.getElementsByClassName('card'));

    tableCards.forEach(card => {
            card.addEventListener('click', addCardToCheck(card)) //add click on card function here
        })

    function addCardToCheck(card) {
        console.log(i+1);
    }
}
