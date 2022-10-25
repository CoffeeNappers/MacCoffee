.class public Lcom/vkontakte/android/media/ExoVideoPlayer$VideoRenderer$Settings;
.super Ljava/lang/Object;
.source "ExoVideoPlayer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/media/ExoVideoPlayer$VideoRenderer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Settings"
.end annotation


# static fields
.field static final instance:Lcom/vkontakte/android/media/ExoVideoPlayer$VideoRenderer$Settings;


# instance fields
.field aboveScreenResolutionDisable:Z

.field adaptiveDisable:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 597
    new-instance v0, Lcom/vkontakte/android/media/ExoVideoPlayer$VideoRenderer$Settings;

    invoke-direct {v0}, Lcom/vkontakte/android/media/ExoVideoPlayer$VideoRenderer$Settings;-><init>()V

    sput-object v0, Lcom/vkontakte/android/media/ExoVideoPlayer$VideoRenderer$Settings;->instance:Lcom/vkontakte/android/media/ExoVideoPlayer$VideoRenderer$Settings;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 596
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 598
    iput-boolean v0, p0, Lcom/vkontakte/android/media/ExoVideoPlayer$VideoRenderer$Settings;->aboveScreenResolutionDisable:Z

    .line 599
    iput-boolean v0, p0, Lcom/vkontakte/android/media/ExoVideoPlayer$VideoRenderer$Settings;->adaptiveDisable:Z

    return-void
.end method
