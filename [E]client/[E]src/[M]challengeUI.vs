(PIXI, clearUI, challengeDone) => {
    let elements = [];
    
    const menuWindow = this.UI.menuWindow(PIXI);
    menuWindow.width = 740;
    menuWindow.height = 530;
    menuWindow.x = 200;
    menuWindow.y = 150;
    elements.push(menuWindow);
    
    const header = new PIXI.Text("Haluatko suorittaa tämän tehtävän?", {fontSize : 45, wordWrapWidth : 600});
    header.x = menuWindow.x + menuWindow.width / 2 - header.width / 2;
    header.y = menuWindow.y + 75;
    elements.push(header);
    
    const text3 = new PIXI.Text("Sinulla on " + this.data.challenge.timeAmount + " sekuntia aikaa", {wordWrap : true, wordWrapWidth : 600, fontSize : 35, lineHeight : 42});
    text3.x = menuWindow.x + menuWindow.width / 2 - text3.width / 2;
    text3.y = menuWindow.y + 150;
    elements.push(text3);
    
    const text = new PIXI.Text(this.data.challenge.description, {wordWrap : true, wordWrapWidth : 600, fontSize : 70, lineHeight : 42});
    text.x = menuWindow.x + menuWindow.width / 2 - text.width / 2;
    text.y = menuWindow.y + 250;
    elements.push(text);
 
    
    const okButton = this.UI.okButton(PIXI, challengeDone);
    okButton.height = 75;
    okButton.width = 78;
    okButton.x = (menuWindow.width + okButton.width +10); 
    okButton.y = (menuWindow.height + okButton.height -40); 
    elements.push(okButton);
    
    return elements;
}