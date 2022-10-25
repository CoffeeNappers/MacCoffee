.class final Lcom/vk/emoji/EmojiAdapter;
.super Landroid/support/v7/widget/RecyclerView$Adapter;
.source "EmojiAdapter.java"

# interfaces
.implements Lcom/vk/emoji/EmojiRecyclerView$HeaderInfoProvider;
.implements Lcom/vk/emoji/ScrollPositionProvider;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/support/v7/widget/RecyclerView$Adapter",
        "<",
        "Lcom/vk/emoji/EmojiHolder;",
        ">;",
        "Lcom/vk/emoji/EmojiRecyclerView$HeaderInfoProvider;",
        "Lcom/vk/emoji/ScrollPositionProvider;"
    }
.end annotation


# static fields
.field private static final TYPE_HEADER:I = 0x0

.field private static final TYPE_ITEM:I = 0x1


# instance fields
.field private final context:Landroid/content/Context;

.field private final data:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<[",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final dataSize:I

.field private final emojiCount:I

.field private emojiKeyboardListener:Lcom/vk/emoji/EmojiKeyboardListener;

.field private final emojiRecyclerView:Lcom/vk/emoji/EmojiRecyclerView;

.field private final headerPositions:[I

.field private headersTypeface:Landroid/graphics/Typeface;

.field private final recentData:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final recentStore:Lcom/vk/emoji/RecentItemStore;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/vk/emoji/EmojiRecyclerView;Lcom/vk/emoji/RecentItemStore;Lcom/vk/emoji/EmojiKeyboardListener;Landroid/graphics/Typeface;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "recyclerView"    # Lcom/vk/emoji/EmojiRecyclerView;
    .param p3, "recentItemStore"    # Lcom/vk/emoji/RecentItemStore;
    .param p4, "emojiKeyboardListener"    # Lcom/vk/emoji/EmojiKeyboardListener;
    .param p5, "headersTypeface"    # Landroid/graphics/Typeface;

    .prologue
    .line 32
    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$Adapter;-><init>()V

    .line 28
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lcom/vk/emoji/EmojiAdapter;->recentData:Ljava/util/ArrayList;

    .line 33
    iput-object p1, p0, Lcom/vk/emoji/EmojiAdapter;->context:Landroid/content/Context;

    .line 34
    iput-object p2, p0, Lcom/vk/emoji/EmojiAdapter;->emojiRecyclerView:Lcom/vk/emoji/EmojiRecyclerView;

    .line 35
    iput-object p3, p0, Lcom/vk/emoji/EmojiAdapter;->recentStore:Lcom/vk/emoji/RecentItemStore;

    .line 36
    iput-object p4, p0, Lcom/vk/emoji/EmojiAdapter;->emojiKeyboardListener:Lcom/vk/emoji/EmojiKeyboardListener;

    .line 37
    iput-object p5, p0, Lcom/vk/emoji/EmojiAdapter;->headersTypeface:Landroid/graphics/Typeface;

    .line 39
    sget-object v2, Lcom/vk/emoji/EmojiGenerated;->KEYBOARD_MAP:Ljava/util/ArrayList;

    iput-object v2, p0, Lcom/vk/emoji/EmojiAdapter;->data:Ljava/util/ArrayList;

    .line 40
    iget-object v2, p0, Lcom/vk/emoji/EmojiAdapter;->data:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    iput v2, p0, Lcom/vk/emoji/EmojiAdapter;->dataSize:I

    .line 41
    iget v2, p0, Lcom/vk/emoji/EmojiAdapter;->dataSize:I

    new-array v2, v2, [I

    iput-object v2, p0, Lcom/vk/emoji/EmojiAdapter;->headerPositions:[I

    .line 43
    const/4 v0, 0x0

    .line 44
    .local v0, "emojiCountTmp":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v2, p0, Lcom/vk/emoji/EmojiAdapter;->data:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 45
    iget-object v2, p0, Lcom/vk/emoji/EmojiAdapter;->headerPositions:[I

    add-int v3, v0, v1

    aput v3, v2, v1

    .line 46
    iget-object v2, p0, Lcom/vk/emoji/EmojiAdapter;->data:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Ljava/lang/String;

    array-length v2, v2

    add-int/2addr v0, v2

    .line 44
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 48
    :cond_0
    iput v0, p0, Lcom/vk/emoji/EmojiAdapter;->emojiCount:I

    .line 49
    invoke-virtual {p0}, Lcom/vk/emoji/EmojiAdapter;->updateRecents()V

    .line 50
    return-void
.end method

.method private getHeaderTitleResId(I)I
    .locals 4
    .param p1, "index"    # I

    .prologue
    .line 105
    invoke-direct {p0}, Lcom/vk/emoji/EmojiAdapter;->recentCountWithHeader()I

    move-result v1

    .line 106
    .local v1, "recentCountWithHeader":I
    if-nez p1, :cond_0

    if-lez v1, :cond_0

    .line 107
    sget v2, Lcom/vk/emoji/R$string;->emoji_frequently_used:I

    .line 126
    :goto_0
    return v2

    .line 109
    :cond_0
    sub-int/2addr p1, v1

    .line 110
    iget-object v2, p0, Lcom/vk/emoji/EmojiAdapter;->headerPositions:[I

    invoke-static {v2, p1}, Ljava/util/Arrays;->binarySearch([II)I

    move-result v0

    .line 111
    .local v0, "pos":I
    if-gez v0, :cond_1

    .line 112
    new-instance v2, Ljava/lang/RuntimeException;

    const-string/jumbo v3, "Invalid emoji set"

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 114
    :cond_1
    packed-switch v0, :pswitch_data_0

    .line 126
    sget v2, Lcom/vk/emoji/R$string;->emoji_emojis:I

    goto :goto_0

    .line 115
    :pswitch_0
    sget v2, Lcom/vk/emoji/R$string;->emoji_emojis:I

    goto :goto_0

    .line 116
    :pswitch_1
    sget v2, Lcom/vk/emoji/R$string;->emoji_gestures_and_people:I

    goto :goto_0

    .line 117
    :pswitch_2
    sget v2, Lcom/vk/emoji/R$string;->emoji_symbols:I

    goto :goto_0

    .line 118
    :pswitch_3
    sget v2, Lcom/vk/emoji/R$string;->emoji_animals_and_plants:I

    goto :goto_0

    .line 119
    :pswitch_4
    sget v2, Lcom/vk/emoji/R$string;->emoji_food_and_drink:I

    goto :goto_0

    .line 120
    :pswitch_5
    sget v2, Lcom/vk/emoji/R$string;->emoji_sport_and_activity:I

    goto :goto_0

    .line 121
    :pswitch_6
    sget v2, Lcom/vk/emoji/R$string;->emoji_travels_and_transport:I

    goto :goto_0

    .line 122
    :pswitch_7
    sget v2, Lcom/vk/emoji/R$string;->emoji_objects:I

    goto :goto_0

    .line 123
    :pswitch_8
    sget v2, Lcom/vk/emoji/R$string;->emoji_flags:I

    goto :goto_0

    .line 114
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
    .end packed-switch
.end method

.method private getItem(I)Ljava/lang/String;
    .locals 7
    .param p1, "index"    # I

    .prologue
    const/4 v5, 0x0

    .line 130
    if-nez p1, :cond_1

    .line 154
    :cond_0
    :goto_0
    return-object v5

    .line 133
    :cond_1
    invoke-direct {p0}, Lcom/vk/emoji/EmojiAdapter;->recentCountWithHeader()I

    move-result v3

    .line 134
    .local v3, "recentsCountWithHeader":I
    if-ge p1, v3, :cond_2

    .line 135
    iget-object v5, p0, Lcom/vk/emoji/EmojiAdapter;->recentData:Ljava/util/ArrayList;

    add-int/lit8 v6, p1, -0x1

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    goto :goto_0

    .line 137
    :cond_2
    sub-int/2addr p1, v3

    .line 140
    iget-object v6, p0, Lcom/vk/emoji/EmojiAdapter;->headerPositions:[I

    invoke-static {v6, p1}, Ljava/util/Arrays;->binarySearch([II)I

    move-result v2

    .line 141
    .local v2, "pos":I
    if-gez v2, :cond_0

    .line 146
    iget-object v6, p0, Lcom/vk/emoji/EmojiAdapter;->headerPositions:[I

    array-length v6, v6

    add-int/lit8 v1, v6, -0x1

    .local v1, "i":I
    :goto_1
    if-ltz v1, :cond_0

    .line 147
    iget-object v6, p0, Lcom/vk/emoji/EmojiAdapter;->headerPositions:[I

    aget v6, v6, v1

    if-le p1, v6, :cond_3

    .line 148
    move v0, v1

    .line 149
    .local v0, "catIndex":I
    iget-object v5, p0, Lcom/vk/emoji/EmojiAdapter;->headerPositions:[I

    aget v5, v5, v1

    sub-int v5, p1, v5

    add-int/lit8 v4, v5, -0x1

    .line 150
    .local v4, "targetIndex":I
    iget-object v5, p0, Lcom/vk/emoji/EmojiAdapter;->data:Ljava/util/ArrayList;

    invoke-virtual {v5, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [Ljava/lang/String;

    aget-object v5, v5, v4

    goto :goto_0

    .line 146
    .end local v0    # "catIndex":I
    .end local v4    # "targetIndex":I
    :cond_3
    add-int/lit8 v1, v1, -0x1

    goto :goto_1
.end method

.method private recentCountWithHeader()I
    .locals 1

    .prologue
    .line 158
    iget-object v0, p0, Lcom/vk/emoji/EmojiAdapter;->recentData:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_0

    .line 159
    const/4 v0, 0x0

    .line 161
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/vk/emoji/EmojiAdapter;->recentData:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method


# virtual methods
.method public getItemCount()I
    .locals 2

    .prologue
    .line 77
    iget v0, p0, Lcom/vk/emoji/EmojiAdapter;->dataSize:I

    iget v1, p0, Lcom/vk/emoji/EmojiAdapter;->emojiCount:I

    add-int/2addr v0, v1

    invoke-direct {p0}, Lcom/vk/emoji/EmojiAdapter;->recentCountWithHeader()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public getItemViewType(I)I
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 72
    invoke-direct {p0, p1}, Lcom/vk/emoji/EmojiAdapter;->getItem(I)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public getScrollPosition(F)I
    .locals 7
    .param p1, "floatPosition"    # F

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 167
    iget-object v5, p0, Lcom/vk/emoji/EmojiAdapter;->recentData:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-lez v5, :cond_0

    move v0, v3

    .line 168
    .local v0, "hasRecent":Z
    :goto_0
    if-eqz v0, :cond_1

    iget-object v5, p0, Lcom/vk/emoji/EmojiAdapter;->headerPositions:[I

    array-length v5, v5

    add-int/lit8 v5, v5, 0x1

    :goto_1
    add-int/lit8 v1, v5, -0x1

    .line 169
    .local v1, "headersCount":I
    int-to-float v5, v1

    mul-float/2addr v5, p1

    float-to-int v2, v5

    .line 170
    .local v2, "targetPosition":I
    if-nez v2, :cond_2

    if-eqz v0, :cond_2

    .line 173
    :goto_2
    return v4

    .end local v0    # "hasRecent":Z
    .end local v1    # "headersCount":I
    .end local v2    # "targetPosition":I
    :cond_0
    move v0, v4

    .line 167
    goto :goto_0

    .line 168
    .restart local v0    # "hasRecent":Z
    :cond_1
    iget-object v5, p0, Lcom/vk/emoji/EmojiAdapter;->headerPositions:[I

    array-length v5, v5

    goto :goto_1

    .line 173
    .restart local v1    # "headersCount":I
    .restart local v2    # "targetPosition":I
    :cond_2
    invoke-direct {p0}, Lcom/vk/emoji/EmojiAdapter;->recentCountWithHeader()I

    move-result v5

    iget-object v6, p0, Lcom/vk/emoji/EmojiAdapter;->headerPositions:[I

    if-eqz v0, :cond_3

    :goto_3
    sub-int v3, v2, v3

    aget v3, v6, v3

    add-int v4, v5, v3

    goto :goto_2

    :cond_3
    move v3, v4

    goto :goto_3
.end method

.method public isHeader(I)Z
    .locals 1
    .param p1, "pos"    # I

    .prologue
    .line 100
    invoke-virtual {p0, p1}, Lcom/vk/emoji/EmojiAdapter;->getItemViewType(I)I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .prologue
    .line 13
    check-cast p1, Lcom/vk/emoji/EmojiHolder;

    invoke-virtual {p0, p1, p2}, Lcom/vk/emoji/EmojiAdapter;->onBindViewHolder(Lcom/vk/emoji/EmojiHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/vk/emoji/EmojiHolder;I)V
    .locals 2
    .param p1, "holder"    # Lcom/vk/emoji/EmojiHolder;
    .param p2, "position"    # I

    .prologue
    .line 63
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-class v1, Lcom/vk/emoji/EmojiItemHolder;

    if-ne v0, v1, :cond_0

    .line 64
    check-cast p1, Lcom/vk/emoji/EmojiItemHolder;

    .end local p1    # "holder":Lcom/vk/emoji/EmojiHolder;
    invoke-direct {p0, p2}, Lcom/vk/emoji/EmojiAdapter;->getItem(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/vk/emoji/EmojiItemHolder;->update(Ljava/lang/String;)V

    .line 68
    :goto_0
    return-void

    .line 66
    .restart local p1    # "holder":Lcom/vk/emoji/EmojiHolder;
    :cond_0
    check-cast p1, Lcom/vk/emoji/EmojiHeaderHolder;

    .end local p1    # "holder":Lcom/vk/emoji/EmojiHolder;
    iget-object v0, p0, Lcom/vk/emoji/EmojiAdapter;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-direct {p0, p2}, Lcom/vk/emoji/EmojiAdapter;->getHeaderTitleResId(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/vk/emoji/EmojiHeaderHolder;->update(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 1

    .prologue
    .line 13
    invoke-virtual {p0, p1, p2}, Lcom/vk/emoji/EmojiAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vk/emoji/EmojiHolder;

    move-result-object v0

    return-object v0
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vk/emoji/EmojiHolder;
    .locals 4
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .prologue
    .line 54
    if-nez p2, :cond_0

    .line 55
    new-instance v0, Lcom/vk/emoji/EmojiHeaderHolder;

    iget-object v1, p0, Lcom/vk/emoji/EmojiAdapter;->context:Landroid/content/Context;

    iget-object v2, p0, Lcom/vk/emoji/EmojiAdapter;->headersTypeface:Landroid/graphics/Typeface;

    invoke-direct {v0, v1, v2}, Lcom/vk/emoji/EmojiHeaderHolder;-><init>(Landroid/content/Context;Landroid/graphics/Typeface;)V

    .line 57
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lcom/vk/emoji/EmojiItemHolder;

    iget-object v1, p0, Lcom/vk/emoji/EmojiAdapter;->context:Landroid/content/Context;

    iget-object v2, p0, Lcom/vk/emoji/EmojiAdapter;->recentStore:Lcom/vk/emoji/RecentItemStore;

    iget-object v3, p0, Lcom/vk/emoji/EmojiAdapter;->emojiKeyboardListener:Lcom/vk/emoji/EmojiKeyboardListener;

    invoke-direct {v0, v1, v2, v3}, Lcom/vk/emoji/EmojiItemHolder;-><init>(Landroid/content/Context;Lcom/vk/emoji/RecentItemStore;Lcom/vk/emoji/EmojiKeyboardListener;)V

    goto :goto_0
.end method

.method public setEmojiKeyboardListener(Lcom/vk/emoji/EmojiKeyboardListener;)V
    .locals 0
    .param p1, "emojiKeyboardListener"    # Lcom/vk/emoji/EmojiKeyboardListener;

    .prologue
    .line 82
    iput-object p1, p0, Lcom/vk/emoji/EmojiAdapter;->emojiKeyboardListener:Lcom/vk/emoji/EmojiKeyboardListener;

    .line 83
    return-void
.end method

.method public setHeadersTypeface(Landroid/graphics/Typeface;)V
    .locals 0
    .param p1, "headersTypeface"    # Landroid/graphics/Typeface;

    .prologue
    .line 86
    iput-object p1, p0, Lcom/vk/emoji/EmojiAdapter;->headersTypeface:Landroid/graphics/Typeface;

    .line 87
    return-void
.end method

.method public updateRecents()V
    .locals 5

    .prologue
    .line 90
    iget-object v3, p0, Lcom/vk/emoji/EmojiAdapter;->emojiRecyclerView:Lcom/vk/emoji/EmojiRecyclerView;

    invoke-virtual {v3}, Lcom/vk/emoji/EmojiRecyclerView;->getSpanCount()I

    move-result v3

    mul-int/lit8 v2, v3, 0x2

    .line 91
    .local v2, "recentsCount":I
    iget-object v3, p0, Lcom/vk/emoji/EmojiAdapter;->recentData:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->clear()V

    .line 92
    iget-object v3, p0, Lcom/vk/emoji/EmojiAdapter;->recentStore:Lcom/vk/emoji/RecentItemStore;

    invoke-virtual {v3}, Lcom/vk/emoji/RecentItemStore;->load()[Ljava/lang/String;

    move-result-object v1

    .line 93
    .local v1, "recents":[Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v3, v1

    invoke-static {v3, v2}, Ljava/lang/Math;->min(II)I

    move-result v3

    if-ge v0, v3, :cond_0

    .line 94
    iget-object v3, p0, Lcom/vk/emoji/EmojiAdapter;->recentData:Ljava/util/ArrayList;

    aget-object v4, v1, v0

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 93
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 96
    :cond_0
    invoke-virtual {p0}, Lcom/vk/emoji/EmojiAdapter;->notifyDataSetChanged()V

    .line 97
    return-void
.end method
