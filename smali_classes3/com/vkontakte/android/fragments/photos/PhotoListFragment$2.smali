.class Lcom/vkontakte/android/fragments/photos/PhotoListFragment$2;
.super Landroid/support/v7/widget/RecyclerView$ItemDecoration;
.source "PhotoListFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
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
    .line 217
    iput-object p1, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$2;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$ItemDecoration;-><init>()V

    return-void
.end method


# virtual methods
.method public getItemOffsets(Landroid/graphics/Rect;Landroid/view/View;Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$State;)V
    .locals 4
    .param p1, "outRect"    # Landroid/graphics/Rect;
    .param p2, "view"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/support/v7/widget/RecyclerView;
    .param p4, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    .line 220
    invoke-virtual {p3, p2}, Landroid/support/v7/widget/RecyclerView;->getChildAdapterPosition(Landroid/view/View;)I

    move-result v1

    .line 221
    .local v1, "pos":I
    iget-object v2, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$2;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    iget-object v2, v2, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->adapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    invoke-virtual {v2, v1}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->getAdapterForPosition(I)Lme/grishka/appkit/views/UsableRecyclerView$Adapter;

    move-result-object v0

    .line 222
    .local v0, "inner":Lme/grishka/appkit/views/UsableRecyclerView$Adapter;
    iget-object v2, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$2;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    iget-object v3, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$2;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    iget-object v3, v3, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->adapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    invoke-virtual {v3, v1}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->getAdapterPosition(I)I

    move-result v3

    invoke-virtual {v2, v0, v3, v1, p1}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->getItemOffsets(Lme/grishka/appkit/views/UsableRecyclerView$Adapter;IILandroid/graphics/Rect;)V

    .line 223
    return-void
.end method
