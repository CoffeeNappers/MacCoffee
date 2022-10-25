.class public Lcom/vk/analytics/AnalyticsEvent$MediaCameraEvent;
.super Lcom/vk/analytics/AnalyticsEvent;
.source "AnalyticsEvent.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/analytics/AnalyticsEvent;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "MediaCameraEvent"
.end annotation


# static fields
.field public static final BAD_FPS:I = 0xe

.field private static final BAD_SUFFIX:Ljava/lang/String; = "_BAD"

.field private static final EVENTS_COLLECT:I = 0x4

.field public static final GOOD_FPS:I = 0x14

.field private static final UGLY_SUFFIX:Ljava/lang/String; = "_UGLY"

.field private static sSuccessEventCounter:I


# instance fields
.field private mEventName:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 97
    const/4 v0, 0x0

    sput v0, Lcom/vk/analytics/AnalyticsEvent$MediaCameraEvent;->sSuccessEventCounter:I

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 99
    invoke-direct {p0}, Lcom/vk/analytics/AnalyticsEvent;-><init>()V

    .line 100
    const-string/jumbo v0, "SUCCESS_CAMERA"

    iput-object v0, p0, Lcom/vk/analytics/AnalyticsEvent$MediaCameraEvent;->mName:Ljava/lang/String;

    .line 101
    sget v0, Lcom/vk/analytics/AnalyticsEvent$MediaCameraEvent;->sSuccessEventCounter:I

    add-int/lit8 v0, v0, 0x1

    sput v0, Lcom/vk/analytics/AnalyticsEvent$MediaCameraEvent;->sSuccessEventCounter:I

    .line 102
    return-void
.end method


# virtual methods
.method public fill(ILjava/util/ArrayList;)V
    .locals 6
    .param p1, "fps"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p2, "stat":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const/16 v5, 0xe

    .line 105
    invoke-virtual {p2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_2

    .line 106
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 107
    .local v1, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 108
    .local v0, "event":Ljava/lang/String;
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 110
    .end local v0    # "event":Ljava/lang/String;
    :cond_0
    invoke-virtual {p0}, Lcom/vk/analytics/AnalyticsEvent$MediaCameraEvent;->params()Landroid/os/Bundle;

    move-result-object v2

    const-string/jumbo v3, "key_cam_fps"

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 111
    if-lt p1, v5, :cond_3

    const/16 v2, 0x14

    if-ge p1, v2, :cond_3

    .line 112
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/vk/analytics/AnalyticsEvent$MediaCameraEvent;->mName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "_BAD"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/vk/analytics/AnalyticsEvent$MediaCameraEvent;->mEventName:Ljava/lang/String;

    .line 116
    :cond_1
    :goto_1
    iget-object v2, p0, Lcom/vk/analytics/AnalyticsEvent$MediaCameraEvent;->mTags:Ljava/util/HashMap;

    const-string/jumbo v3, "key_cam_fps"

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 118
    .end local v1    # "sb":Ljava/lang/StringBuilder;
    :cond_2
    return-void

    .line 113
    .restart local v1    # "sb":Ljava/lang/StringBuilder;
    :cond_3
    if-ge p1, v5, :cond_1

    .line 114
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/vk/analytics/AnalyticsEvent$MediaCameraEvent;->mName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "_UGLY"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/vk/analytics/AnalyticsEvent$MediaCameraEvent;->mEventName:Ljava/lang/String;

    goto :goto_1
.end method

.method public getEventName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 122
    iget-object v0, p0, Lcom/vk/analytics/AnalyticsEvent$MediaCameraEvent;->mEventName:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/vk/analytics/AnalyticsEvent$MediaCameraEvent;->mEventName:Ljava/lang/String;

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/vk/analytics/AnalyticsEvent$MediaCameraEvent;->mName:Ljava/lang/String;

    goto :goto_0
.end method

.method public isReady()Z
    .locals 2

    .prologue
    .line 127
    sget v0, Lcom/vk/analytics/AnalyticsEvent$MediaCameraEvent;->sSuccessEventCounter:I

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
