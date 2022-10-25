.class public Lcom/vkontakte/android/ui/adapters/RelationAdapter;
.super Landroid/widget/ArrayAdapter;
.source "RelationAdapter.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/ArrayAdapter",
        "<",
        "Lcom/vkontakte/android/Relation;",
        ">;"
    }
.end annotation


# instance fields
.field private final isMale:Z


# direct methods
.method public constructor <init>(ZLandroid/content/Context;I[Lcom/vkontakte/android/Relation;)V
    .locals 0
    .param p1, "isMale"    # Z
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "resource"    # I
    .param p4, "objects"    # [Lcom/vkontakte/android/Relation;

    .prologue
    .line 17
    invoke-direct {p0, p2, p3, p4}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    .line 18
    iput-boolean p1, p0, Lcom/vkontakte/android/ui/adapters/RelationAdapter;->isMale:Z

    .line 19
    return-void
.end method


# virtual methods
.method public getDropDownView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 5
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 40
    invoke-super {p0, p1, p2, p3}, Landroid/widget/ArrayAdapter;->getDropDownView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    .line 41
    .local v1, "view":Landroid/view/View;
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/ui/adapters/RelationAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/Relation;

    .line 42
    .local v0, "relation":Lcom/vkontakte/android/Relation;
    instance-of v2, v1, Landroid/widget/TextView;

    if-eqz v2, :cond_0

    if-eqz v0, :cond_0

    move-object v2, v1

    .line 43
    check-cast v2, Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/adapters/RelationAdapter;->getContext()Landroid/content/Context;

    move-result-object v3

    iget-boolean v4, p0, Lcom/vkontakte/android/ui/adapters/RelationAdapter;->isMale:Z

    invoke-virtual {v0, v3, v4}, Lcom/vkontakte/android/Relation;->getName(Landroid/content/Context;Z)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 45
    :cond_0
    return-object v1
.end method

.method public getItemId(I)J
    .locals 4
    .param p1, "position"    # I

    .prologue
    .line 23
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/ui/adapters/RelationAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/Relation;

    .line 24
    .local v0, "relation":Lcom/vkontakte/android/Relation;
    if-nez v0, :cond_0

    const-wide/16 v2, 0x0

    :goto_0
    return-wide v2

    :cond_0
    iget v1, v0, Lcom/vkontakte/android/Relation;->id:I

    int-to-long v2, v1

    goto :goto_0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 5
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 30
    invoke-super {p0, p1, p2, p3}, Landroid/widget/ArrayAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    .line 31
    .local v1, "view":Landroid/view/View;
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/ui/adapters/RelationAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/Relation;

    .line 32
    .local v0, "relation":Lcom/vkontakte/android/Relation;
    instance-of v2, v1, Landroid/widget/TextView;

    if-eqz v2, :cond_0

    if-eqz v0, :cond_0

    move-object v2, v1

    .line 33
    check-cast v2, Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/adapters/RelationAdapter;->getContext()Landroid/content/Context;

    move-result-object v3

    iget-boolean v4, p0, Lcom/vkontakte/android/ui/adapters/RelationAdapter;->isMale:Z

    invoke-virtual {v0, v3, v4}, Lcom/vkontakte/android/Relation;->getName(Landroid/content/Context;Z)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 35
    :cond_0
    return-object v1
.end method
