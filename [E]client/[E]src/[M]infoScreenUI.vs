(PIXI, showGroupView) => {
    let elements = [];
    
    const background = this.UI.menuWindow(PIXI);
    elements.push(background);
    
    const starSymbol = new PIXI.Text("Tähtiä:");
    starSymbol.x = 40;
    starSymbol.y = 40;
    elements.push(starSymbol);
    
    const starCounter = new PIXI.Text(this.data.resources.stars);
    starCounter.x = 200;
    starCounter.y = 40;
    elements.push(starCounter);
    
    const moonSymbol = new PIXI.Text("Kuita:");
    moonSymbol.x = 40;
    moonSymbol.y = 80;
    elements.push(moonSymbol);
    
    const moonCounter = new PIXI.Text(this.data.resources.moons);
    moonCounter.x = 200;
    moonCounter.y = 80;
    elements.push(moonCounter);
    
    const planetSymbol = new PIXI.Text("Planeettoja:");
    planetSymbol.x = 40;
    planetSymbol.y = 120;
    elements.push(planetSymbol);
    
    const planetCounter = new PIXI.Text(this.data.resources.planets);
    planetCounter.x = 200;
    planetCounter.y = 120;
    elements.push(planetCounter);
    
    const missionTitle = new PIXI.Text("Aktiivinen tehtäväsi:");
    missionTitle.x = 40;
    missionTitle.y = 450;
    elements.push(missionTitle);
    
    const missionText = "Kerää " + this.data.activeMission.stars + " tähteä. Kerää " + this.data.activeMission.moons + " kuuta. Kerää " + this.data.activeMission.planets + " planeettaa."
    
    const activeMission = new PIXI.Text(missionText);
    activeMission.x = 40;
    activeMission.y = 500;
    elements.push(activeMission);
    
    const missionCounterSymbol = new PIXI.Text("Ryhmäsi suorittamat tehtävät:");
    missionCounterSymbol.x = 700;
    missionCounterSymbol.y = 450;
    elements.push(missionCounterSymbol);
    
    const missionCounter = new PIXI.Text(this.data.group.missionCounter);
    missionCounter.x = 700;
    missionCounter.y = 500;
    elements.push(missionCounter);
    
    const groupInfoButton = this.UI.button(PIXI, PIXI.spritesheet1.textures['multiplayer_icon.png'], showGroupView);
    groupInfoButton.x = 600;
    groupInfoButton.y = 100;
    elements.push(groupInfoButton);
    
    return elements;
}