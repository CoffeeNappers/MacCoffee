.class Lcom/vk/media/camera/CameraEffects$Stat;
.super Ljava/lang/Object;
.source "CameraEffects.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/media/camera/CameraEffects;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "Stat"
.end annotation


# static fields
.field private static final LOW_FPS:I = 0xe

.field private static final LOW_FPS_EVENTS:I = 0x2

.field private static final READY_TIME_MS:J = 0xfa0L


# instance fields
.field private mAverageFps:I

.field private mEventCollect:Z

.field private mEvents:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mHeight:I

.field private mOrientation:I

.field private mPull:I

.field private mPush:I

.field private mStartTime:J

.field private mTime:J

.field private mWidth:I

.field final synthetic this$0:Lcom/vk/media/camera/CameraEffects;


# direct methods
.method private constructor <init>(Lcom/vk/media/camera/CameraEffects;)V
    .locals 4

    .prologue
    const-wide/16 v2, 0x0

    const/4 v1, 0x0

    .line 233
    iput-object p1, p0, Lcom/vk/media/camera/CameraEffects$Stat;->this$0:Lcom/vk/media/camera/CameraEffects;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 237
    iput-wide v2, p0, Lcom/vk/media/camera/CameraEffects$Stat;->mTime:J

    .line 238
    iput v1, p0, Lcom/vk/media/camera/CameraEffects$Stat;->mPull:I

    .line 239
    iput v1, p0, Lcom/vk/media/camera/CameraEffects$Stat;->mPush:I

    .line 240
    iput v1, p0, Lcom/vk/media/camera/CameraEffects$Stat;->mWidth:I

    .line 241
    iput v1, p0, Lcom/vk/media/camera/CameraEffects$Stat;->mHeight:I

    .line 242
    iput v1, p0, Lcom/vk/media/camera/CameraEffects$Stat;->mOrientation:I

    .line 243
    iput-wide v2, p0, Lcom/vk/media/camera/CameraEffects$Stat;->mStartTime:J

    .line 245
    iput-boolean v1, p0, Lcom/vk/media/camera/CameraEffects$Stat;->mEventCollect:Z

    .line 247
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vk/media/camera/CameraEffects$Stat;->mEvents:Ljava/util/ArrayList;

    .line 248
    iput v1, p0, Lcom/vk/media/camera/CameraEffects$Stat;->mAverageFps:I

    return-void
.end method

.method synthetic constructor <init>(Lcom/vk/media/camera/CameraEffects;Lcom/vk/media/camera/CameraEffects$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vk/media/camera/CameraEffects;
    .param p2, "x1"    # Lcom/vk/media/camera/CameraEffects$1;

    .prologue
    .line 233
    invoke-direct {p0, p1}, Lcom/vk/media/camera/CameraEffects$Stat;-><init>(Lcom/vk/media/camera/CameraEffects;)V

    return-void
.end method

.method private check()V
    .locals 10

    .prologue
    .line 274
    iget-object v6, p0, Lcom/vk/media/camera/CameraEffects$Stat;->this$0:Lcom/vk/media/camera/CameraEffects;

    invoke-static {v6}, Lcom/vk/media/camera/CameraEffects;->access$100(Lcom/vk/media/camera/CameraEffects;)Z

    move-result v6

    if-nez v6, :cond_1

    .line 310
    :cond_0
    :goto_0
    return-void

    .line 278
    :cond_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 279
    .local v4, "now":J
    iget-wide v6, p0, Lcom/vk/media/camera/CameraEffects$Stat;->mTime:J

    sub-long v6, v4, v6

    const-wide/16 v8, 0x3e8

    cmp-long v6, v6, v8

    if-ltz v6, :cond_0

    .line 280
    invoke-static {}, Lcom/vk/medianative/MediaNative;->nativeProcessorGetFPS()I

    move-result v3

    .line 281
    .local v3, "fps":I
    shr-int/lit8 v6, v3, 0x10

    iput v6, p0, Lcom/vk/media/camera/CameraEffects$Stat;->mPush:I

    .line 282
    int-to-short v6, v3

    iput v6, p0, Lcom/vk/media/camera/CameraEffects$Stat;->mPull:I

    .line 283
    iput-wide v4, p0, Lcom/vk/media/camera/CameraEffects$Stat;->mTime:J

    .line 285
    iget-wide v6, p0, Lcom/vk/media/camera/CameraEffects$Stat;->mStartTime:J

    const-wide/16 v8, 0x0

    cmp-long v6, v6, v8

    if-nez v6, :cond_2

    .line 286
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    iput-wide v6, p0, Lcom/vk/media/camera/CameraEffects$Stat;->mStartTime:J

    .line 289
    :cond_2
    iget v6, p0, Lcom/vk/media/camera/CameraEffects$Stat;->mPull:I

    const/4 v7, 0x3

    if-le v6, v7, :cond_0

    iget-boolean v6, p0, Lcom/vk/media/camera/CameraEffects$Stat;->mEventCollect:Z

    if-nez v6, :cond_0

    iget-wide v6, p0, Lcom/vk/media/camera/CameraEffects$Stat;->mStartTime:J

    sub-long v6, v4, v6

    const-wide/16 v8, 0xfa0

    cmp-long v6, v6, v8

    if-lez v6, :cond_0

    .line 290
    invoke-virtual {p0}, Lcom/vk/media/camera/CameraEffects$Stat;->toString()Ljava/lang/String;

    move-result-object v2

    .line 291
    .local v2, "event":Ljava/lang/String;
    iget v6, p0, Lcom/vk/media/camera/CameraEffects$Stat;->mAverageFps:I

    iget v7, p0, Lcom/vk/media/camera/CameraEffects$Stat;->mPull:I

    add-int/2addr v6, v7

    iput v6, p0, Lcom/vk/media/camera/CameraEffects$Stat;->mAverageFps:I

    .line 292
    iget-object v6, p0, Lcom/vk/media/camera/CameraEffects$Stat;->mEvents:Ljava/util/ArrayList;

    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 294
    iget v6, p0, Lcom/vk/media/camera/CameraEffects$Stat;->mAverageFps:I

    iget-object v7, p0, Lcom/vk/media/camera/CameraEffects$Stat;->mEvents:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v7

    div-int v0, v6, v7

    .line 295
    .local v0, "averageFps":I
    invoke-static {}, Lcom/vk/media/camera/CameraEffects;->access$300()Ljava/lang/String;

    move-result-object v6

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "stat: avg: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, " events: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/vk/media/camera/CameraEffects$Stat;->mEvents:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, " "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 296
    const/16 v6, 0xe

    if-ge v0, v6, :cond_3

    iget-object v6, p0, Lcom/vk/media/camera/CameraEffects$Stat;->mEvents:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    const/4 v7, 0x2

    if-le v6, v7, :cond_3

    iget-object v6, p0, Lcom/vk/media/camera/CameraEffects$Stat;->this$0:Lcom/vk/media/camera/CameraEffects;

    iget-object v6, v6, Lcom/vk/media/camera/CameraEffects;->mSettings:Lcom/vk/media/camera/CameraUtils$Settings;

    if-eqz v6, :cond_3

    .line 297
    iget-object v6, p0, Lcom/vk/media/camera/CameraEffects$Stat;->this$0:Lcom/vk/media/camera/CameraEffects;

    iget-object v6, v6, Lcom/vk/media/camera/CameraEffects;->mSettings:Lcom/vk/media/camera/CameraUtils$Settings;

    invoke-virtual {v6}, Lcom/vk/media/camera/CameraUtils$Settings;->setUseLowResolution()V

    .line 300
    :cond_3
    new-instance v1, Lcom/vk/analytics/AnalyticsEvent$MediaCameraEvent;

    invoke-direct {v1}, Lcom/vk/analytics/AnalyticsEvent$MediaCameraEvent;-><init>()V

    .line 301
    .local v1, "e":Lcom/vk/analytics/AnalyticsEvent$MediaCameraEvent;
    invoke-virtual {v1}, Lcom/vk/analytics/AnalyticsEvent$MediaCameraEvent;->isReady()Z

    move-result v6

    if-eqz v6, :cond_4

    .line 302
    iget-object v6, p0, Lcom/vk/media/camera/CameraEffects$Stat;->mEvents:Ljava/util/ArrayList;

    invoke-virtual {v1, v0, v6}, Lcom/vk/analytics/AnalyticsEvent$MediaCameraEvent;->fill(ILjava/util/ArrayList;)V

    .line 303
    invoke-static {v1}, Lcom/vk/analytics/Analytics;->logOnce(Lcom/vk/analytics/AnalyticsEvent;)V

    .line 304
    const/4 v6, 0x0

    iput v6, p0, Lcom/vk/media/camera/CameraEffects$Stat;->mAverageFps:I

    .line 305
    iget-object v6, p0, Lcom/vk/media/camera/CameraEffects$Stat;->mEvents:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->clear()V

    .line 307
    :cond_4
    const/4 v6, 0x1

    iput-boolean v6, p0, Lcom/vk/media/camera/CameraEffects$Stat;->mEventCollect:Z

    goto/16 :goto_0
.end method


# virtual methods
.method public clear()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 251
    iput v2, p0, Lcom/vk/media/camera/CameraEffects$Stat;->mOrientation:I

    iput v2, p0, Lcom/vk/media/camera/CameraEffects$Stat;->mHeight:I

    iput v2, p0, Lcom/vk/media/camera/CameraEffects$Stat;->mWidth:I

    iput v2, p0, Lcom/vk/media/camera/CameraEffects$Stat;->mPush:I

    iput v2, p0, Lcom/vk/media/camera/CameraEffects$Stat;->mPull:I

    int-to-long v0, v2

    iput-wide v0, p0, Lcom/vk/media/camera/CameraEffects$Stat;->mTime:J

    .line 252
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/vk/media/camera/CameraEffects$Stat;->mStartTime:J

    .line 253
    iput-boolean v2, p0, Lcom/vk/media/camera/CameraEffects$Stat;->mEventCollect:Z

    .line 254
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 264
    iget v2, p0, Lcom/vk/media/camera/CameraEffects$Stat;->mPull:I

    if-lez v2, :cond_0

    const/16 v2, 0x3e8

    iget v3, p0, Lcom/vk/media/camera/CameraEffects$Stat;->mPull:I

    div-int v1, v2, v3

    .line 265
    .local v1, "time":I
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 266
    .local v0, "s":Ljava/lang/StringBuilder;
    const-string/jumbo v2, "[fps:+/-"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/vk/media/camera/CameraEffects$Stat;->mPush:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/vk/media/camera/CameraEffects$Stat;->mPull:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, ", "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/vk/media/camera/CameraEffects$Stat;->mWidth:I

    .line 267
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "x"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/vk/media/camera/CameraEffects$Stat;->mHeight:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "~"

    .line 268
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "(ms)-"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/vk/media/camera/CameraEffects$Stat;->mOrientation:I

    .line 269
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "]"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 270
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 264
    .end local v0    # "s":Ljava/lang/StringBuilder;
    .end local v1    # "time":I
    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public update(III)V
    .locals 0
    .param p1, "width"    # I
    .param p2, "height"    # I
    .param p3, "orientation"    # I

    .prologue
    .line 257
    iput p1, p0, Lcom/vk/media/camera/CameraEffects$Stat;->mWidth:I

    .line 258
    iput p2, p0, Lcom/vk/media/camera/CameraEffects$Stat;->mHeight:I

    .line 259
    iput p3, p0, Lcom/vk/media/camera/CameraEffects$Stat;->mOrientation:I

    .line 260
    invoke-direct {p0}, Lcom/vk/media/camera/CameraEffects$Stat;->check()V

    .line 261
    return-void
.end method
