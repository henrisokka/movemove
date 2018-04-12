(PIXI, spritesheet) => {
    console.log("Get character animation");
    let walkAni = [spritesheet.textures['sg_char2_00.png'], spritesheet.textures['sg_char2_01.png'], spritesheet.textures['sg_char2_02.png']];
    
    let character;
    
    if (this.data.character.animation === "walk") {
        character = this.createAnimation(PIXI, walkAni, 0.15);
    }
    
    if (this.data.character.animation === "idle") {
        character = this.createAnimation(PIXI, [walkAni[1]], 1);
    }
    
    character.height = this.data.character.height;
    character.width = this.data.character.width;
    character.anchor.set(0.5, 0.5);
    
    return character;
}