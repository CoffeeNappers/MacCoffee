.class Lcom/vkontakte/android/audio/player/exo/AudioCacheHelper$OutputStreamRandomAccessFile;
.super Ljava/io/OutputStream;
.source "AudioCacheHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/audio/player/exo/AudioCacheHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "OutputStreamRandomAccessFile"
.end annotation


# instance fields
.field final randomAccessFile:Ljava/io/RandomAccessFile;


# direct methods
.method constructor <init>(Ljava/io/RandomAccessFile;)V
    .locals 0
    .param p1, "randomAccessFile"    # Ljava/io/RandomAccessFile;

    .prologue
    .line 219
    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    .line 220
    iput-object p1, p0, Lcom/vkontakte/android/audio/player/exo/AudioCacheHelper$OutputStreamRandomAccessFile;->randomAccessFile:Ljava/io/RandomAccessFile;

    .line 221
    return-void
.end method


# virtual methods
.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 236
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/exo/AudioCacheHelper$OutputStreamRandomAccessFile;->randomAccessFile:Ljava/io/RandomAccessFile;

    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->getFD()Ljava/io/FileDescriptor;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/FileDescriptor;->sync()V

    .line 237
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/exo/AudioCacheHelper$OutputStreamRandomAccessFile;->randomAccessFile:Ljava/io/RandomAccessFile;

    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->close()V

    .line 238
    return-void
.end method

.method public flush()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 232
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/exo/AudioCacheHelper$OutputStreamRandomAccessFile;->randomAccessFile:Ljava/io/RandomAccessFile;

    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->getFD()Ljava/io/FileDescriptor;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/FileDescriptor;->sync()V

    .line 233
    return-void
.end method

.method public write(I)V
    .locals 1
    .param p1, "b"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 242
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/exo/AudioCacheHelper$OutputStreamRandomAccessFile;->randomAccessFile:Ljava/io/RandomAccessFile;

    invoke-virtual {v0, p1}, Ljava/io/RandomAccessFile;->write(I)V

    .line 243
    return-void
.end method

.method public write([B)V
    .locals 1
    .param p1, "b"    # [B
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 224
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/exo/AudioCacheHelper$OutputStreamRandomAccessFile;->randomAccessFile:Ljava/io/RandomAccessFile;

    invoke-virtual {v0, p1}, Ljava/io/RandomAccessFile;->write([B)V

    .line 225
    return-void
.end method

.method public write([BII)V
    .locals 1
    .param p1, "b"    # [B
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 228
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/exo/AudioCacheHelper$OutputStreamRandomAccessFile;->randomAccessFile:Ljava/io/RandomAccessFile;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/RandomAccessFile;->write([BII)V

    .line 229
    return-void
.end method
