(PIXI, clearUI) => {
    let elements = [];
    
    const menuWindow = this.UI.menuWindow(PIXI);
    menuWindow.width = 740;
    menuWindow.height = 530;
    menuWindow.x = 200;
    menuWindow.y = 150;
    elements.push(menuWindow);
    
    if (this.data.challenge.timed) {
        console.log("timed challenge");
    } else {
        console.log("not timed challenge");
        const text = new PIXI.Text("Haaste suoritettu!", {fontSize : 50});
        text.x = menuWindow.x + menuWindow.width / 2 - text.width / 2;
        text.y = menuWindow.y + 75;
        elements.push(text);
        
        const text2 = new PIXI.Text("Onneksi olkoon. Tässä kaikkea.");
        text2.x = menuWindow.x + 50;
        text2.y = menuWindow.y + 150;
        elements.push(text2);
    }
    
    const closeButton = this.UI.button(PIXI, PIXI.spritesheet1.textures['sg_close_button.png'], clearUI);
    closeButton.width = 75;
    closeButton.height = 78;
    closeButton.x = menuWindow.width +93;
    closeButton.y = menuWindow.y + 30;
    elements.push(closeButton);
    
    
    return elements;
}