(coord) => {
    this.data.destinationX = coord.x;
    this.data.destinationY = coord.y;
    this.data.character.newState("walk");
    console.log("moveTo", this.data.destinationX, this.data.destinationY);
}