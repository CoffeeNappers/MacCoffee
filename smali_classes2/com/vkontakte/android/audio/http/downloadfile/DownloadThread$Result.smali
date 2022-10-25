.class Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread$Result;
.super Ljava/lang/Object;
.source "DownloadThread.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Result"
.end annotation


# instance fields
.field final lastModified:J

.field final notModified:Z


# direct methods
.method private constructor <init>(ZJ)V
    .locals 0
    .param p1, "notModified"    # Z
    .param p2, "lastModified"    # J

    .prologue
    .line 179
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 180
    iput-boolean p1, p0, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread$Result;->notModified:Z

    .line 181
    iput-wide p2, p0, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread$Result;->lastModified:J

    .line 182
    return-void
.end method

.method synthetic constructor <init>(ZJLcom/vkontakte/android/audio/http/downloadfile/DownloadThread$1;)V
    .locals 0
    .param p1, "x0"    # Z
    .param p2, "x1"    # J
    .param p4, "x2"    # Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread$1;

    .prologue
    .line 175
    invoke-direct {p0, p1, p2, p3}, Lcom/vkontakte/android/audio/http/downloadfile/DownloadThread$Result;-><init>(ZJ)V

    return-void
.end method
