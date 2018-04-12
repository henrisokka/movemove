(PIXI) => {
    const menuWindow = new PIXI.Sprite(PIXI.loader.resources.uiWindow.texture);
    menuWindow.width = data.width;
    menuWindow.height = data.height;
    return menuWindow;
}