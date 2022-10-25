.class public Lcom/vk/attachpicker/util/CameraUtils;
.super Ljava/lang/Object;
.source "CameraUtils.java"


# static fields
.field private static final cameraFilesMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation
.end field

.field private static final requestId:Ljava/util/concurrent/atomic/AtomicInteger;

.field private static final requestTypesMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 19
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    const/16 v1, 0x64

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    sput-object v0, Lcom/vk/attachpicker/util/CameraUtils;->requestId:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 20
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/vk/attachpicker/util/CameraUtils;->cameraFilesMap:Ljava/util/HashMap;

    .line 21
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/vk/attachpicker/util/CameraUtils;->requestTypesMap:Ljava/util/HashMap;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static addMediaToGallery(Landroid/content/Context;Ljava/io/File;Landroid/media/MediaScannerConnection$OnScanCompletedListener;)V
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "f"    # Ljava/io/File;
    .param p2, "listener"    # Landroid/media/MediaScannerConnection$OnScanCompletedListener;

    .prologue
    .line 50
    const/4 v0, 0x1

    :try_start_0
    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x0

    invoke-static {p0, v0, v1, p2}, Landroid/media/MediaScannerConnection;->scanFile(Landroid/content/Context;[Ljava/lang/String;[Ljava/lang/String;Landroid/media/MediaScannerConnection$OnScanCompletedListener;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 54
    :goto_0
    return-void

    .line 51
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public static getCameraRequestData(Z)Landroid/support/v4/util/Pair;
    .locals 5
    .param p0, "video"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Landroid/support/v4/util/Pair",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation

    .prologue
    .line 24
    sget-object v2, Lcom/vk/attachpicker/util/CameraUtils;->requestId:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    move-result v1

    .line 25
    .local v1, "id":I
    if-eqz p0, :cond_0

    invoke-static {}, Lcom/vk/core/util/FileUtils;->getVideoFile()Ljava/io/File;

    move-result-object v0

    .line 26
    .local v0, "file":Ljava/io/File;
    :goto_0
    sget-object v2, Lcom/vk/attachpicker/util/CameraUtils;->cameraFilesMap:Ljava/util/HashMap;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    sget-object v2, Lcom/vk/attachpicker/util/CameraUtils;->requestTypesMap:Ljava/util/HashMap;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 28
    new-instance v2, Landroid/support/v4/util/Pair;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-direct {v2, v3, v0}, Landroid/support/v4/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v2

    .line 25
    .end local v0    # "file":Ljava/io/File;
    :cond_0
    invoke-static {}, Lcom/vk/core/util/FileUtils;->getPhotoFile()Ljava/io/File;

    move-result-object v0

    goto :goto_0
.end method

.method public static getFileById(I)Ljava/io/File;
    .locals 2
    .param p0, "id"    # I

    .prologue
    .line 32
    sget-object v0, Lcom/vk/attachpicker/util/CameraUtils;->cameraFilesMap:Ljava/util/HashMap;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/File;

    return-object v0
.end method

.method public static isDeviceHasCamera()Z
    .locals 4

    .prologue
    .line 57
    invoke-static {}, Lcom/vk/attachpicker/Picker;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    .line 59
    .local v1, "manager":Landroid/content/pm/PackageManager;
    const-string/jumbo v2, "android.hardware.camera"

    invoke-virtual {v1, v2}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v0

    .line 61
    .local v0, "hasCamera":Z
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x11

    if-lt v2, v3, :cond_1

    .line 62
    if-nez v0, :cond_0

    const-string/jumbo v2, "android.hardware.camera.any"

    invoke-virtual {v1, v2}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    :cond_0
    const/4 v0, 0x1

    .line 65
    :cond_1
    :goto_0
    return v0

    .line 62
    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isRequestValid(I)Z
    .locals 2
    .param p0, "id"    # I

    .prologue
    .line 45
    sget-object v0, Lcom/vk/attachpicker/util/CameraUtils;->cameraFilesMap:Ljava/util/HashMap;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/vk/attachpicker/util/CameraUtils;->requestTypesMap:Ljava/util/HashMap;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isVideoRequest(I)Z
    .locals 3
    .param p0, "id"    # I

    .prologue
    .line 36
    sget-object v1, Lcom/vk/attachpicker/util/CameraUtils;->requestTypesMap:Ljava/util/HashMap;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    .line 37
    .local v0, "res":Ljava/lang/Boolean;
    if-nez v0, :cond_0

    .line 38
    const/4 v1, 0x0

    .line 40
    :goto_0
    return v1

    :cond_0
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    goto :goto_0
.end method

.method public static savePhoto(Ljava/io/File;)Ljava/io/File;
    .locals 5
    .param p0, "file"    # Ljava/io/File;

    .prologue
    const/4 v2, 0x0

    .line 79
    invoke-static {}, Lcom/vk/core/util/FileUtils;->getPhotoFile()Ljava/io/File;

    move-result-object v1

    .line 81
    .local v1, "newFile":Ljava/io/File;
    :try_start_0
    invoke-static {p0, v1}, Lcom/vk/core/util/FileUtils;->copyFile(Ljava/io/File;Ljava/io/File;)V

    .line 82
    sget-object v3, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const/4 v4, 0x0

    invoke-static {v3, v1, v4}, Lcom/vk/attachpicker/util/CameraUtils;->addMediaToGallery(Landroid/content/Context;Ljava/io/File;Landroid/media/MediaScannerConnection$OnScanCompletedListener;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 86
    .end local v1    # "newFile":Ljava/io/File;
    :goto_0
    return-object v1

    .line 84
    .restart local v1    # "newFile":Ljava/io/File;
    :catch_0
    move-exception v0

    .line 85
    .local v0, "e":Ljava/lang/Exception;
    invoke-static {v1}, Lcom/vk/core/util/FileUtils;->deleteFile(Ljava/io/File;)Z

    move-object v1, v2

    .line 86
    goto :goto_0
.end method

.method public static savePhotoAsync(Ljava/io/File;)V
    .locals 2
    .param p0, "file"    # Ljava/io/File;

    .prologue
    .line 69
    new-instance v0, Lcom/vk/attachpicker/util/CameraUtils$1;

    invoke-direct {v0, p0}, Lcom/vk/attachpicker/util/CameraUtils$1;-><init>(Ljava/io/File;)V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    .line 75
    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/util/CameraUtils$1;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 76
    return-void
.end method

.method public static saveVideo(Ljava/io/File;)Ljava/io/File;
    .locals 5
    .param p0, "file"    # Ljava/io/File;

    .prologue
    const/4 v2, 0x0

    .line 91
    invoke-static {}, Lcom/vk/core/util/FileUtils;->getVideoFile()Ljava/io/File;

    move-result-object v1

    .line 93
    .local v1, "newFile":Ljava/io/File;
    :try_start_0
    invoke-static {p0, v1}, Lcom/vk/core/util/FileUtils;->copyFile(Ljava/io/File;Ljava/io/File;)V

    .line 94
    sget-object v3, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const/4 v4, 0x0

    invoke-static {v3, v1, v4}, Lcom/vk/attachpicker/util/CameraUtils;->addMediaToGallery(Landroid/content/Context;Ljava/io/File;Landroid/media/MediaScannerConnection$OnScanCompletedListener;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 98
    .end local v1    # "newFile":Ljava/io/File;
    :goto_0
    return-object v1

    .line 96
    .restart local v1    # "newFile":Ljava/io/File;
    :catch_0
    move-exception v0

    .line 97
    .local v0, "e":Ljava/lang/Exception;
    invoke-static {v1}, Lcom/vk/core/util/FileUtils;->deleteFile(Ljava/io/File;)Z

    move-object v1, v2

    .line 98
    goto :goto_0
.end method
