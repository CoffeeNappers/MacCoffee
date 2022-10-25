.class Lcom/vkontakte/android/AudioMessagePlayerService$AudioBuffer;
.super Ljava/lang/Object;
.source "AudioMessagePlayerService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/AudioMessagePlayerService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "AudioBuffer"
.end annotation


# instance fields
.field buffer:Ljava/nio/ByteBuffer;

.field bufferBytes:[B

.field finished:I

.field pcmOffset:J

.field size:I


# direct methods
.method public constructor <init>(I)V
    .locals 1
    .param p1, "capacity"    # I

    .prologue
    .line 732
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 733
    invoke-static {p1}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/AudioMessagePlayerService$AudioBuffer;->buffer:Ljava/nio/ByteBuffer;

    .line 734
    new-array v0, p1, [B

    iput-object v0, p0, Lcom/vkontakte/android/AudioMessagePlayerService$AudioBuffer;->bufferBytes:[B

    .line 735
    return-void
.end method
