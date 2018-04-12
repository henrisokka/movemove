(PIXI, texture, callback) => {
    const button = new PIXI.Sprite(texture);
    button.interactive = true;
    button.on('mousedown', () => {
        callback();
    });
    console.log("button: ", button);
    return button;
};