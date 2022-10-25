.class public Lcom/vkontakte/android/fragments/PostViewFragment$PostDisplayItemViewHolder;
.super Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
.source "PostViewFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/PostViewFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "PostDisplayItemViewHolder"
.end annotation


# instance fields
.field private item:Lcom/vkontakte/android/ui/posts/PostDisplayItem;

.field final synthetic this$0:Lcom/vkontakte/android/fragments/PostViewFragment;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/fragments/PostViewFragment;Landroid/view/View;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/PostViewFragment;
    .param p2, "itemView"    # Landroid/view/View;

    .prologue
    .line 2325
    iput-object p1, p0, Lcom/vkontakte/android/fragments/PostViewFragment$PostDisplayItemViewHolder;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    .line 2326
    invoke-direct {p0, p2}, Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 2327
    return-void
.end method


# virtual methods
.method public bind(Lcom/vkontakte/android/ui/posts/PostDisplayItem;)V
    .locals 0
    .param p1, "item"    # Lcom/vkontakte/android/ui/posts/PostDisplayItem;

    .prologue
    .line 2330
    iput-object p1, p0, Lcom/vkontakte/android/fragments/PostViewFragment$PostDisplayItemViewHolder;->item:Lcom/vkontakte/android/ui/posts/PostDisplayItem;

    .line 2331
    return-void
.end method
