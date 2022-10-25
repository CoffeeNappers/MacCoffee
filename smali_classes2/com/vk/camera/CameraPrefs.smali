.class public Lcom/vk/camera/CameraPrefs;
.super Lcom/vk/attachpicker/util/Prefs;
.source "CameraPrefs.java"


# static fields
.field private static final KEY_USE_FRONT_CAMERA:Ljava/lang/String; = "use_front_camera"

.field private static final KEY_USE_MEDIA_RECORDER:Ljava/lang/String; = "use_media_recorder"

.field private static volatile instance:Lcom/vk/camera/CameraPrefs;


# direct methods
.method private constructor <init>()V
    .locals 1

    .prologue
    .line 24
    const-string/jumbo v0, "camera_prefs"

    invoke-direct {p0, v0}, Lcom/vk/attachpicker/util/Prefs;-><init>(Ljava/lang/String;)V

    .line 25
    return-void
.end method

.method public static instance()Lcom/vk/camera/CameraPrefs;
    .locals 2

    .prologue
    .line 10
    sget-object v0, Lcom/vk/camera/CameraPrefs;->instance:Lcom/vk/camera/CameraPrefs;

    if-nez v0, :cond_1

    .line 11
    const-class v1, Lcom/vk/camera/CameraPrefs;

    monitor-enter v1

    .line 12
    :try_start_0
    sget-object v0, Lcom/vk/camera/CameraPrefs;->instance:Lcom/vk/camera/CameraPrefs;

    if-nez v0, :cond_0

    .line 13
    new-instance v0, Lcom/vk/camera/CameraPrefs;

    invoke-direct {v0}, Lcom/vk/camera/CameraPrefs;-><init>()V

    sput-object v0, Lcom/vk/camera/CameraPrefs;->instance:Lcom/vk/camera/CameraPrefs;

    .line 15
    :cond_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    :cond_1
    sget-object v0, Lcom/vk/camera/CameraPrefs;->instance:Lcom/vk/camera/CameraPrefs;

    return-object v0

    .line 15
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method


# virtual methods
.method public useFrontCamera(Z)V
    .locals 2
    .param p1, "useFrontCamera"    # Z

    .prologue
    .line 40
    invoke-virtual {p0}, Lcom/vk/camera/CameraPrefs;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "use_front_camera"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 41
    return-void
.end method

.method public useFrontCamera()Z
    .locals 2

    .prologue
    .line 36
    const-string/jumbo v0, "use_front_camera"

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lcom/vk/camera/CameraPrefs;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public useMediaRecorder(Z)V
    .locals 2
    .param p1, "useMediaRecorder"    # Z

    .prologue
    .line 32
    invoke-virtual {p0}, Lcom/vk/camera/CameraPrefs;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "use_media_recorder"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 33
    return-void
.end method

.method public useMediaRecorder()Z
    .locals 1

    .prologue
    .line 28
    const-string/jumbo v0, "use_media_recorder"

    invoke-virtual {p0, v0}, Lcom/vk/camera/CameraPrefs;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method
