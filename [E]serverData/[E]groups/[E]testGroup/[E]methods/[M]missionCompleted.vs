(mission, choice) => {
    
    const selectorHelper = [this.data.blueResource, this.data.redResource, this.data.greenResource];
    selectorHelper[choice].amount += 10;
    this.isGoalCompleted(selectorHelper[choice]);
    mission.completed = true;
    this.missionCounter += 1;
}