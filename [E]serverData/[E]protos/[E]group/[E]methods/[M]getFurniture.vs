(PIXI, n, stage) => { //n is the valaa object of furniture. if you wonder why it's called n the answer is because of lack of find and replace
    console.log("create a furniture");
        console.log(n.texture);
        const furniture = new PIXI.Sprite(PIXI.spritesheet1.textures[n.texture]);
        furniture.x = n.x;
        furniture.y = n.y;
        furniture.vo = n; //vo = valaa object
        
        furniture.anchor.set(0.5);
        furniture.handleDrag = (event) => {
            if (furniture.dragging) {
                console.log("handleDrag");
                const newPosition = event.data.getLocalPosition(stage);
                furniture.x = newPosition.x;
                furniture.y = newPosition.y;
            }
        }
        
        furniture.handleMouseDown = () => {
            console.log("handleMouseDown", furniture);
            furniture.alpha = 0.5;
            furniture.dragging = true;
        }
        
        furniture.handleMouseUp = () => {
            console.log("handleMouseUp", furniture);
            furniture.alpha = 1;
            furniture.dragging = false;
            furniture.vo.x = furniture.x;
            furniture.vo.y = furniture.y;
        }
        
        furniture.interactive = true;
        furniture.on('mousedown', furniture.handleMouseDown)
            .on('mouseup', furniture.handleMouseUp)
            .on('mousemove', furniture.handleDrag);
            
        return furniture;
}