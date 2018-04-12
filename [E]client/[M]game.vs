() => {
    this.init(); // this function takes care of the valaa-side of the game initialization
    
    const PIXI = this.pixi[Media.immediateContent]({ mime: "application/javascript" });
    console.log("testi");
    //Asset URLs
    
    //character
    const imageURL = "https://valaa.com/dev/cdn/character.png";
    
    //actionpoints
    const mapPointURL = "https://valaa.com/dev/cdn/dam.png";
    const lockedMapPointURL = "https://valaa.com/dev/cdn/dam_grayscale.png";
    const houseURL = "https://valaa.com/dev/cdn/house.png";
    const forestURL = "https://valaa.com/dev/cdn/forest.png";
    
    //buttons
    const buttonURL = "https://valaa.com/dev/cdn/ok_button.png";
    const closeButtonURL = "https://valaa.com/dev/cdn/close_button.png";
    const backButtonURL = "https://valaa.com/dev/cdn/back_button.png";
    
    //backgrounds
    const backgroundURL = "https://i.imgur.com/LsTwV3a.jpg";
    const background2URL = "https://i.imgur.com/RW78LRM.png";
    const background3URL = "https://i.imgur.com/T3zm6gl.png";
    const windowURL = "https://valaa.com/dev/cdn/dialogue_box_base.png";
    
    //spritesheet
    const spritesheetURL = "https://valaa.com/dev/cdn/sg_spritesheet.png";
    
    let width = window.innerWidth;
    let height = window.innerHeight;
    this.data.width = width;
    this.data.height = height;
    
    let uiElements = []; // UI-elements: menus etc.
    let gameObjects = []; // all the elements that are not UI-objects or character
    let hud = []; // UI-elements that are shown all the time
    
    let background;
    let character;
    let spritesheet;
    let cutScene;
    
    let gameOn = false;
    
    let app = new PIXI.Application({width: width, height: height});
    const stage = app.stage;
    
    document.body.insertBefore(app.view, document.body.firstChild);
    
    const gameloop = (delta) => {
        if (this.data.updateHud) {
            renderHUD();
        }
        
        if (this.data.character.update) { // update character animation if needed
            let oldChar = character;
            removeFromStage(character);
            character = this.src.getCharacterAnimation(PIXI, spritesheet);
            character.position.set(oldChar.x, oldChar.y);
            addToStage(character);
            this.data.character.update = false;
        }
        
        if (gameOn) {
            let xMovementDone = false;
            let yMovementDone = false;
            let vectorX = this.data.destinationX - character.x;
            let vectorY = this.data.destinationY - character.y;

            let Mag = Math.sqrt(vectorX * vectorX + vectorY * vectorY);
            let speed = 5;
            let new_vx = vectorX * speed / Mag;
            let new_vy = vectorY * speed / Mag;

            if (this.movementOn && !this.data.uiOn) {
                character.x += new_vx;
                character.y += new_vy;
            }

            if (vectorX < 5 && vectorX > -5 && vectorY < 5 && vectorY > -5 && this.movementOn) {
                this.movementOn = false;
                this.canShowText = true;
                this.data.character.newState("idle");
                if (this.data.state === "ACTIONPOINT") {
                    actionPoint();
                } else if (this.data.state === "CHANGE_SCENE") {
                    changeScene();
                }
            }
        }
    };
    
    const updateMap = () => {
        console.log("scene: ", this.data.scene);
        const actionPoints = this.data.scene[Relatable.getRelations]("in"); // get all action points in this room
        for (let i=0; i<actionPoints.length; i++) {
            const actionPoint = this.src.actionPoint(PIXI, actionPoints[i][Relation.target], mapClickHandler);
            actionPoint.x = Number(actionPoints[i].x);
            actionPoint.y = Number(actionPoints[i].y);
            addToStage(actionPoint);
            gameObjects.push(actionPoint);
        }
    };
    
    const getDoors = () => {
        // get all doors in this room
        const outgoingDoors = this.data.scene[Relatable.getRelations]("door");
        const incomingDoors = this.data.scene[Relatable.getIncomingRelations]("door");
        const doorRelations = incomingDoors.concat(outgoingDoors);
        
        for (let i=0; i<doorRelations.length; i++) {
            const door = this.src.getDoor(PIXI, doorRelations[i], mapClickHandler);
            gameObjects.push(door);
            addToStage(door);
        }
    };
    
    /* GAME LOGIC FUNCTIONS */
    
    const actionPoint = () => {
        this.data.state = "null";
        this.data.uiOn = true;
        removeFromStage(gameObjects);
        addToUI(this.src.actionPointUI(PIXI, clearUI, acceptChallenge));
    };
    
    const changeScene = () => {
        this.data.state = "null";
        this.data.scene = this.data.doorTarget;
        this.data.doorTarget = "";
        character.x = Number(this.data.doorSpawnX);
        character.y = Number(this.data.doorSpawnY);
        
        removeFromStage(gameObjects);
        gameObjects = [];
        updateMap();
        getDoors();
        bringToFront(character);
    };
    
    const showCutScene = () => {
        clearUI();
        removeFromStage(character);
        removeFromStage(background);
        removeFromStage(gameObjects);

        let frames = [];
        
        for (let i=0; i<20; i++) {
            const animation = [spritesheet.textures['sg_char3_00.png'], spritesheet.textures['sg_char3_01.png']];
            frames = frames.concat(animation);
        }
        
        cutScene = this.src.createAnimation(PIXI, frames, 0.2);
        
        cutScene.loop = false;
        cutScene.onComplete = () => { 
            hideCutScene();
        };
        
        cutScene.width = this.data.width;
        cutScene.height = this.data.height;
        addToStage(cutScene);
    };
    
    const hideCutScene = () => {
        removeFromStage(cutScene); 
        addToStage(background);
        addToStage(gameObjects);
        addToStage(character);
        bringToFront(hud);
    };
    
   /* CLICK HANDLERS */
   
    const startGame = () => {
        clearUI();
        renderHUD();
        updateMap();
        getDoors();
        gameOn = true;
        character = this.src.getCharacterAnimation(PIXI, spritesheet);
        addToStage(character);
    };
    
    const mapClickHandler = (e) => {
        const coord = e.data.getLocalPosition(stage);
        if (!this.data.uiOn) {
            this.src.moveTo(coord);
            this.movementOn = true;
            this.canShowText = false;
            this.data.changeScene = false;
            this.data.character.newState("walk");
        }
    };
    
    const acceptChallenge = () => {
        this.src.getNewChallenge();
        clearUI();
        addToUI(this.src.challengeUI(PIXI, clearUI, challengeDone));
    };
    
    const challengeDone = () => {
        clearUI();
        const categories = this.data.challenge.categories;
        if (categories.catBalance) {
            this.data.resources.stars += 1;
        }
        if (categories.catMoving) {
            this.data.resources.moons += 1; 
        }
        if (categories.catEquipment) {
            this.data.resources.planets += 1;
        }
        
        if (this.src.isMissionCompleted()) {
            addToUI(this.src.missionCompletedUI(PIXI, clearUI, showCutScene));
        } else {
            addToUI(this.src.challengeDoneUI(PIXI, clearUI));
        }
    };
    
    /* UI FUNCTIONS */
    
    const addToUI = (ui) => { // accepts only arrays now
        this.data.uiOn = true;
        uiElements = uiElements.concat(ui);
        addToStage(ui);
    };
    
    const clearUI = () => {
        removeFromStage(uiElements);
        uiElements = [];
        
        // in case gameObjects are disabled:
        removeFromStage(gameObjects); 
        addToStage(gameObjects);
        
        if (character) {
            bringToFront(character);    
        }
        this.data.uiOn = false;
        
        renderHUD(); // not sure if this is ok here. if there is problems with hud rendering it's because of this
    };
    
    const renderHUD = () => {
        removeFromStage(hud);
        hud = this.src.hud(PIXI, infoViewSwitcher);
        addToStage(hud);
    };
    
    const openGameMenu = () => {
        addToUI(this.src.getActiveMenu(PIXI, addToStage, clearUI));
    };
    
    const infoViewSwitcher = () => {
        if (this.data.state !== "infoView") {
            this.data.state = "infoView";
            clearUI();
            removeFromStage(gameObjects);
            removeFromStage(character);
            addToUI(this.src.infoScreenUI(PIXI, showGroupView));
            bringToFront(hud);
        } else {
            this.data.state = "main";
            clearUI();
            addToStage(gameObjects);
            addToStage(character);
            bringToFront(hud);
        }
    }
    
    const showGroupView = () => {
        this.data.state = "groupView";
        clearUI();
        addToUI(this.data.group.methods.getNest(PIXI, clearUI, this.data, stage));
    }
    
    /* STAGE HELPERS*/
    
    const addToStage = (thing) => {
        if (Array.isArray(thing)) {
            for (let i=0; i<thing.length; i++) {
                stage.addChild(thing[i]);
            }
        } else {
            stage.addChild(thing);
        }
    }
    
    PIXI.addToStage = addToStage;
    
    const removeFromStage = (thing) => {
        if (Array.isArray(thing)) {
            for (let i=0; i<thing.length; i++) {
                stage.removeChild(thing[i]);
            }
        } else {
            stage.removeChild(thing);
        }
    }
    
    PIXI.removeFromStage = removeFromStage;
    
    const bringToFront = (thing) => {
        removeFromStage(thing);
        addToStage(thing);
    }
    
    /* THESE ARE RAN WHEN THE GAME LOADS AND STARTS */
    
    const loaderOptions = {
      loadType: PIXI.loaders.Resource.LOAD_TYPE.IMAGE,
      xhrType:  PIXI.loaders.Resource.XHR_RESPONSE_TYPE.BLOB,
    };
    
    const loadProgressHandler = () => {
        console.log("Loading");
    }
    
    const setup = () => {
        const json_string = this.data.assets.sg_spritesheet_json[Media.immediateContent]({ mime: "text/plain" }); // prepare the spritesheet
        const json_data = JSON.parse(json_string);
        /* Assign aliases to PIXI loader resources */
        const image_data = PIXI.loader.resources.spritesheet1;
        spritesheet = new PIXI.Spritesheet(
            PIXI.loader.resources.spritesheet1.texture.baseTexture,
            json_data,
            image_data.url);
        spritesheet.parse(() => console.log("spritesheet parsed!"));
        PIXI.spritesheet1 = spritesheet; // we store the spritesheet to PIXI object so we don't have to pass them around separately
        
        app.ticker.add(delta => gameloop(delta));
        
        background = this.src.updateBackground(PIXI, addToStage, mapClickHandler);  // draw background
        addToUI(this.src.startMenu(PIXI, addToStage, startGame));                   // show startmenu
    }

    PIXI.loader
      .add("juha", imageURL, loaderOptions)
      .add("activePoint", mapPointURL, loaderOptions)
      .add("lockedPoint", lockedMapPointURL, loaderOptions)
      .add("background0", backgroundURL, loaderOptions)
      .add("background1", background2URL, loaderOptions)
      .add("background2", background3URL, loaderOptions)
      .add("uiWindow", windowURL, loaderOptions)
      .add("house", houseURL, loaderOptions)
      .add("forest", forestURL, loaderOptions)
      .add("button", buttonURL, loaderOptions)
      .add("backButton", backButtonURL, loaderOptions)
      .add("closeButton", closeButtonURL, loaderOptions)
      .add("spritesheet1", spritesheetURL , loaderOptions)
      .on("progress", loadProgressHandler)
      .load(setup);
}