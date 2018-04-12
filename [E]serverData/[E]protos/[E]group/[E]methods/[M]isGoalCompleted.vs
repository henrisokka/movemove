(resource) => {
    console.log("isGoalCompleted");
    console.log(resource[Valaa.name]);
    if (resource.amount >= resource.currentGoal) {
        console.log("goal is completed indeed");        
        
        resource.amount = 0;
        //resource.goal = 40;
        
        const furniture = new this.data.protos.furniture({owner: this.data.nest.furnitures, name: "furniture"});
        furniture.x = 300;
        furniture.y = 300;
        console.log(furniture);
        this.getNewGoal(resource);
        return true;
    }
    console.log("goal isn't completed yet");
    return false;
}