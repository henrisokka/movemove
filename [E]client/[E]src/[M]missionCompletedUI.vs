(PIXI, clearUI, showCutScene) => {
    let elements = [];
    
    const menuWindow = this.UI.menuWindow(PIXI);
    menuWindow.width = data.width - 100;
    menuWindow.height = data.height - 100;
    elements.push(menuWindow);

    const text = new PIXI.Text("Sait tehtäväsi suoritettua! Onneksi olkoon!");
    elements.push(text);
    
    const button1description = new PIXI.Text("Kerrytä resurssia 0:");
    button1description.x = 50;
    button1description.y = 100;
    elements.push(button1description);
    
    const button1 = this.UI.button(PIXI, PIXI.spritesheet1.textures['play_button.png'], 
        () => {
            Promise.resolve().then(() => {
                this.data.group.methods.missionCompleted(this.data.activeMission, 0);
            });
            this.getNewMission();
            showCutScene();
        });
    button1.x = 50;
    button1.y = 200;
    elements.push(button1);
    
    const button2description = new PIXI.Text("Kerrytä resurssia 1:");
    button2description.x = 350;
    button2description.y = 100;
    elements.push(button2description);
    
    const button2 = this.UI.button(PIXI, PIXI.spritesheet1.textures['play_button.png'], 
        () => {
            Promise.resolve().then(() => {
                this.data.group.methods.missionCompleted(this.data.activeMission, 1);
            });            
            this.getNewMission();
            showCutScene();
        });
    button2.x = 350;
    button2.y = 200;
    elements.push(button2);
    
    const button3description = new PIXI.Text("Kerrytä resurssia 2:");
    button3description.x = 650;
    button3description.y = 100;
    elements.push(button3description);
    
    const button3 = this.UI.button(PIXI, PIXI.spritesheet1.textures['play_button.png'], 
        () => {
            Promise.resolve().then(() => {
                this.data.group.methods.missionCompleted(this.data.activeMission, 2);
            });            
            this.getNewMission();
            showCutScene();
        });
    button3.x = 650;
    button3.y = 200;
    elements.push(button3);
    
    
    return elements;
}