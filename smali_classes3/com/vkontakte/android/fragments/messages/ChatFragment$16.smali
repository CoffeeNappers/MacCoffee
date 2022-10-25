.class Lcom/vkontakte/android/fragments/messages/ChatFragment$16;
.super Ljava/lang/Object;
.source "ChatFragment.java"

# interfaces
.implements Lcom/vkontakte/android/data/Messages$GetMessagesCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/messages/ChatFragment;->loadDataUp(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

.field final synthetic val$fromUnread:Z

.field final synthetic val$startTime:J


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/messages/ChatFragment;ZJ)V
    .locals 1
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/messages/ChatFragment;

    .prologue
    .line 1985
    iput-object p1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    iput-boolean p2, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->val$fromUnread:Z

    iput-wide p3, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->val$startTime:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method synthetic lambda$onError$1(ILjava/lang/String;)V
    .locals 2
    .param p1, "code"    # I
    .param p2, "msg"    # Ljava/lang/String;

    .prologue
    const/16 v1, 0x8

    .line 2118
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$5800(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Lcom/vkontakte/android/ui/ErrorViewHelper;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$400(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Lcom/vkontakte/android/ui/widget/ChatRecyclerView;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 2119
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$5800(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Lcom/vkontakte/android/ui/ErrorViewHelper;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/vkontakte/android/ui/ErrorViewHelper;->setErrorInfo(ILjava/lang/String;)V

    .line 2120
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$400(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Lcom/vkontakte/android/ui/widget/ChatRecyclerView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/widget/ChatRecyclerView;->clearAnimation()V

    .line 2122
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$2800(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Lcom/vkontakte/android/ui/widget/MessagesTimesList;

    move-result-object v0

    invoke-static {v0, v1}, Lcom/vkontakte/android/ViewUtils;->setVisibility(Landroid/view/View;I)V

    .line 2123
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$2700(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Landroid/widget/ProgressBar;

    move-result-object v0

    invoke-static {v0, v1}, Lcom/vkontakte/android/ViewUtils;->setVisibilityAnimated(Landroid/view/View;I)V

    .line 2124
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$5800(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Lcom/vkontakte/android/ui/ErrorViewHelper;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/ui/ErrorViewHelper;->setVisibilityAnimated(Lcom/vkontakte/android/ui/ErrorViewHelper;I)V

    .line 2125
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$3600(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Lcom/vkontakte/android/ui/WriteBar;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 2126
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$3600(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Lcom/vkontakte/android/ui/WriteBar;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/WriteBar;->setErrorViewShown(Z)V

    .line 2128
    :cond_1
    return-void
.end method

.method synthetic lambda$onError$2(ILjava/lang/String;)V
    .locals 3
    .param p1, "code"    # I
    .param p2, "msg"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x1

    .line 2133
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v0, v2}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$2302(Lcom/vkontakte/android/fragments/messages/ChatFragment;Z)Z

    .line 2134
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0, p1, p2}, Lcom/vkontakte/android/api/APIUtils;->showErrorToast(Landroid/content/Context;ILjava/lang/String;)V

    .line 2135
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$4500(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;->setVisibilityLoadMoreButton(I)V

    .line 2136
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$4500(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;->setVisibilityProgressBar(I)V

    .line 2137
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$3800(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$3800(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    .line 2138
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$3800(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/view/View;->setEnabled(Z)V

    .line 2140
    :cond_0
    return-void
.end method

.method synthetic lambda$onMessagesLoaded$0(ZLjava/util/ArrayList;J)V
    .locals 11
    .param p1, "fromUnread"    # Z
    .param p2, "msgs"    # Ljava/util/ArrayList;
    .param p3, "startTime"    # J

    .prologue
    .line 2021
    iget-object v6, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v6}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$3800(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Landroid/view/View;

    move-result-object v6

    if-eqz v6, :cond_2

    iget-object v6, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v6}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$3800(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Landroid/view/View;

    move-result-object v6

    invoke-virtual {v6}, Landroid/view/View;->getVisibility()I

    move-result v6

    if-nez v6, :cond_2

    const/4 v0, 0x1

    .line 2022
    .local v0, "btnVisible":Z
    :goto_0
    iget-object v6, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v6}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$3800(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Landroid/view/View;

    move-result-object v6

    if-eqz v6, :cond_0

    if-nez v0, :cond_0

    iget-object v6, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v6}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$1000(Lcom/vkontakte/android/fragments/messages/ChatFragment;)I

    move-result v6

    if-lez v6, :cond_0

    .line 2023
    iget-object v6, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v6}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$3800(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Landroid/view/View;

    move-result-object v6

    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Landroid/view/View;->setVisibility(I)V

    .line 2025
    :cond_0
    if-nez p1, :cond_1

    .line 2026
    iget-object v6, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v6}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$100(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/ArrayList;->clear()V

    .line 2028
    :cond_1
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 2029
    .local v4, "mids":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    iget-object v6, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v6}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$000(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_1
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_3

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vkontakte/android/Message;

    .line 2030
    .local v3, "m":Lcom/vkontakte/android/Message;
    iget v7, v3, Lcom/vkontakte/android/Message;->id:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 2021
    .end local v0    # "btnVisible":Z
    .end local v3    # "m":Lcom/vkontakte/android/Message;
    .end local v4    # "mids":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    :cond_2
    const/4 v0, 0x0

    goto :goto_0

    .line 2032
    .restart local v0    # "btnVisible":Z
    .restart local v4    # "mids":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    :cond_3
    iget-object v6, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v6}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$2400(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_2
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_4

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vkontakte/android/Message;

    .line 2033
    .restart local v3    # "m":Lcom/vkontakte/android/Message;
    iget v7, v3, Lcom/vkontakte/android/Message;->id:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 2035
    .end local v3    # "m":Lcom/vkontakte/android/Message;
    :cond_4
    invoke-virtual {p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 2036
    .local v2, "imsgs":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/vkontakte/android/Message;>;"
    :goto_3
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_6

    .line 2037
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vkontakte/android/Message;

    .line 2038
    .restart local v3    # "m":Lcom/vkontakte/android/Message;
    iget v6, v3, Lcom/vkontakte/android/Message;->id:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_5

    .line 2039
    invoke-interface {v2}, Ljava/util/Iterator;->remove()V

    goto :goto_3

    .line 2041
    :cond_5
    iget v6, v3, Lcom/vkontakte/android/Message;->id:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 2044
    .end local v3    # "m":Lcom/vkontakte/android/Message;
    :cond_6
    iget-object v6, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v6}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$000(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-nez v6, :cond_7

    .line 2045
    iget-object v6, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v6}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$5800(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Lcom/vkontakte/android/ui/ErrorViewHelper;

    move-result-object v6

    const/16 v7, 0x8

    invoke-static {v6, v7}, Lcom/vkontakte/android/ui/ErrorViewHelper;->setVisibility(Lcom/vkontakte/android/ui/ErrorViewHelper;I)V

    .line 2046
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    sub-long/2addr v6, p3

    const-wide/16 v8, 0x64

    cmp-long v6, v6, v8

    if-gez v6, :cond_9

    .line 2047
    iget-object v6, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v6}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$2800(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Lcom/vkontakte/android/ui/widget/MessagesTimesList;

    move-result-object v6

    const/4 v7, 0x0

    invoke-static {v6, v7}, Lcom/vkontakte/android/ViewUtils;->setVisibility(Landroid/view/View;I)V

    .line 2048
    iget-object v6, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v6}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$2700(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Landroid/widget/ProgressBar;

    move-result-object v6

    const/16 v7, 0x8

    invoke-static {v6, v7}, Lcom/vkontakte/android/ViewUtils;->setVisibility(Landroid/view/View;I)V

    .line 2054
    :cond_7
    :goto_4
    iget-object v7, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    iget-object v6, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v6}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$1000(Lcom/vkontakte/android/fragments/messages/ChatFragment;)I

    move-result v6

    if-lez v6, :cond_a

    const/4 v6, 0x1

    :goto_5
    invoke-static {v7, v6}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$4802(Lcom/vkontakte/android/fragments/messages/ChatFragment;Z)Z

    .line 2055
    iget-object v6, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v6}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$4800(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Z

    move-result v6

    if-nez v6, :cond_8

    .line 2056
    iget-object v6, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v6}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$5100(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;

    move-result-object v6

    const/16 v7, 0x8

    invoke-virtual {v6, v7}, Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;->setVisibilityLoadMoreButton(I)V

    .line 2057
    iget-object v6, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v6}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$5100(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;

    move-result-object v6

    const/16 v7, 0x8

    invoke-virtual {v6, v7}, Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;->setVisibilityProgressBar(I)V

    .line 2059
    :cond_8
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-nez v6, :cond_b

    .line 2060
    iget-object v6, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v6}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$4500(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;

    move-result-object v6

    const/16 v7, 0x8

    invoke-virtual {v6, v7}, Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;->setVisibilityLoadMoreButton(I)V

    .line 2061
    iget-object v6, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v6}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$4500(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;

    move-result-object v6

    const/16 v7, 0x8

    invoke-virtual {v6, v7}, Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;->setVisibilityProgressBar(I)V

    .line 2062
    iget-object v6, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    const/4 v7, 0x0

    invoke-static {v6, v7}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$4202(Lcom/vkontakte/android/fragments/messages/ChatFragment;Z)Z

    .line 2063
    iget-object v6, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    const/4 v7, 0x0

    invoke-static {v6, v7}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$902(Lcom/vkontakte/android/fragments/messages/ChatFragment;Z)Z

    .line 2109
    :goto_6
    return-void

    .line 2050
    :cond_9
    iget-object v6, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v6}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$2800(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Lcom/vkontakte/android/ui/widget/MessagesTimesList;

    move-result-object v6

    const/4 v7, 0x0

    invoke-static {v6, v7}, Lcom/vkontakte/android/ViewUtils;->setVisibilityAnimated(Landroid/view/View;I)V

    .line 2051
    iget-object v6, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v6}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$2700(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Landroid/widget/ProgressBar;

    move-result-object v6

    const/16 v7, 0x8

    invoke-static {v6, v7}, Lcom/vkontakte/android/ViewUtils;->setVisibilityAnimated(Landroid/view/View;I)V

    goto :goto_4

    .line 2054
    :cond_a
    const/4 v6, 0x0

    goto :goto_5

    .line 2066
    :cond_b
    iget-object v6, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v6}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$4500(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;

    move-result-object v6

    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;->setVisibilityLoadMoreButton(I)V

    .line 2067
    iget-object v6, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v6}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$4500(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;

    move-result-object v6

    const/16 v7, 0x8

    invoke-virtual {v6, v7}, Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;->setVisibilityProgressBar(I)V

    .line 2068
    iget-object v6, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    const/4 v7, 0x1

    invoke-static {v6, v7}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$4202(Lcom/vkontakte/android/fragments/messages/ChatFragment;Z)Z

    .line 2072
    iget-object v6, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v6}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$4100(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Z

    move-result v6

    if-eqz v6, :cond_12

    .line 2073
    iget-object v6, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v6}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$2400(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 2082
    :goto_7
    iget-object v6, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v6}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$1300(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Z

    move-result v6

    if-eqz v6, :cond_c

    .line 2083
    iget-object v6, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v6}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$1400(Lcom/vkontakte/android/fragments/messages/ChatFragment;)V

    .line 2085
    :cond_c
    iget-object v6, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    const/4 v7, 0x0

    invoke-static {v6, v7}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$902(Lcom/vkontakte/android/fragments/messages/ChatFragment;Z)Z

    .line 2086
    iget-object v6, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    const/4 v7, 0x0

    invoke-static {v6, v7}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$4102(Lcom/vkontakte/android/fragments/messages/ChatFragment;Z)Z

    .line 2087
    iget-object v6, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v6}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$4300(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Z

    move-result v6

    if-eqz v6, :cond_d

    .line 2088
    iget-object v6, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    const/4 v7, 0x1

    invoke-static {v6, v7}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$4102(Lcom/vkontakte/android/fragments/messages/ChatFragment;Z)Z

    .line 2089
    iget-object v6, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    const/4 v7, 0x0

    invoke-static {v6, v7}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$4302(Lcom/vkontakte/android/fragments/messages/ChatFragment;Z)Z

    .line 2090
    iget-object v6, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    const/4 v7, 0x1

    invoke-static {v6, v7}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$5900(Lcom/vkontakte/android/fragments/messages/ChatFragment;Z)V

    .line 2092
    :cond_d
    iget-object v6, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-virtual {v6}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v6

    const-string/jumbo v7, "msg_id"

    invoke-virtual {v6, v7}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v5

    .line 2093
    .local v5, "startMid1":I
    if-lez v5, :cond_f

    .line 2094
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_8
    iget-object v6, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v6}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$100(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-ge v1, v6, :cond_e

    .line 2095
    iget-object v6, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v6}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$400(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Lcom/vkontakte/android/ui/widget/ChatRecyclerView;

    move-result-object v6

    if-eqz v6, :cond_14

    iget-object v6, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v6}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$100(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;

    iget v6, v6, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->msgId:I

    if-ne v6, v5, :cond_14

    .line 2096
    iget-object v6, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v6}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$400(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Lcom/vkontakte/android/ui/widget/ChatRecyclerView;

    move-result-object v6

    iget-object v6, v6, Lcom/vkontakte/android/ui/widget/ChatRecyclerView;->delegate:Lcom/vkontakte/android/ui/widget/VKRecyclerView$VKRecyclerViewDelegate;

    const/high16 v7, 0x428c0000    # 70.0f

    invoke-static {v7}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v7

    invoke-virtual {v6, v1, v7}, Lcom/vkontakte/android/ui/widget/VKRecyclerView$VKRecyclerViewDelegate;->setSelectionFromTop(II)V

    .line 2100
    :cond_e
    iget-object v6, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-virtual {v6}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v6

    const-string/jumbo v7, "msg_id"

    invoke-virtual {v6, v7}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    .line 2102
    .end local v1    # "i":I
    :cond_f
    iget-object v6, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v6}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$3800(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Landroid/view/View;

    move-result-object v6

    if-eqz v6, :cond_10

    iget-object v6, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v6}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$400(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Lcom/vkontakte/android/ui/widget/ChatRecyclerView;

    move-result-object v6

    if-eqz v6, :cond_10

    if-nez p1, :cond_10

    iget-object v6, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v6}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$3800(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Landroid/view/View;

    move-result-object v6

    invoke-virtual {v6}, Landroid/view/View;->getVisibility()I

    move-result v6

    if-nez v6, :cond_10

    .line 2103
    iget-object v6, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v6}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$6000(Lcom/vkontakte/android/fragments/messages/ChatFragment;)V

    .line 2105
    :cond_10
    iget-object v6, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v6}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$3600(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Lcom/vkontakte/android/ui/WriteBar;

    move-result-object v6

    if-eqz v6, :cond_11

    .line 2106
    iget-object v6, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v6}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$3600(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Lcom/vkontakte/android/ui/WriteBar;

    move-result-object v6

    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Lcom/vkontakte/android/ui/WriteBar;->setErrorViewShown(Z)V

    .line 2108
    :cond_11
    iget-object v6, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v6}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$200(Lcom/vkontakte/android/fragments/messages/ChatFragment;)V

    goto/16 :goto_6

    .line 2074
    .end local v5    # "startMid1":I
    :cond_12
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v6

    const/16 v7, 0x1e

    if-le v6, v7, :cond_13

    .line 2076
    iget-object v6, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v7

    add-int/lit8 v7, v7, -0x1e

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v8

    invoke-virtual {p2, v7, v8}, Ljava/util/ArrayList;->subList(II)Ljava/util/List;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$4400(Lcom/vkontakte/android/fragments/messages/ChatFragment;Ljava/util/List;)V

    .line 2077
    iget-object v6, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v6}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$2400(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v6

    const/4 v7, 0x0

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v8

    add-int/lit8 v8, v8, -0x1e

    invoke-virtual {p2, v7, v8}, Ljava/util/ArrayList;->subList(II)Ljava/util/List;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    goto/16 :goto_7

    .line 2079
    :cond_13
    iget-object v6, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v6, p2}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$4400(Lcom/vkontakte/android/fragments/messages/ChatFragment;Ljava/util/List;)V

    goto/16 :goto_7

    .line 2094
    .restart local v1    # "i":I
    .restart local v5    # "startMid1":I
    :cond_14
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_8
.end method

.method public onError(ILjava/lang/String;)V
    .locals 3
    .param p1, "code"    # I
    .param p2, "msg"    # Ljava/lang/String;

    .prologue
    .line 2114
    const-string/jumbo v0, "vk"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "error isLoading history "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " act="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 2115
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$000(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->val$fromUnread:Z

    if-eqz v0, :cond_1

    .line 2116
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 2117
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {p0, p1, p2}, Lcom/vkontakte/android/fragments/messages/ChatFragment$16$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/fragments/messages/ChatFragment$16;ILjava/lang/String;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 2143
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$902(Lcom/vkontakte/android/fragments/messages/ChatFragment;Z)Z

    .line 2144
    return-void

    .line 2131
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 2132
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {p0, p1, p2}, Lcom/vkontakte/android/fragments/messages/ChatFragment$16$$Lambda$3;->lambdaFactory$(Lcom/vkontakte/android/fragments/messages/ChatFragment$16;ILjava/lang/String;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method public onMessagesLoaded(Ljava/util/ArrayList;I)V
    .locals 10
    .param p2, "offsetFromBtm"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/Message;",
            ">;I)V"
        }
    .end annotation

    .prologue
    .local p1, "msgs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/Message;>;"
    const/4 v6, 0x0

    .line 1989
    iget-object v5, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-virtual {v5}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getActivity()Landroid/app/Activity;

    move-result-object v5

    if-nez v5, :cond_1

    .line 1990
    iget-object v5, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v5, v6}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$902(Lcom/vkontakte/android/fragments/messages/ChatFragment;Z)Z

    .line 2110
    :cond_0
    :goto_0
    return-void

    .line 1993
    :cond_1
    iget-boolean v5, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->val$fromUnread:Z

    if-nez v5, :cond_2

    .line 1994
    iget-object v5, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v5}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$000(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/ArrayList;->clear()V

    .line 1995
    iget-object v5, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v5}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$2400(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/ArrayList;->clear()V

    .line 1996
    iget-object v5, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v5}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$2500(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/ArrayList;->clear()V

    .line 1997
    iget-object v5, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v5, v6}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$1002(Lcom/vkontakte/android/fragments/messages/ChatFragment;I)I

    .line 1999
    :cond_2
    iget-object v5, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v5}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$000(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-nez v5, :cond_3

    .line 2000
    iget-object v5, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v5, p2}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$1002(Lcom/vkontakte/android/fragments/messages/ChatFragment;I)I

    .line 2002
    :cond_3
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 2003
    .local v1, "needUsersAcc":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/Integer;>;"
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_4
    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_5

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/Message;

    .line 2004
    .local v0, "m":Lcom/vkontakte/android/Message;
    iget-boolean v6, v0, Lcom/vkontakte/android/Message;->isServiceMessage:Z

    if-eqz v6, :cond_4

    iget-object v6, v0, Lcom/vkontakte/android/Message;->extras:Landroid/os/Bundle;

    const-string/jumbo v7, "action_mid"

    invoke-virtual {v6, v7}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_4

    iget-object v6, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v6}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$1100(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Landroid/util/SparseArray;

    move-result-object v6

    iget-object v7, v0, Lcom/vkontakte/android/Message;->extras:Landroid/os/Bundle;

    const-string/jumbo v8, "action_mid"

    invoke-virtual {v7, v8}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v7

    invoke-static {v6, v7}, Lcom/vkontakte/android/utils/Utils;->containsKey(Landroid/util/SparseArray;I)Z

    move-result v6

    if-nez v6, :cond_4

    .line 2005
    iget-object v6, v0, Lcom/vkontakte/android/Message;->extras:Landroid/os/Bundle;

    const-string/jumbo v7, "action_mid"

    invoke-virtual {v6, v7}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v1, v6}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 2008
    .end local v0    # "m":Lcom/vkontakte/android/Message;
    :cond_5
    invoke-virtual {v1}, Ljava/util/HashSet;->size()I

    move-result v5

    if-lez v5, :cond_6

    .line 2009
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 2010
    .local v3, "uids":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 2011
    const/4 v5, 0x3

    invoke-static {v3, v5}, Lcom/vkontakte/android/data/Friends;->getUsersBlocking(Ljava/util/List;I)Ljava/util/ArrayList;

    move-result-object v4

    .line 2012
    .local v4, "users":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/UserProfile;>;"
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_2
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_6

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/UserProfile;

    .line 2013
    .local v2, "p":Lcom/vkontakte/android/UserProfile;
    iget-object v6, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v6}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$1100(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Landroid/util/SparseArray;

    move-result-object v6

    iget v7, v2, Lcom/vkontakte/android/UserProfile;->uid:I

    iget-object v8, v2, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    invoke-virtual {v6, v7, v8}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto :goto_2

    .line 2016
    .end local v2    # "p":Lcom/vkontakte/android/UserProfile;
    .end local v3    # "uids":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    .end local v4    # "users":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/UserProfile;>;"
    :cond_6
    iget-object v5, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-virtual {v5}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getActivity()Landroid/app/Activity;

    move-result-object v5

    if-eqz v5, :cond_0

    .line 2019
    iget-object v5, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-virtual {v5}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getActivity()Landroid/app/Activity;

    move-result-object v5

    iget-boolean v6, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->val$fromUnread:Z

    iget-wide v8, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;->val$startTime:J

    invoke-static {p0, v6, p1, v8, v9}, Lcom/vkontakte/android/fragments/messages/ChatFragment$16$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/fragments/messages/ChatFragment$16;ZLjava/util/ArrayList;J)Ljava/lang/Runnable;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto/16 :goto_0
.end method
