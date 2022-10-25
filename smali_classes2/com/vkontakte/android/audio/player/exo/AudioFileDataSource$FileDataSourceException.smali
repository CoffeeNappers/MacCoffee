.class Lcom/vkontakte/android/audio/player/exo/AudioFileDataSource$FileDataSourceException;
.super Ljava/io/IOException;
.source "AudioFileDataSource.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/audio/player/exo/AudioFileDataSource;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "FileDataSourceException"
.end annotation


# direct methods
.method constructor <init>(Ljava/io/IOException;)V
    .locals 0
    .param p1, "cause"    # Ljava/io/IOException;

    .prologue
    .line 23
    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/Throwable;)V

    .line 24
    return-void
.end method
