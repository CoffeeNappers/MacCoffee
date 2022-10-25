.class Lcom/vkontakte/android/fragments/messages/DialogsFragment$5;
.super Ljava/lang/Object;
.source "DialogsFragment.java"

# interfaces
.implements Lcom/vkontakte/android/data/Messages$SearchCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/messages/DialogsFragment;->loadData(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

.field final synthetic val$refresh:Z


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/messages/DialogsFragment;Z)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    .prologue
    .line 696
    iput-object p1, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$5;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    iput-boolean p2, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$5;->val$refresh:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method synthetic lambda$onDialogsLoaded$1(ZLjava/util/ArrayList;I)V
    .locals 3
    .param p1, "refresh"    # Z
    .param p2, "dlgs"    # Ljava/util/ArrayList;
    .param p3, "total"    # I

    .prologue
    const/4 v2, 0x0

    .line 724
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$5;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    invoke-static {v0, v2}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$802(Lcom/vkontakte/android/fragments/messages/DialogsFragment;Z)Z

    .line 725
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$5;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->searchQuery:Ljava/lang/String;

    if-nez v0, :cond_1

    .line 746
    :cond_0
    :goto_0
    return-void

    .line 728
    :cond_1
    if-eqz p1, :cond_2

    .line 729
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$5;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$1600(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 732
    :cond_2
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$5;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$1600(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 733
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$5;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$100(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)V

    .line 734
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$5;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$1600(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lt v0, p3, :cond_5

    .line 735
    :cond_3
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$5;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    invoke-static {v0, v2}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$1202(Lcom/vkontakte/android/fragments/messages/DialogsFragment;Z)Z

    .line 739
    :goto_1
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$5;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$1300(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)Lcom/vkontakte/android/ui/LoadMoreFooterView;

    move-result-object v0

    if-eqz v0, :cond_4

    .line 740
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$5;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$1300(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)Lcom/vkontakte/android/ui/LoadMoreFooterView;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$5;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$1200(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/LoadMoreFooterView;->setVisible(Z)V

    .line 742
    :cond_4
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$5;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$1400(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)Landroid/widget/FrameLayout;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$5;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$1400(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)Landroid/widget/FrameLayout;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getVisibility()I

    move-result v0

    if-eqz v0, :cond_0

    .line 743
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$5;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$1400(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)Landroid/widget/FrameLayout;

    move-result-object v0

    invoke-static {v0, v2}, Lcom/vkontakte/android/ViewUtils;->setVisibilityAnimated(Landroid/view/View;I)V

    .line 744
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$5;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$1000(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)Landroid/widget/ProgressBar;

    move-result-object v0

    const/16 v1, 0x8

    invoke-static {v0, v1}, Lcom/vkontakte/android/ViewUtils;->setVisibilityAnimated(Landroid/view/View;I)V

    goto :goto_0

    .line 737
    :cond_5
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$5;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$1202(Lcom/vkontakte/android/fragments/messages/DialogsFragment;Z)Z

    goto :goto_1
.end method

.method synthetic lambda$onError$0(ILjava/lang/String;)V
    .locals 2
    .param p1, "ecode"    # I
    .param p2, "emsg"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 703
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$5;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$802(Lcom/vkontakte/android/fragments/messages/DialogsFragment;Z)Z

    .line 704
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$5;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->searchQuery:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 716
    :goto_0
    return-void

    .line 707
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$5;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$1600(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_2

    .line 708
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$5;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$900(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)Lcom/vkontakte/android/ui/ErrorViewHelper;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 709
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$5;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$900(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)Lcom/vkontakte/android/ui/ErrorViewHelper;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/vkontakte/android/ui/ErrorViewHelper;->setErrorInfo(ILjava/lang/String;)V

    .line 711
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$5;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$900(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)Lcom/vkontakte/android/ui/ErrorViewHelper;

    move-result-object v0

    invoke-static {v0, v1}, Lcom/vkontakte/android/ui/ErrorViewHelper;->setVisibilityAnimated(Lcom/vkontakte/android/ui/ErrorViewHelper;I)V

    .line 712
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$5;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$1000(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)Landroid/widget/ProgressBar;

    move-result-object v0

    const/16 v1, 0x8

    invoke-static {v0, v1}, Lcom/vkontakte/android/ViewUtils;->setVisibilityAnimated(Landroid/view/View;I)V

    goto :goto_0

    .line 714
    :cond_2
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$5;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0, p1, p2}, Lcom/vkontakte/android/api/APIUtils;->showErrorToast(Landroid/content/Context;ILjava/lang/String;)V

    goto :goto_0
.end method

.method public onDialogsLoaded(Ljava/util/ArrayList;I)V
    .locals 2
    .param p2, "total"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/DialogEntry;",
            ">;I)V"
        }
    .end annotation

    .prologue
    .line 722
    .local p1, "dlgs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/DialogEntry;>;"
    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$5;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 723
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$5;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    iget-boolean v1, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$5;->val$refresh:Z

    invoke-static {p0, v1, p1, p2}, Lcom/vkontakte/android/fragments/messages/DialogsFragment$5$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/fragments/messages/DialogsFragment$5;ZLjava/util/ArrayList;I)Ljava/lang/Runnable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 750
    :goto_0
    return-void

    .line 748
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$5;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$802(Lcom/vkontakte/android/fragments/messages/DialogsFragment;Z)Z

    goto :goto_0
.end method

.method public onError(ILjava/lang/String;)V
    .locals 2
    .param p1, "ecode"    # I
    .param p2, "emsg"    # Ljava/lang/String;

    .prologue
    .line 699
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$5;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    if-nez v0, :cond_0

    .line 700
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$5;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$802(Lcom/vkontakte/android/fragments/messages/DialogsFragment;Z)Z

    .line 718
    :goto_0
    return-void

    .line 702
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$5;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {p0, p1, p2}, Lcom/vkontakte/android/fragments/messages/DialogsFragment$5$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/fragments/messages/DialogsFragment$5;ILjava/lang/String;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method
