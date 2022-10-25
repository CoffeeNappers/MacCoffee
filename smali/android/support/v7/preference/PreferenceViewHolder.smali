.class public Landroid/support/v7/preference/PreferenceViewHolder;
.super Landroid/support/v7/widget/RecyclerView$ViewHolder;
.source "PreferenceViewHolder.java"


# instance fields
.field private final mCachedViews:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private mDividerAllowedAbove:Z

.field private mDividerAllowedBelow:Z


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 6
    .param p1, "itemView"    # Landroid/view/View;
    .annotation build Landroid/support/annotation/RestrictTo;
        value = {
            .enum Landroid/support/annotation/RestrictTo$Scope;->TESTS:Landroid/support/annotation/RestrictTo$Scope;
        }
    .end annotation

    .prologue
    const v5, 0x102003e

    const v4, 0x1020016

    const v3, 0x1020010

    const v2, 0x1020006

    .line 38
    invoke-direct {p0, p1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 31
    new-instance v0, Landroid/util/SparseArray;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Landroid/util/SparseArray;-><init>(I)V

    iput-object v0, p0, Landroid/support/v7/preference/PreferenceViewHolder;->mCachedViews:Landroid/util/SparseArray;

    .line 41
    iget-object v0, p0, Landroid/support/v7/preference/PreferenceViewHolder;->mCachedViews:Landroid/util/SparseArray;

    invoke-virtual {p1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v4, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 42
    iget-object v0, p0, Landroid/support/v7/preference/PreferenceViewHolder;->mCachedViews:Landroid/util/SparseArray;

    invoke-virtual {p1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v3, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 43
    iget-object v0, p0, Landroid/support/v7/preference/PreferenceViewHolder;->mCachedViews:Landroid/util/SparseArray;

    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 44
    iget-object v0, p0, Landroid/support/v7/preference/PreferenceViewHolder;->mCachedViews:Landroid/util/SparseArray;

    sget v1, Landroid/support/v7/preference/R$id;->icon_frame:I

    sget v2, Landroid/support/v7/preference/R$id;->icon_frame:I

    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 45
    iget-object v0, p0, Landroid/support/v7/preference/PreferenceViewHolder;->mCachedViews:Landroid/util/SparseArray;

    .line 46
    invoke-virtual {p1, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 45
    invoke-virtual {v0, v5, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 47
    return-void
.end method


# virtual methods
.method public findViewById(I)Landroid/view/View;
    .locals 3
    .param p1, "id"    # I
        .annotation build Landroid/support/annotation/IdRes;
        .end annotation
    .end param

    .prologue
    .line 57
    iget-object v2, p0, Landroid/support/v7/preference/PreferenceViewHolder;->mCachedViews:Landroid/util/SparseArray;

    invoke-virtual {v2, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    .line 58
    .local v0, "cachedView":Landroid/view/View;
    if-eqz v0, :cond_0

    .line 65
    .end local v0    # "cachedView":Landroid/view/View;
    :goto_0
    return-object v0

    .line 61
    .restart local v0    # "cachedView":Landroid/view/View;
    :cond_0
    iget-object v2, p0, Landroid/support/v7/preference/PreferenceViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 62
    .local v1, "v":Landroid/view/View;
    if-eqz v1, :cond_1

    .line 63
    iget-object v2, p0, Landroid/support/v7/preference/PreferenceViewHolder;->mCachedViews:Landroid/util/SparseArray;

    invoke-virtual {v2, p1, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    :cond_1
    move-object v0, v1

    .line 65
    goto :goto_0
.end method

.method public isDividerAllowedAbove()Z
    .locals 1

    .prologue
    .line 76
    iget-boolean v0, p0, Landroid/support/v7/preference/PreferenceViewHolder;->mDividerAllowedAbove:Z

    return v0
.end method

.method public isDividerAllowedBelow()Z
    .locals 1

    .prologue
    .line 100
    iget-boolean v0, p0, Landroid/support/v7/preference/PreferenceViewHolder;->mDividerAllowedBelow:Z

    return v0
.end method

.method public setDividerAllowedAbove(Z)V
    .locals 0
    .param p1, "allowed"    # Z

    .prologue
    .line 90
    iput-boolean p1, p0, Landroid/support/v7/preference/PreferenceViewHolder;->mDividerAllowedAbove:Z

    .line 91
    return-void
.end method

.method public setDividerAllowedBelow(Z)V
    .locals 0
    .param p1, "allowed"    # Z

    .prologue
    .line 114
    iput-boolean p1, p0, Landroid/support/v7/preference/PreferenceViewHolder;->mDividerAllowedBelow:Z

    .line 115
    return-void
.end method
