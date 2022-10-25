.class public Lcom/vkontakte/android/audio/player/TrackInfo;
.super Ljava/lang/Object;
.source "TrackInfo.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/audio/player/TrackInfo$TrackInfoProvider;
    }
.end annotation


# instance fields
.field private currentIndex:I

.field private hash:I

.field private mBufferingPercent:[I

.field private mDuration:[I

.field private mPosition:[I

.field private mTrack:Lcom/vkontakte/android/audio/player/PlayerTrack;

.field private final size:I

.field private final trackInfoProvider:Lcom/vkontakte/android/audio/player/TrackInfo$TrackInfoProvider;


# direct methods
.method constructor <init>(ILcom/vkontakte/android/audio/player/TrackInfo$TrackInfoProvider;)V
    .locals 1
    .param p1, "size"    # I
    .param p2, "trackInfoProvider"    # Lcom/vkontakte/android/audio/player/TrackInfo$TrackInfoProvider;

    .prologue
    const/4 v0, 0x0

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    iput v0, p0, Lcom/vkontakte/android/audio/player/TrackInfo;->hash:I

    .line 28
    iput v0, p0, Lcom/vkontakte/android/audio/player/TrackInfo;->currentIndex:I

    .line 41
    iput p1, p0, Lcom/vkontakte/android/audio/player/TrackInfo;->size:I

    .line 42
    iput-object p2, p0, Lcom/vkontakte/android/audio/player/TrackInfo;->trackInfoProvider:Lcom/vkontakte/android/audio/player/TrackInfo$TrackInfoProvider;

    .line 43
    invoke-virtual {p0, v0}, Lcom/vkontakte/android/audio/player/TrackInfo;->clear(Z)V

    .line 44
    return-void
.end method

.method public constructor <init>(Lcom/vkontakte/android/audio/player/TrackInfo;)V
    .locals 3
    .param p1, "info"    # Lcom/vkontakte/android/audio/player/TrackInfo;

    .prologue
    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    iput v0, p0, Lcom/vkontakte/android/audio/player/TrackInfo;->hash:I

    .line 28
    iput v0, p0, Lcom/vkontakte/android/audio/player/TrackInfo;->currentIndex:I

    .line 31
    iget-object v0, p1, Lcom/vkontakte/android/audio/player/TrackInfo;->mTrack:Lcom/vkontakte/android/audio/player/PlayerTrack;

    iput-object v0, p0, Lcom/vkontakte/android/audio/player/TrackInfo;->mTrack:Lcom/vkontakte/android/audio/player/PlayerTrack;

    .line 32
    iget-object v0, p1, Lcom/vkontakte/android/audio/player/TrackInfo;->mDuration:[I

    if-nez v0, :cond_0

    move-object v0, v1

    :goto_0
    iput-object v0, p0, Lcom/vkontakte/android/audio/player/TrackInfo;->mDuration:[I

    .line 33
    iget-object v0, p1, Lcom/vkontakte/android/audio/player/TrackInfo;->mPosition:[I

    if-nez v0, :cond_1

    move-object v0, v1

    :goto_1
    iput-object v0, p0, Lcom/vkontakte/android/audio/player/TrackInfo;->mPosition:[I

    .line 34
    iget-object v0, p1, Lcom/vkontakte/android/audio/player/TrackInfo;->mBufferingPercent:[I

    if-nez v0, :cond_2

    :goto_2
    iput-object v1, p0, Lcom/vkontakte/android/audio/player/TrackInfo;->mBufferingPercent:[I

    .line 35
    iget v0, p1, Lcom/vkontakte/android/audio/player/TrackInfo;->size:I

    iput v0, p0, Lcom/vkontakte/android/audio/player/TrackInfo;->size:I

    .line 36
    iget-object v0, p1, Lcom/vkontakte/android/audio/player/TrackInfo;->trackInfoProvider:Lcom/vkontakte/android/audio/player/TrackInfo$TrackInfoProvider;

    iput-object v0, p0, Lcom/vkontakte/android/audio/player/TrackInfo;->trackInfoProvider:Lcom/vkontakte/android/audio/player/TrackInfo$TrackInfoProvider;

    .line 37
    iget v0, p1, Lcom/vkontakte/android/audio/player/TrackInfo;->currentIndex:I

    iput v0, p0, Lcom/vkontakte/android/audio/player/TrackInfo;->currentIndex:I

    .line 38
    return-void

    .line 32
    :cond_0
    iget-object v0, p1, Lcom/vkontakte/android/audio/player/TrackInfo;->mDuration:[I

    iget-object v2, p1, Lcom/vkontakte/android/audio/player/TrackInfo;->mDuration:[I

    array-length v2, v2

    invoke-static {v0, v2}, Ljava/util/Arrays;->copyOf([II)[I

    move-result-object v0

    goto :goto_0

    .line 33
    :cond_1
    iget-object v0, p1, Lcom/vkontakte/android/audio/player/TrackInfo;->mPosition:[I

    iget-object v2, p1, Lcom/vkontakte/android/audio/player/TrackInfo;->mPosition:[I

    array-length v2, v2

    invoke-static {v0, v2}, Ljava/util/Arrays;->copyOf([II)[I

    move-result-object v0

    goto :goto_1

    .line 34
    :cond_2
    iget-object v0, p1, Lcom/vkontakte/android/audio/player/TrackInfo;->mBufferingPercent:[I

    iget-object v1, p1, Lcom/vkontakte/android/audio/player/TrackInfo;->mBufferingPercent:[I

    array-length v1, v1

    invoke-static {v0, v1}, Ljava/util/Arrays;->copyOf([II)[I

    move-result-object v1

    goto :goto_2
.end method


# virtual methods
.method clear(Z)V
    .locals 1
    .param p1, "preserveProgress"    # Z

    .prologue
    .line 63
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/audio/player/TrackInfo;->mTrack:Lcom/vkontakte/android/audio/player/PlayerTrack;

    .line 64
    if-nez p1, :cond_0

    .line 65
    iget v0, p0, Lcom/vkontakte/android/audio/player/TrackInfo;->size:I

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/vkontakte/android/audio/player/TrackInfo;->mDuration:[I

    .line 66
    iget v0, p0, Lcom/vkontakte/android/audio/player/TrackInfo;->size:I

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/vkontakte/android/audio/player/TrackInfo;->mPosition:[I

    .line 68
    :cond_0
    iget v0, p0, Lcom/vkontakte/android/audio/player/TrackInfo;->size:I

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/vkontakte/android/audio/player/TrackInfo;->mBufferingPercent:[I

    .line 69
    return-void
.end method

.method clearBuffering()V
    .locals 1

    .prologue
    .line 72
    iget v0, p0, Lcom/vkontakte/android/audio/player/TrackInfo;->size:I

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/vkontakte/android/audio/player/TrackInfo;->mBufferingPercent:[I

    .line 73
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 140
    instance-of v2, p1, Lcom/vkontakte/android/audio/player/TrackInfo;

    if-eqz v2, :cond_0

    move-object v0, p1

    .line 141
    check-cast v0, Lcom/vkontakte/android/audio/player/TrackInfo;

    .line 142
    .local v0, "info":Lcom/vkontakte/android/audio/player/TrackInfo;
    iget-object v2, v0, Lcom/vkontakte/android/audio/player/TrackInfo;->mTrack:Lcom/vkontakte/android/audio/player/PlayerTrack;

    iget-object v3, p0, Lcom/vkontakte/android/audio/player/TrackInfo;->mTrack:Lcom/vkontakte/android/audio/player/PlayerTrack;

    invoke-static {v2, v3}, Lcom/vkontakte/android/utils/Utils;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    iget v2, v0, Lcom/vkontakte/android/audio/player/TrackInfo;->currentIndex:I

    iget v3, p0, Lcom/vkontakte/android/audio/player/TrackInfo;->currentIndex:I

    if-ne v2, v3, :cond_0

    const/4 v1, 0x1

    .line 145
    .end local v0    # "info":Lcom/vkontakte/android/audio/player/TrackInfo;
    :cond_0
    return v1
.end method

.method public getBufferingPercent()I
    .locals 2

    .prologue
    .line 109
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/TrackInfo;->mBufferingPercent:[I

    iget v1, p0, Lcom/vkontakte/android/audio/player/TrackInfo;->currentIndex:I

    aget v0, v0, v1

    return v0
.end method

.method public getDuration()I
    .locals 2

    .prologue
    .line 80
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/TrackInfo;->mDuration:[I

    iget v1, p0, Lcom/vkontakte/android/audio/player/TrackInfo;->currentIndex:I

    aget v0, v0, v1

    return v0
.end method

.method getDuration(I)I
    .locals 1
    .param p1, "index"    # I

    .prologue
    .line 84
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/TrackInfo;->mDuration:[I

    aget v0, v0, p1

    return v0
.end method

.method public getPosition()I
    .locals 2

    .prologue
    .line 92
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/TrackInfo;->mPosition:[I

    iget v1, p0, Lcom/vkontakte/android/audio/player/TrackInfo;->currentIndex:I

    aget v0, v0, v1

    return v0
.end method

.method getPosition(I)I
    .locals 1
    .param p1, "index"    # I

    .prologue
    .line 96
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/TrackInfo;->mPosition:[I

    aget v0, v0, p1

    return v0
.end method

.method public getPositionPercent()I
    .locals 4

    .prologue
    .line 104
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/TrackInfo;->mDuration:[I

    iget v1, p0, Lcom/vkontakte/android/audio/player/TrackInfo;->currentIndex:I

    aget v0, v0, v1

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/audio/player/TrackInfo;->mPosition:[I

    iget v1, p0, Lcom/vkontakte/android/audio/player/TrackInfo;->currentIndex:I

    aget v0, v0, v1

    int-to-long v0, v0

    const-wide/16 v2, 0x64

    mul-long/2addr v0, v2

    iget-object v2, p0, Lcom/vkontakte/android/audio/player/TrackInfo;->mDuration:[I

    iget v3, p0, Lcom/vkontakte/android/audio/player/TrackInfo;->currentIndex:I

    aget v2, v2, v3

    int-to-long v2, v2

    div-long/2addr v0, v2

    long-to-int v0, v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getSubTitle()Ljava/lang/String;
    .locals 2

    .prologue
    .line 121
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/TrackInfo;->trackInfoProvider:Lcom/vkontakte/android/audio/player/TrackInfo$TrackInfoProvider;

    iget v1, p0, Lcom/vkontakte/android/audio/player/TrackInfo;->currentIndex:I

    invoke-interface {v0, p0, v1}, Lcom/vkontakte/android/audio/player/TrackInfo$TrackInfoProvider;->getSubtitle(Lcom/vkontakte/android/audio/player/TrackInfo;I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 2

    .prologue
    .line 117
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/TrackInfo;->trackInfoProvider:Lcom/vkontakte/android/audio/player/TrackInfo$TrackInfoProvider;

    iget v1, p0, Lcom/vkontakte/android/audio/player/TrackInfo;->currentIndex:I

    invoke-interface {v0, p0, v1}, Lcom/vkontakte/android/audio/player/TrackInfo$TrackInfoProvider;->getTitle(Lcom/vkontakte/android/audio/player/TrackInfo;I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getTrack()Lcom/vkontakte/android/audio/player/PlayerTrack;
    .locals 1

    .prologue
    .line 47
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/TrackInfo;->mTrack:Lcom/vkontakte/android/audio/player/PlayerTrack;

    return-object v0
.end method

.method public varargs hasAction([Lcom/vkontakte/android/audio/PlayerAction;)Z
    .locals 9
    .param p1, "action"    # [Lcom/vkontakte/android/audio/PlayerAction;

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 125
    iget-object v5, p0, Lcom/vkontakte/android/audio/player/TrackInfo;->trackInfoProvider:Lcom/vkontakte/android/audio/player/TrackInfo$TrackInfoProvider;

    iget v6, p0, Lcom/vkontakte/android/audio/player/TrackInfo;->currentIndex:I

    invoke-interface {v5, p0, v6}, Lcom/vkontakte/android/audio/player/TrackInfo$TrackInfoProvider;->getActions(Lcom/vkontakte/android/audio/player/TrackInfo;I)[Lcom/vkontakte/android/audio/PlayerAction;

    move-result-object v2

    .line 126
    .local v2, "actions":[Lcom/vkontakte/android/audio/PlayerAction;
    if-eqz v2, :cond_3

    .line 127
    array-length v7, v2

    move v6, v4

    :goto_0
    if-ge v6, v7, :cond_3

    aget-object v0, v2, v6

    .line 128
    .local v0, "action1":Lcom/vkontakte/android/audio/PlayerAction;
    array-length v8, p1

    move v5, v4

    :goto_1
    if-ge v5, v8, :cond_2

    aget-object v1, p1, v5

    .line 129
    .local v1, "action2":Lcom/vkontakte/android/audio/PlayerAction;
    if-ne v0, v1, :cond_1

    .line 135
    .end local v0    # "action1":Lcom/vkontakte/android/audio/PlayerAction;
    .end local v1    # "action2":Lcom/vkontakte/android/audio/PlayerAction;
    :cond_0
    :goto_2
    return v3

    .line 128
    .restart local v0    # "action1":Lcom/vkontakte/android/audio/PlayerAction;
    .restart local v1    # "action2":Lcom/vkontakte/android/audio/PlayerAction;
    :cond_1
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 127
    .end local v1    # "action2":Lcom/vkontakte/android/audio/PlayerAction;
    :cond_2
    add-int/lit8 v5, v6, 0x1

    move v6, v5

    goto :goto_0

    .line 135
    .end local v0    # "action1":Lcom/vkontakte/android/audio/PlayerAction;
    :cond_3
    if-eqz v2, :cond_0

    move v3, v4

    goto :goto_2
.end method

.method public hasTrack()Z
    .locals 1

    .prologue
    .line 76
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/TrackInfo;->mTrack:Lcom/vkontakte/android/audio/player/PlayerTrack;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 151
    iget v0, p0, Lcom/vkontakte/android/audio/player/TrackInfo;->hash:I

    if-nez v0, :cond_0

    .line 152
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/TrackInfo;->mTrack:Lcom/vkontakte/android/audio/player/PlayerTrack;

    if-nez v0, :cond_1

    const/4 v0, 0x0

    :goto_0
    iput v0, p0, Lcom/vkontakte/android/audio/player/TrackInfo;->hash:I

    .line 154
    :cond_0
    iget v0, p0, Lcom/vkontakte/android/audio/player/TrackInfo;->hash:I

    return v0

    .line 152
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/TrackInfo;->mTrack:Lcom/vkontakte/android/audio/player/PlayerTrack;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    goto :goto_0
.end method

.method public isContentMode()Z
    .locals 2

    .prologue
    .line 51
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/TrackInfo;->trackInfoProvider:Lcom/vkontakte/android/audio/player/TrackInfo$TrackInfoProvider;

    iget v1, p0, Lcom/vkontakte/android/audio/player/TrackInfo;->currentIndex:I

    invoke-interface {v0, p0, v1}, Lcom/vkontakte/android/audio/player/TrackInfo$TrackInfoProvider;->isContentMode(Lcom/vkontakte/android/audio/player/TrackInfo;I)Z

    move-result v0

    return v0
.end method

.method setBufferingPercent(II)V
    .locals 1
    .param p1, "index"    # I
    .param p2, "percent"    # I

    .prologue
    .line 113
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/TrackInfo;->mBufferingPercent:[I

    aput p2, v0, p1

    .line 114
    return-void
.end method

.method setCurrentIndex(I)V
    .locals 0
    .param p1, "currentIndex"    # I

    .prologue
    .line 55
    iput p1, p0, Lcom/vkontakte/android/audio/player/TrackInfo;->currentIndex:I

    .line 56
    return-void
.end method

.method setDuration(II)V
    .locals 1
    .param p1, "index"    # I
    .param p2, "duration"    # I

    .prologue
    .line 88
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/TrackInfo;->mDuration:[I

    aput p2, v0, p1

    .line 89
    return-void
.end method

.method setPosition(II)V
    .locals 1
    .param p1, "index"    # I
    .param p2, "position"    # I

    .prologue
    .line 100
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/TrackInfo;->mPosition:[I

    aput p2, v0, p1

    .line 101
    return-void
.end method

.method setTrack(Lcom/vkontakte/android/audio/player/PlayerTrack;)V
    .locals 0
    .param p1, "track"    # Lcom/vkontakte/android/audio/player/PlayerTrack;

    .prologue
    .line 59
    iput-object p1, p0, Lcom/vkontakte/android/audio/player/TrackInfo;->mTrack:Lcom/vkontakte/android/audio/player/PlayerTrack;

    .line 60
    return-void
.end method
