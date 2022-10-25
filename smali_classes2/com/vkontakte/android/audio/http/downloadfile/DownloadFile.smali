.class public final Lcom/vkontakte/android/audio/http/downloadfile/DownloadFile;
.super Ljava/lang/Object;
.source "DownloadFile.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    return-void
.end method

.method public static downloadFile(Landroid/content/Context;Ljava/lang/String;Ljava/io/File;ZLcom/vkontakte/android/audio/http/downloadfile/DownloadFileListener;Lcom/vkontakte/android/audio/http/downloadfile/DownloadFileConverter;)Z
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "file"    # Ljava/io/File;
    .param p3, "checkLastModified"    # Z
    .param p4, "listener"    # Lcom/vkontakte/android/audio/http/downloadfile/DownloadFileListener;
    .param p5, "converter"    # Lcom/vkontakte/android/audio/http/downloadfile/DownloadFileConverter;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 14
    invoke-static/range {p0 .. p5}, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;->execute(Landroid/content/Context;Ljava/lang/String;Ljava/io/File;ZLcom/vkontakte/android/audio/http/downloadfile/DownloadFileListener;Lcom/vkontakte/android/audio/http/downloadfile/DownloadFileConverter;)Z

    move-result v0

    return v0
.end method
