.class final Lnet/ypresto/androidtranscoder/engine/AudioRemixer$1;
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


# static fields
.field private static final SIGNED_SHORT_LIMIT:I = 0x8000

.field private static final UNSIGNED_SHORT_MAX:I = 0xffff


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public remix(Ljava/nio/ShortBuffer;Ljava/nio/ShortBuffer;)V
    .locals 10
    .param p1, "inSBuff"    # Ljava/nio/ShortBuffer;
    .param p2, "outSBuff"    # Ljava/nio/ShortBuffer;

    .prologue
    const v9, 0x8000

    .line 18
    invoke-virtual {p1}, Ljava/nio/ShortBuffer;->remaining()I

    move-result v7

    div-int/lit8 v3, v7, 0x2

    .line 19
    .local v3, "inRemaining":I
    invoke-virtual {p2}, Ljava/nio/ShortBuffer;->remaining()I

    move-result v5

    .line 21
    .local v5, "outSpace":I
    invoke-static {v3, v5}, Ljava/lang/Math;->min(II)I

    move-result v6

    .line 22
    .local v6, "samplesToBeProcessed":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v6, :cond_3

    .line 24
    invoke-virtual {p1}, Ljava/nio/ShortBuffer;->get()S

    move-result v7

    add-int v0, v7, v9

    .line 25
    .local v0, "a":I
    invoke-virtual {p1}, Ljava/nio/ShortBuffer;->get()S

    move-result v7

    add-int v1, v7, v9

    .line 28
    .local v1, "b":I
    if-lt v0, v9, :cond_0

    if-ge v1, v9, :cond_2

    .line 31
    :cond_0
    mul-int v7, v0, v1

    div-int v4, v7, v9

    .line 37
    .local v4, "m":I
    :goto_1
    const/high16 v7, 0x10000

    if-ne v4, v7, :cond_1

    const v4, 0xffff

    .line 38
    :cond_1
    add-int/lit16 v7, v4, -0x8000

    int-to-short v7, v7

    invoke-virtual {p2, v7}, Ljava/nio/ShortBuffer;->put(S)Ljava/nio/ShortBuffer;

    .line 22
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 34
    .end local v4    # "m":I
    :cond_2
    add-int v7, v0, v1

    mul-int/lit8 v7, v7, 0x2

    mul-int v8, v0, v1

    div-int/2addr v8, v9

    sub-int/2addr v7, v8

    const v8, 0xffff

    sub-int v4, v7, v8

    .restart local v4    # "m":I
    goto :goto_1

    .line 40
    .end local v0    # "a":I
    .end local v1    # "b":I
    .end local v4    # "m":I
    :cond_3
    return-void
.end method
