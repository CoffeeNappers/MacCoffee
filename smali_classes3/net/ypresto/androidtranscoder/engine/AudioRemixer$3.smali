.class final Lnet/ypresto/androidtranscoder/engine/AudioRemixer$3;
.super Ljava/lang/Object;
.source "AudioRemixer.java"

# interfaces
.implements Lnet/ypresto/androidtranscoder/engine/AudioRemixer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnet/ypresto/androidtranscoder/engine/AudioRemixer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public remix(Ljava/nio/ShortBuffer;Ljava/nio/ShortBuffer;)V
    .locals 0
    .param p1, "inSBuff"    # Ljava/nio/ShortBuffer;
    .param p2, "outSBuff"    # Ljava/nio/ShortBuffer;

    .prologue
    .line 63
    invoke-virtual {p2, p1}, Ljava/nio/ShortBuffer;->put(Ljava/nio/ShortBuffer;)Ljava/nio/ShortBuffer;

    .line 64
    return-void
.end method
