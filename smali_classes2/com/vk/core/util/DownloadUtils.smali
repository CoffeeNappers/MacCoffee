.class public Lcom/vk/core/util/DownloadUtils;
.super Ljava/lang/Object;
.source "DownloadUtils.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static downloadFile(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 14
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "filename"    # Ljava/lang/String;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 28
    invoke-static/range {p2 .. p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v12

    if-eqz v12, :cond_1

    .line 80
    :cond_0
    :goto_0
    return-void

    .line 32
    :cond_1
    invoke-static/range {p2 .. p2}, Lcom/facebook/common/media/MediaUtils;->extractMime(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 33
    .local v7, "mimeType":Ljava/lang/String;
    invoke-static {v7}, Lcom/facebook/common/media/MediaUtils;->isVideo(Ljava/lang/String;)Z

    move-result v5

    .line 34
    .local v5, "isVideo":Z
    invoke-static {v7}, Lcom/facebook/common/media/MediaUtils;->isPhoto(Ljava/lang/String;)Z

    move-result v4

    .line 35
    .local v4, "isPhoto":Z
    if-nez v4, :cond_2

    if-eqz v5, :cond_5

    :cond_2
    const/4 v9, 0x1

    .line 37
    .local v9, "shouldBeAddedToGallery":Z
    :goto_1
    invoke-static/range {p1 .. p2}, Lcom/vk/core/util/DownloadUtils;->getTargetFileName(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 38
    .local v11, "targetFileName":Ljava/lang/String;
    invoke-static {v11}, Lcom/vk/core/util/FileUtils;->getDownloadFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v10

    .line 41
    .local v10, "targetFile":Ljava/io/File;
    if-eqz v4, :cond_7

    .line 42
    invoke-static/range {p2 .. p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v12

    invoke-static {v12}, Lcom/vk/imageloader/VKImageLoader;->getDiskCacheEntry(Landroid/net/Uri;)Lcom/facebook/imagepipeline/image/EncodedImage;

    move-result-object v2

    .line 43
    .local v2, "encodedImage":Lcom/facebook/imagepipeline/image/EncodedImage;
    if-nez v2, :cond_6

    const/4 v3, 0x0

    .line 44
    .local v3, "inputStream":Ljava/io/InputStream;
    :goto_2
    if-eqz v3, :cond_7

    .line 46
    :try_start_0
    invoke-virtual {v10}, Ljava/io/File;->exists()Z

    move-result v12

    if-nez v12, :cond_3

    invoke-virtual {v10}, Ljava/io/File;->createNewFile()Z

    move-result v12

    if-eqz v12, :cond_4

    .line 47
    :cond_3
    invoke-static {p0, v10}, Lcom/vk/core/util/DownloadUtils$$Lambda$1;->lambdaFactory$(Landroid/content/Context;Ljava/io/File;)Lcom/vkontakte/android/functions/VoidF1;

    move-result-object v12

    invoke-static {v3, v10, v12}, Lcom/vkontakte/android/utils/Utils;->copyInputStreamToFile(Ljava/io/InputStream;Ljava/io/File;Lcom/vkontakte/android/functions/VoidF1;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 57
    :cond_4
    :goto_3
    if-eqz v9, :cond_0

    .line 58
    const/4 v12, 0x0

    invoke-static {p0, v10, v12}, Lcom/vk/attachpicker/util/CameraUtils;->addMediaToGallery(Landroid/content/Context;Ljava/io/File;Landroid/media/MediaScannerConnection$OnScanCompletedListener;)V

    goto :goto_0

    .line 35
    .end local v2    # "encodedImage":Lcom/facebook/imagepipeline/image/EncodedImage;
    .end local v3    # "inputStream":Ljava/io/InputStream;
    .end local v9    # "shouldBeAddedToGallery":Z
    .end local v10    # "targetFile":Ljava/io/File;
    .end local v11    # "targetFileName":Ljava/lang/String;
    :cond_5
    const/4 v9, 0x0

    goto :goto_1

    .line 43
    .restart local v2    # "encodedImage":Lcom/facebook/imagepipeline/image/EncodedImage;
    .restart local v9    # "shouldBeAddedToGallery":Z
    .restart local v10    # "targetFile":Ljava/io/File;
    .restart local v11    # "targetFileName":Ljava/lang/String;
    :cond_6
    invoke-virtual {v2}, Lcom/facebook/imagepipeline/image/EncodedImage;->getInputStream()Ljava/io/InputStream;

    move-result-object v3

    goto :goto_2

    .line 53
    .restart local v3    # "inputStream":Ljava/io/InputStream;
    :catch_0
    move-exception v1

    .line 54
    .local v1, "e":Ljava/lang/Exception;
    const/4 v12, 0x0

    new-array v12, v12, [Ljava/lang/Object;

    invoke-static {v1, v12}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_3

    .line 64
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v2    # "encodedImage":Lcom/facebook/imagepipeline/image/EncodedImage;
    .end local v3    # "inputStream":Ljava/io/InputStream;
    :cond_7
    invoke-static/range {p2 .. p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 65
    .local v0, "downloadUri":Landroid/net/Uri;
    new-instance v8, Landroid/app/DownloadManager$Request;

    invoke-direct {v8, v0}, Landroid/app/DownloadManager$Request;-><init>(Landroid/net/Uri;)V

    .line 66
    .local v8, "req":Landroid/app/DownloadManager$Request;
    invoke-static {v10}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v12

    invoke-virtual {v8, v12}, Landroid/app/DownloadManager$Request;->setDestinationUri(Landroid/net/Uri;)Landroid/app/DownloadManager$Request;

    .line 67
    sget v12, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v13, 0xe

    if-lt v12, v13, :cond_8

    .line 68
    const/4 v12, 0x1

    invoke-virtual {v8, v12}, Landroid/app/DownloadManager$Request;->setNotificationVisibility(I)Landroid/app/DownloadManager$Request;

    .line 69
    invoke-virtual {v8}, Landroid/app/DownloadManager$Request;->allowScanningByMediaScanner()V

    .line 71
    :cond_8
    const-string/jumbo v12, "download"

    invoke-virtual {p0, v12}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/app/DownloadManager;

    .line 72
    .local v6, "mgr":Landroid/app/DownloadManager;
    if-eqz v6, :cond_0

    .line 74
    :try_start_1
    invoke-virtual {v6, v8}, Landroid/app/DownloadManager;->enqueue(Landroid/app/DownloadManager$Request;)J
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 75
    :catch_1
    move-exception v1

    .line 76
    .local v1, "e":Ljava/lang/IllegalArgumentException;
    const/4 v12, 0x0

    new-array v12, v12, [Ljava/lang/Object;

    invoke-static {v1, v12}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    .line 77
    invoke-static {p0}, Lcom/vk/core/util/DownloadUtils;->startDownloadManagerHack(Landroid/content/Context;)V

    goto/16 :goto_0
.end method

.method private static getTargetFileName(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p0, "filename"    # Ljava/lang/String;
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 99
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 100
    .local v1, "downloadUri":Landroid/net/Uri;
    invoke-virtual {v1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v0

    .line 102
    .local v0, "downloadFileName":Ljava/lang/String;
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 103
    const/16 v3, 0x2f

    const/16 v4, 0x5f

    invoke-virtual {p0, v3, v4}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v2

    .line 104
    .local v2, "fixedTargetName":Ljava/lang/String;
    const-string/jumbo v3, "."

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 110
    .end local v0    # "downloadFileName":Ljava/lang/String;
    .end local v2    # "fixedTargetName":Ljava/lang/String;
    :cond_0
    :goto_0
    return-object v0

    .restart local v0    # "downloadFileName":Ljava/lang/String;
    .restart local v2    # "fixedTargetName":Ljava/lang/String;
    :cond_1
    move-object v0, v2

    .line 107
    goto :goto_0
.end method

.method static synthetic lambda$downloadFile$1(Landroid/content/Context;Ljava/io/File;Ljava/lang/Boolean;)V
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "targetFile"    # Ljava/io/File;
    .param p2, "b"    # Ljava/lang/Boolean;

    .prologue
    .line 48
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 49
    invoke-static {p0, p1}, Lcom/vk/core/util/DownloadUtils$$Lambda$2;->lambdaFactory$(Landroid/content/Context;Ljava/io/File;)Ljava/lang/Runnable;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/ViewUtils;->post(Ljava/lang/Runnable;)V

    .line 51
    :cond_0
    return-void
.end method

.method static synthetic lambda$null$0(Landroid/content/Context;Ljava/io/File;)V
    .locals 5
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "targetFile"    # Ljava/io/File;

    .prologue
    const/4 v4, 0x0

    .line 49
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const v1, 0x7f080214

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {p1}, Ljava/io/File;->getAbsoluteFile()Ljava/io/File;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-virtual {p0, v1, v2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method private static startDownloadManagerHack(Landroid/content/Context;)V
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 84
    if-eqz p0, :cond_0

    .line 87
    :try_start_0
    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v2, "android.settings.APPLICATION_DETAILS_SETTINGS"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string/jumbo v2, "package:com.android.providers.downloads"

    .line 88
    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    move-result-object v1

    .line 87
    invoke-virtual {p0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 94
    :goto_0
    const-string/jumbo v1, "Please enable download manager"

    const/4 v2, 0x1

    invoke-static {p0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 96
    :cond_0
    return-void

    .line 89
    :catch_0
    move-exception v0

    .line 90
    .local v0, "e":Landroid/content/ActivityNotFoundException;
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    .line 92
    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v2, "android.settings.MANAGE_APPLICATIONS_SETTINGS"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto :goto_0
.end method
