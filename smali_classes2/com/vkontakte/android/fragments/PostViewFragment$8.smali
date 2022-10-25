.class Lcom/vkontakte/android/fragments/PostViewFragment$8;
.super Ljava/lang/Object;
.source "PostViewFragment.java"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


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


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/PostViewFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/PostViewFragment;

    .prologue
    .line 752
    iput-object p1, p0, Lcom/vkontakte/android/fragments/PostViewFragment$8;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLongClick(Landroid/view/View;)Z
    .locals 4
    .param p1, "view1"    # Landroid/view/View;

    .prologue
    .line 755
    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment$8;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$000(Lcom/vkontakte/android/fragments/PostViewFragment;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v1

    iget v1, v1, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    neg-int v1, v1

    invoke-static {v1}, Lcom/vkontakte/android/data/Groups;->getAdminLevel(I)I

    move-result v1

    const/4 v2, 0x2

    if-ge v1, v2, :cond_0

    .line 756
    const/4 v1, 0x0

    .line 774
    :goto_0
    return v1

    .line 758
    :cond_0
    new-instance v0, Landroid/widget/PopupMenu;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment$8;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/PostViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/PostViewFragment$8;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$1100(Lcom/vkontakte/android/fragments/PostViewFragment;)Lcom/vkontakte/android/ui/WriteBar;

    move-result-object v2

    const v3, 0x7f1005cc

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/ui/WriteBar;->findViewById(I)Landroid/view/View;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/widget/PopupMenu;-><init>(Landroid/content/Context;Landroid/view/View;)V

    .line 759
    .local v0, "menu":Landroid/widget/PopupMenu;
    invoke-virtual {v0}, Landroid/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object v1

    const v2, 0x7f0805bb

    invoke-interface {v1, v2}, Landroid/view/Menu;->add(I)Landroid/view/MenuItem;

    .line 760
    new-instance v1, Lcom/vkontakte/android/fragments/PostViewFragment$8$1;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/fragments/PostViewFragment$8$1;-><init>(Lcom/vkontakte/android/fragments/PostViewFragment$8;)V

    invoke-virtual {v0, v1}, Landroid/widget/PopupMenu;->setOnMenuItemClickListener(Landroid/widget/PopupMenu$OnMenuItemClickListener;)V

    .line 773
    invoke-virtual {v0}, Landroid/widget/PopupMenu;->show()V

    .line 774
    const/4 v1, 0x1

    goto :goto_0
.end method
