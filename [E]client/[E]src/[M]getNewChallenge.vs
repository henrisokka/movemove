() => {
    const challenges = this.data.gameData.challenges[Resource.unnamedOwnlings];
   
    let possibleChallenges = [];
    
    if (this.data.actionPoint.chosenChallenge === null) {
        
        for (let i=0; i<challenges.length; i++) {
            if (true) {
                possibleChallenges.push(challenges[i]);
            }
        }
        let index = Math.floor(Math.random() * possibleChallenges.length);
        this.data.challenge = possibleChallenges[index];
    } else {
        this.data.challenge = this.data.actionPoint.chosenChallenge;
    }
    
};