(PIXI, text, x, y, givenData) => {
    let elements = [];
    const content = new PIXI.Text(givenData.activeDialogue.content, {wordWrap : true, wordWrapWidth : 280});
    content.x = x + 5;
    content.y = y + 5;
    
    const bubble = new PIXI.Graphics();
    bubble.lineStyle(2, 0xFF00FF, 1);
    bubble.beginFill(0xffffff, 1);
    bubble.drawRoundedRect(x, y, 450, 150, 15);
    bubble.endFill();
    
    bubble.interactive = true;
    
    bubble.on('mousedown', () => {
        if (givenData.activeDialogue.next !== null) {
            givenData.activeDialogue = givenData.activeDialogue.next;
            content.text = givenData.activeDialogue.content;
        } else {
            PIXI.removeFromStage(bubble);
            PIXI.removeFromStage(content);    
        }
    });
    
    
    elements.push(bubble);
    elements.push(content);
    
    return elements;
}