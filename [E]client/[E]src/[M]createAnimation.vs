(PIXI, frames, speed) => {
    console.log("create animation", frames);
    let animation = new PIXI.extras.AnimatedSprite(frames);
    animation.animationSpeed = speed;
    animation.play();
    
    return animation;
}