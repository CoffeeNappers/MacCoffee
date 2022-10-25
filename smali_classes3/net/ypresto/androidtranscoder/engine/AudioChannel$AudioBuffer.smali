.class Lnet/ypresto/androidtranscoder/engine/AudioChannel$AudioBuffer;
.super Ljava/lang/Object;
.source "AudioChannel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnet/ypresto/androidtranscoder/engine/AudioChannel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "AudioBuffer"
.end annotation


# instance fields
.field bufferIndex:I

.field data:Ljava/nio/ShortBuffer;

.field presentationTimeUs:J


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lnet/ypresto/androidtranscoder/engine/AudioChannel$1;)V
    .locals 0
    .param p1, "x0"    # Lnet/ypresto/androidtranscoder/engine/AudioChannel$1;

    .prologue
    .line 23
    invoke-direct {p0}, Lnet/ypresto/androidtranscoder/engine/AudioChannel$AudioBuffer;-><init>()V

    return-void
.end method
