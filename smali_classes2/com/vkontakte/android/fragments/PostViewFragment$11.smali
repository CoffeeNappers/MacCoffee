.class Lcom/vkontakte/android/fragments/PostViewFragment$11;
.super Ljava/lang/Object;
.source "PostViewFragment.java"

# interfaces
.implements Lcom/vkontakte/android/ui/controllers/ReplyBarController$Delegate;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/PostViewFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

.field final synthetic val$replyBarView:Landroid/view/View;

.field final synthetic val$restrictToAdminedGroup:Z


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/PostViewFragment;ZLandroid/view/View;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/PostViewFragment;

    .prologue
    .line 819
    iput-object p1, p0, Lcom/vkontakte/android/fragments/PostViewFragment$11;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    iput-boolean p2, p0, Lcom/vkontakte/android/fragments/PostViewFragment$11;->val$restrictToAdminedGroup:Z

    iput-object p3, p0, Lcom/vkontakte/android/fragments/PostViewFragment$11;->val$replyBarView:Landroid/view/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTextFromClick()V
    .locals 6

    .prologue
    .line 828
    new-instance v1, Lcom/vk/sharing/Picking$Builder;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/PostViewFragment$11;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/PostViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/vk/sharing/Picking$Builder;-><init>(Landroid/content/Context;)V

    iget-object v2, p0, Lcom/vkontakte/android/fragments/PostViewFragment$11;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    .line 829
    invoke-static {v2}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$000(Lcom/vkontakte/android/fragments/PostViewFragment;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v2

    iget v2, v2, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    neg-int v2, v2

    invoke-virtual {v1, v2}, Lcom/vk/sharing/Picking$Builder;->adminedGroupId(I)Lcom/vk/sharing/Picking$Builder;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/PostViewFragment$11;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    .line 830
    invoke-static {v2}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$1900(Lcom/vkontakte/android/fragments/PostViewFragment;)I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/vk/sharing/Picking$Builder;->preselectGroup(I)Lcom/vk/sharing/Picking$Builder;

    move-result-object v0

    .line 832
    .local v0, "builder":Lcom/vk/sharing/Picking$Builder;
    iget-boolean v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment$11;->val$restrictToAdminedGroup:Z

    if-eqz v1, :cond_0

    .line 833
    invoke-virtual {v0}, Lcom/vk/sharing/Picking$Builder;->restrictToAdminedGroup()Lcom/vk/sharing/Picking$Builder;

    .line 836
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment$11;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$1000(Lcom/vkontakte/android/fragments/PostViewFragment;)Lcom/vkontakte/android/stickers/KeyboardPopup;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/stickers/KeyboardPopup;->getKeyboardVisible()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 837
    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment$11;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/PostViewFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/vk/core/util/KeyboardUtils;->hideKeyboard(Landroid/content/Context;)V

    .line 839
    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment$11;->val$replyBarView:Landroid/view/View;

    new-instance v2, Lcom/vkontakte/android/fragments/PostViewFragment$11$1;

    invoke-direct {v2, p0, v0}, Lcom/vkontakte/android/fragments/PostViewFragment$11$1;-><init>(Lcom/vkontakte/android/fragments/PostViewFragment$11;Lcom/vk/sharing/Picking$Builder;)V

    const-wide/16 v4, 0x12c

    invoke-virtual {v1, v2, v4, v5}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 848
    :goto_0
    return-void

    .line 846
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment$11;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    const/16 v2, 0x10eb

    invoke-virtual {v0, v1, v2}, Lcom/vk/sharing/Picking$Builder;->pick(Landroid/app/Fragment;I)V

    goto :goto_0
.end method

.method public onTextToReset()V
    .locals 1

    .prologue
    .line 822
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$11;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$1800(Lcom/vkontakte/android/fragments/PostViewFragment;)V

    .line 823
    return-void
.end method

.method public onViewVisibilityChanged(I)V
    .locals 1
    .param p1, "newVisibility"    # I

    .prologue
    .line 852
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$11;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$1100(Lcom/vkontakte/android/fragments/PostViewFragment;)Lcom/vkontakte/android/ui/WriteBar;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/ui/WriteBar;->handleReplyBarVisibilityChange(I)V

    .line 853
    return-void
.end method
