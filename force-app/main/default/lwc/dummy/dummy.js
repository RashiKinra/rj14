import { LightningElement } from 'lwc';

export default class Dummy extends LightningElement {
    
    connectedCallback(){
        var x = 5;
        if(x == 5){
            alert('is 5')
        }
        else{
            alert('not 5');
        }
    }
    
}