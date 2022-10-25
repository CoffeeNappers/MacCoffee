.class Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolder;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "ShitBlockPostDisplayItem.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ViewHolder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<",
        "Lcom/vkontakte/android/NewsEntry;",
        ">;",
        "Landroid/view/View$OnTouchListener;"
    }
.end annotation


# instance fields
.field final content:Landroid/widget/LinearLayout;

.field items:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;",
            ">;"
        }
    .end annotation
.end field

.field postDisplayItem:Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem;

.field final scroller:Landroid/widget/HorizontalScrollView;

.field final title:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 134
    const v0, 0x7f030168

    invoke-direct {p0, v0, p1}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(ILandroid/content/Context;)V

    .line 131
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolder;->items:Ljava/util/List;

    .line 136
    const v0, 0x7f10000e

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolder;->content:Landroid/widget/LinearLayout;

    .line 137
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolder;->content:Landroid/widget/LinearLayout;

    sget-object v1, Lcom/vkontakte/android/ui/posts/AdBlockPostDisplayItem;->dividerDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setDividerDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 138
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolder;->content:Landroid/widget/LinearLayout;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setShowDividers(I)V

    .line 139
    const v0, 0x7f100128

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolder;->title:Landroid/widget/TextView;

    .line 140
    const v0, 0x7f100415

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/HorizontalScrollView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolder;->scroller:Landroid/widget/HorizontalScrollView;

    .line 142
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 144
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolder;->scroller:Landroid/widget/HorizontalScrollView;

    invoke-virtual {v0, p0}, Landroid/widget/HorizontalScrollView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 145
    return-void
.end method


# virtual methods
.method public bind(Lcom/vkontakte/android/NewsEntry;Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem;)V
    .locals 0
    .param p1, "item"    # Lcom/vkontakte/android/NewsEntry;
    .param p2, "postDisplayItem"    # Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem;

    .prologue
    .line 171
    iput-object p2, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolder;->postDisplayItem:Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem;

    .line 172
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolder;->bind(Ljava/lang/Object;)V

    .line 173
    return-void
.end method

.method getAttachment(I)Lcom/vkontakte/android/attachments/ShitAttachment;
    .locals 1
    .param p1, "i"    # I

    .prologue
    .line 167
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolder;->item:Ljava/lang/Object;

    check-cast v0, Lcom/vkontakte/android/NewsEntry;

    iget-object v0, v0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lt p1, v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    check-cast v0, Lcom/vkontakte/android/attachments/ShitAttachment;

    check-cast v0, Lcom/vkontakte/android/attachments/ShitAttachment;

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolder;->item:Ljava/lang/Object;

    check-cast v0, Lcom/vkontakte/android/NewsEntry;

    iget-object v0, v0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/Attachment;

    goto :goto_0
.end method

.method synthetic lambda$onTouch$0(Landroid/view/View;)V
    .locals 5
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 151
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v3, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolder;->content:Landroid/widget/LinearLayout;

    invoke-virtual {v3}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v3

    if-ge v1, v3, :cond_0

    .line 152
    iget-object v3, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolder;->content:Landroid/widget/LinearLayout;

    invoke-virtual {v3, v1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 153
    .local v0, "c":Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v3

    if-eqz v3, :cond_1

    .line 161
    .end local v0    # "c":Landroid/view/View;
    :cond_0
    return-void

    .line 156
    .restart local v0    # "c":Landroid/view/View;
    :cond_1
    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    move-result v3

    invoke-virtual {p1}, Landroid/view/View;->getScrollX()I

    move-result v4

    sub-int v2, v3, v4

    .line 157
    .local v2, "offset":I
    if-lez v2, :cond_2

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v3

    add-int/2addr v3, v2

    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v4

    if-ge v3, v4, :cond_2

    .line 158
    invoke-virtual {p0, v1}, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolder;->getAttachment(I)Lcom/vkontakte/android/attachments/ShitAttachment;

    move-result-object v3

    invoke-static {v3}, Lcom/vkontakte/android/utils/AdsUtil;->trackImpression(Lcom/vkontakte/android/attachments/ShitAttachment;)V

    .line 151
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public onBind(Lcom/vkontakte/android/NewsEntry;)V
    .locals 21
    .param p1, "post"    # Lcom/vkontakte/android/NewsEntry;

    .prologue
    .line 177
    move-object/from16 v0, p1

    iget-object v9, v0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v6

    .line 178
    .local v6, "count":I
    invoke-static {}, Lcom/vkontakte/android/NewsEntry;->getMaxThumbsWidth()I

    move-result v17

    const/4 v9, 0x1

    if-le v6, v9, :cond_3

    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolder;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const v18, 0x7f090027

    move/from16 v0, v18

    invoke-virtual {v9, v0}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v9

    mul-int/lit8 v9, v9, 0x2

    :goto_0
    sub-int v7, v17, v9

    .line 179
    .local v7, "width":I
    int-to-float v9, v7

    const v17, 0x3f0faa69

    mul-float v9, v9, v17

    invoke-static {v9}, Ljava/lang/Math;->round(F)I

    move-result v8

    .line 181
    .local v8, "height":I
    const/4 v11, 0x0

    .line 183
    .local v11, "needCleanScroll":Z
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolder;->content:Landroid/widget/LinearLayout;

    invoke-virtual {v9}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v9

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Ljava/util/ArrayList;->size()I

    move-result v17

    move/from16 v0, v17

    invoke-static {v9, v0}, Ljava/lang/Math;->max(II)I

    move-result v14

    .line 184
    .local v14, "size":I
    const/4 v10, 0x0

    .local v10, "i":I
    :goto_1
    if-ge v10, v14, :cond_5

    .line 185
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolder;->content:Landroid/widget/LinearLayout;

    invoke-virtual {v9, v10}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v16

    .line 186
    .local v16, "view":Landroid/view/View;
    if-nez v16, :cond_4

    const/4 v4, 0x0

    .line 187
    .local v4, "holderItem":Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;
    :goto_2
    if-nez v4, :cond_0

    .line 188
    new-instance v4, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;

    .end local v4    # "holderItem":Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v9}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v9

    invoke-direct {v4, v9}, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;-><init>(Landroid/content/Context;)V

    .line 189
    .restart local v4    # "holderItem":Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolder;->items:Ljava/util/List;

    invoke-interface {v9, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 190
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolder;->content:Landroid/widget/LinearLayout;

    iget-object v0, v4, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;->itemView:Landroid/view/View;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v9, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 193
    :cond_0
    move-object/from16 v0, p0

    invoke-virtual {v0, v10}, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolder;->getAttachment(I)Lcom/vkontakte/android/attachments/ShitAttachment;

    move-result-object v5

    .line 194
    .local v5, "a":Lcom/vkontakte/android/attachments/ShitAttachment;
    if-eqz v5, :cond_1

    iget-object v9, v5, Lcom/vkontakte/android/attachments/ShitAttachment;->video:Lcom/vkontakte/android/attachments/VideoAttachment;

    if-eqz v9, :cond_1

    .line 195
    iget-object v9, v5, Lcom/vkontakte/android/attachments/ShitAttachment;->video:Lcom/vkontakte/android/attachments/VideoAttachment;

    invoke-virtual {v9, v5}, Lcom/vkontakte/android/attachments/VideoAttachment;->setStatistic(Lcom/vkontakte/android/statistics/Statistic;)V

    .line 196
    iget-object v9, v5, Lcom/vkontakte/android/attachments/ShitAttachment;->video:Lcom/vkontakte/android/attachments/VideoAttachment;

    move-object/from16 v0, p1

    iget v0, v0, Lcom/vkontakte/android/NewsEntry;->postID:I

    move/from16 v17, v0

    move/from16 v0, v17

    invoke-virtual {v9, v0}, Lcom/vkontakte/android/attachments/VideoAttachment;->setPostId(I)V

    .line 197
    iget-object v9, v5, Lcom/vkontakte/android/attachments/ShitAttachment;->video:Lcom/vkontakte/android/attachments/VideoAttachment;

    move-object/from16 v0, p1

    iget v0, v0, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    move/from16 v17, v0

    move/from16 v0, v17

    invoke-virtual {v9, v0}, Lcom/vkontakte/android/attachments/VideoAttachment;->setPostOwnerId(I)V

    .line 198
    iget-object v9, v5, Lcom/vkontakte/android/attachments/ShitAttachment;->video:Lcom/vkontakte/android/attachments/VideoAttachment;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolder;->postDisplayItem:Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem;

    move-object/from16 v17, v0

    invoke-static/range {v17 .. v17}, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem;->access$000(Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem;)Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolder;->postDisplayItem:Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem;

    move-object/from16 v18, v0

    invoke-static/range {v18 .. v18}, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem;->access$100(Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem;)Lcom/vkontakte/android/data/PostInteract;

    move-result-object v18

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v9, v0, v1}, Lcom/vkontakte/android/attachments/VideoAttachment;->setReferData(Ljava/lang/String;Lcom/vkontakte/android/data/PostInteract;)V

    .line 200
    :cond_1
    invoke-virtual {v4, v5}, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;->setVideoAttachment(Lcom/vkontakte/android/attachments/ShitAttachment;)V

    .line 202
    invoke-virtual {v4}, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;->getItem()Ljava/lang/Object;

    move-result-object v9

    invoke-static {v9, v5}, Lcom/vkontakte/android/utils/Utils;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_2

    .line 203
    const/4 v11, 0x1

    .line 205
    :cond_2
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolder;->postDisplayItem:Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem;

    invoke-virtual/range {v4 .. v9}, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;->bind(Lcom/vkontakte/android/attachments/ShitAttachment;IIILcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem;)V

    .line 184
    add-int/lit8 v10, v10, 0x1

    goto/16 :goto_1

    .line 178
    .end local v4    # "holderItem":Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;
    .end local v5    # "a":Lcom/vkontakte/android/attachments/ShitAttachment;
    .end local v7    # "width":I
    .end local v8    # "height":I
    .end local v10    # "i":I
    .end local v11    # "needCleanScroll":Z
    .end local v14    # "size":I
    .end local v16    # "view":Landroid/view/View;
    :cond_3
    const/4 v9, 0x0

    goto/16 :goto_0

    .line 186
    .restart local v7    # "width":I
    .restart local v8    # "height":I
    .restart local v10    # "i":I
    .restart local v11    # "needCleanScroll":Z
    .restart local v14    # "size":I
    .restart local v16    # "view":Landroid/view/View;
    :cond_4
    invoke-virtual/range {v16 .. v16}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolderItem;

    move-object v4, v9

    goto/16 :goto_2

    .line 208
    .end local v16    # "view":Landroid/view/View;
    :cond_5
    if-eqz v11, :cond_6

    .line 209
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolder;->scroller:Landroid/widget/HorizontalScrollView;

    invoke-static {v9}, Lcom/vkontakte/android/ui/posts/AdBlockPostDisplayItem;->cleanScroll(Landroid/widget/HorizontalScrollView;)V

    .line 212
    :cond_6
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolder;->updateHeight()V

    .line 216
    const/4 v9, 0x1

    if-ne v6, v9, :cond_9

    .line 217
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolder;->content:Landroid/widget/LinearLayout;

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    move/from16 v0, v17

    move/from16 v1, v18

    move/from16 v2, v19

    move/from16 v3, v20

    invoke-virtual {v9, v0, v1, v2, v3}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 218
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolder;->itemView:Landroid/view/View;

    check-cast v9, Landroid/widget/LinearLayout;

    const/16 v17, 0x2

    move/from16 v0, v17

    invoke-virtual {v9, v0}, Landroid/widget/LinearLayout;->setShowDividers(I)V

    .line 225
    :goto_3
    new-instance v15, Ljava/lang/StringBuilder;

    move-object/from16 v0, p1

    iget-object v9, v0, Lcom/vkontakte/android/NewsEntry;->extra:Landroid/os/Bundle;

    const-string/jumbo v17, "ads_title"

    move-object/from16 v0, v17

    invoke-virtual {v9, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v15, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 226
    .local v15, "titleStr":Ljava/lang/StringBuilder;
    const/4 v9, 0x1

    if-ne v6, v9, :cond_8

    .line 227
    move-object/from16 v0, p1

    iget-object v9, v0, Lcom/vkontakte/android/NewsEntry;->extra:Landroid/os/Bundle;

    const-string/jumbo v17, "age_restriction"

    move-object/from16 v0, v17

    invoke-virtual {v9, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 228
    .local v13, "restriction":Ljava/lang/String;
    const/16 v9, 0x20

    invoke-virtual {v15, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-static {v13}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v17

    if-eqz v17, :cond_7

    const/16 v17, 0x0

    .line 229
    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolder;->getAttachment(I)Lcom/vkontakte/android/attachments/ShitAttachment;

    move-result-object v17

    move-object/from16 v0, v17

    iget-object v13, v0, Lcom/vkontakte/android/attachments/ShitAttachment;->ageRestriction:Ljava/lang/String;

    .line 228
    .end local v13    # "restriction":Ljava/lang/String;
    :cond_7
    invoke-virtual {v9, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 232
    :cond_8
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolder;->title:Landroid/widget/TextView;

    invoke-virtual {v9, v15}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 234
    move-object/from16 v0, p1

    iget-object v9, v0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    const/16 v17, 0x0

    move/from16 v0, v17

    invoke-virtual {v9, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/vkontakte/android/attachments/ShitAttachment;

    invoke-static {v9}, Lcom/vkontakte/android/utils/AdsUtil;->trackImpression(Lcom/vkontakte/android/attachments/ShitAttachment;)V

    .line 235
    return-void

    .line 220
    .end local v15    # "titleStr":Ljava/lang/StringBuilder;
    :cond_9
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolder;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const v17, 0x7f090027

    move/from16 v0, v17

    invoke-virtual {v9, v0}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v12

    .line 221
    .local v12, "postSidePad":I
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolder;->content:Landroid/widget/LinearLayout;

    const/16 v17, 0x0

    const/high16 v18, 0x41800000    # 16.0f

    invoke-static/range {v18 .. v18}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v18

    move/from16 v0, v17

    move/from16 v1, v18

    invoke-virtual {v9, v12, v0, v12, v1}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 222
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolder;->itemView:Landroid/view/View;

    check-cast v9, Landroid/widget/LinearLayout;

    const/16 v17, 0x0

    move/from16 v0, v17

    invoke-virtual {v9, v0}, Landroid/widget/LinearLayout;->setShowDividers(I)V

    goto/16 :goto_3
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 124
    check-cast p1, Lcom/vkontakte/android/NewsEntry;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolder;->onBind(Lcom/vkontakte/android/NewsEntry;)V

    return-void
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 4
    .param p1, "v"    # Landroid/view/View;
    .param p2, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 149
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    const/4 v1, 0x3

    if-ne v0, v1, :cond_1

    .line 150
    :cond_0
    invoke-static {p0, p1}, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolder$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolder;Landroid/view/View;)Ljava/lang/Runnable;

    move-result-object v0

    const-wide/16 v2, 0x1f4

    invoke-virtual {p1, v0, v2, v3}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 163
    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method updateHeight()V
    .locals 2

    .prologue
    .line 238
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolder;->content:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    new-instance v1, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolder$1;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolder$1;-><init>(Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem$ViewHolder;)V

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 261
    return-void
.end method
