(PIXI, addToStage, clearUI) => {
    let elements = [];

    const menuWindow = this.UI.menuWindow(PIXI);
    menuWindow.width = 740;
    menuWindow.height = 530;
    menuWindow.x = 200;
    menuWindow.y = 150;
    elements.push(menuWindow);
    
    const okButton = this.UI.okButton(PIXI, clearUI);
    okButton.height = 75;
    okButton.width = 78;
    okButton.x = menuWindow.x  + 30;
    okButton.y = menuWindow.y + 30; 
    elements.push(okButton);
    console.log("beforeAddToStage");
    addToStage(elements);
    
    return elements;
}