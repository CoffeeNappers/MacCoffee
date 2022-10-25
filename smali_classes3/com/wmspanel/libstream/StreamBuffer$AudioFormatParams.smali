.class public Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/wmspanel/libstream/StreamBuffer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "AudioFormatParams"
.end annotation


# instance fields
.field channelCount:I

.field public configBuf:[B

.field public configLen:I

.field sampleRate:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, -0x1

    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    const/4 v0, 0x0

    iput v0, p0, Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;->configLen:I

    .line 59
    iput v1, p0, Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;->sampleRate:I

    .line 60
    iput v1, p0, Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;->channelCount:I

    .line 61
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1, "other"    # Ljava/lang/Object;

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 65
    if-ne p0, p1, :cond_1

    .line 75
    .end local p1    # "other":Ljava/lang/Object;
    :cond_0
    :goto_0
    return v0

    .line 69
    .restart local p1    # "other":Ljava/lang/Object;
    :cond_1
    if-eqz p1, :cond_2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_3

    :cond_2
    move v0, v1

    .line 70
    goto :goto_0

    .line 73
    :cond_3
    check-cast p1, Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;

    .line 75
    .end local p1    # "other":Ljava/lang/Object;
    iget v2, p0, Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;->configLen:I

    iget v3, p1, Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;->configLen:I

    if-ne v2, v3, :cond_4

    iget v2, p0, Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;->sampleRate:I

    iget v3, p1, Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;->sampleRate:I

    if-ne v2, v3, :cond_4

    iget v2, p0, Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;->channelCount:I

    iget v3, p1, Lcom/wmspanel/libstream/StreamBuffer$AudioFormatParams;->channelCount:I

    if-eq v2, v3, :cond_0

    :cond_4
    move v0, v1

    goto :goto_0
.end method
