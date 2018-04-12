(PIXI, ap, callback) => {
    console.log("ap.type: ", ap);
    const textureName = ap.type + ".png";
    console.log("texturename: ", textureName);
    
    const actionPoint = new PIXI.Sprite(PIXI.spritesheet1.textures[textureName]);
    const rx = Math.floor(Math.random() * this.data.width - 300);
    const ry = Math.floor(Math.random() * this.data.height - 300);
    actionPoint.position.set(rx, ry);
    actionPoint.interactive = true;
    actionPoint.entity = ap;
    actionPoint.width = 181;
    actionPoint.height = 107;
    
    actionPoint.on('mousedown', (e) => {
        this.data.state = "ACTIONPOINT";
        this.data.actionPoint = actionPoint.entity;
        callback(e);
    });
    
    return actionPoint;
};