(PIXI, clearUI, acceptChallenge) => {
    let elements = [];
    
    const menuWindow = this.UI.menuWindow(PIXI);
    menuWindow.width = 740;
    menuWindow.height = 530;
    menuWindow.x = 200;
    menuWindow.y = 150;
    elements.push(menuWindow);
    
    const text = new PIXI.Text(this.data.actionPoint.name, {fontSize : 45, wordWrapWidth : 600});
    text.x = menuWindow.x + menuWindow.width / 2 - text.width / 2;
    text.y = menuWindow.y + 75;
    elements.push(text);
    
    const text2 = new PIXI.Text(this.data.actionPoint.description, {wordWrap : true, wordWrapWidth : 600, fontSize : 35, lineHeight : 42});
    text2.x = menuWindow.x + 50;
    text2.y = menuWindow.y + 150;
    elements.push(text2);
    /*
    const text3 = new PIXI.Text(this.data.challenge.description, {wordWrap : true, wordWrapWidth : 600, fontSize : 35, lineHeight : 42});
    text3.x = menuWindow.x + 50;
    text3.y = menuWindow.y + 350;
    elements.push(text3);
    */
    const play = this.UI.button(PIXI, PIXI.spritesheet1.textures['play_button.png'], acceptChallenge);
    play.height = 75;
    play.width = 78;
    play.x = (menuWindow.width + play.width +10); 
    play.y = (menuWindow.height + play.height -40);
    
    elements.push(play);
    
    const okButton = this.UI.okButton(PIXI, clearUI);
    okButton.height = 75;
    okButton.width = 78;
    okButton.x = menuWindow.width + 93;
    okButton.y = menuWindow.y + 30; 
    elements.push(okButton);
    
    console.log("actionPointUI: ", elements);
    
    return elements;
}