.class Lcom/vkontakte/android/fragments/HtmlGameFragment$7;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "HtmlGameFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/HtmlGameFragment;->doShowLeaderboard(II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/SimpleCallback",
        "<",
        "Lcom/vkontakte/android/api/apps/AppsGetGameLeaderboard$LeaderboardData;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/HtmlGameFragment;

.field final synthetic val$applicationId:I

.field final synthetic val$currentPointsOrLevel:I


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/HtmlGameFragment;Landroid/content/Context;II)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/HtmlGameFragment;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 685
    iput-object p1, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$7;->this$0:Lcom/vkontakte/android/fragments/HtmlGameFragment;

    iput p3, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$7;->val$currentPointsOrLevel:I

    iput p4, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$7;->val$applicationId:I

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/SimpleCallback;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 2
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 709
    invoke-super {p0, p1}, Lcom/vkontakte/android/api/SimpleCallback;->fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V

    .line 710
    iget-object v0, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$7;->this$0:Lcom/vkontakte/android/fragments/HtmlGameFragment;

    const-string/jumbo v1, "fail"

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->access$1500(Lcom/vkontakte/android/fragments/HtmlGameFragment;Ljava/lang/String;)V

    .line 711
    return-void
.end method

.method public success(Lcom/vkontakte/android/api/apps/AppsGetGameLeaderboard$LeaderboardData;)V
    .locals 5
    .param p1, "result"    # Lcom/vkontakte/android/api/apps/AppsGetGameLeaderboard$LeaderboardData;

    .prologue
    .line 688
    iget-object v2, p1, Lcom/vkontakte/android/api/apps/AppsGetGameLeaderboard$LeaderboardData;->leaderboard:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_0

    iget-object v2, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$7;->this$0:Lcom/vkontakte/android/fragments/HtmlGameFragment;

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 690
    iget v2, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$7;->val$currentPointsOrLevel:I

    iput v2, p1, Lcom/vkontakte/android/api/apps/AppsGetGameLeaderboard$LeaderboardData;->userLevelOrPointsCurrent:I

    .line 691
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 692
    .local v0, "b":Landroid/os/Bundle;
    const-string/jumbo v2, "leaderboard_data"

    invoke-virtual {v0, v2, p1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 694
    new-instance v1, Lcom/vkontakte/android/fragments/LeaderboardFragment;

    invoke-direct {v1}, Lcom/vkontakte/android/fragments/LeaderboardFragment;-><init>()V

    .line 695
    .local v1, "leaderboardFragment":Lcom/vkontakte/android/fragments/LeaderboardFragment;
    invoke-virtual {v1, v0}, Lcom/vkontakte/android/fragments/LeaderboardFragment;->setArguments(Landroid/os/Bundle;)V

    .line 697
    iget-object v2, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$7;->this$0:Lcom/vkontakte/android/fragments/HtmlGameFragment;

    iput-object v2, v1, Lcom/vkontakte/android/fragments/LeaderboardFragment;->dismissedListener:Lcom/vkontakte/android/fragments/LeaderboardFragment$OnDismissedListener;

    .line 699
    iget-object v2, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$7;->this$0:Lcom/vkontakte/android/fragments/HtmlGameFragment;

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    check-cast v2, Landroid/support/v4/app/FragmentActivity;

    invoke-virtual {v2}, Landroid/support/v4/app/FragmentActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v2

    const-string/jumbo v3, ""

    invoke-virtual {v1, v2, v3}, Lcom/vkontakte/android/fragments/LeaderboardFragment;->show(Landroid/support/v4/app/FragmentManager;Ljava/lang/String;)V

    .line 705
    .end local v0    # "b":Landroid/os/Bundle;
    .end local v1    # "leaderboardFragment":Lcom/vkontakte/android/fragments/LeaderboardFragment;
    :goto_0
    return-void

    .line 702
    :cond_0
    invoke-static {}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->access$000()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "No data for leaderboard appId = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$7;->val$applicationId:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 703
    iget-object v2, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$7;->this$0:Lcom/vkontakte/android/fragments/HtmlGameFragment;

    const-string/jumbo v3, "fail"

    invoke-static {v2, v3}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->access$1500(Lcom/vkontakte/android/fragments/HtmlGameFragment;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 685
    check-cast p1, Lcom/vkontakte/android/api/apps/AppsGetGameLeaderboard$LeaderboardData;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/HtmlGameFragment$7;->success(Lcom/vkontakte/android/api/apps/AppsGetGameLeaderboard$LeaderboardData;)V

    return-void
.end method
