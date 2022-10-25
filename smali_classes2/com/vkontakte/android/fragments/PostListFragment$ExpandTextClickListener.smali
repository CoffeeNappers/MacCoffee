.class public Lcom/vkontakte/android/fragments/PostListFragment$ExpandTextClickListener;
.super Ljava/lang/Object;
.source "PostListFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/PostListFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "ExpandTextClickListener"
.end annotation


# instance fields
.field public entry:Lcom/vkontakte/android/NewsEntry;

.field public item:Lcom/vkontakte/android/ui/posts/TextPostDisplayItem;

.field final synthetic this$0:Lcom/vkontakte/android/fragments/PostListFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/PostListFragment;Lcom/vkontakte/android/NewsEntry;Lcom/vkontakte/android/ui/posts/TextPostDisplayItem;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/PostListFragment;
    .param p2, "entry"    # Lcom/vkontakte/android/NewsEntry;
    .param p3, "item"    # Lcom/vkontakte/android/ui/posts/TextPostDisplayItem;

    .prologue
    .line 1189
    iput-object p1, p0, Lcom/vkontakte/android/fragments/PostListFragment$ExpandTextClickListener;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1190
    iput-object p2, p0, Lcom/vkontakte/android/fragments/PostListFragment$ExpandTextClickListener;->entry:Lcom/vkontakte/android/NewsEntry;

    .line 1191
    iput-object p3, p0, Lcom/vkontakte/android/fragments/PostListFragment$ExpandTextClickListener;->item:Lcom/vkontakte/android/ui/posts/TextPostDisplayItem;

    .line 1192
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 1196
    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostListFragment$ExpandTextClickListener;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/PostListFragment;->items:Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/PostListFragment$ExpandTextClickListener;->item:Lcom/vkontakte/android/ui/posts/TextPostDisplayItem;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v0

    .line 1197
    .local v0, "index":I
    if-lez v0, :cond_0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostListFragment$ExpandTextClickListener;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/PostListFragment;->items:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 1198
    new-instance v1, Lcom/vkontakte/android/data/PostInteract;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/PostListFragment$ExpandTextClickListener;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/PostListFragment;->getListReferrer()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/vkontakte/android/fragments/PostListFragment$ExpandTextClickListener;->entry:Lcom/vkontakte/android/NewsEntry;

    invoke-direct {v1, v2, v3}, Lcom/vkontakte/android/data/PostInteract;-><init>(Ljava/lang/String;Lcom/vkontakte/android/NewsEntry;)V

    sget-object v2, Lcom/vkontakte/android/data/PostInteract$Type;->expand:Lcom/vkontakte/android/data/PostInteract$Type;

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/data/PostInteract;->commit(Lcom/vkontakte/android/data/PostInteract$Type;)V

    .line 1199
    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostListFragment$ExpandTextClickListener;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/PostListFragment;->items:Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/PostListFragment$ExpandTextClickListener;->item:Lcom/vkontakte/android/ui/posts/TextPostDisplayItem;

    invoke-virtual {v2}, Lcom/vkontakte/android/ui/posts/TextPostDisplayItem;->expandText()Lcom/vkontakte/android/ui/posts/TextPostDisplayItem;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 1200
    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostListFragment$ExpandTextClickListener;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/PostListFragment;->adapter:Lme/grishka/appkit/views/UsableRecyclerView$Adapter;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/PostListFragment$ExpandTextClickListener;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    invoke-virtual {v2, v0}, Lcom/vkontakte/android/fragments/PostListFragment;->convertItemsIndexToReal(I)I

    move-result v2

    invoke-virtual {v1, v2}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;->notifyItemChanged(I)V

    .line 1202
    :cond_0
    return-void
.end method
