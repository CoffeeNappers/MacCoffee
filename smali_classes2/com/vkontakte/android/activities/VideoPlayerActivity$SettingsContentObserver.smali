.class public Lcom/vkontakte/android/activities/VideoPlayerActivity$SettingsContentObserver;
.super Landroid/database/ContentObserver;
.source "VideoPlayerActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/activities/VideoPlayerActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "SettingsContentObserver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/activities/VideoPlayerActivity;Landroid/os/Handler;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/activities/VideoPlayerActivity;
    .param p2, "handler"    # Landroid/os/Handler;

    .prologue
    .line 1324
    iput-object p1, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$SettingsContentObserver;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    .line 1325
    invoke-direct {p0, p2}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    .line 1326
    return-void
.end method


# virtual methods
.method public onChange(Z)V
    .locals 1
    .param p1, "selfChange"    # Z

    .prologue
    .line 1330
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$SettingsContentObserver;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    invoke-static {v0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->access$700(Lcom/vkontakte/android/activities/VideoPlayerActivity;)V

    .line 1331
    return-void
.end method
