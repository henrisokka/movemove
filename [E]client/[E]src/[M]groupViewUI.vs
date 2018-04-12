(PIXI, clearUI) => {
    let elements = [];
    
    const uiWindow = this.UI.menuWindow(PIXI);
    elements.push(uiWindow);
    
    const button = this.UI.button(PIXI, PIXI.spritesheet1.textures['tickbox_unchecked.png'], clearUI);
    elements.push(button);
    
    const groupTitle = new PIXI.Text("Tähän tulee ryhmäsi nimi");
    groupTitle.x = 40;
    groupTitle.y = 100;
    elements.push(groupTitle);
    
    const resourceText = "Luokkallasi on " + this.data.group.data.blueResource.amount + "sinistä. " + 
        "Luokkallasi on " + this.data.group.data.redResource.amount + " punaista. " + 
        "Luokkallasi on " + this.data.group.data.greenResource.amount + " vihreää.";
    
    const groupResourcesUI = new PIXI.Text(resourceText);
    groupResourcesUI.x = 40;
    groupResourcesUI.y = 400;
    elements.push(groupResourcesUI);
    
    return elements;
}