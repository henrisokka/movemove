() => {
    const gameData = new this.data.gameData({owner: this.data, name: "gameData"});
     
    this.data.scene = gameData.firstScene;
}