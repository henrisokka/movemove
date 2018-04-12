(PIXI, backHome, width, height, stage) => {
    let elements = [];
    
    const background = new PIXI.Sprite(PIXI.loader.resources.background2.texture);
    background.width = width;
    background.height = height;
    elements.push(background);
    
    const button = this.UI.button(PIXI, PIXI.spritesheet1.textures['sg_close_button.png'], backHome);
    button.x = width - 100;
    button.y = 40;
    elements.push(button);
    
    const nestObjects = this.data.nest.furnitures[Resource.unnamedOwnlings];
    
    console.log("getNest.vs unnamedOwnlings: ", nestObjects);
    console.log(this[Resource.owner][Valaa.name]);
    
    nestObjects.forEach((n) => {
        const furniture = this.getFurniture(PIXI, n, stage);
        elements.push(furniture); 
    });
    
    
    const content = "Hei! Minä olen luokkasi oma olento ja tämä on pesäni. Auta pitämään se kunnossa suorittamalla tehtäviä!";
    const speechBubble = this.UI.speechBubble(PIXI, content, x, y);
    elements = elements.concat(speechBubble);
    
    
    const creature = new PIXI.Sprite(PIXI.spritesheet1.textures['sg_char3_01.png']);
    creature.height = 300;
    creature.width = 200;
    creature.x = 400;
    creature.y = 350;
    elements.push(creature);
    
    console.log("nest elements: ", elements);
    return elements;
}