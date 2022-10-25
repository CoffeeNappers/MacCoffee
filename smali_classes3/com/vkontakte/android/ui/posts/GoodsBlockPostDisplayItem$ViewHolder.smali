.class Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$ViewHolder;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "GoodsBlockPostDisplayItem.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem;
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
        "Landroid/view/View$OnClickListener;"
    }
.end annotation


# instance fields
.field adapter:Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$Adapter;

.field private final appSubtitle:Landroid/widget/TextView;

.field private final appTitle:Landroid/widget/TextView;

.field lastPost:Lcom/vkontakte/android/NewsEntry;

.field private final optionsButton:Landroid/view/View;

.field private final photo:Lcom/vk/imageloader/view/VKImageView;

.field postDisplayItem:Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem;

.field private final recyclerView:Landroid/support/v7/widget/RecyclerView;

.field private final text:Landroid/widget/TextView;

.field private final title:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v3, 0x0

    .line 96
    const v0, 0x7f03015c

    invoke-direct {p0, v0, p1}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(ILandroid/content/Context;)V

    .line 93
    new-instance v0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$Adapter;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$Adapter;-><init>(Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$1;)V

    iput-object v0, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$ViewHolder;->adapter:Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$Adapter;

    .line 98
    const v0, 0x7f1001c3

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$ViewHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$ViewHolder;->text:Landroid/widget/TextView;

    .line 99
    const v0, 0x7f100128

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$ViewHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$ViewHolder;->title:Landroid/widget/TextView;

    .line 100
    const v0, 0x7f10000a

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$ViewHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$ViewHolder;->appTitle:Landroid/widget/TextView;

    .line 101
    const v0, 0x7f100009

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$ViewHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$ViewHolder;->appSubtitle:Landroid/widget/TextView;

    .line 102
    const v0, 0x7f1001e8

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$ViewHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/imageloader/view/VKImageView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$ViewHolder;->photo:Lcom/vk/imageloader/view/VKImageView;

    .line 103
    const v0, 0x7f100400

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$ViewHolder;->$(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$ViewHolder;->optionsButton:Landroid/view/View;

    .line 104
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$ViewHolder;->optionsButton:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 106
    const v0, 0x7f1001c2

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$ViewHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/RecyclerView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$ViewHolder;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    .line 107
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$ViewHolder;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    new-instance v1, Landroid/support/v7/widget/LinearLayoutManager;

    invoke-direct {v1, p1, v3, v3}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    .line 108
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$ViewHolder;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$ViewHolder;->adapter:Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$Adapter;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 109
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$ViewHolder;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    new-instance v1, Lcom/vkontakte/android/ui/recyclerview/SpaceItemDecoration;

    const/high16 v2, 0x41000000    # 8.0f

    invoke-static {v2}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v2

    invoke-direct {v1, v3, v3, v2, v3}, Lcom/vkontakte/android/ui/recyclerview/SpaceItemDecoration;-><init>(IIII)V

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    .line 111
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 112
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 113
    return-void
.end method

.method static getGuid(Lcom/vkontakte/android/NewsEntry;)Ljava/lang/String;
    .locals 2
    .param p0, "post"    # Lcom/vkontakte/android/NewsEntry;

    .prologue
    const/4 v1, 0x0

    .line 116
    if-eqz p0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    .line 117
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    .line 118
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    instance-of v0, v0, Lcom/vkontakte/android/attachments/ShitAttachment;

    if-eqz v0, :cond_0

    .line 119
    iget-object v0, p0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/ShitAttachment;

    iget-object v0, v0, Lcom/vkontakte/android/attachments/ShitAttachment;->guid:Ljava/lang/String;

    .line 121
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public bind(Lcom/vkontakte/android/NewsEntry;Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem;)V
    .locals 0
    .param p1, "item"    # Lcom/vkontakte/android/NewsEntry;
    .param p2, "postDisplayItem"    # Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem;

    .prologue
    .line 126
    iput-object p2, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$ViewHolder;->postDisplayItem:Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem;

    .line 127
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$ViewHolder;->bind(Ljava/lang/Object;)V

    .line 128
    return-void
.end method

.method getAttachment(I)Lcom/vkontakte/android/attachments/ShitAttachment;
    .locals 1
    .param p1, "i"    # I

    .prologue
    .line 143
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$ViewHolder;->item:Ljava/lang/Object;

    check-cast v0, Lcom/vkontakte/android/NewsEntry;

    iget-object v0, v0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-le p1, v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    check-cast v0, Lcom/vkontakte/android/attachments/ShitAttachment;

    check-cast v0, Lcom/vkontakte/android/attachments/ShitAttachment;

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$ViewHolder;->item:Ljava/lang/Object;

    check-cast v0, Lcom/vkontakte/android/NewsEntry;

    iget-object v0, v0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/Attachment;

    goto :goto_0
.end method

.method public onBind(Lcom/vkontakte/android/NewsEntry;)V
    .locals 9
    .param p1, "post"    # Lcom/vkontakte/android/NewsEntry;

    .prologue
    const/4 v6, 0x0

    .line 148
    invoke-virtual {p0, v6}, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$ViewHolder;->getAttachment(I)Lcom/vkontakte/android/attachments/ShitAttachment;

    move-result-object v2

    .line 149
    .local v2, "att":Lcom/vkontakte/android/attachments/ShitAttachment;
    if-eqz v2, :cond_3

    .line 150
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$ViewHolder;->lastPost:Lcom/vkontakte/android/NewsEntry;

    invoke-static {v0}, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$ViewHolder;->getGuid(Lcom/vkontakte/android/NewsEntry;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1}, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$ViewHolder;->getGuid(Lcom/vkontakte/android/NewsEntry;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/utils/Utils;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v6, 0x1

    .line 152
    .local v6, "needCleanScroll":Z
    :cond_0
    iget-object v0, p1, Lcom/vkontakte/android/NewsEntry;->extra:Landroid/os/Bundle;

    const-string/jumbo v1, "age_restriction"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 153
    .local v7, "restriction":Ljava/lang/String;
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v7, v2, Lcom/vkontakte/android/attachments/ShitAttachment;->ageRestriction:Ljava/lang/String;

    .line 154
    :cond_1
    new-instance v8, Ljava/lang/StringBuilder;

    iget-object v0, p1, Lcom/vkontakte/android/NewsEntry;->extra:Landroid/os/Bundle;

    const-string/jumbo v1, "ads_title"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v8, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 155
    .local v8, "titleStr":Ljava/lang/StringBuilder;
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$ViewHolder;->photo:Lcom/vk/imageloader/view/VKImageView;

    iget-object v1, v2, Lcom/vkontakte/android/attachments/ShitAttachment;->userPhoto:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 156
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$ViewHolder;->text:Landroid/widget/TextView;

    iget-object v1, v2, Lcom/vkontakte/android/attachments/ShitAttachment;->text:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 157
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$ViewHolder;->appTitle:Landroid/widget/TextView;

    iget-object v1, v2, Lcom/vkontakte/android/attachments/ShitAttachment;->userName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 158
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$ViewHolder;->appSubtitle:Landroid/widget/TextView;

    iget-object v1, v2, Lcom/vkontakte/android/attachments/ShitAttachment;->genre:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 159
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$ViewHolder;->title:Landroid/widget/TextView;

    const/16 v1, 0x20

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 161
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$ViewHolder;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f090134

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v5

    .line 162
    .local v5, "size":I
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$ViewHolder;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f090133

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v4

    .line 164
    .local v4, "padding":I
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$ViewHolder;->adapter:Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$Adapter;

    iget-object v1, v2, Lcom/vkontakte/android/attachments/ShitAttachment;->cards:Ljava/util/ArrayList;

    iget-object v3, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$ViewHolder;->postDisplayItem:Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem;

    invoke-virtual/range {v0 .. v5}, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$Adapter;->bind(Ljava/util/List;Lcom/vkontakte/android/attachments/ShitAttachment;Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem;II)V

    .line 166
    if-eqz v6, :cond_2

    .line 167
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$ViewHolder;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-static {v0}, Lcom/vkontakte/android/ui/posts/AdBlockPostDisplayItem;->cleanScroll(Landroid/support/v7/widget/RecyclerView;)V

    .line 170
    :cond_2
    invoke-static {v2}, Lcom/vkontakte/android/utils/AdsUtil;->trackImpression(Lcom/vkontakte/android/attachments/ShitAttachment;)V

    .line 172
    iput-object p1, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$ViewHolder;->lastPost:Lcom/vkontakte/android/NewsEntry;

    .line 174
    .end local v4    # "padding":I
    .end local v5    # "size":I
    .end local v6    # "needCleanScroll":Z
    .end local v7    # "restriction":Ljava/lang/String;
    .end local v8    # "titleStr":Ljava/lang/StringBuilder;
    :cond_3
    return-void
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 85
    check-cast p1, Lcom/vkontakte/android/NewsEntry;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$ViewHolder;->onBind(Lcom/vkontakte/android/NewsEntry;)V

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v1, 0x0

    .line 132
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 137
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$ViewHolder;->postDisplayItem:Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem;

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$ViewHolder;->getAttachment(I)Lcom/vkontakte/android/attachments/ShitAttachment;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem;->onItemClicked(Lcom/vkontakte/android/attachments/ShitAttachment;Landroid/view/View;)V

    .line 140
    :goto_0
    return-void

    .line 134
    :pswitch_0
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$ViewHolder;->postDisplayItem:Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem;

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem$ViewHolder;->getAttachment(I)Lcom/vkontakte/android/attachments/ShitAttachment;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem;->onMenuClicked(Lcom/vkontakte/android/attachments/ShitAttachment;Landroid/view/View;)V

    goto :goto_0

    .line 132
    :pswitch_data_0
    .packed-switch 0x7f100400
        :pswitch_0
    .end packed-switch
.end method
