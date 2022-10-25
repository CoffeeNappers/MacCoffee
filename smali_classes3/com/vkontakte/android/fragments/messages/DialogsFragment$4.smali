.class Lcom/vkontakte/android/fragments/messages/DialogsFragment$4;
.super Ljava/lang/Object;
.source "DialogsFragment.java"

# interfaces
.implements Lcom/vkontakte/android/data/Messages$GetDialogsCallback;


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
    .line 636
    iput-object p1, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$4;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    iput-boolean p2, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$4;->val$refresh:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method synthetic lambda$onDialogsLoaded$0(ZLjava/util/ArrayList;)V
    .locals 5
    .param p1, "refresh"    # Z
    .param p2, "rdlgs"    # Ljava/util/ArrayList;

    .prologue
    const/4 v2, 0x0

    .line 641
    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$4;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    invoke-static {v1, v2}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$802(Lcom/vkontakte/android/fragments/messages/DialogsFragment;Z)Z

    .line 642
    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$4;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->searchQuery:Ljava/lang/String;

    if-eqz v1, :cond_1

    .line 667
    :cond_0
    :goto_0
    return-void

    .line 645
    :cond_1
    if-eqz p1, :cond_2

    .line 646
    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$4;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$000(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 648
    :cond_2
    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$4;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$000(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 649
    .local v0, "prevSize":I
    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$4;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$000(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 650
    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$4;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$200(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)V

    .line 651
    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$4;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$1100(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)Z

    .line 652
    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$4;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$100(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)V

    .line 653
    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$4;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-eqz v1, :cond_7

    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$4;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$000(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ne v0, v1, :cond_3

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/16 v4, 0x14

    if-le v1, v4, :cond_7

    :cond_3
    const/4 v1, 0x1

    :goto_1
    invoke-static {v3, v1}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$1202(Lcom/vkontakte/android/fragments/messages/DialogsFragment;Z)Z

    .line 654
    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$4;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$1300(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)Lcom/vkontakte/android/ui/LoadMoreFooterView;

    move-result-object v1

    if-eqz v1, :cond_4

    .line 655
    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$4;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$1300(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)Lcom/vkontakte/android/ui/LoadMoreFooterView;

    move-result-object v1

    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$4;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$1200(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)Z

    move-result v3

    invoke-virtual {v1, v3}, Lcom/vkontakte/android/ui/LoadMoreFooterView;->setVisible(Z)V

    .line 657
    :cond_4
    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$4;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$1400(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)Landroid/widget/FrameLayout;

    move-result-object v1

    if-eqz v1, :cond_5

    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$4;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$1400(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)Landroid/widget/FrameLayout;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/FrameLayout;->getVisibility()I

    move-result v1

    if-eqz v1, :cond_5

    .line 658
    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$4;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$1400(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)Landroid/widget/FrameLayout;

    move-result-object v1

    invoke-static {v1, v2}, Lcom/vkontakte/android/ViewUtils;->setVisibilityAnimated(Landroid/view/View;I)V

    .line 659
    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$4;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$1000(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)Landroid/widget/ProgressBar;

    move-result-object v1

    const/16 v2, 0x8

    invoke-static {v1, v2}, Lcom/vkontakte/android/ViewUtils;->setVisibilityAnimated(Landroid/view/View;I)V

    .line 661
    :cond_5
    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$4;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$600(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)Lcom/vkontakte/android/ui/MessagesSearchSuggestionsPopup;

    move-result-object v1

    if-eqz v1, :cond_6

    .line 662
    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$4;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$600(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)Lcom/vkontakte/android/ui/MessagesSearchSuggestionsPopup;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/ui/MessagesSearchSuggestionsPopup;->updateSearchIndex()V

    .line 664
    :cond_6
    if-nez v0, :cond_0

    .line 665
    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$4;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$1500(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)V

    goto/16 :goto_0

    :cond_7
    move v1, v2

    .line 653
    goto :goto_1
.end method

.method synthetic lambda$onError$1(ILjava/lang/String;)V
    .locals 2
    .param p1, "ecode"    # I
    .param p2, "emsg"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 678
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$4;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$802(Lcom/vkontakte/android/fragments/messages/DialogsFragment;Z)Z

    .line 679
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$4;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->searchQuery:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 691
    :goto_0
    return-void

    .line 682
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$4;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$000(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_2

    .line 683
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$4;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$900(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)Lcom/vkontakte/android/ui/ErrorViewHelper;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 684
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$4;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$900(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)Lcom/vkontakte/android/ui/ErrorViewHelper;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/vkontakte/android/ui/ErrorViewHelper;->setErrorInfo(ILjava/lang/String;)V

    .line 686
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$4;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$900(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)Lcom/vkontakte/android/ui/ErrorViewHelper;

    move-result-object v0

    invoke-static {v0, v1}, Lcom/vkontakte/android/ui/ErrorViewHelper;->setVisibilityAnimated(Lcom/vkontakte/android/ui/ErrorViewHelper;I)V

    .line 687
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$4;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$1000(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)Landroid/widget/ProgressBar;

    move-result-object v0

    const/16 v1, 0x8

    invoke-static {v0, v1}, Lcom/vkontakte/android/ViewUtils;->setVisibilityAnimated(Landroid/view/View;I)V

    goto :goto_0

    .line 689
    :cond_2
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$4;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0, p1, p2}, Lcom/vkontakte/android/api/APIUtils;->showErrorToast(Landroid/content/Context;ILjava/lang/String;)V

    goto :goto_0
.end method

.method public onDialogsLoaded(Ljava/util/ArrayList;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/DialogEntry;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 639
    .local p1, "rdlgs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/DialogEntry;>;"
    if-eqz p1, :cond_0

    .line 640
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$4;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    iget-boolean v1, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$4;->val$refresh:Z

    invoke-static {p0, v1, p1}, Lcom/vkontakte/android/fragments/messages/DialogsFragment$4$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/fragments/messages/DialogsFragment$4;ZLjava/util/ArrayList;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/ViewUtils;->runOnUiThread(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 671
    :goto_0
    return-void

    .line 669
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$4;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$802(Lcom/vkontakte/android/fragments/messages/DialogsFragment;Z)Z

    goto :goto_0
.end method

.method public onError(ILjava/lang/String;)V
    .locals 2
    .param p1, "ecode"    # I
    .param p2, "emsg"    # Ljava/lang/String;

    .prologue
    .line 674
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$4;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    if-nez v0, :cond_0

    .line 675
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$4;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$802(Lcom/vkontakte/android/fragments/messages/DialogsFragment;Z)Z

    .line 693
    :goto_0
    return-void

    .line 677
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$4;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {p0, p1, p2}, Lcom/vkontakte/android/fragments/messages/DialogsFragment$4$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/fragments/messages/DialogsFragment$4;ILjava/lang/String;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method
