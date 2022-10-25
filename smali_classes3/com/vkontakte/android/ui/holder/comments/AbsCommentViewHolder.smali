.class public abstract Lcom/vkontakte/android/ui/holder/comments/AbsCommentViewHolder;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "AbsCommentViewHolder.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Lcom/vkontakte/android/Comment;",
        ">",
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<TT;>;"
    }
.end annotation


# direct methods
.method constructor <init>(ILandroid/view/ViewGroup;)V
    .locals 0
    .param p1, "layoutRes"    # I
        .annotation build Landroid/support/annotation/LayoutRes;
        .end annotation
    .end param
    .param p2, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 17
    .local p0, "this":Lcom/vkontakte/android/ui/holder/comments/AbsCommentViewHolder;, "Lcom/vkontakte/android/ui/holder/comments/AbsCommentViewHolder<TT;>;"
    invoke-direct {p0, p1, p2}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(ILandroid/view/ViewGroup;)V

    .line 18
    return-void
.end method


# virtual methods
.method public highlight()V
    .locals 1

    .prologue
    .line 21
    .local p0, "this":Lcom/vkontakte/android/ui/holder/comments/AbsCommentViewHolder;, "Lcom/vkontakte/android/ui/holder/comments/AbsCommentViewHolder<TT;>;"
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/comments/AbsCommentViewHolder;->itemView:Landroid/view/View;

    invoke-static {v0}, Lcom/vkontakte/android/ui/util/HightlightHelper;->highlight(Landroid/view/View;)V

    .line 22
    return-void
.end method
