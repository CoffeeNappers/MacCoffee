.class Lcom/vkontakte/android/fragments/LeaderboardFragment$ViewHolder$1;
.super Ljava/lang/Object;
.source "LeaderboardFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/LeaderboardFragment$ViewHolder;-><init>(Lcom/vkontakte/android/fragments/LeaderboardFragment;Landroid/view/ViewGroup;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vkontakte/android/fragments/LeaderboardFragment$ViewHolder;

.field final synthetic val$this$0:Lcom/vkontakte/android/fragments/LeaderboardFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/LeaderboardFragment$ViewHolder;Lcom/vkontakte/android/fragments/LeaderboardFragment;)V
    .locals 0
    .param p1, "this$1"    # Lcom/vkontakte/android/fragments/LeaderboardFragment$ViewHolder;

    .prologue
    .line 267
    iput-object p1, p0, Lcom/vkontakte/android/fragments/LeaderboardFragment$ViewHolder$1;->this$1:Lcom/vkontakte/android/fragments/LeaderboardFragment$ViewHolder;

    iput-object p2, p0, Lcom/vkontakte/android/fragments/LeaderboardFragment$ViewHolder$1;->val$this$0:Lcom/vkontakte/android/fragments/LeaderboardFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 270
    iget-object v0, p0, Lcom/vkontakte/android/fragments/LeaderboardFragment$ViewHolder$1;->this$1:Lcom/vkontakte/android/fragments/LeaderboardFragment$ViewHolder;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/LeaderboardFragment$ViewHolder;->access$300(Lcom/vkontakte/android/fragments/LeaderboardFragment$ViewHolder;)Lcom/vkontakte/android/data/GameLeaderboard;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 271
    new-instance v0, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/LeaderboardFragment$ViewHolder$1;->this$1:Lcom/vkontakte/android/fragments/LeaderboardFragment$ViewHolder;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/LeaderboardFragment$ViewHolder;->access$300(Lcom/vkontakte/android/fragments/LeaderboardFragment$ViewHolder;)Lcom/vkontakte/android/data/GameLeaderboard;

    move-result-object v1

    iget v1, v1, Lcom/vkontakte/android/data/GameLeaderboard;->userId:I

    invoke-direct {v0, v1}, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;-><init>(I)V

    iget-object v1, p0, Lcom/vkontakte/android/fragments/LeaderboardFragment$ViewHolder$1;->this$1:Lcom/vkontakte/android/fragments/LeaderboardFragment$ViewHolder;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/LeaderboardFragment$ViewHolder;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;->go(Landroid/content/Context;)Z

    .line 273
    :cond_0
    return-void
.end method
