.class Lcom/vkontakte/android/fragments/photos/PhotoListFragment$5;
.super Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;
.source "PhotoListFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->onCreateLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/photos/PhotoListFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    .prologue
    .line 322
    iput-object p1, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$5;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    invoke-direct {p0}, Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;-><init>()V

    return-void
.end method


# virtual methods
.method public getSpanSize(I)I
    .locals 4
    .param p1, "position"    # I

    .prologue
    const/16 v1, 0x3e8

    .line 325
    iget-object v2, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$5;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    iget-object v2, v2, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->adapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    invoke-virtual {v2, p1}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->getAdapterForPosition(I)Lme/grishka/appkit/views/UsableRecyclerView$Adapter;

    move-result-object v0

    .line 326
    .local v0, "a":Lme/grishka/appkit/views/UsableRecyclerView$Adapter;
    instance-of v2, v0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoAdapter;

    if-nez v2, :cond_1

    .line 333
    .end local v0    # "a":Lme/grishka/appkit/views/UsableRecyclerView$Adapter;
    :cond_0
    :goto_0
    return v1

    .line 329
    .restart local v0    # "a":Lme/grishka/appkit/views/UsableRecyclerView$Adapter;
    :cond_1
    iget-object v2, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$5;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    iget-object v2, v2, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->adapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    invoke-virtual {v2, p1}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->getAdapterPosition(I)I

    move-result v2

    check-cast v0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoAdapter;

    .end local v0    # "a":Lme/grishka/appkit/views/UsableRecyclerView$Adapter;
    invoke-static {v0}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoAdapter;->access$1900(Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoAdapter;)I

    move-result v3

    add-int p1, v2, v3

    .line 330
    iget-object v2, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$5;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    iget-object v2, v2, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->layout:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-le v2, p1, :cond_0

    .line 333
    iget-object v1, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$5;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->layout:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoLayoutInfo;

    iget v1, v1, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoLayoutInfo;->spanSize:I

    goto :goto_0
.end method
