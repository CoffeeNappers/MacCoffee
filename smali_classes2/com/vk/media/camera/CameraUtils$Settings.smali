.class public Lcom/vk/media/camera/CameraUtils$Settings;
.super Ljava/lang/Object;
.source "CameraUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/media/camera/CameraUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Settings"
.end annotation


# static fields
.field public static final HI_FPS:F = 30.0f

.field public static final HI_HEIGHT:I = 0x2d0

.field public static final HI_WIDTH:I = 0x500

.field private static final KEY_USE_LOW_RESOLUTION:Ljava/lang/String; = "low_profile"

.field public static final LOW_FPS:F = 25.0f

.field public static final LOW_HEIGHT:I = 0x1e0

.field public static final LOW_WIDTH:I = 0x280

.field private static final NAME:Ljava/lang/String; = "camera_settings"


# instance fields
.field private mMaxCameraFrameResolution:I

.field private mPreferences:Landroid/content/SharedPreferences;


# direct methods
.method public constructor <init>(Landroid/content/Context;I)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "maxResolution"    # I

    .prologue
    .line 186
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 187
    const-string/jumbo v0, "camera_settings"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/media/camera/CameraUtils$Settings;->mPreferences:Landroid/content/SharedPreferences;

    .line 188
    iput p2, p0, Lcom/vk/media/camera/CameraUtils$Settings;->mMaxCameraFrameResolution:I

    .line 189
    return-void
.end method

.method private useLowProfile()Z
    .locals 1

    .prologue
    .line 243
    const/4 v0, 0x0

    return v0
.end method


# virtual methods
.method public getFps()F
    .locals 1

    .prologue
    .line 239
    invoke-direct {p0}, Lcom/vk/media/camera/CameraUtils$Settings;->useLowProfile()Z

    move-result v0

    if-eqz v0, :cond_0

    const/high16 v0, 0x41c80000    # 25.0f

    :goto_0
    return v0

    :cond_0
    const/high16 v0, 0x41f00000    # 30.0f

    goto :goto_0
.end method

.method public getVideoProfile(I)Landroid/media/CamcorderProfile;
    .locals 5
    .param p1, "cameraId"    # I

    .prologue
    .line 192
    const/4 v1, 0x0

    .line 194
    .local v1, "p":Landroid/media/CamcorderProfile;
    :try_start_0
    invoke-direct {p0}, Lcom/vk/media/camera/CameraUtils$Settings;->useLowProfile()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 195
    const/4 v2, 0x4

    invoke-static {p1, v2}, Landroid/media/CamcorderProfile;->hasProfile(II)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 196
    const/4 v2, 0x4

    invoke-static {p1, v2}, Landroid/media/CamcorderProfile;->get(II)Landroid/media/CamcorderProfile;

    move-result-object v1

    .line 200
    :goto_0
    if-eqz v1, :cond_0

    .line 201
    const/16 v2, 0x280

    iput v2, v1, Landroid/media/CamcorderProfile;->videoFrameWidth:I

    .line 202
    const/16 v2, 0x1e0

    iput v2, v1, Landroid/media/CamcorderProfile;->videoFrameHeight:I

    .line 207
    :cond_0
    :goto_1
    if-nez v1, :cond_1

    const/4 v2, 0x0

    invoke-static {p1, v2}, Landroid/media/CamcorderProfile;->hasProfile(II)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 208
    const/4 v2, 0x0

    invoke-static {p1, v2}, Landroid/media/CamcorderProfile;->get(II)Landroid/media/CamcorderProfile;

    move-result-object v1

    .line 209
    const/16 v2, 0x280

    iput v2, v1, Landroid/media/CamcorderProfile;->videoFrameWidth:I

    .line 210
    const/16 v2, 0x1e0

    iput v2, v1, Landroid/media/CamcorderProfile;->videoFrameHeight:I

    .line 215
    :cond_1
    :goto_2
    return-object v1

    .line 198
    :cond_2
    const/4 v2, 0x0

    invoke-static {p1, v2}, Landroid/media/CamcorderProfile;->get(II)Landroid/media/CamcorderProfile;

    move-result-object v1

    goto :goto_0

    .line 205
    :cond_3
    invoke-virtual {p0, p1}, Lcom/vk/media/camera/CameraUtils$Settings;->getVideoProfileDefault(I)Landroid/media/CamcorderProfile;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    goto :goto_1

    .line 212
    :catch_0
    move-exception v0

    .line 213
    .local v0, "e":Ljava/lang/Exception;
    invoke-static {}, Lcom/vk/media/camera/CameraUtils;->access$000()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "empty camera profile"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2
.end method

.method public getVideoProfileDefault(I)Landroid/media/CamcorderProfile;
    .locals 5
    .param p1, "cameraId"    # I

    .prologue
    const/4 v4, 0x7

    const/4 v3, 0x5

    const/4 v2, 0x4

    .line 219
    const/4 v0, 0x0

    .line 220
    .local v0, "p":Landroid/media/CamcorderProfile;
    invoke-static {p1, v3}, Landroid/media/CamcorderProfile;->hasProfile(II)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 221
    invoke-static {p1, v3}, Landroid/media/CamcorderProfile;->get(II)Landroid/media/CamcorderProfile;

    move-result-object v0

    .line 227
    :cond_0
    :goto_0
    return-object v0

    .line 222
    :cond_1
    invoke-static {p1, v2}, Landroid/media/CamcorderProfile;->hasProfile(II)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 223
    invoke-static {p1, v2}, Landroid/media/CamcorderProfile;->get(II)Landroid/media/CamcorderProfile;

    move-result-object v0

    goto :goto_0

    .line 224
    :cond_2
    invoke-static {p1, v4}, Landroid/media/CamcorderProfile;->hasProfile(II)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 225
    invoke-static {p1, v4}, Landroid/media/CamcorderProfile;->get(II)Landroid/media/CamcorderProfile;

    move-result-object v0

    goto :goto_0
.end method

.method public setUseLowResolution()V
    .locals 3

    .prologue
    .line 231
    iget-object v1, p0, Lcom/vk/media/camera/CameraUtils$Settings;->mPreferences:Landroid/content/SharedPreferences;

    if-eqz v1, :cond_0

    .line 232
    iget-object v1, p0, Lcom/vk/media/camera/CameraUtils$Settings;->mPreferences:Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 233
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    const-string/jumbo v1, "low_profile"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 234
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 236
    .end local v0    # "editor":Landroid/content/SharedPreferences$Editor;
    :cond_0
    return-void
.end method
