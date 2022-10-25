.class Lcom/vkontakte/android/fragments/AudioListFragment$5;
.super Ljava/lang/Object;
.source "AudioListFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/AudioListFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/AudioListFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/AudioListFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/AudioListFragment;

    .prologue
    .line 526
    iput-object p1, p0, Lcom/vkontakte/android/fragments/AudioListFragment$5;->this$0:Lcom/vkontakte/android/fragments/AudioListFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 530
    :try_start_0
    iget-object v1, p0, Lcom/vkontakte/android/fragments/AudioListFragment$5;->this$0:Lcom/vkontakte/android/fragments/AudioListFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/AudioListFragment;->access$1500(Lcom/vkontakte/android/fragments/AudioListFragment;)Lme/grishka/appkit/views/UsableRecyclerView;

    move-result-object v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/AudioListFragment$5;->this$0:Lcom/vkontakte/android/fragments/AudioListFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/AudioListFragment;->access$1600(Lcom/vkontakte/android/fragments/AudioListFragment;)Lme/grishka/appkit/views/UsableRecyclerView;

    move-result-object v1

    invoke-virtual {v1}, Lme/grishka/appkit/views/UsableRecyclerView;->isComputingLayout()Z

    move-result v1

    if-nez v1, :cond_2

    .line 531
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/fragments/AudioListFragment$5;->this$0:Lcom/vkontakte/android/fragments/AudioListFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/AudioListFragment;->access$1700(Lcom/vkontakte/android/fragments/AudioListFragment;)V

    .line 540
    :cond_1
    :goto_0
    return-void

    .line 532
    :cond_2
    iget-object v1, p0, Lcom/vkontakte/android/fragments/AudioListFragment$5;->this$0:Lcom/vkontakte/android/fragments/AudioListFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/AudioListFragment;->isResumed()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 533
    invoke-static {p0}, Lcom/vkontakte/android/ViewUtils;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 534
    const-wide/16 v2, 0xc8

    invoke-static {p0, v2, v3}, Lcom/vkontakte/android/ViewUtils;->postDelayed(Ljava/lang/Runnable;J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 536
    :catch_0
    move-exception v0

    .line 537
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    .line 538
    invoke-static {v0}, Lcom/vk/analytics/Analytics;->logException(Ljava/lang/Throwable;)V

    goto :goto_0
.end method
