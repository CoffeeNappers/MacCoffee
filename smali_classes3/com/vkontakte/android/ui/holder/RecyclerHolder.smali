.class public abstract Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.super Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
.source "RecyclerHolder.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;"
    }
.end annotation


# instance fields
.field protected item:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field private final mContext:Landroid/content/Context;

.field private mParent:Landroid/view/ViewGroup;


# direct methods
.method public constructor <init>(ILandroid/content/Context;)V
    .locals 2
    .param p1, "layoutId"    # I
        .annotation build Landroid/support/annotation/LayoutRes;
        .end annotation
    .end param
    .param p2, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 41
    .local p0, "this":Lcom/vkontakte/android/ui/holder/RecyclerHolder;, "Lcom/vkontakte/android/ui/holder/RecyclerHolder<TT;>;"
    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(Landroid/view/View;)V

    .line 42
    return-void
.end method

.method public constructor <init>(ILandroid/view/ViewGroup;)V
    .locals 2
    .param p1, "layoutId"    # I
        .annotation build Landroid/support/annotation/LayoutRes;
        .end annotation
    .end param
    .param p2, "parent"    # Landroid/view/ViewGroup;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 45
    .local p0, "this":Lcom/vkontakte/android/ui/holder/RecyclerHolder;, "Lcom/vkontakte/android/ui/holder/RecyclerHolder<TT;>;"
    invoke-virtual {p2}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, p1, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(Landroid/view/View;)V

    .line 46
    iput-object p2, p0, Lcom/vkontakte/android/ui/holder/RecyclerHolder;->mParent:Landroid/view/ViewGroup;

    .line 47
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;ILandroid/view/ViewGroup;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "layout"    # I
        .annotation build Landroid/support/annotation/LayoutRes;
        .end annotation
    .end param
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 50
    .local p0, "this":Lcom/vkontakte/android/ui/holder/RecyclerHolder;, "Lcom/vkontakte/android/ui/holder/RecyclerHolder<TT;>;"
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, p2, p3, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    invoke-direct {p0, v0}, Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 24
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/RecyclerHolder;->mParent:Landroid/view/ViewGroup;

    .line 51
    iput-object p1, p0, Lcom/vkontakte/android/ui/holder/RecyclerHolder;->mContext:Landroid/content/Context;

    .line 52
    return-void
.end method

.method public constructor <init>(Landroid/view/View;)V
    .locals 1
    .param p1, "itemView"    # Landroid/view/View;

    .prologue
    .line 30
    .local p0, "this":Lcom/vkontakte/android/ui/holder/RecyclerHolder;, "Lcom/vkontakte/android/ui/holder/RecyclerHolder<TT;>;"
    invoke-direct {p0, p1}, Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 24
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/RecyclerHolder;->mParent:Landroid/view/ViewGroup;

    .line 31
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/RecyclerHolder;->mContext:Landroid/content/Context;

    .line 32
    return-void
.end method

.method public constructor <init>(Landroid/view/View;Landroid/view/ViewGroup;)V
    .locals 1
    .param p1, "itemView"    # Landroid/view/View;
    .param p2, "parent"    # Landroid/view/ViewGroup;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 35
    .local p0, "this":Lcom/vkontakte/android/ui/holder/RecyclerHolder;, "Lcom/vkontakte/android/ui/holder/RecyclerHolder<TT;>;"
    invoke-direct {p0, p1}, Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 24
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/RecyclerHolder;->mParent:Landroid/view/ViewGroup;

    .line 36
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/RecyclerHolder;->mContext:Landroid/content/Context;

    .line 37
    iput-object p2, p0, Lcom/vkontakte/android/ui/holder/RecyclerHolder;->mParent:Landroid/view/ViewGroup;

    .line 38
    return-void
.end method


# virtual methods
.method public $(I)Landroid/view/View;
    .locals 1
    .param p1, "id"    # I
        .annotation build Landroid/support/annotation/IdRes;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Landroid/view/View;",
            ">(I)TT;"
        }
    .end annotation

    .prologue
    .line 68
    .local p0, "this":Lcom/vkontakte/android/ui/holder/RecyclerHolder;, "Lcom/vkontakte/android/ui/holder/RecyclerHolder<TT;>;"
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/RecyclerHolder;->itemView:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public final bind(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 61
    .local p0, "this":Lcom/vkontakte/android/ui/holder/RecyclerHolder;, "Lcom/vkontakte/android/ui/holder/RecyclerHolder<TT;>;"
    .local p1, "item":Ljava/lang/Object;, "TT;"
    iput-object p1, p0, Lcom/vkontakte/android/ui/holder/RecyclerHolder;->item:Ljava/lang/Object;

    .line 62
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;->onBind(Ljava/lang/Object;)V

    .line 63
    return-void
.end method

.method public getContext()Landroid/content/Context;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Landroid/content/Context;",
            ">()TT;"
        }
    .end annotation

    .prologue
    .line 74
    .local p0, "this":Lcom/vkontakte/android/ui/holder/RecyclerHolder;, "Lcom/vkontakte/android/ui/holder/RecyclerHolder<TT;>;"
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/RecyclerHolder;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method public getDrawable(I)Landroid/graphics/drawable/Drawable;
    .locals 1
    .param p1, "id"    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/res/Resources$NotFoundException;
        }
    .end annotation

    .prologue
    .line 112
    .local p0, "this":Lcom/vkontakte/android/ui/holder/RecyclerHolder;, "Lcom/vkontakte/android/ui/holder/RecyclerHolder<TT;>;"
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/vkontakte/android/ViewUtils;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0
.end method

.method public getItem()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 82
    .local p0, "this":Lcom/vkontakte/android/ui/holder/RecyclerHolder;, "Lcom/vkontakte/android/ui/holder/RecyclerHolder<TT;>;"
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/RecyclerHolder;->item:Ljava/lang/Object;

    return-object v0
.end method

.method public getParent()Landroid/view/ViewGroup;
    .locals 1

    .prologue
    .line 78
    .local p0, "this":Lcom/vkontakte/android/ui/holder/RecyclerHolder;, "Lcom/vkontakte/android/ui/holder/RecyclerHolder<TT;>;"
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/RecyclerHolder;->mParent:Landroid/view/ViewGroup;

    return-object v0
.end method

.method public getQuantityString(II)Ljava/lang/String;
    .locals 1
    .param p1, "id"    # I
        .annotation build Landroid/support/annotation/PluralsRes;
        .end annotation
    .end param
    .param p2, "quantity"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/res/Resources$NotFoundException;
        }
    .end annotation

    .prologue
    .line 104
    .local p0, "this":Lcom/vkontakte/android/ui/holder/RecyclerHolder;, "Lcom/vkontakte/android/ui/holder/RecyclerHolder<TT;>;"
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Landroid/content/res/Resources;->getQuantityString(II)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public varargs getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;
    .locals 1
    .param p1, "id"    # I
        .annotation build Landroid/support/annotation/PluralsRes;
        .end annotation
    .end param
    .param p2, "quantity"    # I
    .param p3, "formatArgs"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/res/Resources$NotFoundException;
        }
    .end annotation

    .prologue
    .line 100
    .local p0, "this":Lcom/vkontakte/android/ui/holder/RecyclerHolder;, "Lcom/vkontakte/android/ui/holder/RecyclerHolder<TT;>;"
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getResources()Landroid/content/res/Resources;
    .locals 1

    .prologue
    .line 88
    .local p0, "this":Lcom/vkontakte/android/ui/holder/RecyclerHolder;, "Lcom/vkontakte/android/ui/holder/RecyclerHolder<TT;>;"
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    return-object v0
.end method

.method public getString(I)Ljava/lang/String;
    .locals 1
    .param p1, "id"    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/res/Resources$NotFoundException;
        }
    .end annotation

    .prologue
    .line 92
    .local p0, "this":Lcom/vkontakte/android/ui/holder/RecyclerHolder;, "Lcom/vkontakte/android/ui/holder/RecyclerHolder<TT;>;"
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public varargs getString(I[Ljava/lang/Object;)Ljava/lang/String;
    .locals 1
    .param p1, "id"    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param
    .param p2, "formatArgs"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/res/Resources$NotFoundException;
        }
    .end annotation

    .prologue
    .line 96
    .local p0, "this":Lcom/vkontakte/android/ui/holder/RecyclerHolder;, "Lcom/vkontakte/android/ui/holder/RecyclerHolder<TT;>;"
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getStringArray(I)[Ljava/lang/String;
    .locals 1
    .param p1, "id"    # I
        .annotation build Landroid/support/annotation/ArrayRes;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/res/Resources$NotFoundException;
        }
    .end annotation

    .prologue
    .line 108
    .local p0, "this":Lcom/vkontakte/android/ui/holder/RecyclerHolder;, "Lcom/vkontakte/android/ui/holder/RecyclerHolder<TT;>;"
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public abstract onBind(Ljava/lang/Object;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation
.end method

.method public final rebind()V
    .locals 1

    .prologue
    .line 57
    .local p0, "this":Lcom/vkontakte/android/ui/holder/RecyclerHolder;, "Lcom/vkontakte/android/ui/holder/RecyclerHolder<TT;>;"
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;->getItem()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;->bind(Ljava/lang/Object;)V

    .line 58
    return-void
.end method
