.class Lcom/vkontakte/android/fragments/friends/FriendsListFragment$3;
.super Ljava/lang/Object;
.source "FriendsListFragment.java"

# interfaces
.implements Landroid/view/ActionMode$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->updateActionMode()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    .prologue
    .line 290
    .local p0, "this":Lcom/vkontakte/android/fragments/friends/FriendsListFragment$3;, "Lcom/vkontakte/android/fragments/friends/FriendsListFragment$3;"
    iput-object p1, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$3;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onActionItemClicked(Landroid/view/ActionMode;Landroid/view/MenuItem;)Z
    .locals 3
    .param p1, "mode"    # Landroid/view/ActionMode;
    .param p2, "item"    # Landroid/view/MenuItem;

    .prologue
    .local p0, "this":Lcom/vkontakte/android/fragments/friends/FriendsListFragment$3;, "Lcom/vkontakte/android/fragments/friends/FriendsListFragment$3;"
    const/4 v2, 0x1

    .line 310
    invoke-interface {p2}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x102000c

    if-ne v0, v1, :cond_1

    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$3;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->access$400(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)Lcom/vkontakte/android/functions/VoidF1;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 311
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$3;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->access$400(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)Lcom/vkontakte/android/functions/VoidF1;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$3;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->access$500(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/vkontakte/android/functions/VoidF1;->f(Ljava/lang/Object;)V

    .line 317
    :cond_0
    :goto_0
    return v2

    .line 312
    :cond_1
    invoke-interface {p2}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f10007f

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$3;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->access$600(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)Lcom/vkontakte/android/ui/SearchViewWrapper;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 313
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$3;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->access$702(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;Z)Z

    .line 314
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$3;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->access$600(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)Lcom/vkontakte/android/ui/SearchViewWrapper;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/vkontakte/android/ui/SearchViewWrapper;->setExpanded(Z)V

    .line 315
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$3;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->access$200(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)Landroid/view/ActionMode;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ActionMode;->finish()V

    goto :goto_0
.end method

.method public onCreateActionMode(Landroid/view/ActionMode;Landroid/view/Menu;)Z
    .locals 9
    .param p1, "mode"    # Landroid/view/ActionMode;
    .param p2, "menu"    # Landroid/view/Menu;

    .prologue
    .local p0, "this":Lcom/vkontakte/android/fragments/friends/FriendsListFragment$3;, "Lcom/vkontakte/android/fragments/friends/FriendsListFragment$3;"
    const v8, 0x7f10007f

    const v7, 0x102000c

    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 293
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$3;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    invoke-static {v0, p0}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->access$102(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;Landroid/view/ActionMode$Callback;)Landroid/view/ActionMode$Callback;

    .line 294
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$3;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    invoke-static {v0, p1}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->access$202(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;Landroid/view/ActionMode;)Landroid/view/ActionMode;

    .line 295
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$3;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->access$200(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)Landroid/view/ActionMode;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$3;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0805f6

    new-array v3, v6, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$3;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->access$300(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)Landroid/util/SparseArray;

    move-result-object v4

    invoke-virtual {v4}, Landroid/util/SparseArray;->size()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-virtual {v1, v2, v3}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/ActionMode;->setTitle(Ljava/lang/CharSequence;)V

    .line 296
    const v0, 0x7f0805e4

    invoke-interface {p2, v5, v8, v5, v0}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    .line 297
    const v0, 0x7f0801c5

    invoke-interface {p2, v5, v7, v6, v0}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    .line 298
    invoke-interface {p2, v8}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    const v1, 0x7f0201f7

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    .line 299
    invoke-interface {p2, v7}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    const v1, 0x7f020184

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    .line 300
    return v6
.end method

.method public onDestroyActionMode(Landroid/view/ActionMode;)V
    .locals 2
    .param p1, "mode"    # Landroid/view/ActionMode;

    .prologue
    .line 322
    .local p0, "this":Lcom/vkontakte/android/fragments/friends/FriendsListFragment$3;, "Lcom/vkontakte/android/fragments/friends/FriendsListFragment$3;"
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$3;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->access$700(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 323
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$3;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->access$500(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)Ljava/util/ArrayList;

    .line 327
    :goto_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$3;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->access$800(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;->notifyDataSetChanged()V

    .line 328
    invoke-virtual {p1}, Landroid/view/ActionMode;->finish()V

    .line 329
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$3;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->access$202(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;Landroid/view/ActionMode;)Landroid/view/ActionMode;

    .line 330
    return-void

    .line 325
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$3;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->access$702(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;Z)Z

    goto :goto_0
.end method

.method public onPrepareActionMode(Landroid/view/ActionMode;Landroid/view/Menu;)Z
    .locals 1
    .param p1, "mode"    # Landroid/view/ActionMode;
    .param p2, "menu"    # Landroid/view/Menu;

    .prologue
    .line 305
    .local p0, "this":Lcom/vkontakte/android/fragments/friends/FriendsListFragment$3;, "Lcom/vkontakte/android/fragments/friends/FriendsListFragment$3;"
    const/4 v0, 0x0

    return v0
.end method
