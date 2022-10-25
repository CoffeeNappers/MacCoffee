.class final Lnet/ypresto/androidtranscoder/engine/AudioRemixer$2;
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
    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public remix(Ljava/nio/ShortBuffer;Ljava/nio/ShortBuffer;)V
    .locals 6
    .param p1, "inSBuff"    # Ljava/nio/ShortBuffer;
    .param p2, "outSBuff"    # Ljava/nio/ShortBuffer;

    .prologue
    .line 47
    invoke-virtual {p1}, Ljava/nio/ShortBuffer;->remaining()I

    move-result v1

    .line 48
    .local v1, "inRemaining":I
    invoke-virtual {p2}, Ljava/nio/ShortBuffer;->remaining()I

    move-result v5

    div-int/lit8 v3, v5, 0x2

    .line 50
    .local v3, "outSpace":I
    invoke-static {v1, v3}, Ljava/lang/Math;->min(II)I

    move-result v4

    .line 51
    .local v4, "samplesToBeProcessed":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, v4, :cond_0

    .line 52
    invoke-virtual {p1}, Ljava/nio/ShortBuffer;->get()S

    move-result v2

    .line 53
    .local v2, "inSample":S
    invoke-virtual {p2, v2}, Ljava/nio/ShortBuffer;->put(S)Ljava/nio/ShortBuffer;

    .line 54
    invoke-virtual {p2, v2}, Ljava/nio/ShortBuffer;->put(S)Ljava/nio/ShortBuffer;

    .line 51
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 56
    .end local v2    # "inSample":S
    :cond_0
    return-void
.end method
