.class Lcom/vkontakte/android/fragments/messages/ChatFragment$17;
.super Ljava/lang/Object;
.source "ChatFragment.java"

# interfaces
.implements Lcom/vkontakte/android/data/Messages$GetMessagesCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/messages/ChatFragment;->loadDataDown()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/messages/ChatFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/messages/ChatFragment;

    .prologue
    .line 2153
    iput-object p1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$17;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method synthetic lambda$onError$1(ILjava/lang/String;)V
    .locals 2
    .param p1, "code"    # I
    .param p2, "msg"    # Ljava/lang/String;

    .prologue
    .line 2243
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$17;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0, p1, p2}, Lcom/vkontakte/android/api/APIUtils;->showErrorToast(Landroid/content/Context;ILjava/lang/String;)V

    .line 2244
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$17;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$5100(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;->setVisibilityLoadMoreButton(I)V

    .line 2245
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$17;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$5100(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;->setVisibilityProgressBar(I)V

    .line 2246
    return-void
.end method

.method synthetic lambda$onMessagesLoaded$0(Ljava/util/ArrayList;)V
    .locals 9
    .param p1, "msgs"    # Ljava/util/ArrayList;

    .prologue
    const/4 v5, 0x1

    const/16 v8, 0x8

    const/4 v6, 0x0

    .line 2180
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 2181
    .local v3, "mids":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    iget-object v4, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$17;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$000(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_0

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/Message;

    .line 2182
    .local v2, "m":Lcom/vkontakte/android/Message;
    iget v7, v2, Lcom/vkontakte/android/Message;->id:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v3, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 2184
    .end local v2    # "m":Lcom/vkontakte/android/Message;
    :cond_0
    iget-object v4, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$17;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$2400(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/Message;

    .line 2185
    .restart local v2    # "m":Lcom/vkontakte/android/Message;
    iget v7, v2, Lcom/vkontakte/android/Message;->id:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v3, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 2187
    .end local v2    # "m":Lcom/vkontakte/android/Message;
    :cond_1
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 2188
    .local v1, "imsgs":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/vkontakte/android/Message;>;"
    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 2189
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/Message;

    .line 2190
    .restart local v2    # "m":Lcom/vkontakte/android/Message;
    iget v4, v2, Lcom/vkontakte/android/Message;->id:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 2191
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    goto :goto_2

    .line 2193
    :cond_2
    iget v4, v2, Lcom/vkontakte/android/Message;->id:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 2196
    .end local v2    # "m":Lcom/vkontakte/android/Message;
    :cond_3
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-nez v4, :cond_5

    .line 2197
    iget-object v4, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$17;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$5100(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;

    move-result-object v4

    invoke-virtual {v4, v8}, Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;->setVisibilityLoadMoreButton(I)V

    .line 2198
    iget-object v4, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$17;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$5100(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;

    move-result-object v4

    invoke-virtual {v4, v8}, Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;->setVisibilityProgressBar(I)V

    .line 2199
    iget-object v4, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$17;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v4, v6}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$4802(Lcom/vkontakte/android/fragments/messages/ChatFragment;Z)Z

    .line 2200
    iget-object v4, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$17;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v4, v6}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$4602(Lcom/vkontakte/android/fragments/messages/ChatFragment;Z)Z

    .line 2236
    :cond_4
    :goto_3
    return-void

    .line 2203
    :cond_5
    iget-object v7, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$17;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    iget-object v4, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$17;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$1000(Lcom/vkontakte/android/fragments/messages/ChatFragment;)I

    move-result v4

    if-lez v4, :cond_8

    move v4, v5

    :goto_4
    invoke-static {v7, v4}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$4802(Lcom/vkontakte/android/fragments/messages/ChatFragment;Z)Z

    .line 2204
    iget-object v4, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$17;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$4800(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Z

    move-result v4

    if-eqz v4, :cond_9

    .line 2205
    iget-object v4, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$17;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$5100(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;

    move-result-object v4

    invoke-virtual {v4, v6}, Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;->setVisibilityLoadMoreButton(I)V

    .line 2206
    iget-object v4, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$17;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$5100(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;

    move-result-object v4

    invoke-virtual {v4, v8}, Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;->setVisibilityProgressBar(I)V

    .line 2212
    :goto_5
    iget-object v4, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$17;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$4700(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Z

    move-result v4

    if-eqz v4, :cond_a

    .line 2213
    iget-object v4, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$17;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$2500(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 2220
    :goto_6
    iget-object v4, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$17;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$3800(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Landroid/view/View;

    move-result-object v4

    if-eqz v4, :cond_c

    iget-object v4, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$17;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$3800(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Landroid/view/View;

    move-result-object v4

    invoke-virtual {v4}, Landroid/view/View;->getVisibility()I

    move-result v4

    if-nez v4, :cond_c

    move v0, v5

    .line 2221
    .local v0, "btnVisible":Z
    :goto_7
    if-eqz v0, :cond_6

    iget-object v4, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$17;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$4800(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Z

    move-result v4

    if-nez v4, :cond_6

    .line 2222
    iget-object v4, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$17;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$3900(Lcom/vkontakte/android/fragments/messages/ChatFragment;)V

    .line 2225
    :cond_6
    iget-object v4, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$17;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$200(Lcom/vkontakte/android/fragments/messages/ChatFragment;)V

    .line 2226
    iget-object v4, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$17;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$1300(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Z

    move-result v4

    if-eqz v4, :cond_7

    .line 2227
    iget-object v4, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$17;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$1400(Lcom/vkontakte/android/fragments/messages/ChatFragment;)V

    .line 2229
    :cond_7
    iget-object v4, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$17;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v4, v6}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$4602(Lcom/vkontakte/android/fragments/messages/ChatFragment;Z)Z

    .line 2230
    iget-object v4, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$17;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v4, v6}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$4702(Lcom/vkontakte/android/fragments/messages/ChatFragment;Z)Z

    .line 2231
    iget-object v4, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$17;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$4900(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 2232
    iget-object v4, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$17;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v4, v5}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$4702(Lcom/vkontakte/android/fragments/messages/ChatFragment;Z)Z

    .line 2233
    iget-object v4, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$17;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v4, v6}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$4902(Lcom/vkontakte/android/fragments/messages/ChatFragment;Z)Z

    .line 2234
    iget-object v4, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$17;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$6100(Lcom/vkontakte/android/fragments/messages/ChatFragment;)V

    goto/16 :goto_3

    .end local v0    # "btnVisible":Z
    :cond_8
    move v4, v6

    .line 2203
    goto/16 :goto_4

    .line 2208
    :cond_9
    iget-object v4, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$17;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$5100(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;

    move-result-object v4

    invoke-virtual {v4, v8}, Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;->setVisibilityLoadMoreButton(I)V

    .line 2209
    iget-object v4, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$17;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$5100(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;

    move-result-object v4

    invoke-virtual {v4, v8}, Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;->setVisibilityProgressBar(I)V

    goto :goto_5

    .line 2214
    :cond_a
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v4

    const/16 v7, 0x1e

    if-le v4, v7, :cond_b

    .line 2215
    iget-object v4, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$17;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v7

    add-int/lit8 v7, v7, -0x1e

    invoke-virtual {p1, v6, v7}, Ljava/util/ArrayList;->subList(II)Ljava/util/List;

    move-result-object v7

    invoke-static {v4, v7}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$5000(Lcom/vkontakte/android/fragments/messages/ChatFragment;Ljava/util/List;)V

    .line 2216
    iget-object v4, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$17;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$2500(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v7

    add-int/lit8 v7, v7, -0x1e

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v8

    invoke-virtual {p1, v7, v8}, Ljava/util/ArrayList;->subList(II)Ljava/util/List;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    goto/16 :goto_6

    .line 2218
    :cond_b
    iget-object v4, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$17;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v4, p1}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$5000(Lcom/vkontakte/android/fragments/messages/ChatFragment;Ljava/util/List;)V

    goto/16 :goto_6

    :cond_c
    move v0, v6

    .line 2220
    goto/16 :goto_7
.end method

.method public onError(ILjava/lang/String;)V
    .locals 2
    .param p1, "code"    # I
    .param p2, "msg"    # Ljava/lang/String;

    .prologue
    .line 2241
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$17;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 2242
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$17;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {p0, p1, p2}, Lcom/vkontakte/android/fragments/messages/ChatFragment$17$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/fragments/messages/ChatFragment$17;ILjava/lang/String;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 2248
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$17;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$4602(Lcom/vkontakte/android/fragments/messages/ChatFragment;Z)Z

    .line 2249
    return-void
.end method

.method public onMessagesLoaded(Ljava/util/ArrayList;I)V
    .locals 9
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
    .line 2157
    .local p1, "msgs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/Message;>;"
    iget-object v5, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$17;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-virtual {v5}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getActivity()Landroid/app/Activity;

    move-result-object v5

    if-nez v5, :cond_0

    .line 2158
    iget-object v5, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$17;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    const/4 v6, 0x0

    invoke-static {v5, v6}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$4602(Lcom/vkontakte/android/fragments/messages/ChatFragment;Z)Z

    .line 2237
    :goto_0
    return-void

    .line 2161
    :cond_0
    iget-object v5, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$17;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    iget-object v6, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$17;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v6}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$1000(Lcom/vkontakte/android/fragments/messages/ChatFragment;)I

    move-result v6

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v7

    sub-int/2addr v6, v7

    invoke-static {v5, v6}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$1002(Lcom/vkontakte/android/fragments/messages/ChatFragment;I)I

    .line 2162
    const-string/jumbo v5, "vk"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "Offset from bottom="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 2163
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 2164
    .local v1, "needUsersAcc":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/Integer;>;"
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_1
    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/Message;

    .line 2165
    .local v0, "m":Lcom/vkontakte/android/Message;
    iget-boolean v6, v0, Lcom/vkontakte/android/Message;->isServiceMessage:Z

    if-eqz v6, :cond_1

    iget-object v6, v0, Lcom/vkontakte/android/Message;->extras:Landroid/os/Bundle;

    const-string/jumbo v7, "action_mid"

    invoke-virtual {v6, v7}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1

    iget-object v6, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$17;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v6}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$1100(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Landroid/util/SparseArray;

    move-result-object v6

    iget-object v7, v0, Lcom/vkontakte/android/Message;->extras:Landroid/os/Bundle;

    const-string/jumbo v8, "action_mid"

    invoke-virtual {v7, v8}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v7

    invoke-static {v6, v7}, Lcom/vkontakte/android/utils/Utils;->containsKey(Landroid/util/SparseArray;I)Z

    move-result v6

    if-nez v6, :cond_1

    .line 2166
    iget-object v6, v0, Lcom/vkontakte/android/Message;->extras:Landroid/os/Bundle;

    const-string/jumbo v7, "action_mid"

    invoke-virtual {v6, v7}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v1, v6}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 2169
    .end local v0    # "m":Lcom/vkontakte/android/Message;
    :cond_2
    invoke-virtual {v1}, Ljava/util/HashSet;->size()I

    move-result v5

    if-lez v5, :cond_3

    .line 2170
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 2171
    .local v3, "uids":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 2172
    const/4 v5, 0x3

    invoke-static {v3, v5}, Lcom/vkontakte/android/data/Friends;->getUsersBlocking(Ljava/util/List;I)Ljava/util/ArrayList;

    move-result-object v4

    .line 2173
    .local v4, "users":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/UserProfile;>;"
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_2
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/UserProfile;

    .line 2174
    .local v2, "p":Lcom/vkontakte/android/UserProfile;
    iget-object v6, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$17;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v6}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$1100(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Landroid/util/SparseArray;

    move-result-object v6

    iget v7, v2, Lcom/vkontakte/android/UserProfile;->uid:I

    iget-object v8, v2, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    invoke-virtual {v6, v7, v8}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto :goto_2

    .line 2177
    .end local v2    # "p":Lcom/vkontakte/android/UserProfile;
    .end local v3    # "uids":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    .end local v4    # "users":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/UserProfile;>;"
    :cond_3
    iget-object v5, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$17;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-virtual {v5}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getActivity()Landroid/app/Activity;

    move-result-object v5

    invoke-static {p0, p1}, Lcom/vkontakte/android/fragments/messages/ChatFragment$17$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/fragments/messages/ChatFragment$17;Ljava/util/ArrayList;)Ljava/lang/Runnable;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto/16 :goto_0
.end method
