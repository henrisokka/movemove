(PIXI, okHandler) => {
    const okButton = new PIXI.Sprite(PIXI.loader.resources.button.texture);
    okButton.width = 78;
    okButton.height = 75;
    okButton.y = 200;
    okButton.x = 200;
    okButton.interactive = true;
    
    okButton.on('mousedown', () => {
       console.log("OK!");
       okHandler(); 
    });
    
    return okButton;
}