.class Lcom/vkontakte/android/activities/VideoPlayerActivity$6;
.super Ljava/lang/Object;
.source "VideoPlayerActivity.java"

# interfaces
.implements Landroid/support/v7/widget/PopupMenu$OnMenuItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/activities/VideoPlayerActivity;->createUI(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/activities/VideoPlayerActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/activities/VideoPlayerActivity;

    .prologue
    .line 225
    iput-object p1, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$6;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onMenuItemClick(Landroid/view/MenuItem;)Z
    .locals 3
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 228
    invoke-static {}, Lcom/vkontakte/android/utils/Utils;->getNetworkType()Ljava/lang/String;

    move-result-object v1

    .line 229
    .local v1, "netType":Ljava/lang/String;
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    .line 230
    .local v0, "itemId":I
    invoke-static {v0, v1}, Lcom/vkontakte/android/cache/Videos;->saveUsersChoice(ILjava/lang/String;)Z

    .line 231
    iget-object v2, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$6;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    invoke-virtual {v2, v0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->switchQuality(I)V

    .line 232
    const/4 v2, 0x1

    return v2
.end method
