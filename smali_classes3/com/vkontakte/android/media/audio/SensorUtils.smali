.class final Lcom/vkontakte/android/media/audio/SensorUtils;
.super Ljava/lang/Object;
.source "SensorUtils.java"

# interfaces
.implements Landroid/hardware/SensorEventListener;


# static fields
.field private static final TAG:Ljava/lang/String; = "SensorUtils"


# instance fields
.field private final accelerometerSensor:Landroid/hardware/Sensor;

.field private accelerometerVertical:Z

.field private allowStartRecord:Z

.field private final audioManager:Landroid/media/AudioManager;

.field private countLess:I

.field private gravity:[F

.field private gravityFast:[F

.field private final gravitySensor:Landroid/hardware/Sensor;

.field private inputFieldHasText:Z

.field private lastProximityValue:F

.field private lastTimestamp:J

.field private linearAcceleration:[F

.field private final linearSensor:Landroid/hardware/Sensor;

.field private previousAccValue:F

.field private proximityHasDifferentValues:Z

.field private final proximitySensor:Landroid/hardware/Sensor;

.field private proximityTouched:Z

.field private final proximityWakeLock:Landroid/os/PowerManager$WakeLock;

.field private final queue:Lcom/vkontakte/android/utils/DispatchQueue;

.field private raiseChat:Landroid/app/Activity;

.field private raiseToEarRecord:Z

.field private raisedToBack:I

.field private raisedToTop:I

.field private final sensorManager:Landroid/hardware/SensorManager;

.field private sensorsStarted:Z

.field private sessionId:Ljava/lang/String;

.field private timeSinceRaise:J

.field private useFrontSpeaker:Z


# direct methods
.method constructor <init>()V
    .locals 9

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    const/4 v6, 0x3

    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    new-instance v4, Lcom/vkontakte/android/utils/DispatchQueue;

    const-string/jumbo v5, "SensorUtilsQueue"

    invoke-direct {v4, v5}, Lcom/vkontakte/android/utils/DispatchQueue;-><init>(Ljava/lang/String;)V

    iput-object v4, p0, Lcom/vkontakte/android/media/audio/SensorUtils;->queue:Lcom/vkontakte/android/utils/DispatchQueue;

    .line 30
    new-array v4, v6, [F

    iput-object v4, p0, Lcom/vkontakte/android/media/audio/SensorUtils;->gravity:[F

    .line 31
    new-array v4, v6, [F

    iput-object v4, p0, Lcom/vkontakte/android/media/audio/SensorUtils;->gravityFast:[F

    .line 32
    new-array v4, v6, [F

    iput-object v4, p0, Lcom/vkontakte/android/media/audio/SensorUtils;->linearAcceleration:[F

    .line 41
    const/high16 v4, -0x3d380000    # -100.0f

    iput v4, p0, Lcom/vkontakte/android/media/audio/SensorUtils;->lastProximityValue:F

    .line 53
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    .line 54
    .local v0, "context":Landroid/content/Context;
    const-string/jumbo v4, "audio"

    invoke-virtual {v0, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/media/AudioManager;

    iput-object v4, p0, Lcom/vkontakte/android/media/audio/SensorUtils;->audioManager:Landroid/media/AudioManager;

    .line 55
    const-string/jumbo v4, "sensor"

    invoke-virtual {v0, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/hardware/SensorManager;

    iput-object v4, p0, Lcom/vkontakte/android/media/audio/SensorUtils;->sensorManager:Landroid/hardware/SensorManager;

    .line 56
    iget-object v4, p0, Lcom/vkontakte/android/media/audio/SensorUtils;->sensorManager:Landroid/hardware/SensorManager;

    const/16 v5, 0x8

    invoke-virtual {v4, v5}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object v4

    iput-object v4, p0, Lcom/vkontakte/android/media/audio/SensorUtils;->proximitySensor:Landroid/hardware/Sensor;

    .line 57
    iget-object v4, p0, Lcom/vkontakte/android/media/audio/SensorUtils;->sensorManager:Landroid/hardware/SensorManager;

    const/16 v5, 0xa

    invoke-virtual {v4, v5}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object v2

    .line 58
    .local v2, "linearSensor":Landroid/hardware/Sensor;
    iget-object v4, p0, Lcom/vkontakte/android/media/audio/SensorUtils;->sensorManager:Landroid/hardware/SensorManager;

    const/16 v5, 0x9

    invoke-virtual {v4, v5}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object v1

    .line 59
    .local v1, "gravitySensor":Landroid/hardware/Sensor;
    if-eqz v1, :cond_0

    if-nez v2, :cond_1

    .line 60
    :cond_0
    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    const-string/jumbo v6, "SensorUtils"

    aput-object v6, v4, v5

    const-string/jumbo v5, "Gravity or linear sensor not found"

    aput-object v5, v4, v8

    invoke-static {v4}, Lcom/vkontakte/android/utils/L;->w([Ljava/lang/Object;)V

    .line 61
    iget-object v4, p0, Lcom/vkontakte/android/media/audio/SensorUtils;->sensorManager:Landroid/hardware/SensorManager;

    invoke-virtual {v4, v8}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object v4

    iput-object v4, p0, Lcom/vkontakte/android/media/audio/SensorUtils;->accelerometerSensor:Landroid/hardware/Sensor;

    .line 62
    iput-object v7, p0, Lcom/vkontakte/android/media/audio/SensorUtils;->linearSensor:Landroid/hardware/Sensor;

    .line 63
    iput-object v7, p0, Lcom/vkontakte/android/media/audio/SensorUtils;->gravitySensor:Landroid/hardware/Sensor;

    .line 69
    :goto_0
    const-string/jumbo v4, "power"

    invoke-virtual {v0, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/os/PowerManager;

    .line 70
    .local v3, "powerManager":Landroid/os/PowerManager;
    const/16 v4, 0x20

    const-string/jumbo v5, "proximity"

    invoke-virtual {v3, v4, v5}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v4

    iput-object v4, p0, Lcom/vkontakte/android/media/audio/SensorUtils;->proximityWakeLock:Landroid/os/PowerManager$WakeLock;

    .line 71
    return-void

    .line 65
    .end local v3    # "powerManager":Landroid/os/PowerManager;
    :cond_1
    iput-object v7, p0, Lcom/vkontakte/android/media/audio/SensorUtils;->accelerometerSensor:Landroid/hardware/Sensor;

    .line 66
    iput-object v2, p0, Lcom/vkontakte/android/media/audio/SensorUtils;->linearSensor:Landroid/hardware/Sensor;

    .line 67
    iput-object v1, p0, Lcom/vkontakte/android/media/audio/SensorUtils;->gravitySensor:Landroid/hardware/Sensor;

    goto :goto_0
.end method

.method private changeAudioStreamType(Z)V
    .locals 4
    .param p1, "useFrontSpeaker"    # Z

    .prologue
    .line 299
    invoke-direct {p0, p1}, Lcom/vkontakte/android/media/audio/SensorUtils;->screenLocker(Z)V

    .line 301
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    .line 302
    .local v0, "context":Landroid/content/Context;
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/vkontakte/android/AudioMessagePlayerService;

    invoke-direct {v1, v0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 303
    .local v1, "intentPlayer":Landroid/content/Intent;
    const-string/jumbo v2, "action"

    const/4 v3, 0x6

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 304
    const-string/jumbo v2, "front_speaker"

    invoke-virtual {v1, v2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 305
    invoke-virtual {v0, v1}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 306
    return-void
.end method

.method private isNearToSensor(F)Z
    .locals 1
    .param p1, "value"    # F

    .prologue
    .line 295
    const/high16 v0, 0x40a00000    # 5.0f

    cmpg-float v0, p1, v0

    if-gez v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/media/audio/SensorUtils;->proximitySensor:Landroid/hardware/Sensor;

    invoke-virtual {v0}, Landroid/hardware/Sensor;->getMaximumRange()F

    move-result v0

    cmpl-float v0, p1, v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private screenLocker(Z)V
    .locals 2
    .param p1, "lock"    # Z

    .prologue
    .line 309
    iget-boolean v0, p0, Lcom/vkontakte/android/media/audio/SensorUtils;->proximityHasDifferentValues:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/media/audio/SensorUtils;->proximityWakeLock:Landroid/os/PowerManager$WakeLock;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/media/audio/SensorUtils;->proximityWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result v0

    if-eq v0, p1, :cond_0

    .line 310
    if-eqz p1, :cond_1

    .line 311
    iget-object v0, p0, Lcom/vkontakte/android/media/audio/SensorUtils;->proximityWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->acquire()V

    .line 315
    :goto_0
    iget-object v0, p0, Lcom/vkontakte/android/media/audio/SensorUtils;->raiseChat:Landroid/app/Activity;

    if-eqz v0, :cond_0

    .line 316
    iget-object v1, p0, Lcom/vkontakte/android/media/audio/SensorUtils;->raiseChat:Landroid/app/Activity;

    if-eqz p1, :cond_2

    const/4 v0, 0x0

    :goto_1
    invoke-virtual {v1, v0}, Landroid/app/Activity;->setVolumeControlStream(I)V

    .line 320
    :cond_0
    return-void

    .line 313
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/media/audio/SensorUtils;->proximityWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->release()V

    goto :goto_0

    .line 316
    :cond_2
    const/high16 v0, -0x80000000

    goto :goto_1
.end method


# virtual methods
.method synthetic lambda$startSensors$0()V
    .locals 4

    .prologue
    const/16 v3, 0x7530

    .line 99
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    .line 100
    .local v0, "handler":Landroid/os/Handler;
    iget-object v1, p0, Lcom/vkontakte/android/media/audio/SensorUtils;->gravitySensor:Landroid/hardware/Sensor;

    if-eqz v1, :cond_0

    .line 101
    iget-object v1, p0, Lcom/vkontakte/android/media/audio/SensorUtils;->sensorManager:Landroid/hardware/SensorManager;

    iget-object v2, p0, Lcom/vkontakte/android/media/audio/SensorUtils;->gravitySensor:Landroid/hardware/Sensor;

    invoke-virtual {v1, p0, v2, v3, v0}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;ILandroid/os/Handler;)Z

    .line 103
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/media/audio/SensorUtils;->linearSensor:Landroid/hardware/Sensor;

    if-eqz v1, :cond_1

    .line 104
    iget-object v1, p0, Lcom/vkontakte/android/media/audio/SensorUtils;->sensorManager:Landroid/hardware/SensorManager;

    iget-object v2, p0, Lcom/vkontakte/android/media/audio/SensorUtils;->linearSensor:Landroid/hardware/Sensor;

    invoke-virtual {v1, p0, v2, v3, v0}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;ILandroid/os/Handler;)Z

    .line 106
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/media/audio/SensorUtils;->accelerometerSensor:Landroid/hardware/Sensor;

    if-eqz v1, :cond_2

    .line 107
    iget-object v1, p0, Lcom/vkontakte/android/media/audio/SensorUtils;->sensorManager:Landroid/hardware/SensorManager;

    iget-object v2, p0, Lcom/vkontakte/android/media/audio/SensorUtils;->accelerometerSensor:Landroid/hardware/Sensor;

    invoke-virtual {v1, p0, v2, v3, v0}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;ILandroid/os/Handler;)Z

    .line 109
    :cond_2
    iget-object v1, p0, Lcom/vkontakte/android/media/audio/SensorUtils;->sensorManager:Landroid/hardware/SensorManager;

    iget-object v2, p0, Lcom/vkontakte/android/media/audio/SensorUtils;->proximitySensor:Landroid/hardware/Sensor;

    const/4 v3, 0x3

    invoke-virtual {v1, p0, v2, v3, v0}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;ILandroid/os/Handler;)Z

    .line 110
    return-void
.end method

.method synthetic lambda$stopSensors$1()V
    .locals 2

    .prologue
    .line 130
    iget-object v0, p0, Lcom/vkontakte/android/media/audio/SensorUtils;->linearSensor:Landroid/hardware/Sensor;

    if-eqz v0, :cond_0

    .line 131
    iget-object v0, p0, Lcom/vkontakte/android/media/audio/SensorUtils;->sensorManager:Landroid/hardware/SensorManager;

    iget-object v1, p0, Lcom/vkontakte/android/media/audio/SensorUtils;->linearSensor:Landroid/hardware/Sensor;

    invoke-virtual {v0, p0, v1}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;)V

    .line 133
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/media/audio/SensorUtils;->gravitySensor:Landroid/hardware/Sensor;

    if-eqz v0, :cond_1

    .line 134
    iget-object v0, p0, Lcom/vkontakte/android/media/audio/SensorUtils;->sensorManager:Landroid/hardware/SensorManager;

    iget-object v1, p0, Lcom/vkontakte/android/media/audio/SensorUtils;->gravitySensor:Landroid/hardware/Sensor;

    invoke-virtual {v0, p0, v1}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;)V

    .line 136
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/media/audio/SensorUtils;->accelerometerSensor:Landroid/hardware/Sensor;

    if-eqz v0, :cond_2

    .line 137
    iget-object v0, p0, Lcom/vkontakte/android/media/audio/SensorUtils;->sensorManager:Landroid/hardware/SensorManager;

    iget-object v1, p0, Lcom/vkontakte/android/media/audio/SensorUtils;->accelerometerSensor:Landroid/hardware/Sensor;

    invoke-virtual {v0, p0, v1}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;)V

    .line 139
    :cond_2
    iget-object v0, p0, Lcom/vkontakte/android/media/audio/SensorUtils;->sensorManager:Landroid/hardware/SensorManager;

    iget-object v1, p0, Lcom/vkontakte/android/media/audio/SensorUtils;->proximitySensor:Landroid/hardware/Sensor;

    invoke-virtual {v0, p0, v1}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;)V

    .line 140
    return-void
.end method

.method public onAccuracyChanged(Landroid/hardware/Sensor;I)V
    .locals 0
    .param p1, "sensor"    # Landroid/hardware/Sensor;
    .param p2, "accuracy"    # I

    .prologue
    .line 284
    return-void
.end method

.method public onSensorChanged(Landroid/hardware/SensorEvent;)V
    .locals 22
    .param p1, "event"    # Landroid/hardware/SensorEvent;

    .prologue
    .line 146
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->sensorsStarted:Z

    if-nez v13, :cond_1

    .line 279
    :cond_0
    :goto_0
    return-void

    .line 149
    :cond_1
    move-object/from16 v0, p1

    iget-object v13, v0, Landroid/hardware/SensorEvent;->sensor:Landroid/hardware/Sensor;

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->proximitySensor:Landroid/hardware/Sensor;

    if-ne v13, v14, :cond_a

    .line 150
    const/4 v13, 0x2

    new-array v13, v13, [Ljava/lang/Object;

    const/4 v14, 0x0

    const-string/jumbo v15, "SensorUtils"

    aput-object v15, v13, v14

    const/4 v14, 0x1

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v16, "proximity changed to "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/hardware/SensorEvent;->values:[F

    move-object/from16 v16, v0

    const/16 v17, 0x0

    aget v16, v16, v17

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    aput-object v15, v13, v14

    invoke-static {v13}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 151
    move-object/from16 v0, p0

    iget v13, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->lastProximityValue:F

    const/high16 v14, -0x3d380000    # -100.0f

    cmpl-float v13, v13, v14

    if-nez v13, :cond_9

    .line 152
    move-object/from16 v0, p1

    iget-object v13, v0, Landroid/hardware/SensorEvent;->values:[F

    const/4 v14, 0x0

    aget v13, v13, v14

    move-object/from16 v0, p0

    iput v13, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->lastProximityValue:F

    .line 156
    :cond_2
    :goto_1
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->proximityHasDifferentValues:Z

    if-eqz v13, :cond_3

    .line 157
    move-object/from16 v0, p1

    iget-object v13, v0, Landroid/hardware/SensorEvent;->values:[F

    const/4 v14, 0x0

    aget v13, v13, v14

    move-object/from16 v0, p0

    invoke-direct {v0, v13}, Lcom/vkontakte/android/media/audio/SensorUtils;->isNearToSensor(F)Z

    move-result v13

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->proximityTouched:Z

    .line 182
    :cond_3
    :goto_2
    const/high16 v10, 0x41700000    # 15.0f

    .line 183
    .local v10, "minDist":F
    const/4 v9, 0x6

    .line 184
    .local v9, "minCount":I
    const/16 v5, 0xa

    .line 185
    .local v5, "countLessMax":I
    move-object/from16 v0, p1

    iget-object v13, v0, Landroid/hardware/SensorEvent;->sensor:Landroid/hardware/Sensor;

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->linearSensor:Landroid/hardware/Sensor;

    if-eq v13, v14, :cond_4

    move-object/from16 v0, p1

    iget-object v13, v0, Landroid/hardware/SensorEvent;->sensor:Landroid/hardware/Sensor;

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->gravitySensor:Landroid/hardware/Sensor;

    if-eq v13, v14, :cond_4

    move-object/from16 v0, p1

    iget-object v13, v0, Landroid/hardware/SensorEvent;->sensor:Landroid/hardware/Sensor;

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->accelerometerSensor:Landroid/hardware/Sensor;

    if-ne v13, v14, :cond_6

    .line 186
    :cond_4
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->gravity:[F

    const/4 v14, 0x0

    aget v13, v13, v14

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->linearAcceleration:[F

    const/4 v15, 0x0

    aget v14, v14, v15

    mul-float/2addr v13, v14

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->gravity:[F

    const/4 v15, 0x1

    aget v14, v14, v15

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->linearAcceleration:[F

    const/16 v16, 0x1

    aget v15, v15, v16

    mul-float/2addr v14, v15

    add-float/2addr v13, v14

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->gravity:[F

    const/4 v15, 0x2

    aget v14, v14, v15

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->linearAcceleration:[F

    const/16 v16, 0x2

    aget v15, v15, v16

    mul-float/2addr v14, v15

    add-float v11, v13, v14

    .line 187
    .local v11, "val":F
    move-object/from16 v0, p0

    iget v13, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->raisedToBack:I

    const/4 v14, 0x6

    if-eq v13, v14, :cond_5

    .line 188
    const/4 v13, 0x0

    cmpl-float v13, v11, v13

    if-lez v13, :cond_11

    move-object/from16 v0, p0

    iget v13, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->previousAccValue:F

    const/4 v14, 0x0

    cmpl-float v13, v13, v14

    if-lez v13, :cond_11

    .line 189
    const/high16 v13, 0x41700000    # 15.0f

    cmpl-float v13, v11, v13

    if-lez v13, :cond_e

    move-object/from16 v0, p0

    iget v13, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->raisedToBack:I

    if-nez v13, :cond_e

    .line 190
    move-object/from16 v0, p0

    iget v13, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->raisedToTop:I

    const/4 v14, 0x6

    if-ge v13, v14, :cond_5

    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->proximityTouched:Z

    if-nez v13, :cond_5

    .line 191
    move-object/from16 v0, p0

    iget v13, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->raisedToTop:I

    add-int/lit8 v13, v13, 0x1

    move-object/from16 v0, p0

    iput v13, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->raisedToTop:I

    .line 192
    move-object/from16 v0, p0

    iget v13, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->raisedToTop:I

    const/4 v14, 0x6

    if-ne v13, v14, :cond_5

    .line 193
    const/4 v13, 0x0

    move-object/from16 v0, p0

    iput v13, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->countLess:I

    .line 228
    :cond_5
    :goto_3
    move-object/from16 v0, p0

    iput v11, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->previousAccValue:F

    .line 229
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->gravityFast:[F

    const/4 v14, 0x1

    aget v13, v13, v14

    const/high16 v14, 0x40200000    # 2.5f

    cmpl-float v13, v13, v14

    if-lez v13, :cond_15

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->gravityFast:[F

    const/4 v14, 0x2

    aget v13, v13, v14

    invoke-static {v13}, Ljava/lang/Math;->abs(F)F

    move-result v13

    const/high16 v14, 0x40800000    # 4.0f

    cmpg-float v13, v13, v14

    if-gez v13, :cond_15

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->gravityFast:[F

    const/4 v14, 0x0

    aget v13, v13, v14

    invoke-static {v13}, Ljava/lang/Math;->abs(F)F

    move-result v13

    const/high16 v14, 0x3fc00000    # 1.5f

    cmpl-float v13, v13, v14

    if-lez v13, :cond_15

    const/4 v13, 0x1

    :goto_4
    move-object/from16 v0, p0

    iput-boolean v13, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->accelerometerVertical:Z

    .line 231
    .end local v11    # "val":F
    :cond_6
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->audioManager:Landroid/media/AudioManager;

    invoke-virtual {v13}, Landroid/media/AudioManager;->isWiredHeadsetOn()Z

    move-result v12

    .line 232
    .local v12, "wiredHeadsetOn":Z
    invoke-static {}, Lcom/vkontakte/android/AudioMessagePlayerService;->isPlaying()Z

    move-result v8

    .line 233
    .local v8, "isVoicePlaying":Z
    move-object/from16 v0, p0

    iget v13, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->raisedToBack:I

    const/4 v14, 0x6

    if-ne v13, v14, :cond_17

    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->accelerometerVertical:Z

    if-eqz v13, :cond_17

    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->proximityTouched:Z

    if-eqz v13, :cond_17

    if-nez v12, :cond_17

    .line 234
    const/4 v13, 0x2

    new-array v13, v13, [Ljava/lang/Object;

    const/4 v14, 0x0

    const-string/jumbo v15, "SensorUtils"

    aput-object v15, v13, v14

    const/4 v14, 0x1

    const-string/jumbo v15, "sensor values reached"

    aput-object v15, v13, v14

    invoke-static {v13}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 235
    invoke-static {}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->getInstance()Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    move-result-object v13

    invoke-virtual {v13}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->isRecording()Z

    move-result v7

    .line 236
    .local v7, "isRecording":Z
    invoke-static {}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->getInstance()Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    move-result-object v13

    invoke-virtual {v13}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->isHasRecord()Z

    move-result v6

    .line 237
    .local v6, "hasRecord":Z
    if-nez v8, :cond_16

    if-nez v7, :cond_16

    if-nez v6, :cond_16

    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->inputFieldHasText:Z

    if-nez v13, :cond_16

    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->allowStartRecord:Z

    if-eqz v13, :cond_16

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->raiseChat:Landroid/app/Activity;

    if-eqz v13, :cond_16

    .line 239
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->raiseToEarRecord:Z

    if-nez v13, :cond_7

    .line 243
    const/4 v13, 0x2

    new-array v13, v13, [Ljava/lang/Object;

    const/4 v14, 0x0

    const-string/jumbo v15, "SensorUtils"

    aput-object v15, v13, v14

    const/4 v14, 0x1

    const-string/jumbo v15, "start record"

    aput-object v15, v13, v14

    invoke-static {v13}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 244
    const/4 v13, 0x1

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->raiseToEarRecord:Z

    .line 245
    const/4 v13, 0x0

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->useFrontSpeaker:Z

    .line 246
    invoke-static {}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->getInstance()Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    move-result-object v13

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->sessionId:Ljava/lang/String;

    const/4 v15, 0x1

    invoke-virtual {v13, v14, v15}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->startRecording(Ljava/lang/String;Z)V

    .line 248
    const/4 v13, 0x1

    move-object/from16 v0, p0

    invoke-direct {v0, v13}, Lcom/vkontakte/android/media/audio/SensorUtils;->screenLocker(Z)V

    .line 254
    :cond_7
    :goto_5
    const/4 v13, 0x0

    move-object/from16 v0, p0

    iput v13, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->raisedToBack:I

    .line 255
    const/4 v13, 0x0

    move-object/from16 v0, p0

    iput v13, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->raisedToTop:I

    .line 256
    const/4 v13, 0x0

    move-object/from16 v0, p0

    iput v13, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->countLess:I

    .line 273
    .end local v6    # "hasRecord":Z
    .end local v7    # "isRecording":Z
    :cond_8
    :goto_6
    move-object/from16 v0, p0

    iget-wide v14, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->timeSinceRaise:J

    const-wide/16 v16, 0x0

    cmp-long v13, v14, v16

    if-eqz v13, :cond_0

    move-object/from16 v0, p0

    iget v13, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->raisedToBack:I

    const/4 v14, 0x6

    if-ne v13, v14, :cond_0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v14

    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->timeSinceRaise:J

    move-wide/from16 v16, v0

    sub-long v14, v14, v16

    invoke-static {v14, v15}, Ljava/lang/Math;->abs(J)J

    move-result-wide v14

    const-wide/16 v16, 0x3e8

    cmp-long v13, v14, v16

    if-lez v13, :cond_0

    .line 274
    const/4 v13, 0x0

    move-object/from16 v0, p0

    iput v13, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->raisedToBack:I

    .line 275
    const/4 v13, 0x0

    move-object/from16 v0, p0

    iput v13, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->raisedToTop:I

    .line 276
    const/4 v13, 0x0

    move-object/from16 v0, p0

    iput v13, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->countLess:I

    .line 277
    const-wide/16 v14, 0x0

    move-object/from16 v0, p0

    iput-wide v14, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->timeSinceRaise:J

    goto/16 :goto_0

    .line 153
    .end local v5    # "countLessMax":I
    .end local v8    # "isVoicePlaying":Z
    .end local v9    # "minCount":I
    .end local v10    # "minDist":F
    .end local v12    # "wiredHeadsetOn":Z
    :cond_9
    move-object/from16 v0, p0

    iget v13, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->lastProximityValue:F

    move-object/from16 v0, p1

    iget-object v14, v0, Landroid/hardware/SensorEvent;->values:[F

    const/4 v15, 0x0

    aget v14, v14, v15

    cmpl-float v13, v13, v14

    if-eqz v13, :cond_2

    .line 154
    const/4 v13, 0x1

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->proximityHasDifferentValues:Z

    goto/16 :goto_1

    .line 159
    :cond_a
    move-object/from16 v0, p1

    iget-object v13, v0, Landroid/hardware/SensorEvent;->sensor:Landroid/hardware/Sensor;

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->accelerometerSensor:Landroid/hardware/Sensor;

    if-ne v13, v14, :cond_c

    .line 160
    move-object/from16 v0, p0

    iget-wide v14, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->lastTimestamp:J

    const-wide/16 v16, 0x0

    cmp-long v13, v14, v16

    if-nez v13, :cond_b

    const-wide v2, 0x3fef5c2900000000L    # 0.9800000190734863

    .line 161
    .local v2, "alpha":D
    :goto_7
    const v4, 0x3f4ccccd    # 0.8f

    .line 162
    .local v4, "alphaFast":F
    move-object/from16 v0, p1

    iget-wide v14, v0, Landroid/hardware/SensorEvent;->timestamp:J

    move-object/from16 v0, p0

    iput-wide v14, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->lastTimestamp:J

    .line 163
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->gravity:[F

    const/4 v14, 0x0

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->gravity:[F

    const/16 v16, 0x0

    aget v15, v15, v16

    float-to-double v0, v15

    move-wide/from16 v16, v0

    mul-double v16, v16, v2

    const-wide/high16 v18, 0x3ff0000000000000L    # 1.0

    sub-double v18, v18, v2

    move-object/from16 v0, p1

    iget-object v15, v0, Landroid/hardware/SensorEvent;->values:[F

    const/16 v20, 0x0

    aget v15, v15, v20

    float-to-double v0, v15

    move-wide/from16 v20, v0

    mul-double v18, v18, v20

    add-double v16, v16, v18

    move-wide/from16 v0, v16

    double-to-float v15, v0

    aput v15, v13, v14

    .line 164
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->gravity:[F

    const/4 v14, 0x1

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->gravity:[F

    const/16 v16, 0x1

    aget v15, v15, v16

    float-to-double v0, v15

    move-wide/from16 v16, v0

    mul-double v16, v16, v2

    const-wide/high16 v18, 0x3ff0000000000000L    # 1.0

    sub-double v18, v18, v2

    move-object/from16 v0, p1

    iget-object v15, v0, Landroid/hardware/SensorEvent;->values:[F

    const/16 v20, 0x1

    aget v15, v15, v20

    float-to-double v0, v15

    move-wide/from16 v20, v0

    mul-double v18, v18, v20

    add-double v16, v16, v18

    move-wide/from16 v0, v16

    double-to-float v15, v0

    aput v15, v13, v14

    .line 165
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->gravity:[F

    const/4 v14, 0x2

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->gravity:[F

    const/16 v16, 0x2

    aget v15, v15, v16

    float-to-double v0, v15

    move-wide/from16 v16, v0

    mul-double v16, v16, v2

    const-wide/high16 v18, 0x3ff0000000000000L    # 1.0

    sub-double v18, v18, v2

    move-object/from16 v0, p1

    iget-object v15, v0, Landroid/hardware/SensorEvent;->values:[F

    const/16 v20, 0x2

    aget v15, v15, v20

    float-to-double v0, v15

    move-wide/from16 v20, v0

    mul-double v18, v18, v20

    add-double v16, v16, v18

    move-wide/from16 v0, v16

    double-to-float v15, v0

    aput v15, v13, v14

    .line 166
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->gravityFast:[F

    const/4 v14, 0x0

    const v15, 0x3f4ccccd    # 0.8f

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->gravity:[F

    move-object/from16 v16, v0

    const/16 v17, 0x0

    aget v16, v16, v17

    mul-float v15, v15, v16

    const v16, 0x3e4ccccc    # 0.19999999f

    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/hardware/SensorEvent;->values:[F

    move-object/from16 v17, v0

    const/16 v18, 0x0

    aget v17, v17, v18

    mul-float v16, v16, v17

    add-float v15, v15, v16

    aput v15, v13, v14

    .line 167
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->gravityFast:[F

    const/4 v14, 0x1

    const v15, 0x3f4ccccd    # 0.8f

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->gravity:[F

    move-object/from16 v16, v0

    const/16 v17, 0x1

    aget v16, v16, v17

    mul-float v15, v15, v16

    const v16, 0x3e4ccccc    # 0.19999999f

    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/hardware/SensorEvent;->values:[F

    move-object/from16 v17, v0

    const/16 v18, 0x1

    aget v17, v17, v18

    mul-float v16, v16, v17

    add-float v15, v15, v16

    aput v15, v13, v14

    .line 168
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->gravityFast:[F

    const/4 v14, 0x2

    const v15, 0x3f4ccccd    # 0.8f

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->gravity:[F

    move-object/from16 v16, v0

    const/16 v17, 0x2

    aget v16, v16, v17

    mul-float v15, v15, v16

    const v16, 0x3e4ccccc    # 0.19999999f

    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/hardware/SensorEvent;->values:[F

    move-object/from16 v17, v0

    const/16 v18, 0x2

    aget v17, v17, v18

    mul-float v16, v16, v17

    add-float v15, v15, v16

    aput v15, v13, v14

    .line 170
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->linearAcceleration:[F

    const/4 v14, 0x0

    move-object/from16 v0, p1

    iget-object v15, v0, Landroid/hardware/SensorEvent;->values:[F

    const/16 v16, 0x0

    aget v15, v15, v16

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->gravity:[F

    move-object/from16 v16, v0

    const/16 v17, 0x0

    aget v16, v16, v17

    sub-float v15, v15, v16

    aput v15, v13, v14

    .line 171
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->linearAcceleration:[F

    const/4 v14, 0x1

    move-object/from16 v0, p1

    iget-object v15, v0, Landroid/hardware/SensorEvent;->values:[F

    const/16 v16, 0x1

    aget v15, v15, v16

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->gravity:[F

    move-object/from16 v16, v0

    const/16 v17, 0x1

    aget v16, v16, v17

    sub-float v15, v15, v16

    aput v15, v13, v14

    .line 172
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->linearAcceleration:[F

    const/4 v14, 0x2

    move-object/from16 v0, p1

    iget-object v15, v0, Landroid/hardware/SensorEvent;->values:[F

    const/16 v16, 0x2

    aget v15, v15, v16

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->gravity:[F

    move-object/from16 v16, v0

    const/16 v17, 0x2

    aget v16, v16, v17

    sub-float v15, v15, v16

    aput v15, v13, v14

    goto/16 :goto_2

    .line 160
    .end local v2    # "alpha":D
    .end local v4    # "alphaFast":F
    :cond_b
    const-wide/high16 v14, 0x3ff0000000000000L    # 1.0

    const-wide/high16 v16, 0x3ff0000000000000L    # 1.0

    move-object/from16 v0, p1

    iget-wide v0, v0, Landroid/hardware/SensorEvent;->timestamp:J

    move-wide/from16 v18, v0

    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->lastTimestamp:J

    move-wide/from16 v20, v0

    sub-long v18, v18, v20

    move-wide/from16 v0, v18

    long-to-double v0, v0

    move-wide/from16 v18, v0

    const-wide v20, 0x41cdcd6500000000L    # 1.0E9

    div-double v18, v18, v20

    add-double v16, v16, v18

    div-double v2, v14, v16

    goto/16 :goto_7

    .line 173
    :cond_c
    move-object/from16 v0, p1

    iget-object v13, v0, Landroid/hardware/SensorEvent;->sensor:Landroid/hardware/Sensor;

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->linearSensor:Landroid/hardware/Sensor;

    if-ne v13, v14, :cond_d

    .line 174
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->linearAcceleration:[F

    const/4 v14, 0x0

    move-object/from16 v0, p1

    iget-object v15, v0, Landroid/hardware/SensorEvent;->values:[F

    const/16 v16, 0x0

    aget v15, v15, v16

    aput v15, v13, v14

    .line 175
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->linearAcceleration:[F

    const/4 v14, 0x1

    move-object/from16 v0, p1

    iget-object v15, v0, Landroid/hardware/SensorEvent;->values:[F

    const/16 v16, 0x1

    aget v15, v15, v16

    aput v15, v13, v14

    .line 176
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->linearAcceleration:[F

    const/4 v14, 0x2

    move-object/from16 v0, p1

    iget-object v15, v0, Landroid/hardware/SensorEvent;->values:[F

    const/16 v16, 0x2

    aget v15, v15, v16

    aput v15, v13, v14

    goto/16 :goto_2

    .line 177
    :cond_d
    move-object/from16 v0, p1

    iget-object v13, v0, Landroid/hardware/SensorEvent;->sensor:Landroid/hardware/Sensor;

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->gravitySensor:Landroid/hardware/Sensor;

    if-ne v13, v14, :cond_3

    .line 178
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->gravityFast:[F

    const/4 v14, 0x0

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->gravity:[F

    const/16 v16, 0x0

    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/hardware/SensorEvent;->values:[F

    move-object/from16 v17, v0

    const/16 v18, 0x0

    aget v17, v17, v18

    aput v17, v15, v16

    aput v17, v13, v14

    .line 179
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->gravityFast:[F

    const/4 v14, 0x1

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->gravity:[F

    const/16 v16, 0x1

    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/hardware/SensorEvent;->values:[F

    move-object/from16 v17, v0

    const/16 v18, 0x1

    aget v17, v17, v18

    aput v17, v15, v16

    aput v17, v13, v14

    .line 180
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->gravityFast:[F

    const/4 v14, 0x2

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->gravity:[F

    const/16 v16, 0x2

    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/hardware/SensorEvent;->values:[F

    move-object/from16 v17, v0

    const/16 v18, 0x2

    aget v17, v17, v18

    aput v17, v15, v16

    aput v17, v13, v14

    goto/16 :goto_2

    .line 197
    .restart local v5    # "countLessMax":I
    .restart local v9    # "minCount":I
    .restart local v10    # "minDist":F
    .restart local v11    # "val":F
    :cond_e
    const/high16 v13, 0x41700000    # 15.0f

    cmpg-float v13, v11, v13

    if-gez v13, :cond_f

    .line 198
    move-object/from16 v0, p0

    iget v13, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->countLess:I

    add-int/lit8 v13, v13, 0x1

    move-object/from16 v0, p0

    iput v13, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->countLess:I

    .line 200
    :cond_f
    move-object/from16 v0, p0

    iget v13, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->countLess:I

    const/16 v14, 0xa

    if-eq v13, v14, :cond_10

    move-object/from16 v0, p0

    iget v13, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->raisedToTop:I

    const/4 v14, 0x6

    if-ne v13, v14, :cond_10

    move-object/from16 v0, p0

    iget v13, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->raisedToBack:I

    if-eqz v13, :cond_5

    .line 201
    :cond_10
    const/4 v13, 0x0

    move-object/from16 v0, p0

    iput v13, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->raisedToBack:I

    .line 202
    const/4 v13, 0x0

    move-object/from16 v0, p0

    iput v13, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->raisedToTop:I

    .line 203
    const/4 v13, 0x0

    move-object/from16 v0, p0

    iput v13, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->countLess:I

    goto/16 :goto_3

    .line 206
    :cond_11
    const/4 v13, 0x0

    cmpg-float v13, v11, v13

    if-gez v13, :cond_5

    move-object/from16 v0, p0

    iget v13, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->previousAccValue:F

    const/4 v14, 0x0

    cmpg-float v13, v13, v14

    if-gez v13, :cond_5

    .line 207
    move-object/from16 v0, p0

    iget v13, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->raisedToTop:I

    const/4 v14, 0x6

    if-ne v13, v14, :cond_12

    const/high16 v13, -0x3e900000    # -15.0f

    cmpg-float v13, v11, v13

    if-gez v13, :cond_12

    .line 208
    move-object/from16 v0, p0

    iget v13, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->raisedToBack:I

    const/4 v14, 0x6

    if-ge v13, v14, :cond_5

    .line 209
    move-object/from16 v0, p0

    iget v13, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->raisedToBack:I

    add-int/lit8 v13, v13, 0x1

    move-object/from16 v0, p0

    iput v13, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->raisedToBack:I

    .line 210
    move-object/from16 v0, p0

    iget v13, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->raisedToBack:I

    const/4 v14, 0x6

    if-ne v13, v14, :cond_5

    .line 211
    const/4 v13, 0x0

    move-object/from16 v0, p0

    iput v13, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->raisedToTop:I

    .line 212
    const/4 v13, 0x0

    move-object/from16 v0, p0

    iput v13, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->countLess:I

    .line 213
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v14

    move-object/from16 v0, p0

    iput-wide v14, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->timeSinceRaise:J

    goto/16 :goto_3

    .line 217
    :cond_12
    const/high16 v13, -0x3e900000    # -15.0f

    cmpl-float v13, v11, v13

    if-lez v13, :cond_13

    .line 218
    move-object/from16 v0, p0

    iget v13, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->countLess:I

    add-int/lit8 v13, v13, 0x1

    move-object/from16 v0, p0

    iput v13, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->countLess:I

    .line 220
    :cond_13
    move-object/from16 v0, p0

    iget v13, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->countLess:I

    const/16 v14, 0xa

    if-eq v13, v14, :cond_14

    move-object/from16 v0, p0

    iget v13, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->raisedToTop:I

    const/4 v14, 0x6

    if-ne v13, v14, :cond_14

    move-object/from16 v0, p0

    iget v13, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->raisedToBack:I

    if-eqz v13, :cond_5

    .line 221
    :cond_14
    const/4 v13, 0x0

    move-object/from16 v0, p0

    iput v13, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->raisedToTop:I

    .line 222
    const/4 v13, 0x0

    move-object/from16 v0, p0

    iput v13, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->raisedToBack:I

    .line 223
    const/4 v13, 0x0

    move-object/from16 v0, p0

    iput v13, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->countLess:I

    goto/16 :goto_3

    .line 229
    :cond_15
    const/4 v13, 0x0

    goto/16 :goto_4

    .line 250
    .end local v11    # "val":F
    .restart local v6    # "hasRecord":Z
    .restart local v7    # "isRecording":Z
    .restart local v8    # "isVoicePlaying":Z
    .restart local v12    # "wiredHeadsetOn":Z
    :cond_16
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->useFrontSpeaker:Z

    if-nez v13, :cond_7

    if-eqz v8, :cond_7

    .line 251
    const/4 v13, 0x2

    new-array v13, v13, [Ljava/lang/Object;

    const/4 v14, 0x0

    const-string/jumbo v15, "SensorUtils"

    aput-object v15, v13, v14

    const/4 v14, 0x1

    const-string/jumbo v15, "start listen"

    aput-object v15, v13, v14

    invoke-static {v13}, Lcom/vkontakte/android/utils/L;->e([Ljava/lang/Object;)V

    .line 252
    const/4 v13, 0x1

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->useFrontSpeaker:Z

    move-object/from16 v0, p0

    invoke-direct {v0, v13}, Lcom/vkontakte/android/media/audio/SensorUtils;->changeAudioStreamType(Z)V

    goto/16 :goto_5

    .line 257
    .end local v6    # "hasRecord":Z
    .end local v7    # "isRecording":Z
    :cond_17
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->proximityTouched:Z

    if-eqz v13, :cond_18

    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->useFrontSpeaker:Z

    if-nez v13, :cond_18

    if-eqz v8, :cond_18

    if-nez v12, :cond_18

    .line 258
    const/4 v13, 0x2

    new-array v13, v13, [Ljava/lang/Object;

    const/4 v14, 0x0

    const-string/jumbo v15, "SensorUtils"

    aput-object v15, v13, v14

    const/4 v14, 0x1

    const-string/jumbo v15, "start listen by proximity only"

    aput-object v15, v13, v14

    invoke-static {v13}, Lcom/vkontakte/android/utils/L;->e([Ljava/lang/Object;)V

    .line 259
    const/4 v13, 0x1

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->useFrontSpeaker:Z

    move-object/from16 v0, p0

    invoke-direct {v0, v13}, Lcom/vkontakte/android/media/audio/SensorUtils;->changeAudioStreamType(Z)V

    goto/16 :goto_6

    .line 260
    :cond_18
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->proximityTouched:Z

    if-nez v13, :cond_8

    .line 261
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->raiseToEarRecord:Z

    if-eqz v13, :cond_19

    .line 262
    const/4 v13, 0x2

    new-array v13, v13, [Ljava/lang/Object;

    const/4 v14, 0x0

    const-string/jumbo v15, "SensorUtils"

    aput-object v15, v13, v14

    const/4 v14, 0x1

    const-string/jumbo v15, "stop record"

    aput-object v15, v13, v14

    invoke-static {v13}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 263
    invoke-static {}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->getInstance()Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    move-result-object v13

    invoke-virtual {v13}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->stopAndShowWaveform()V

    .line 264
    const/4 v13, 0x0

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->raiseToEarRecord:Z

    .line 265
    const/4 v13, 0x0

    move-object/from16 v0, p0

    invoke-direct {v0, v13}, Lcom/vkontakte/android/media/audio/SensorUtils;->screenLocker(Z)V

    goto/16 :goto_6

    .line 266
    :cond_19
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->useFrontSpeaker:Z

    if-eqz v13, :cond_8

    .line 267
    const/4 v13, 0x2

    new-array v13, v13, [Ljava/lang/Object;

    const/4 v14, 0x0

    const-string/jumbo v15, "SensorUtils"

    aput-object v15, v13, v14

    const/4 v14, 0x1

    const-string/jumbo v15, "stop listen"

    aput-object v15, v13, v14

    invoke-static {v13}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 268
    const/4 v13, 0x0

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->useFrontSpeaker:Z

    .line 269
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/vkontakte/android/media/audio/SensorUtils;->useFrontSpeaker:Z

    move-object/from16 v0, p0

    invoke-direct {v0, v13}, Lcom/vkontakte/android/media/audio/SensorUtils;->changeAudioStreamType(Z)V

    .line 270
    const/4 v13, 0x0

    move-object/from16 v0, p0

    invoke-direct {v0, v13}, Lcom/vkontakte/android/media/audio/SensorUtils;->screenLocker(Z)V

    goto/16 :goto_6
.end method

.method setAllowStartRecord(Z)V
    .locals 0
    .param p1, "value"    # Z

    .prologue
    .line 78
    iput-boolean p1, p0, Lcom/vkontakte/android/media/audio/SensorUtils;->allowStartRecord:Z

    .line 79
    return-void
.end method

.method setInputFieldHasText(Z)V
    .locals 0
    .param p1, "value"    # Z

    .prologue
    .line 74
    iput-boolean p1, p0, Lcom/vkontakte/android/media/audio/SensorUtils;->inputFieldHasText:Z

    .line 75
    return-void
.end method

.method public startRecordingIfFromSpeaker()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 287
    iget-boolean v0, p0, Lcom/vkontakte/android/media/audio/SensorUtils;->useFrontSpeaker:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/media/audio/SensorUtils;->raiseChat:Landroid/app/Activity;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/vkontakte/android/media/audio/SensorUtils;->allowStartRecord:Z

    if-nez v0, :cond_1

    .line 292
    :cond_0
    :goto_0
    return-void

    .line 290
    :cond_1
    iput-boolean v2, p0, Lcom/vkontakte/android/media/audio/SensorUtils;->raiseToEarRecord:Z

    .line 291
    invoke-static {}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->getInstance()Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/media/audio/SensorUtils;->sessionId:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->startRecording(Ljava/lang/String;Z)V

    goto :goto_0
.end method

.method startSensors(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 7
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "sessionId"    # Ljava/lang/String;

    .prologue
    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    const/4 v3, 0x0

    .line 82
    if-eqz p1, :cond_1

    iget-object v0, p0, Lcom/vkontakte/android/media/audio/SensorUtils;->accelerometerSensor:Landroid/hardware/Sensor;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/media/audio/SensorUtils;->gravitySensor:Landroid/hardware/Sensor;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/vkontakte/android/media/audio/SensorUtils;->linearAcceleration:[F

    if-eqz v0, :cond_1

    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/media/audio/SensorUtils;->proximitySensor:Landroid/hardware/Sensor;

    if-nez v0, :cond_2

    .line 113
    :cond_1
    :goto_0
    return-void

    .line 86
    :cond_2
    iput-object p1, p0, Lcom/vkontakte/android/media/audio/SensorUtils;->raiseChat:Landroid/app/Activity;

    .line 87
    iput-object p2, p0, Lcom/vkontakte/android/media/audio/SensorUtils;->sessionId:Ljava/lang/String;

    .line 89
    iget-boolean v0, p0, Lcom/vkontakte/android/media/audio/SensorUtils;->sensorsStarted:Z

    if-nez v0, :cond_1

    .line 90
    iget-object v0, p0, Lcom/vkontakte/android/media/audio/SensorUtils;->gravity:[F

    iget-object v1, p0, Lcom/vkontakte/android/media/audio/SensorUtils;->gravity:[F

    iget-object v2, p0, Lcom/vkontakte/android/media/audio/SensorUtils;->gravity:[F

    aput v4, v2, v6

    aput v4, v1, v5

    aput v4, v0, v3

    .line 91
    iget-object v0, p0, Lcom/vkontakte/android/media/audio/SensorUtils;->linearAcceleration:[F

    iget-object v1, p0, Lcom/vkontakte/android/media/audio/SensorUtils;->linearAcceleration:[F

    iget-object v2, p0, Lcom/vkontakte/android/media/audio/SensorUtils;->linearAcceleration:[F

    aput v4, v2, v6

    aput v4, v1, v5

    aput v4, v0, v3

    .line 92
    iget-object v0, p0, Lcom/vkontakte/android/media/audio/SensorUtils;->gravityFast:[F

    iget-object v1, p0, Lcom/vkontakte/android/media/audio/SensorUtils;->gravityFast:[F

    iget-object v2, p0, Lcom/vkontakte/android/media/audio/SensorUtils;->gravityFast:[F

    aput v4, v2, v6

    aput v4, v1, v5

    aput v4, v0, v3

    .line 93
    iput v4, p0, Lcom/vkontakte/android/media/audio/SensorUtils;->previousAccValue:F

    .line 94
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/vkontakte/android/media/audio/SensorUtils;->lastTimestamp:J

    .line 95
    iput v3, p0, Lcom/vkontakte/android/media/audio/SensorUtils;->raisedToBack:I

    .line 96
    iput v3, p0, Lcom/vkontakte/android/media/audio/SensorUtils;->raisedToTop:I

    .line 97
    iput v3, p0, Lcom/vkontakte/android/media/audio/SensorUtils;->countLess:I

    .line 98
    iget-object v0, p0, Lcom/vkontakte/android/media/audio/SensorUtils;->queue:Lcom/vkontakte/android/utils/DispatchQueue;

    invoke-static {p0}, Lcom/vkontakte/android/media/audio/SensorUtils$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/media/audio/SensorUtils;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/utils/DispatchQueue;->postRunnable(Ljava/lang/Runnable;)V

    .line 111
    iput-boolean v5, p0, Lcom/vkontakte/android/media/audio/SensorUtils;->sensorsStarted:Z

    goto :goto_0
.end method

.method stopSensors(Landroid/app/Activity;)V
    .locals 3
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 116
    iget-boolean v0, p0, Lcom/vkontakte/android/media/audio/SensorUtils;->sensorsStarted:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/vkontakte/android/media/audio/SensorUtils;->accelerometerSensor:Landroid/hardware/Sensor;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/media/audio/SensorUtils;->gravitySensor:Landroid/hardware/Sensor;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/vkontakte/android/media/audio/SensorUtils;->linearAcceleration:[F

    if-eqz v0, :cond_1

    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/media/audio/SensorUtils;->proximitySensor:Landroid/hardware/Sensor;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/vkontakte/android/media/audio/SensorUtils;->raiseChat:Landroid/app/Activity;

    if-eq v0, p1, :cond_2

    .line 142
    :cond_1
    :goto_0
    return-void

    .line 121
    :cond_2
    iput-object v1, p0, Lcom/vkontakte/android/media/audio/SensorUtils;->raiseChat:Landroid/app/Activity;

    .line 122
    iput-object v1, p0, Lcom/vkontakte/android/media/audio/SensorUtils;->sessionId:Ljava/lang/String;

    .line 123
    invoke-static {}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->getInstance()Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->stopRecording()V

    .line 124
    iput-boolean v2, p0, Lcom/vkontakte/android/media/audio/SensorUtils;->accelerometerVertical:Z

    .line 125
    iput-boolean v2, p0, Lcom/vkontakte/android/media/audio/SensorUtils;->proximityTouched:Z

    .line 126
    iput-boolean v2, p0, Lcom/vkontakte/android/media/audio/SensorUtils;->raiseToEarRecord:Z

    .line 127
    iput-boolean v2, p0, Lcom/vkontakte/android/media/audio/SensorUtils;->useFrontSpeaker:Z

    .line 128
    iput-boolean v2, p0, Lcom/vkontakte/android/media/audio/SensorUtils;->sensorsStarted:Z

    .line 129
    iget-object v0, p0, Lcom/vkontakte/android/media/audio/SensorUtils;->queue:Lcom/vkontakte/android/utils/DispatchQueue;

    invoke-static {p0}, Lcom/vkontakte/android/media/audio/SensorUtils$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/media/audio/SensorUtils;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/utils/DispatchQueue;->postRunnable(Ljava/lang/Runnable;)V

    .line 141
    invoke-direct {p0, v2}, Lcom/vkontakte/android/media/audio/SensorUtils;->screenLocker(Z)V

    goto :goto_0
.end method
