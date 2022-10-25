.class public Lcom/vkontakte/android/ui/holder/RecyclerHolderRef;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "RecyclerHolderRef.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/ui/holder/RecyclerHolderRef$Ref;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lcom/vkontakte/android/ui/holder/RecyclerHolderRef$Ref;",
        ">",
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<TT;>;"
    }
.end annotation


# direct methods
.method public constructor <init>(ILandroid/content/Context;)V
    .locals 0
    .param p1, "layoutId"    # I
        .annotation build Landroid/support/annotation/LayoutRes;
        .end annotation
    .end param
    .param p2, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 34
    .local p0, "this":Lcom/vkontakte/android/ui/holder/RecyclerHolderRef;, "Lcom/vkontakte/android/ui/holder/RecyclerHolderRef<TT;>;"
    invoke-direct {p0, p1, p2}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(ILandroid/content/Context;)V

    .line 35
    return-void
.end method

.method public constructor <init>(ILandroid/view/ViewGroup;)V
    .locals 0
    .param p1, "layoutId"    # I
        .annotation build Landroid/support/annotation/LayoutRes;
        .end annotation
    .end param
    .param p2, "parent"    # Landroid/view/ViewGroup;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 38
    .local p0, "this":Lcom/vkontakte/android/ui/holder/RecyclerHolderRef;, "Lcom/vkontakte/android/ui/holder/RecyclerHolderRef<TT;>;"
    invoke-direct {p0, p1, p2}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(ILandroid/view/ViewGroup;)V

    .line 39
    return-void
.end method

.method public constructor <init>(Landroid/view/View;)V
    .locals 0
    .param p1, "itemView"    # Landroid/view/View;

    .prologue
    .line 30
    .local p0, "this":Lcom/vkontakte/android/ui/holder/RecyclerHolderRef;, "Lcom/vkontakte/android/ui/holder/RecyclerHolderRef<TT;>;"
    invoke-direct {p0, p1}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(Landroid/view/View;)V

    .line 31
    return-void
.end method


# virtual methods
.method public onBind(Lcom/vkontakte/android/ui/holder/RecyclerHolderRef$Ref;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 43
    .local p0, "this":Lcom/vkontakte/android/ui/holder/RecyclerHolderRef;, "Lcom/vkontakte/android/ui/holder/RecyclerHolderRef<TT;>;"
    .local p1, "item":Lcom/vkontakte/android/ui/holder/RecyclerHolderRef$Ref;, "TT;"
    invoke-virtual {p1, p0}, Lcom/vkontakte/android/ui/holder/RecyclerHolderRef$Ref;->b(Lcom/vkontakte/android/ui/holder/RecyclerHolderRef;)V

    .line 44
    return-void
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 11
    .local p0, "this":Lcom/vkontakte/android/ui/holder/RecyclerHolderRef;, "Lcom/vkontakte/android/ui/holder/RecyclerHolderRef<TT;>;"
    check-cast p1, Lcom/vkontakte/android/ui/holder/RecyclerHolderRef$Ref;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/ui/holder/RecyclerHolderRef;->onBind(Lcom/vkontakte/android/ui/holder/RecyclerHolderRef$Ref;)V

    return-void
.end method
