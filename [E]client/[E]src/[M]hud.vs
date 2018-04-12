(PIXI, openGameMenu) => {
    let elements = [];
    const openMenu = new PIXI.Sprite(PIXI.spritesheet1.textures['two_player_icon.png'])
    openMenu.width = 100;
    openMenu.height = 100;
    openMenu.x = data.width - 150;
    openMenu.y = 20;
    openMenu.interactive = true;
    openMenu.on('mousedown', () => {
       openGameMenu(); 
    });
    
    elements.push(openMenu);
    
    const mission = new PIXI.Graphics()
    mission.lineStyle(2, 0x0000FF, 1);
    mission.beginFill(0xFF700B, 1);
    mission.drawRect(this.data.width / 2 - 100, 0, 200, 50);
    
    elements.push(mission);
    
    const planets = new PIXI.Text("P: " + this.data.activeMission.planets);
    console.log("planets: ", this.data.activeMission.planets);
    planets.x = this.data.width / 2 - 100;
    planets.y = 10;
    const stars = new PIXI.Text("T: " + this.data.activeMission.stars);
    stars.x = this.data.width / 2 - 50;
    stars.y = 10;
    const moons = new PIXI.Text("K: " +this.data.activeMission.moons);
    moons.x = this.data.width / 2;
    moons.y = 10;
    
    const planetsNow = new PIXI.Text(this.data.resources.planets);
    planetsNow.x = this.data.width / 2 - 80;
    planetsNow.y = 30;
    
    const starsNow = new PIXI.Text(this.data.resources.stars);
    starsNow.x = this.data.width / 2 - 30;
    starsNow.y = 30;
    
    const moonsNow = new PIXI.Text(this.data.resources.moons);
    moonsNow.x = this.data.width / 2 + 20;
    moonsNow.y = 30;
    
    elements.push(planets);
    elements.push(stars);
    elements.push(moons);
    elements.push(planetsNow);
    elements.push(starsNow);
    elements.push(moonsNow);
    
    console.log("HUD ELEMENTS: ", elements);
    return elements;
}