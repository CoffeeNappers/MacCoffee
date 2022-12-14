.class public Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter;
.super Landroid/widget/ArrayAdapter;
.source "NewsSpinnerAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter$DropDownViewHolder;,
        Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter$Item;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/ArrayAdapter",
        "<",
        "Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter$Item;",
        ">;"
    }
.end annotation


# instance fields
.field private selectedItem:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 91
    const v0, 0x7f03002c

    const v1, 0x1020014

    invoke-direct {p0, p1, v0, v1}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;II)V

    .line 83
    const/4 v0, 0x0

    iput v0, p0, Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter;->selectedItem:I

    .line 92
    const v0, 0x7f03015f

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter;->setDropDownViewResource(I)V

    .line 93
    return-void
.end method

.method static synthetic lambda$getDropDownView$0(Landroid/widget/AdapterView$OnItemClickListener;Landroid/view/ViewGroup;Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter$DropDownViewHolder;ILandroid/view/View;)V
    .locals 6
    .param p0, "listener"    # Landroid/widget/AdapterView$OnItemClickListener;
    .param p1, "parent"    # Landroid/view/ViewGroup;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "holder"    # Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter$DropDownViewHolder;
    .param p3, "position"    # I
    .param p4, "v"    # Landroid/view/View;

    .prologue
    .line 108
    move-object v1, p1

    check-cast v1, Landroid/widget/AbsListView;

    iget-object v2, p2, Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter$DropDownViewHolder;->itemView:Landroid/view/View;

    const-wide/16 v4, 0x0

    move-object v0, p0

    move v3, p3

    invoke-interface/range {v0 .. v5}, Landroid/widget/AdapterView$OnItemClickListener;->onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V

    return-void
.end method

.method static synthetic lambda$getDropDownView$1(Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter$Item;Landroid/widget/AdapterView$OnItemClickListener;Landroid/view/ViewGroup;Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter$DropDownViewHolder;ILandroid/widget/CompoundButton;Z)V
    .locals 6
    .param p0, "item"    # Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter$Item;
    .param p1, "listener"    # Landroid/widget/AdapterView$OnItemClickListener;
    .param p2, "parent"    # Landroid/view/ViewGroup;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "holder"    # Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter$DropDownViewHolder;
    .param p4, "position"    # I
    .param p5, "c"    # Landroid/widget/CompoundButton;
    .param p6, "b"    # Z

    .prologue
    .line 115
    iget-object v0, p0, Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter$Item;->onCheckedChangeListener:Landroid/widget/CompoundButton$OnCheckedChangeListener;

    invoke-interface {v0, p5, p6}, Landroid/widget/CompoundButton$OnCheckedChangeListener;->onCheckedChanged(Landroid/widget/CompoundButton;Z)V

    move-object v1, p2

    .line 116
    check-cast v1, Landroid/widget/AbsListView;

    iget-object v2, p3, Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter$DropDownViewHolder;->itemView:Landroid/view/View;

    const-wide/16 v4, 0x0

    move-object v0, p1

    move v3, p4

    invoke-interface/range {v0 .. v5}, Landroid/widget/AdapterView$OnItemClickListener;->onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V

    .line 117
    return-void
.end method


# virtual methods
.method public add(Lcom/vkontakte/android/NewsfeedList;I)V
    .locals 1
    .param p1, "listItem"    # Lcom/vkontakte/android/NewsfeedList;
    .param p2, "icon"    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param

    .prologue
    .line 155
    new-instance v0, Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter$Item;

    invoke-direct {v0, p1, p2}, Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter$Item;-><init>(Lcom/vkontakte/android/NewsfeedList;I)V

    invoke-super {p0, v0}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    .line 156
    return-void
.end method

.method public add(Lcom/vkontakte/android/NewsfeedList;ILjava/lang/String;ZLandroid/widget/CompoundButton$OnCheckedChangeListener;)V
    .locals 6
    .param p1, "listItem"    # Lcom/vkontakte/android/NewsfeedList;
    .param p2, "icon"    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param
    .param p3, "switchTitle"    # Ljava/lang/String;
    .param p4, "checked"    # Z
    .param p5, "onCheckedChangeListener"    # Landroid/widget/CompoundButton$OnCheckedChangeListener;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 160
    new-instance v0, Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter$Item;

    move-object v1, p1

    move v2, p2

    move-object v3, p3

    move v4, p4

    move-object v5, p5

    invoke-direct/range {v0 .. v5}, Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter$Item;-><init>(Lcom/vkontakte/android/NewsfeedList;ILjava/lang/String;ZLandroid/widget/CompoundButton$OnCheckedChangeListener;)V

    invoke-super {p0, v0}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    .line 161
    return-void
.end method

.method public getDropDownView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 11
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    const/4 v8, 0x1

    const/4 v9, 0x0

    const/4 v7, 0x0

    .line 97
    invoke-static {p2, p3}, Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter$DropDownViewHolder;->get(Landroid/view/View;Landroid/view/ViewGroup;)Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter$DropDownViewHolder;

    move-result-object v2

    .line 98
    .local v2, "holder":Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter$DropDownViewHolder;
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter$Item;

    .line 99
    .local v3, "item":Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter$Item;
    iget-object v6, v2, Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter$DropDownViewHolder;->title:Landroid/widget/CheckedTextView;

    invoke-virtual {v3}, Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter$Item;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v6, v10}, Landroid/widget/CheckedTextView;->setText(Ljava/lang/CharSequence;)V

    .line 100
    invoke-virtual {p3}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v10, 0x7f0f0124

    invoke-virtual {v6, v10}, Landroid/content/res/Resources;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    .line 101
    .local v0, "colorStateList":Landroid/content/res/ColorStateList;
    new-instance v1, Lcom/vkontakte/android/ui/drawable/RecoloredDrawable;

    invoke-virtual {p3}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v6

    iget v10, v3, Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter$Item;->iconRes:I

    invoke-static {v6, v10}, Lcom/vkontakte/android/ViewUtils;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v6

    invoke-direct {v1, v6, v0}, Lcom/vkontakte/android/ui/drawable/RecoloredDrawable;-><init>(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V

    .line 102
    .local v1, "drawable":Landroid/graphics/drawable/Drawable;
    iget-object v6, v2, Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter$DropDownViewHolder;->title:Landroid/widget/CheckedTextView;

    invoke-virtual {v6, v1, v9, v9, v9}, Landroid/widget/CheckedTextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 103
    iget-object v6, v2, Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter$DropDownViewHolder;->aSwitch:Landroid/support/v7/widget/SwitchCompat;

    iget-object v10, v3, Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter$Item;->checkTitle:Ljava/lang/String;

    invoke-virtual {v6, v10}, Landroid/support/v7/widget/SwitchCompat;->setText(Ljava/lang/CharSequence;)V

    .line 104
    iget-object v10, v2, Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter$DropDownViewHolder;->aSwitch:Landroid/support/v7/widget/SwitchCompat;

    iget v6, v3, Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter$Item;->checked:I

    if-nez v6, :cond_1

    const/16 v6, 0x8

    :goto_0
    invoke-virtual {v10, v6}, Landroid/support/v7/widget/SwitchCompat;->setVisibility(I)V

    .line 106
    instance-of v6, p3, Landroid/widget/AbsListView;

    if-eqz v6, :cond_2

    move-object v6, p3

    check-cast v6, Landroid/widget/AbsListView;

    invoke-virtual {v6}, Landroid/widget/AbsListView;->getOnItemClickListener()Landroid/widget/AdapterView$OnItemClickListener;

    move-result-object v4

    .line 107
    .local v4, "listener":Landroid/widget/AdapterView$OnItemClickListener;
    :goto_1
    if-eqz v4, :cond_0

    .line 108
    iget-object v6, v2, Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter$DropDownViewHolder;->title:Landroid/widget/CheckedTextView;

    invoke-static {v4, p3, v2, p1}, Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter$$Lambda$1;->lambdaFactory$(Landroid/widget/AdapterView$OnItemClickListener;Landroid/view/ViewGroup;Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter$DropDownViewHolder;I)Landroid/view/View$OnClickListener;

    move-result-object v10

    invoke-virtual {v6, v10}, Landroid/widget/CheckedTextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 111
    :cond_0
    iget-object v6, v2, Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter$DropDownViewHolder;->aSwitch:Landroid/support/v7/widget/SwitchCompat;

    invoke-virtual {v6, v9}, Landroid/support/v7/widget/SwitchCompat;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 112
    iget-object v9, v2, Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter$DropDownViewHolder;->aSwitch:Landroid/support/v7/widget/SwitchCompat;

    iget v6, v3, Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter$Item;->checked:I

    if-lez v6, :cond_3

    move v6, v8

    :goto_2
    invoke-virtual {v9, v6}, Landroid/support/v7/widget/SwitchCompat;->setChecked(Z)V

    .line 113
    if-eqz v4, :cond_4

    iget-object v6, v3, Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter$Item;->onCheckedChangeListener:Landroid/widget/CompoundButton$OnCheckedChangeListener;

    if-eqz v6, :cond_4

    .line 114
    iget-object v6, v2, Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter$DropDownViewHolder;->aSwitch:Landroid/support/v7/widget/SwitchCompat;

    invoke-static {v3, v4, p3, v2, p1}, Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter$Item;Landroid/widget/AdapterView$OnItemClickListener;Landroid/view/ViewGroup;Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter$DropDownViewHolder;I)Landroid/widget/CompoundButton$OnCheckedChangeListener;

    move-result-object v9

    invoke-virtual {v6, v9}, Landroid/support/v7/widget/SwitchCompat;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 122
    :goto_3
    iget-object v6, v2, Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter$DropDownViewHolder;->title:Landroid/widget/CheckedTextView;

    iget v9, p0, Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter;->selectedItem:I

    if-ne v9, p1, :cond_5

    :goto_4
    invoke-virtual {v6, v8}, Landroid/widget/CheckedTextView;->setChecked(Z)V

    .line 124
    iget v6, v3, Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter$Item;->checked:I

    if-nez v6, :cond_6

    .line 125
    iget-object v6, v2, Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter$DropDownViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v6, v7}, Landroid/view/View;->setBackgroundColor(I)V

    .line 130
    :goto_5
    const/high16 v6, 0x41000000    # 8.0f

    invoke-static {v6}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v5

    .line 131
    .local v5, "pad":I
    iget v6, v3, Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter$Item;->checked:I

    if-eqz v6, :cond_7

    .line 132
    iget-object v6, v2, Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter$DropDownViewHolder;->itemView:Landroid/view/View;

    iget-object v7, v2, Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter$DropDownViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v7}, Landroid/view/View;->getPaddingLeft()I

    move-result v7

    iget-object v8, v2, Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter$DropDownViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v8}, Landroid/view/View;->getPaddingRight()I

    move-result v8

    invoke-virtual {v6, v7, v5, v8, v5}, Landroid/view/View;->setPadding(IIII)V

    .line 141
    :goto_6
    iget-object v6, v2, Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter$DropDownViewHolder;->itemView:Landroid/view/View;

    return-object v6

    .end local v4    # "listener":Landroid/widget/AdapterView$OnItemClickListener;
    .end local v5    # "pad":I
    :cond_1
    move v6, v7

    .line 104
    goto :goto_0

    :cond_2
    move-object v4, v9

    .line 106
    goto :goto_1

    .restart local v4    # "listener":Landroid/widget/AdapterView$OnItemClickListener;
    :cond_3
    move v6, v7

    .line 112
    goto :goto_2

    .line 119
    :cond_4
    iget-object v6, v2, Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter$DropDownViewHolder;->aSwitch:Landroid/support/v7/widget/SwitchCompat;

    iget-object v9, v3, Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter$Item;->onCheckedChangeListener:Landroid/widget/CompoundButton$OnCheckedChangeListener;

    invoke-virtual {v6, v9}, Landroid/support/v7/widget/SwitchCompat;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    goto :goto_3

    :cond_5
    move v8, v7

    .line 122
    goto :goto_4

    .line 127
    :cond_6
    iget-object v6, v2, Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter$DropDownViewHolder;->itemView:Landroid/view/View;

    const v8, 0x7f0200d2

    invoke-virtual {v6, v8}, Landroid/view/View;->setBackgroundResource(I)V

    goto :goto_5

    .line 133
    .restart local v5    # "pad":I
    :cond_7
    if-eqz p1, :cond_8

    add-int/lit8 v6, p1, -0x1

    invoke-virtual {p0, v6}, Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter$Item;

    iget v6, v6, Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter$Item;->checked:I

    if-eqz v6, :cond_9

    .line 134
    :cond_8
    iget-object v6, v2, Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter$DropDownViewHolder;->itemView:Landroid/view/View;

    iget-object v8, v2, Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter$DropDownViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v8}, Landroid/view/View;->getPaddingLeft()I

    move-result v8

    iget-object v9, v2, Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter$DropDownViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v9}, Landroid/view/View;->getPaddingRight()I

    move-result v9

    invoke-virtual {v6, v8, v5, v9, v7}, Landroid/view/View;->setPadding(IIII)V

    goto :goto_6

    .line 135
    :cond_9
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter;->getCount()I

    move-result v6

    add-int/lit8 v6, v6, -0x1

    if-ne p1, v6, :cond_a

    .line 136
    iget-object v6, v2, Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter$DropDownViewHolder;->itemView:Landroid/view/View;

    iget-object v8, v2, Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter$DropDownViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v8}, Landroid/view/View;->getPaddingLeft()I

    move-result v8

    iget-object v9, v2, Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter$DropDownViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v9}, Landroid/view/View;->getPaddingRight()I

    move-result v9

    invoke-virtual {v6, v8, v7, v9, v5}, Landroid/view/View;->setPadding(IIII)V

    goto :goto_6

    .line 138
    :cond_a
    iget-object v6, v2, Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter$DropDownViewHolder;->itemView:Landroid/view/View;

    iget-object v8, v2, Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter$DropDownViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v8}, Landroid/view/View;->getPaddingLeft()I

    move-result v8

    iget-object v9, v2, Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter$DropDownViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v9}, Landroid/view/View;->getPaddingRight()I

    move-result v9

    invoke-virtual {v6, v8, v7, v9, v7}, Landroid/view/View;->setPadding(IIII)V

    goto :goto_6
.end method

.method public getPromoId(I)Ljava/lang/String;
    .locals 3
    .param p1, "listId"    # I

    .prologue
    .line 164
    const/16 v2, -0xa

    if-gt p1, v2, :cond_1

    .line 165
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter;->getCount()I

    move-result v2

    if-ge v0, v2, :cond_1

    .line 166
    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter$Item;

    .line 167
    .local v1, "item":Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter$Item;
    if-eqz v1, :cond_0

    iget-object v2, v1, Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter$Item;->listItem:Lcom/vkontakte/android/NewsfeedList;

    invoke-virtual {v2}, Lcom/vkontakte/android/NewsfeedList;->getId()I

    move-result v2

    if-ne v2, p1, :cond_0

    .line 168
    iget-object v2, v1, Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter$Item;->listItem:Lcom/vkontakte/android/NewsfeedList;

    invoke-virtual {v2}, Lcom/vkontakte/android/NewsfeedList;->getPromoId()Ljava/lang/String;

    move-result-object v2

    .line 172
    .end local v0    # "i":I
    .end local v1    # "item":Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter$Item;
    :goto_1
    return-object v2

    .line 165
    .restart local v0    # "i":I
    .restart local v1    # "item":Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter$Item;
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 172
    .end local v0    # "i":I
    .end local v1    # "item":Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter$Item;
    :cond_1
    const/4 v2, 0x0

    goto :goto_1
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 3
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 147
    invoke-super {p0, p1, p2, p3}, Landroid/widget/ArrayAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 148
    .local v0, "view":Landroid/view/View;
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x15

    if-ge v1, v2, :cond_0

    .line 149
    const v1, 0x1020014

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    sget-object v2, Lcom/vkontakte/android/ui/Font;->Medium:Lcom/vkontakte/android/ui/Font;

    iget-object v2, v2, Lcom/vkontakte/android/ui/Font;->typeface:Landroid/graphics/Typeface;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 151
    :cond_0
    return-object v0
.end method

.method public setSelectedItem(I)V
    .locals 0
    .param p1, "selectedItem"    # I

    .prologue
    .line 86
    iput p1, p0, Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter;->selectedItem:I

    .line 87
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter;->notifyDataSetChanged()V

    .line 88
    return-void
.end method
