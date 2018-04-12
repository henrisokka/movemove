(PIXI, addToStage, handler, bg) => {
    let background;
    if (bg === "info") {
        background = new PIXI.Sprite(PIXI.loader.resources.background1.texture);
    } else {
        background = new PIXI.Sprite(PIXI.loader.resources.background0.texture);
    }
    background.width = this.data.width;
    background.height = this.data.height;
    background.interactive = true;
    background.on('mousedown', (e) => {
        handler(e);
    });
    
    
    addToStage(background);
    return background;
}