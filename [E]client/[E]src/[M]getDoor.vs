(PIXI, rel, handler) => {
    const isSource = rel[Relation.source] === this.data.scene;
    
    const door = new PIXI.Sprite(PIXI.spritesheet1.textures['one_player_icon.png']);
    door.interactive = true;
    door.target = isSource ? rel[Relation.target] : rel[Relation.source];
    door.x = isSource ? rel.sourceX : rel.targetX;
    door.y = isSource ? rel.sourceY : rel.targetY;
    door.spawnX = isSource ? rel.targetX : rel.sourceX;
    door.spawnY = isSource ? rel.targetY : rel.sourceY;
    door.on('mousedown', (e) => {
        handler(e);
        this.data.doorTarget = door.target;
        this.data.state = "CHANGE_SCENE";
        this.data.doorSpawnX = door.spawnX;
        this.data.doorSpawnY = door.spawnY;
    });
    
    return door;
    
}