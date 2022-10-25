.class public Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "ChatMessageHolder.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/view/View$OnLongClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<",
        "Lcom/vkontakte/android/ui/holder/messages/MessageListItem;",
        ">;",
        "Landroid/view/View$OnClickListener;",
        "Landroid/view/View$OnLongClickListener;"
    }
.end annotation


# static fields
.field public static STANDARD_PADDING:I

.field public static STANDARD_PADDING_BOTTOM:I

.field private static final TIME_DX:I

.field protected static final WRAP_BG_RES:[[I


# instance fields
.field public final attachments:Landroid/view/ViewGroup;

.field private attachmentsImageViews:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field public final attachmentsWrapper:Landroid/view/View;

.field private chatFragment:Lcom/vkontakte/android/fragments/messages/ChatFragment;

.field public final extGiftText:Landroid/widget/TextView;

.field public final fwdName:Landroid/widget/TextView;

.field public final fwdTime:Landroid/widget/TextView;

.field public final fwdWrap:Landroid/view/ViewGroup;

.field private isActionMod:Z

.field private isActionMode:Z

.field private isSelected:Z

.field private isTimeVisible:Z

.field public lastItem:Lcom/vkontakte/android/ui/holder/messages/MessageListItem;

.field public final msgFwdPhoto:Lcom/vk/imageloader/view/VKImageView;

.field private msgId:I

.field private peer:I

.field private final progressDrawable:Lcom/vkontakte/android/ui/drawables/MessageStatusDrawable;

.field public final referenceLinkToHolder:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;",
            ">;"
        }
    .end annotation
.end field

.field public final senderPhoto:Lcom/vk/imageloader/view/VKImageView;

.field public final showStickerPuckButton:Landroid/widget/TextView;

.field public final stateContainer:Landroid/view/View;

.field public final text:Landroid/widget/TextView;

.field public final time:Landroid/widget/TextView;

.field public final translatedViews:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field public final wrap:Landroid/view/ViewGroup;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/16 v3, 0x8

    .line 61
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f090105

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    sput v0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->TIME_DX:I

    .line 63
    sput v5, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->STANDARD_PADDING:I

    .line 64
    sput v4, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->STANDARD_PADDING_BOTTOM:I

    .line 632
    const/4 v0, 0x4

    new-array v0, v0, [[I

    const/4 v1, 0x0

    new-array v2, v3, [I

    fill-array-data v2, :array_0

    aput-object v2, v0, v1

    const/4 v1, 0x1

    new-array v2, v3, [I

    fill-array-data v2, :array_1

    aput-object v2, v0, v1

    new-array v1, v3, [I

    fill-array-data v1, :array_2

    aput-object v1, v0, v4

    new-array v1, v3, [I

    fill-array-data v1, :array_3

    aput-object v1, v0, v5

    sput-object v0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->WRAP_BG_RES:[[I

    return-void

    nop

    :array_0
    .array-data 4
        0x7f02008d
        0x7f020092
        0x7f020090
        0x7f02008b
        0x7f02008f
        0x7f020094
        0x7f020096
        0x7f020097
    .end array-data

    :array_1
    .array-data 4
        0x7f0200a0
        0x7f0200a5
        0x7f0200a3
        0x7f02009e
        0x7f0200a2
        0x7f020099
        0x7f02009b
        0x7f02009c
    .end array-data

    :array_2
    .array-data 4
        0x7f02008e
        0x7f020093
        0x7f020091
        0x7f02008c
        0x7f02008e
        0x7f020095
        0x7f020095
        0x7f020098
    .end array-data

    :array_3
    .array-data 4
        0x7f0200a1
        0x7f0200a6
        0x7f0200a4
        0x7f02009f
        0x7f0200a1
        0x7f02009a
        0x7f02009a
        0x7f02009d
    .end array-data
.end method

.method public constructor <init>(Landroid/view/ViewGroup;IILcom/vkontakte/android/fragments/messages/ChatFragment;I)V
    .locals 7
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I
    .param p3, "peer"    # I
    .param p4, "chatFragment"    # Lcom/vkontakte/android/fragments/messages/ChatFragment;
    .param p5, "fontSize"    # I

    .prologue
    const/4 v2, 0x1

    .line 110
    invoke-static {p2}, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;->getByViewTypeId(I)Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;

    move-result-object v3

    invoke-direct {p0, p1, v3}, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;-><init>(Landroid/view/ViewGroup;Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;)V

    .line 112
    iput-object p4, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->chatFragment:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    .line 114
    invoke-static {p2}, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;->getByViewTypeId(I)Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;

    move-result-object v1

    .line 115
    .local v1, "type":Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;
    sget-object v3, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;->fwdOut:Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;

    if-eq v1, v3, :cond_0

    sget-object v3, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;->giftOut:Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;

    if-eq v1, v3, :cond_0

    sget-object v3, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;->messageOut:Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;

    if-eq v1, v3, :cond_0

    sget-object v3, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;->messageOutText:Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;

    if-ne v1, v3, :cond_3

    :cond_0
    move v0, v2

    .line 118
    .local v0, "isOut":Z
    :goto_0
    sget-object v3, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;->service:Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;

    if-ne v1, v3, :cond_4

    .line 119
    iget-object v3, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->text:Landroid/widget/TextView;

    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 129
    :cond_1
    :goto_1
    iget-boolean v3, v1, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;->canTextSizeChange:Z

    if-eqz v3, :cond_2

    iget-object v3, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->text:Landroid/widget/TextView;

    if-eqz v3, :cond_2

    .line 130
    iget-object v3, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->text:Landroid/widget/TextView;

    const/high16 v4, 0x41800000    # 16.0f

    int-to-float v5, p5

    const/high16 v6, 0x40000000    # 2.0f

    mul-float/2addr v5, v6

    add-float/2addr v4, v5

    invoke-virtual {v3, v2, v4}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 132
    :cond_2
    return-void

    .line 115
    .end local v0    # "isOut":Z
    :cond_3
    const/4 v0, 0x0

    goto :goto_0

    .line 120
    .restart local v0    # "isOut":Z
    :cond_4
    iget-object v3, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->text:Landroid/widget/TextView;

    if-eqz v3, :cond_1

    iget-object v3, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->senderPhoto:Lcom/vk/imageloader/view/VKImageView;

    if-eqz v3, :cond_1

    .line 121
    if-nez v0, :cond_5

    const v3, 0x77359400

    if-ge p3, v3, :cond_5

    .line 122
    iget-object v3, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->senderPhoto:Lcom/vk/imageloader/view/VKImageView;

    const/16 v4, 0x8

    invoke-virtual {v3, v4}, Lcom/vk/imageloader/view/VKImageView;->setVisibility(I)V

    goto :goto_1

    .line 123
    :cond_5
    if-nez v0, :cond_1

    .line 124
    iget-object v3, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->senderPhoto:Lcom/vk/imageloader/view/VKImageView;

    iget-object v4, p4, Lcom/vkontakte/android/fragments/messages/ChatFragment;->chatUserClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v3, v4}, Lcom/vk/imageloader/view/VKImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 125
    iget-object v3, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->senderPhoto:Lcom/vk/imageloader/view/VKImageView;

    iget-object v4, p4, Lcom/vkontakte/android/fragments/messages/ChatFragment;->chatUserLongClickListener:Landroid/view/View$OnLongClickListener;

    invoke-virtual {v3, v4}, Lcom/vk/imageloader/view/VKImageView;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    goto :goto_1
.end method

.method public constructor <init>(Landroid/view/ViewGroup;Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;)V
    .locals 6
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 135
    iget v1, p2, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;->res:I

    invoke-direct {p0, v1, p1}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(ILandroid/view/ViewGroup;)V

    .line 95
    iput-boolean v3, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->isActionMode:Z

    .line 97
    iput-boolean v3, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->isTimeVisible:Z

    .line 103
    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v1, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->referenceLinkToHolder:Ljava/lang/ref/WeakReference;

    .line 137
    const v1, 0x7f10005b

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->$(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->text:Landroid/widget/TextView;

    .line 138
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->text:Landroid/widget/TextView;

    instance-of v1, v1, Lcom/vkontakte/android/ui/LinkedTextView;

    if-eqz v1, :cond_0

    .line 139
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->text:Landroid/widget/TextView;

    check-cast v1, Lcom/vkontakte/android/ui/LinkedTextView;

    invoke-virtual {v1, v4}, Lcom/vkontakte/android/ui/LinkedTextView;->setCanShowMessageOptions(Z)V

    .line 141
    :cond_0
    const v1, 0x7f10005c

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->$(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->time:Landroid/widget/TextView;

    .line 142
    const v1, 0x7f100057

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->$(I)Landroid/view/View;

    move-result-object v0

    .line 143
    .local v0, "progress":Landroid/view/View;
    if-eqz v0, :cond_3

    .line 144
    new-instance v1, Lcom/vkontakte/android/ui/drawables/MessageStatusDrawable;

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/vkontakte/android/ui/drawables/MessageStatusDrawable;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->progressDrawable:Lcom/vkontakte/android/ui/drawables/MessageStatusDrawable;

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 148
    :goto_0
    const v1, 0x7f10005a

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->$(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->stateContainer:Landroid/view/View;

    .line 149
    const v1, 0x7f10005d

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->$(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    iput-object v1, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->wrap:Landroid/view/ViewGroup;

    .line 150
    const v1, 0x7f100054

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->$(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    iput-object v1, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->attachments:Landroid/view/ViewGroup;

    .line 151
    const v1, 0x7f1003a0

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->$(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->attachmentsWrapper:Landroid/view/View;

    .line 152
    const v1, 0x7f100059

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->$(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/vk/imageloader/view/VKImageView;

    iput-object v1, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->senderPhoto:Lcom/vk/imageloader/view/VKImageView;

    .line 153
    const v1, 0x7f10039c

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->$(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/vk/imageloader/view/VKImageView;

    iput-object v1, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->msgFwdPhoto:Lcom/vk/imageloader/view/VKImageView;

    .line 155
    const v1, 0x7f1003a1

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->$(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->extGiftText:Landroid/widget/TextView;

    .line 156
    const v1, 0x7f1003a2

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->$(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->showStickerPuckButton:Landroid/widget/TextView;

    .line 157
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->showStickerPuckButton:Landroid/widget/TextView;

    if-eqz v1, :cond_1

    .line 158
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->showStickerPuckButton:Landroid/widget/TextView;

    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 161
    :cond_1
    const v1, 0x7f10039d

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->$(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->fwdName:Landroid/widget/TextView;

    .line 162
    const v1, 0x7f10039e

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->$(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->fwdTime:Landroid/widget/TextView;

    .line 163
    const v1, 0x7f10039b

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->$(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    iput-object v1, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->fwdWrap:Landroid/view/ViewGroup;

    .line 165
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->wrap:Landroid/view/ViewGroup;

    if-eqz v1, :cond_2

    .line 166
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->wrap:Landroid/view/ViewGroup;

    invoke-virtual {v1, p0}, Landroid/view/ViewGroup;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 167
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->wrap:Landroid/view/ViewGroup;

    invoke-virtual {v1, p0}, Landroid/view/ViewGroup;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 169
    :cond_2
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->itemView:Landroid/view/View;

    invoke-virtual {v1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 170
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->itemView:Landroid/view/View;

    invoke-virtual {v1, p0}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 172
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->itemView:Landroid/view/View;

    invoke-virtual {v1, p0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 174
    sget-object v1, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$2;->$SwitchMap$com$vkontakte$android$ui$holder$messages$ChatMessageHolder$ViewType:[I

    invoke-virtual {p2}, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    .line 179
    iput-object v5, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->translatedViews:Ljava/util/List;

    .line 194
    :goto_1
    return-void

    .line 146
    :cond_3
    iput-object v5, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->progressDrawable:Lcom/vkontakte/android/ui/drawables/MessageStatusDrawable;

    goto/16 :goto_0

    .line 185
    :pswitch_0
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->time:Landroid/widget/TextView;

    invoke-static {v1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->translatedViews:Ljava/util/List;

    goto :goto_1

    .line 191
    :pswitch_1
    const/4 v1, 0x3

    new-array v1, v1, [Landroid/view/View;

    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->time:Landroid/widget/TextView;

    aput-object v2, v1, v3

    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->wrap:Landroid/view/ViewGroup;

    aput-object v2, v1, v4

    const/4 v2, 0x2

    iget-object v3, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->stateContainer:Landroid/view/View;

    aput-object v3, v1, v2

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->translatedViews:Ljava/util/List;

    goto :goto_1

    .line 174
    :pswitch_data_0
    .packed-switch 0x4
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method

.method private fillBg(Lcom/vkontakte/android/ui/holder/messages/MessageListItem;ZZ)V
    .locals 16
    .param p1, "item"    # Lcom/vkontakte/android/ui/holder/messages/MessageListItem;
    .param p2, "isSelected"    # Z
    .param p3, "animate"    # Z

    .prologue
    .line 462
    sget v12, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->STANDARD_PADDING_BOTTOM:I

    int-to-float v12, v12

    invoke-static {v12}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v4

    .line 463
    .local v4, "padBtm":I
    sget v12, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->STANDARD_PADDING:I

    int-to-float v12, v12

    invoke-static {v12}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v5

    .line 464
    .local v5, "padTop":I
    move-object/from16 v0, p1

    iget-boolean v12, v0, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->isOut:Z

    if-eqz v12, :cond_4

    const/4 v12, 0x1

    move v13, v12

    :goto_0
    if-eqz p2, :cond_5

    const/4 v12, 0x1

    :goto_1
    shl-int/lit8 v12, v12, 0x1

    or-int v2, v13, v12

    .line 465
    .local v2, "index":I
    const/4 v1, 0x0

    .line 466
    .local v1, "canShowDot":Z
    invoke-virtual/range {p1 .. p1}, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->isSticker()Z

    move-result v12

    if-nez v12, :cond_0

    invoke-virtual/range {p1 .. p1}, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->isGraffiti()Z

    move-result v12

    if-eqz v12, :cond_6

    :cond_0
    move-object/from16 v0, p1

    iget v12, v0, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->fwdLevel:I

    if-nez v12, :cond_6

    .line 467
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->wrap:Landroid/view/ViewGroup;

    new-instance v13, Landroid/graphics/drawable/ColorDrawable;

    const/4 v14, 0x0

    invoke-direct {v13, v14}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v12, v13}, Landroid/view/ViewGroup;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 468
    const/4 v1, 0x1

    .line 504
    :cond_1
    :goto_2
    move-object/from16 v0, p1

    iget-boolean v12, v0, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->isOut:Z

    if-eqz v12, :cond_2

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->progressDrawable:Lcom/vkontakte/android/ui/drawables/MessageStatusDrawable;

    if-eqz v12, :cond_2

    .line 505
    if-nez v1, :cond_f

    .line 506
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->progressDrawable:Lcom/vkontakte/android/ui/drawables/MessageStatusDrawable;

    sget-object v13, Lcom/vkontakte/android/ui/drawables/MessageStatusDrawable$DrawState;->haveBeenRed:Lcom/vkontakte/android/ui/drawables/MessageStatusDrawable$DrawState;

    const/4 v14, 0x0

    invoke-virtual {v12, v13, v14}, Lcom/vkontakte/android/ui/drawables/MessageStatusDrawable;->setDrawState(Lcom/vkontakte/android/ui/drawables/MessageStatusDrawable$DrawState;Z)V

    .line 518
    :cond_2
    :goto_3
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->itemView:Landroid/view/View;

    invoke-virtual {v12}, Landroid/view/View;->getPaddingLeft()I

    move-result v6

    .local v6, "paddingLeft":I
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->itemView:Landroid/view/View;

    invoke-virtual {v12}, Landroid/view/View;->getPaddingRight()I

    move-result v7

    .line 519
    .local v7, "paddingRight":I
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->chatFragment:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    iget v12, v12, Lcom/vkontakte/android/fragments/messages/ChatFragment;->searchedMessageId:I

    if-eqz v12, :cond_3

    .line 520
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->itemView:Landroid/view/View;

    move-object/from16 v0, p1

    iget v12, v0, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->msgId:I

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->chatFragment:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    iget v14, v14, Lcom/vkontakte/android/fragments/messages/ChatFragment;->searchedMessageId:I

    if-ne v12, v14, :cond_13

    const v12, -0x271d13

    :goto_4
    invoke-virtual {v13, v12}, Landroid/view/View;->setBackgroundColor(I)V

    .line 522
    :cond_3
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->itemView:Landroid/view/View;

    invoke-virtual {v12, v6, v5, v7, v4}, Landroid/view/View;->setPadding(IIII)V

    .line 524
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->wrap:Landroid/view/ViewGroup;

    invoke-virtual {v12}, Landroid/view/ViewGroup;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroid/widget/LinearLayout$LayoutParams;

    .line 525
    .local v3, "lp":Landroid/widget/LinearLayout$LayoutParams;
    move-object/from16 v0, p1

    iget v12, v0, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->type:I

    const/4 v13, 0x1

    if-eq v12, v13, :cond_14

    move-object/from16 v0, p1

    iget v12, v0, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->type:I

    const/4 v13, 0x7

    if-eq v12, v13, :cond_14

    const/high16 v12, 0x3f800000    # 1.0f

    :goto_5
    iput v12, v3, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    .line 526
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->wrap:Landroid/view/ViewGroup;

    invoke-virtual {v12, v3}, Landroid/view/ViewGroup;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 527
    return-void

    .line 464
    .end local v1    # "canShowDot":Z
    .end local v2    # "index":I
    .end local v3    # "lp":Landroid/widget/LinearLayout$LayoutParams;
    .end local v6    # "paddingLeft":I
    .end local v7    # "paddingRight":I
    :cond_4
    const/4 v12, 0x0

    move v13, v12

    goto/16 :goto_0

    :cond_5
    const/4 v12, 0x0

    goto/16 :goto_1

    .line 469
    .restart local v1    # "canShowDot":Z
    .restart local v2    # "index":I
    :cond_6
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->wrap:Landroid/view/ViewGroup;

    if-eqz v12, :cond_1

    .line 470
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->wrap:Landroid/view/ViewGroup;

    invoke-virtual {v12}, Landroid/view/ViewGroup;->getPaddingLeft()I

    move-result v9

    .local v9, "wPL":I
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->wrap:Landroid/view/ViewGroup;

    invoke-virtual {v12}, Landroid/view/ViewGroup;->getPaddingTop()I

    move-result v11

    .local v11, "wPT":I
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->wrap:Landroid/view/ViewGroup;

    invoke-virtual {v12}, Landroid/view/ViewGroup;->getPaddingRight()I

    move-result v10

    .local v10, "wPR":I
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->wrap:Landroid/view/ViewGroup;

    invoke-virtual {v12}, Landroid/view/ViewGroup;->getPaddingBottom()I

    move-result v8

    .line 471
    .local v8, "wPB":I
    move-object/from16 v0, p1

    iget v12, v0, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->type:I

    packed-switch v12, :pswitch_data_0

    .line 473
    :pswitch_0
    invoke-virtual/range {p1 .. p1}, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->isTime()Z

    move-result v12

    if-nez v12, :cond_7

    .line 474
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->wrap:Landroid/view/ViewGroup;

    sget-object v12, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->WRAP_BG_RES:[[I

    aget-object v14, v12, v2

    invoke-virtual/range {p1 .. p1}, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->isFirstBubbleBg()Z

    move-result v12

    if-eqz v12, :cond_a

    const/4 v12, 0x0

    :goto_6
    aget v12, v14, v12

    invoke-virtual {v13, v12}, Landroid/view/ViewGroup;->setBackgroundResource(I)V

    .line 475
    const/4 v1, 0x1

    .line 496
    :cond_7
    :goto_7
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->wrap:Landroid/view/ViewGroup;

    invoke-virtual {v12, v9, v11, v10, v8}, Landroid/view/ViewGroup;->setPadding(IIII)V

    .line 497
    move-object/from16 v0, p1

    iget v12, v0, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->fwdLevel:I

    if-lez v12, :cond_1

    .line 498
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->wrap:Landroid/view/ViewGroup;

    check-cast v12, Lcom/vkontakte/android/ui/MessageRelativeLayout;

    move-object/from16 v0, p1

    iget v13, v0, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->type:I

    const/4 v14, 0x1

    if-eq v13, v14, :cond_8

    move-object/from16 v0, p1

    iget v13, v0, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->type:I

    const/4 v14, 0x2

    if-ne v13, v14, :cond_d

    :cond_8
    const/high16 v13, 0x41000000    # 8.0f

    .line 499
    invoke-static {v13}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v13

    :goto_8
    move-object/from16 v0, p1

    iget v14, v0, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->type:I

    const/4 v15, 0x1

    if-eq v14, v15, :cond_9

    move-object/from16 v0, p1

    iget v14, v0, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->type:I

    const/4 v15, 0x4

    if-ne v14, v15, :cond_e

    :cond_9
    const/high16 v14, 0x41000000    # 8.0f

    .line 500
    invoke-static {v14}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v14

    .line 498
    :goto_9
    invoke-virtual {v12, v13, v14}, Lcom/vkontakte/android/ui/MessageRelativeLayout;->setPaddingD(II)V

    goto/16 :goto_2

    .line 474
    :cond_a
    const/4 v12, 0x5

    goto :goto_6

    .line 479
    :pswitch_1
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->wrap:Landroid/view/ViewGroup;

    sget-object v12, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->WRAP_BG_RES:[[I

    aget-object v14, v12, v2

    invoke-virtual/range {p1 .. p1}, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->isFirstBubbleBg()Z

    move-result v12

    if-eqz v12, :cond_b

    const/4 v12, 0x1

    :goto_a
    aget v12, v14, v12

    invoke-virtual {v13, v12}, Landroid/view/ViewGroup;->setBackgroundResource(I)V

    .line 480
    const/4 v4, 0x0

    .line 481
    goto :goto_7

    .line 479
    :cond_b
    const/4 v12, 0x7

    goto :goto_a

    .line 483
    :pswitch_2
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->wrap:Landroid/view/ViewGroup;

    sget-object v13, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->WRAP_BG_RES:[[I

    aget-object v13, v13, v2

    const/4 v14, 0x2

    aget v13, v13, v14

    invoke-virtual {v12, v13}, Landroid/view/ViewGroup;->setBackgroundResource(I)V

    .line 484
    const/4 v4, 0x0

    move v5, v4

    .line 485
    goto :goto_7

    .line 487
    :pswitch_3
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->wrap:Landroid/view/ViewGroup;

    sget-object v13, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->WRAP_BG_RES:[[I

    aget-object v13, v13, v2

    const/4 v14, 0x3

    aget v13, v13, v14

    invoke-virtual {v12, v13}, Landroid/view/ViewGroup;->setBackgroundResource(I)V

    .line 488
    const/4 v5, 0x0

    .line 489
    const/4 v1, 0x1

    .line 490
    goto :goto_7

    .line 492
    :pswitch_4
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->wrap:Landroid/view/ViewGroup;

    sget-object v12, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->WRAP_BG_RES:[[I

    aget-object v14, v12, v2

    invoke-virtual/range {p1 .. p1}, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->isFirstBubbleBg()Z

    move-result v12

    if-eqz v12, :cond_c

    const/4 v12, 0x4

    :goto_b
    aget v12, v14, v12

    invoke-virtual {v13, v12}, Landroid/view/ViewGroup;->setBackgroundResource(I)V

    .line 493
    const/4 v1, 0x1

    goto/16 :goto_7

    .line 492
    :cond_c
    const/4 v12, 0x6

    goto :goto_b

    .line 499
    :cond_d
    const/4 v13, 0x0

    goto :goto_8

    .line 500
    :cond_e
    const/4 v14, 0x0

    goto :goto_9

    .line 507
    .end local v8    # "wPB":I
    .end local v9    # "wPL":I
    .end local v10    # "wPR":I
    .end local v11    # "wPT":I
    :cond_f
    move-object/from16 v0, p1

    iget-boolean v12, v0, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->isFailed:Z

    if-eqz v12, :cond_10

    .line 508
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->progressDrawable:Lcom/vkontakte/android/ui/drawables/MessageStatusDrawable;

    sget-object v13, Lcom/vkontakte/android/ui/drawables/MessageStatusDrawable$DrawState;->error:Lcom/vkontakte/android/ui/drawables/MessageStatusDrawable$DrawState;

    move/from16 v0, p3

    invoke-virtual {v12, v13, v0}, Lcom/vkontakte/android/ui/drawables/MessageStatusDrawable;->setDrawState(Lcom/vkontakte/android/ui/drawables/MessageStatusDrawable$DrawState;Z)V

    goto/16 :goto_3

    .line 509
    :cond_10
    move-object/from16 v0, p1

    iget v12, v0, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->msgId:I

    if-gez v12, :cond_11

    .line 510
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->progressDrawable:Lcom/vkontakte/android/ui/drawables/MessageStatusDrawable;

    sget-object v13, Lcom/vkontakte/android/ui/drawables/MessageStatusDrawable$DrawState;->sending:Lcom/vkontakte/android/ui/drawables/MessageStatusDrawable$DrawState;

    move/from16 v0, p3

    invoke-virtual {v12, v13, v0}, Lcom/vkontakte/android/ui/drawables/MessageStatusDrawable;->setDrawState(Lcom/vkontakte/android/ui/drawables/MessageStatusDrawable$DrawState;Z)V

    goto/16 :goto_3

    .line 511
    :cond_11
    move-object/from16 v0, p1

    iget-boolean v12, v0, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->readState:Z

    if-nez v12, :cond_12

    .line 512
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->progressDrawable:Lcom/vkontakte/android/ui/drawables/MessageStatusDrawable;

    sget-object v13, Lcom/vkontakte/android/ui/drawables/MessageStatusDrawable$DrawState;->sent:Lcom/vkontakte/android/ui/drawables/MessageStatusDrawable$DrawState;

    move/from16 v0, p3

    invoke-virtual {v12, v13, v0}, Lcom/vkontakte/android/ui/drawables/MessageStatusDrawable;->setDrawState(Lcom/vkontakte/android/ui/drawables/MessageStatusDrawable$DrawState;Z)V

    goto/16 :goto_3

    .line 514
    :cond_12
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->progressDrawable:Lcom/vkontakte/android/ui/drawables/MessageStatusDrawable;

    sget-object v13, Lcom/vkontakte/android/ui/drawables/MessageStatusDrawable$DrawState;->haveBeenRed:Lcom/vkontakte/android/ui/drawables/MessageStatusDrawable$DrawState;

    move/from16 v0, p3

    invoke-virtual {v12, v13, v0}, Lcom/vkontakte/android/ui/drawables/MessageStatusDrawable;->setDrawState(Lcom/vkontakte/android/ui/drawables/MessageStatusDrawable$DrawState;Z)V

    goto/16 :goto_3

    .line 520
    .restart local v6    # "paddingLeft":I
    .restart local v7    # "paddingRight":I
    :cond_13
    const/4 v12, 0x0

    goto/16 :goto_4

    .line 525
    .restart local v3    # "lp":Landroid/widget/LinearLayout$LayoutParams;
    :cond_14
    const/4 v12, 0x0

    goto/16 :goto_5

    .line 471
    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_0
        :pswitch_0
        :pswitch_4
    .end packed-switch
.end method

.method public static getViewType(Lcom/vkontakte/android/ui/holder/messages/MessageListItem;)I
    .locals 2
    .param p0, "item"    # Lcom/vkontakte/android/ui/holder/messages/MessageListItem;

    .prologue
    .line 577
    iget v0, p0, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->type:I

    const/4 v1, 0x5

    if-ne v0, v1, :cond_1

    .line 578
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->hasAttachments()Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;->serviceWithoutImage:Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;

    iget v0, v0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;->viewTypeId:I

    .line 593
    :goto_0
    return v0

    .line 578
    :cond_0
    sget-object v0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;->service:Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;

    iget v0, v0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;->viewTypeId:I

    goto :goto_0

    .line 580
    :cond_1
    iget v0, p0, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->type:I

    const/4 v1, 0x6

    if-ne v0, v1, :cond_2

    .line 581
    sget-object v0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;->unreadSeparator:Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;

    iget v0, v0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;->viewTypeId:I

    goto :goto_0

    .line 583
    :cond_2
    iget v0, p0, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->type:I

    const/4 v1, 0x7

    if-ne v0, v1, :cond_4

    .line 584
    iget-boolean v0, p0, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->isOut:Z

    if-eqz v0, :cond_3

    sget-object v0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;->giftOut:Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;

    iget v0, v0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;->viewTypeId:I

    goto :goto_0

    :cond_3
    sget-object v0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;->giftIn:Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;

    iget v0, v0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;->viewTypeId:I

    goto :goto_0

    .line 586
    :cond_4
    iget v0, p0, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->fwdLevel:I

    if-lez v0, :cond_6

    .line 587
    iget-boolean v0, p0, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->isOut:Z

    if-eqz v0, :cond_5

    sget-object v0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;->fwdOut:Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;

    iget v0, v0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;->viewTypeId:I

    goto :goto_0

    :cond_5
    sget-object v0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;->fwdIn:Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;

    iget v0, v0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;->viewTypeId:I

    goto :goto_0

    .line 589
    :cond_6
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->hasAttachments()Z

    move-result v0

    if-nez v0, :cond_8

    .line 590
    iget-boolean v0, p0, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->isOut:Z

    if-eqz v0, :cond_7

    sget-object v0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;->messageOutText:Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;

    iget v0, v0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;->viewTypeId:I

    goto :goto_0

    :cond_7
    sget-object v0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;->messageInText:Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;

    iget v0, v0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;->viewTypeId:I

    goto :goto_0

    .line 593
    :cond_8
    iget-boolean v0, p0, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->isOut:Z

    if-eqz v0, :cond_9

    sget-object v0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;->messageOut:Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;

    iget v0, v0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;->viewTypeId:I

    goto :goto_0

    :cond_9
    sget-object v0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;->messageIn:Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;

    iget v0, v0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;->viewTypeId:I

    goto :goto_0
.end method

.method private processAttachments(Lcom/vkontakte/android/ui/holder/messages/MessageListItem;IZ)V
    .locals 21
    .param p1, "item"    # Lcom/vkontakte/android/ui/holder/messages/MessageListItem;
    .param p2, "msgId"    # I
    .param p3, "isSelected"    # Z

    .prologue
    .line 311
    const/4 v13, 0x0

    .line 312
    .local v13, "stickerView":Landroid/view/View;
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->attachments:Landroid/view/ViewGroup;

    if-eqz v15, :cond_12

    .line 313
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_0
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->attachments:Landroid/view/ViewGroup;

    invoke-virtual {v15}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v15

    if-ge v7, v15, :cond_1

    .line 314
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->attachments:Landroid/view/ViewGroup;

    invoke-virtual {v15, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    .line 315
    .local v6, "av":Landroid/view/View;
    invoke-virtual {v6}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v15

    if-eqz v15, :cond_0

    invoke-virtual {v6}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v15

    instance-of v15, v15, Ljava/lang/String;

    if-eqz v15, :cond_0

    .line 316
    invoke-virtual {v6}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v6, v15}, Lcom/vkontakte/android/attachments/Attachment;->reuseView(Landroid/view/View;Ljava/lang/String;)V

    .line 313
    :cond_0
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 319
    .end local v6    # "av":Landroid/view/View;
    :cond_1
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->attachments:Landroid/view/ViewGroup;

    invoke-virtual {v15}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 320
    new-instance v15, Ljava/util/ArrayList;

    invoke-direct {v15}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v0, p0

    iput-object v15, v0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->attachmentsImageViews:Ljava/util/List;

    .line 321
    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    .line 322
    .local v12, "photos":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/Photo;>;"
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 323
    .local v5, "audios":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/audio/MusicTrack;>;"
    const/4 v10, 0x0

    .line 324
    .local v10, "ph":I
    invoke-virtual/range {p1 .. p1}, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->getOrCreateAttachments()Ljava/util/List;

    move-result-object v15

    invoke-interface {v15}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v16

    :cond_2
    :goto_1
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_d

    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/attachments/Attachment;

    .line 325
    .local v4, "a":Lcom/vkontakte/android/attachments/Attachment;
    instance-of v15, v4, Lcom/vkontakte/android/attachments/GeoAttachment;

    if-eqz v15, :cond_3

    move-object v15, v4

    .line 326
    check-cast v15, Lcom/vkontakte/android/attachments/GeoAttachment;

    const/16 v17, 0x0

    move/from16 v0, v17

    iput v0, v15, Lcom/vkontakte/android/attachments/GeoAttachment;->style:I

    .line 328
    :cond_3
    instance-of v15, v4, Lcom/vkontakte/android/attachments/SnippetAttachment;

    if-eqz v15, :cond_4

    move-object v15, v4

    .line 329
    check-cast v15, Lcom/vkontakte/android/attachments/SnippetAttachment;

    const/16 v17, 0x0

    move-object/from16 v0, v17

    invoke-virtual {v15, v0}, Lcom/vkontakte/android/attachments/SnippetAttachment;->setReferData(Lcom/vkontakte/android/data/PostInteract;)V

    .line 332
    :cond_4
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->getContext()Landroid/content/Context;

    move-result-object v15

    invoke-virtual {v4, v15}, Lcom/vkontakte/android/attachments/Attachment;->getFullView(Landroid/content/Context;)Landroid/view/View;

    move-result-object v14

    .line 333
    .local v14, "v":Landroid/view/View;
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->attachments:Landroid/view/ViewGroup;

    invoke-virtual {v15, v14}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 335
    instance-of v15, v4, Lcom/vkontakte/android/attachments/ImageAttachment;

    if-eqz v15, :cond_5

    move-object v15, v4

    .line 336
    check-cast v15, Lcom/vkontakte/android/attachments/ImageAttachment;

    invoke-interface {v15, v14}, Lcom/vkontakte/android/attachments/ImageAttachment;->bind(Landroid/view/View;)V

    .line 338
    :cond_5
    instance-of v15, v4, Lcom/vkontakte/android/attachments/PhotoAttachment;

    if-eqz v15, :cond_6

    instance-of v15, v4, Lcom/vkontakte/android/attachments/AlbumAttachment;

    if-nez v15, :cond_6

    .line 339
    move v11, v10

    .line 340
    .local v11, "photoIdx":I
    add-int/lit8 v10, v10, 0x1

    .line 341
    new-instance v17, Lcom/vkontakte/android/Photo;

    move-object v15, v4

    check-cast v15, Lcom/vkontakte/android/attachments/PhotoAttachment;

    move-object/from16 v0, v17

    invoke-direct {v0, v15}, Lcom/vkontakte/android/Photo;-><init>(Lcom/vkontakte/android/attachments/PhotoAttachment;)V

    move-object/from16 v0, v17

    invoke-virtual {v12, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 342
    move-object/from16 v0, p0

    invoke-static {v0, v12, v11}, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;Ljava/util/ArrayList;I)Landroid/view/View$OnClickListener;

    move-result-object v15

    invoke-virtual {v14, v15}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 377
    .end local v11    # "photoIdx":I
    :cond_6
    instance-of v15, v4, Lcom/vkontakte/android/attachments/AudioAttachment;

    if-eqz v15, :cond_7

    move-object v15, v4

    .line 378
    check-cast v15, Lcom/vkontakte/android/attachments/AudioAttachment;

    iget-object v15, v15, Lcom/vkontakte/android/attachments/AudioAttachment;->musicTrack:Lcom/vkontakte/android/audio/MusicTrack;

    invoke-virtual {v5, v15}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 379
    const/high16 v15, 0x41000000    # 8.0f

    invoke-static {v15}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v15

    invoke-virtual {v14}, Landroid/view/View;->getPaddingTop()I

    move-result v17

    const/high16 v18, 0x41000000    # 8.0f

    invoke-static/range {v18 .. v18}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v18

    invoke-virtual {v14}, Landroid/view/View;->getPaddingBottom()I

    move-result v19

    move/from16 v0, v17

    move/from16 v1, v18

    move/from16 v2, v19

    invoke-virtual {v14, v15, v0, v1, v2}, Landroid/view/View;->setPadding(IIII)V

    .line 381
    :cond_7
    instance-of v15, v4, Lcom/vkontakte/android/attachments/VideoAttachment;

    if-eqz v15, :cond_8

    move-object v15, v4

    .line 382
    check-cast v15, Lcom/vkontakte/android/attachments/VideoAttachment;

    const-string/jumbo v17, "messages"

    const/16 v18, 0x0

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v15, v0, v1}, Lcom/vkontakte/android/attachments/VideoAttachment;->setReferData(Ljava/lang/String;Lcom/vkontakte/android/data/PostInteract;)V

    .line 384
    :cond_8
    instance-of v15, v4, Lcom/vkontakte/android/attachments/GiftAttachment;

    if-eqz v15, :cond_a

    move-object v15, v4

    .line 385
    check-cast v15, Lcom/vkontakte/android/attachments/GiftAttachment;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->chatFragment:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v15, v0}, Lcom/vkontakte/android/attachments/GiftAttachment;->setCallback(Lcom/vkontakte/android/attachments/StickerAttachment$Callback;)V

    move-object v15, v4

    .line 386
    check-cast v15, Lcom/vkontakte/android/attachments/GiftAttachment;

    invoke-virtual {v15}, Lcom/vkontakte/android/attachments/GiftAttachment;->hasPackId()Z

    move-result v15

    if-eqz v15, :cond_b

    .line 387
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->extGiftText:Landroid/widget/TextView;

    if-eqz v15, :cond_9

    .line 388
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->extGiftText:Landroid/widget/TextView;

    const v17, 0x7f0806c8

    move/from16 v0, v17

    invoke-virtual {v15, v0}, Landroid/widget/TextView;->setText(I)V

    .line 389
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->extGiftText:Landroid/widget/TextView;

    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->getContext()Landroid/content/Context;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v17

    const v18, 0x7f02017f

    .line 390
    invoke-virtual/range {v17 .. v18}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v17

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    .line 389
    move-object/from16 v0, v17

    move-object/from16 v1, v18

    move-object/from16 v2, v19

    move-object/from16 v3, v20

    invoke-virtual {v15, v0, v1, v2, v3}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 392
    :cond_9
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->showStickerPuckButton:Landroid/widget/TextView;

    const/16 v17, 0x0

    move/from16 v0, v17

    invoke-static {v15, v0}, Lcom/vkontakte/android/ViewUtils;->setVisibility(Landroid/view/View;I)V

    .line 402
    :cond_a
    :goto_2
    instance-of v15, v4, Lcom/vkontakte/android/attachments/AudioMessageAttachment;

    if-eqz v15, :cond_2

    .line 403
    check-cast v4, Lcom/vkontakte/android/attachments/AudioMessageAttachment;

    .end local v4    # "a":Lcom/vkontakte/android/attachments/Attachment;
    move/from16 v0, p2

    invoke-virtual {v4, v0}, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->setMessageId(I)V

    goto/16 :goto_1

    .line 394
    .restart local v4    # "a":Lcom/vkontakte/android/attachments/Attachment;
    :cond_b
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->extGiftText:Landroid/widget/TextView;

    if-eqz v15, :cond_c

    .line 395
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->extGiftText:Landroid/widget/TextView;

    const v17, 0x7f080284

    move/from16 v0, v17

    invoke-virtual {v15, v0}, Landroid/widget/TextView;->setText(I)V

    .line 396
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->extGiftText:Landroid/widget/TextView;

    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->getContext()Landroid/content/Context;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v17

    const v18, 0x7f02017e

    .line 397
    invoke-virtual/range {v17 .. v18}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v17

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    .line 396
    move-object/from16 v0, v17

    move-object/from16 v1, v18

    move-object/from16 v2, v19

    move-object/from16 v3, v20

    invoke-virtual {v15, v0, v1, v2, v3}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 399
    :cond_c
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->showStickerPuckButton:Landroid/widget/TextView;

    const/16 v17, 0x8

    move/from16 v0, v17

    invoke-static {v15, v0}, Lcom/vkontakte/android/ViewUtils;->setVisibility(Landroid/view/View;I)V

    goto :goto_2

    .line 406
    .end local v4    # "a":Lcom/vkontakte/android/attachments/Attachment;
    .end local v14    # "v":Landroid/view/View;
    :cond_d
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v15

    if-lez v15, :cond_f

    .line 407
    const/4 v7, 0x0

    .line 408
    invoke-virtual/range {p1 .. p1}, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->getOrCreateAttachments()Ljava/util/List;

    move-result-object v15

    invoke-interface {v15}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v16

    :cond_e
    :goto_3
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_f

    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/attachments/Attachment;

    .line 409
    .restart local v4    # "a":Lcom/vkontakte/android/attachments/Attachment;
    instance-of v15, v4, Lcom/vkontakte/android/attachments/AudioAttachment;

    if-eqz v15, :cond_e

    move-object v15, v4

    .line 410
    check-cast v15, Lcom/vkontakte/android/attachments/AudioAttachment;

    iput v7, v15, Lcom/vkontakte/android/attachments/AudioAttachment;->playlistPos:I

    move-object v15, v4

    .line 411
    check-cast v15, Lcom/vkontakte/android/attachments/AudioAttachment;

    iput-object v5, v15, Lcom/vkontakte/android/attachments/AudioAttachment;->playlist:Ljava/util/ArrayList;

    .line 412
    check-cast v4, Lcom/vkontakte/android/attachments/AudioAttachment;

    .end local v4    # "a":Lcom/vkontakte/android/attachments/Attachment;
    const-string/jumbo v15, "messages"

    const/16 v17, 0x0

    move-object/from16 v0, v17

    invoke-virtual {v4, v15, v0}, Lcom/vkontakte/android/attachments/AudioAttachment;->setReferData(Ljava/lang/String;Lcom/vkontakte/android/data/PostInteract;)V

    .line 413
    add-int/lit8 v7, v7, 0x1

    goto :goto_3

    .line 417
    :cond_f
    const/4 v8, 0x0

    .line 418
    .local v8, "idx":I
    invoke-virtual/range {p1 .. p1}, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->getOrCreateAttachments()Ljava/util/List;

    move-result-object v15

    invoke-interface {v15}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v15

    :goto_4
    invoke-interface {v15}, Ljava/util/Iterator;->hasNext()Z

    move-result v16

    if-eqz v16, :cond_12

    invoke-interface {v15}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/attachments/Attachment;

    .line 419
    .restart local v4    # "a":Lcom/vkontakte/android/attachments/Attachment;
    instance-of v0, v4, Lcom/vkontakte/android/attachments/ImageAttachment;

    move/from16 v16, v0

    if-eqz v16, :cond_10

    .line 420
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->attachments:Landroid/view/ViewGroup;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-virtual {v0, v8}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    .line 421
    .restart local v6    # "av":Landroid/view/View;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->attachmentsImageViews:Ljava/util/List;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-interface {v0, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 422
    instance-of v0, v4, Lcom/vkontakte/android/attachments/StickerAttachment;

    move/from16 v16, v0

    if-eqz v16, :cond_11

    .line 423
    move-object v13, v6

    .line 424
    check-cast v4, Lcom/vkontakte/android/attachments/StickerAttachment;

    .end local v4    # "a":Lcom/vkontakte/android/attachments/Attachment;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->chatFragment:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-virtual {v4, v0}, Lcom/vkontakte/android/attachments/StickerAttachment;->setCallback(Lcom/vkontakte/android/attachments/StickerAttachment$Callback;)V

    .line 429
    .end local v6    # "av":Landroid/view/View;
    :cond_10
    :goto_5
    add-int/lit8 v8, v8, 0x1

    .line 430
    goto :goto_4

    .line 425
    .restart local v4    # "a":Lcom/vkontakte/android/attachments/Attachment;
    .restart local v6    # "av":Landroid/view/View;
    :cond_11
    instance-of v0, v4, Lcom/vkontakte/android/attachments/GraffitiAttachment;

    move/from16 v16, v0

    if-eqz v16, :cond_10

    .line 426
    move-object v13, v6

    goto :goto_5

    .line 433
    .end local v4    # "a":Lcom/vkontakte/android/attachments/Attachment;
    .end local v5    # "audios":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/audio/MusicTrack;>;"
    .end local v6    # "av":Landroid/view/View;
    .end local v7    # "i":I
    .end local v8    # "idx":I
    .end local v10    # "ph":I
    .end local v12    # "photos":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/Photo;>;"
    :cond_12
    move-object/from16 v0, p1

    iget v15, v0, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->type:I

    const/16 v16, 0x5

    move/from16 v0, v16

    if-ne v15, v0, :cond_13

    .line 434
    const/4 v7, 0x0

    .restart local v7    # "i":I
    :goto_6
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->attachments:Landroid/view/ViewGroup;

    if-eqz v15, :cond_13

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->attachments:Landroid/view/ViewGroup;

    invoke-virtual {v15}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v15

    if-ge v7, v15, :cond_13

    .line 435
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->attachments:Landroid/view/ViewGroup;

    invoke-virtual {v15, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v15

    invoke-virtual {v15}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v9

    check-cast v9, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;

    .line 436
    .local v9, "lp":Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;
    const/4 v15, 0x0

    iput v15, v9, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;->vertical_spacing:I

    .line 437
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->attachments:Landroid/view/ViewGroup;

    invoke-virtual {v15, v7}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v15

    invoke-virtual {v15, v9}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 434
    add-int/lit8 v7, v7, 0x1

    goto :goto_6

    .line 440
    .end local v7    # "i":I
    .end local v9    # "lp":Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;
    :cond_13
    move-object/from16 v0, p1

    iget v15, v0, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->type:I

    const/16 v16, 0x5

    move/from16 v0, v16

    if-eq v15, v0, :cond_15

    .line 441
    invoke-virtual/range {p1 .. p1}, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->isSticker()Z

    move-result v15

    if-nez v15, :cond_14

    invoke-virtual/range {p1 .. p1}, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->isGraffiti()Z

    move-result v15

    if-eqz v15, :cond_15

    :cond_14
    move-object/from16 v0, p1

    iget v15, v0, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->fwdLevel:I

    if-nez v15, :cond_15

    if-eqz v13, :cond_15

    .line 442
    if-eqz p3, :cond_16

    .line 443
    check-cast v13, Landroid/widget/ImageView;

    .end local v13    # "stickerView":Landroid/view/View;
    const/high16 v15, 0x33000000

    invoke-virtual {v13, v15}, Landroid/widget/ImageView;->setColorFilter(I)V

    .line 449
    :cond_15
    :goto_7
    return-void

    .line 445
    .restart local v13    # "stickerView":Landroid/view/View;
    :cond_16
    check-cast v13, Landroid/widget/ImageView;

    .end local v13    # "stickerView":Landroid/view/View;
    const/4 v15, 0x0

    invoke-virtual {v13, v15}, Landroid/widget/ImageView;->setColorFilter(I)V

    goto :goto_7
.end method

.method private processFw(Lcom/vkontakte/android/ui/holder/messages/MessageListItem;)V
    .locals 4
    .param p1, "item"    # Lcom/vkontakte/android/ui/holder/messages/MessageListItem;

    .prologue
    .line 452
    iget v0, p1, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->fwdLevel:I

    if-lez v0, :cond_0

    .line 453
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->wrap:Landroid/view/ViewGroup;

    check-cast v0, Lcom/vkontakte/android/ui/MessageRelativeLayout;

    iget v1, p1, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->fwdLevelLast:I

    iget v2, p1, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->fwdLevel:I

    iget v3, p1, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->fwdLevelNext:I

    invoke-virtual {v0, v1, v2, v3}, Lcom/vkontakte/android/ui/MessageRelativeLayout;->setLevel(III)V

    .line 454
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->fwdName:Landroid/widget/TextView;

    iget-object v1, p1, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->fwdName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 455
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->fwdTime:Landroid/widget/TextView;

    iget v1, p1, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->fwdTime:I

    invoke-static {v1}, Lcom/vkontakte/android/TimeUtils;->langDate(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 456
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->fwdWrap:Landroid/view/ViewGroup;

    iget v1, p1, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->fwdUid:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setTag(Ljava/lang/Object;)V

    .line 457
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->fwdWrap:Landroid/view/ViewGroup;

    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 459
    :cond_0
    return-void
.end method

.method private processSubViewVisible(Lcom/vkontakte/android/ui/holder/messages/MessageListItem;)V
    .locals 4
    .param p1, "item"    # Lcom/vkontakte/android/ui/holder/messages/MessageListItem;

    .prologue
    const/4 v3, 0x4

    const/4 v2, 0x0

    .line 299
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->time:Landroid/widget/TextView;

    iget v1, p1, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->time:I

    invoke-static {v1}, Lcom/vkontakte/android/TimeUtils;->time(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, v2}, Lcom/vkontakte/android/ViewUtils;->setText(Landroid/widget/TextView;Ljava/lang/Object;Z)V

    .line 301
    iget v0, p1, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->type:I

    if-eq v0, v3, :cond_0

    iget v0, p1, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->type:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    iget v0, p1, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->type:I

    const/4 v1, 0x7

    if-eq v0, v1, :cond_0

    .line 304
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->time:Landroid/widget/TextView;

    invoke-static {v0, v3}, Lcom/vkontakte/android/ViewUtils;->setVisibility(Landroid/view/View;I)V

    .line 308
    :goto_0
    return-void

    .line 306
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->time:Landroid/widget/TextView;

    invoke-static {v0, v2}, Lcom/vkontakte/android/ViewUtils;->setVisibility(Landroid/view/View;I)V

    goto :goto_0
.end method


# virtual methods
.method public bind(Lcom/vkontakte/android/ui/holder/messages/MessageListItem;Z)V
    .locals 7
    .param p1, "item"    # Lcom/vkontakte/android/ui/holder/messages/MessageListItem;
    .param p2, "animate"    # Z

    .prologue
    .line 239
    iget-boolean v2, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->isSelected:Z

    iget-boolean v3, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->isActionMod:Z

    iget v4, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->peer:I

    iget v5, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->msgId:I

    move-object v0, p0

    move-object v1, p1

    move v6, p2

    invoke-virtual/range {v0 .. v6}, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->bind(Lcom/vkontakte/android/ui/holder/messages/MessageListItem;ZZIIZ)V

    .line 240
    return-void
.end method

.method public bind(Lcom/vkontakte/android/ui/holder/messages/MessageListItem;ZZIIZ)V
    .locals 6
    .param p1, "item"    # Lcom/vkontakte/android/ui/holder/messages/MessageListItem;
    .param p2, "isSelected"    # Z
    .param p3, "isActionMod"    # Z
    .param p4, "peer"    # I
    .param p5, "msgId"    # I
    .param p6, "animate"    # Z

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 243
    iput-boolean p2, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->isSelected:Z

    .line 244
    iput-boolean p3, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->isActionMod:Z

    .line 245
    iput p5, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->msgId:I

    .line 246
    iput p4, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->peer:I

    .line 248
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->translatedViews:Ljava/util/List;

    if-eqz v1, :cond_1

    .line 249
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->translatedViews:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 250
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->translatedViews:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    iget-boolean v2, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->isTimeVisible:Z

    if-eqz v2, :cond_0

    sget v2, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->TIME_DX:I

    int-to-float v2, v2

    :goto_1
    invoke-virtual {v1, v2}, Landroid/view/View;->setTranslationX(F)V

    .line 249
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 250
    :cond_0
    const/4 v2, 0x0

    goto :goto_1

    .line 254
    .end local v0    # "i":I
    :cond_1
    iput-object p1, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->lastItem:Lcom/vkontakte/android/ui/holder/messages/MessageListItem;

    .line 255
    iput-boolean p3, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->isActionMode:Z

    .line 256
    iget v1, p1, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->type:I

    const/4 v2, 0x6

    if-ne v1, v2, :cond_3

    .line 296
    :cond_2
    :goto_2
    return-void

    .line 259
    :cond_3
    iget v1, p1, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->type:I

    const/4 v2, 0x5

    if-ne v1, v2, :cond_6

    .line 260
    iget-object v1, p1, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->text:Ljava/lang/CharSequence;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 261
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->text:Landroid/widget/TextView;

    iget v2, p1, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->time:I

    invoke-static {v2}, Lcom/vkontakte/android/TimeUtils;->langDate(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 262
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->text:Landroid/widget/TextView;

    sget-object v2, Lcom/vkontakte/android/ui/Font;->Medium:Lcom/vkontakte/android/ui/Font;

    iget-object v2, v2, Lcom/vkontakte/android/ui/Font;->typeface:Landroid/graphics/Typeface;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 263
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->text:Landroid/widget/TextView;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 268
    :goto_3
    invoke-direct {p0, p1, p5, p2}, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->processAttachments(Lcom/vkontakte/android/ui/holder/messages/MessageListItem;IZ)V

    .line 290
    :goto_4
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->senderPhoto:Lcom/vk/imageloader/view/VKImageView;

    if-eqz v1, :cond_4

    invoke-virtual {p1}, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->hasMainPhoto()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 291
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->senderPhoto:Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {p1}, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->getImageUrl()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 293
    :cond_4
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->msgFwdPhoto:Lcom/vk/imageloader/view/VKImageView;

    if-eqz v1, :cond_2

    invoke-virtual {p1}, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->getImageUrlFwd()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 294
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->msgFwdPhoto:Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {p1}, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->getImageUrlFwd()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    goto :goto_2

    .line 265
    :cond_5
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->text:Landroid/widget/TextView;

    iget-object v2, p1, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->text:Ljava/lang/CharSequence;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 266
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->text:Landroid/widget/TextView;

    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    goto :goto_3

    .line 270
    :cond_6
    invoke-direct {p0, p1, p5, p2}, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->processAttachments(Lcom/vkontakte/android/ui/holder/messages/MessageListItem;IZ)V

    .line 272
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->text:Landroid/widget/TextView;

    iget-object v2, p1, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->text:Ljava/lang/CharSequence;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 273
    invoke-direct {p0, p1}, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->processSubViewVisible(Lcom/vkontakte/android/ui/holder/messages/MessageListItem;)V

    .line 274
    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->text:Landroid/widget/TextView;

    iget-object v1, p1, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->text:Ljava/lang/CharSequence;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_b

    const/16 v1, 0x8

    :goto_5
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 276
    invoke-direct {p0, p1, p2, p6}, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->fillBg(Lcom/vkontakte/android/ui/holder/messages/MessageListItem;ZZ)V

    .line 277
    invoke-direct {p0, p1}, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->processFw(Lcom/vkontakte/android/ui/holder/messages/MessageListItem;)V

    .line 279
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->senderPhoto:Lcom/vk/imageloader/view/VKImageView;

    if-eqz v1, :cond_9

    iget-boolean v1, p1, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->isOut:Z

    if-nez v1, :cond_9

    .line 280
    const v1, 0x77359400

    if-le p4, v1, :cond_8

    .line 281
    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->senderPhoto:Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {p1}, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->isShowPhoto()Z

    move-result v1

    if-eqz v1, :cond_c

    iget v1, p1, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->type:I

    const/4 v5, 0x2

    if-eq v1, v5, :cond_7

    iget v1, p1, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->type:I

    if-ne v1, v4, :cond_c

    :cond_7
    move v1, v3

    :goto_6
    invoke-virtual {v2, v1}, Lcom/vk/imageloader/view/VKImageView;->setVisibility(I)V

    .line 284
    :cond_8
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->senderPhoto:Lcom/vk/imageloader/view/VKImageView;

    iget v2, p1, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->msgId:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vk/imageloader/view/VKImageView;->setTag(Ljava/lang/Object;)V

    .line 286
    :cond_9
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->wrap:Landroid/view/ViewGroup;

    if-nez p3, :cond_a

    move v3, v4

    :cond_a
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->setEnabled(Z)V

    goto/16 :goto_4

    :cond_b
    move v1, v3

    .line 274
    goto :goto_5

    .line 281
    :cond_c
    const/4 v1, 0x4

    goto :goto_6
.end method

.method public getLastItem()Lcom/vkontakte/android/ui/holder/messages/MessageListItem;
    .locals 1

    .prologue
    .line 100
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->lastItem:Lcom/vkontakte/android/ui/holder/messages/MessageListItem;

    return-object v0
.end method

.method public getSearchedMessageColorAnimator()Landroid/animation/Animator;
    .locals 4

    .prologue
    .line 214
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->itemView:Landroid/view/View;

    const-string/jumbo v2, "backgroundColor"

    const/4 v3, 0x2

    new-array v3, v3, [I

    fill-array-data v3, :array_0

    invoke-static {v1, v2, v3}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Ljava/lang/String;[I)Landroid/animation/ObjectAnimator;

    move-result-object v0

    .line 215
    .local v0, "colorAnim":Landroid/animation/ValueAnimator;
    new-instance v1, Landroid/animation/ArgbEvaluator;

    invoke-direct {v1}, Landroid/animation/ArgbEvaluator;-><init>()V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setEvaluator(Landroid/animation/TypeEvaluator;)V

    .line 216
    return-object v0

    .line 214
    :array_0
    .array-data 4
        -0x271d13
        0xd8e2ed
    .end array-data
.end method

.method synthetic lambda$processAttachments$0(Ljava/util/ArrayList;ILandroid/view/View;)V
    .locals 4
    .param p1, "photos"    # Ljava/util/ArrayList;
    .param p2, "photoIdx"    # I
    .param p3, "v1"    # Landroid/view/View;

    .prologue
    const v3, 0x7f100067

    .line 343
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->attachments:Landroid/view/ViewGroup;

    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getTag(I)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 375
    :goto_0
    return-void

    .line 346
    :cond_0
    new-instance v0, Lcom/vkontakte/android/PhotoViewer;

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->getContext()Landroid/content/Context;

    move-result-object v1

    check-cast v1, Landroid/app/Activity;

    new-instance v2, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$1;

    invoke-direct {v2, p0}, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$1;-><init>(Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;)V

    invoke-direct {v0, v1, p1, p2, v2}, Lcom/vkontakte/android/PhotoViewer;-><init>(Landroid/app/Activity;Ljava/util/List;ILcom/vkontakte/android/PhotoViewer$PhotoViewerCallback;)V

    .line 373
    .local v0, "viewer":Lcom/vkontakte/android/PhotoViewer;
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->attachments:Landroid/view/ViewGroup;

    invoke-virtual {v1, v3, v0}, Landroid/view/ViewGroup;->setTag(ILjava/lang/Object;)V

    .line 374
    invoke-virtual {v0}, Lcom/vkontakte/android/PhotoViewer;->show()V

    goto :goto_0
.end method

.method public onBind(Lcom/vkontakte/android/ui/holder/messages/MessageListItem;)V
    .locals 1
    .param p1, "item"    # Lcom/vkontakte/android/ui/holder/messages/MessageListItem;

    .prologue
    .line 235
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->bind(Lcom/vkontakte/android/ui/holder/messages/MessageListItem;Z)V

    .line 236
    return-void
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 59
    check-cast p1, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->onBind(Lcom/vkontakte/android/ui/holder/messages/MessageListItem;)V

    return-void
.end method

.method public onClick()V
    .locals 2

    .prologue
    .line 563
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->lastItem:Lcom/vkontakte/android/ui/holder/messages/MessageListItem;

    iget v0, v0, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->type:I

    const/4 v1, 0x5

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->lastItem:Lcom/vkontakte/android/ui/holder/messages/MessageListItem;

    iget v0, v0, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->type:I

    const/4 v1, 0x6

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->chatFragment:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    if-eqz v0, :cond_0

    .line 564
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->chatFragment:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->lastItem:Lcom/vkontakte/android/ui/holder/messages/MessageListItem;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->onItemClick(Lcom/vkontakte/android/ui/holder/messages/MessageListItem;)V

    .line 566
    :cond_0
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v3, 0x0

    .line 533
    const v1, 0x7f1003a2

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v2

    if-ne v1, v2, :cond_1

    .line 534
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->lastItem:Lcom/vkontakte/android/ui/holder/messages/MessageListItem;

    invoke-virtual {v1}, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->hasAttachments()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->lastItem:Lcom/vkontakte/android/ui/holder/messages/MessageListItem;

    invoke-virtual {v1}, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->getOrCreateAttachments()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    instance-of v1, v1, Lcom/vkontakte/android/attachments/GiftAttachment;

    if-eqz v1, :cond_0

    .line 535
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->lastItem:Lcom/vkontakte/android/ui/holder/messages/MessageListItem;

    invoke-virtual {v1}, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->getOrCreateAttachments()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/attachments/GiftAttachment;

    iget v0, v1, Lcom/vkontakte/android/attachments/GiftAttachment;->packID:I

    .line 536
    .local v0, "packId":I
    const-string/jumbo v1, "message"

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;->show(ILjava/lang/String;Landroid/content/Context;)V

    .line 555
    .end local v0    # "packId":I
    :cond_0
    :goto_0
    return-void

    .line 540
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->itemView:Landroid/view/View;

    if-ne p1, v1, :cond_3

    iget-boolean v1, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->isActionMode:Z

    if-nez v1, :cond_2

    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->chatFragment:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->isShowingTime()Z

    move-result v1

    if-nez v1, :cond_3

    .line 541
    :cond_2
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->onClick()V

    goto :goto_0

    .line 542
    :cond_3
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->itemView:Landroid/view/View;

    if-ne p1, v1, :cond_4

    .line 543
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->chatFragment:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->toggleTime()V

    goto :goto_0

    .line 545
    :cond_4
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v1

    sparse-switch v1, :sswitch_data_0

    goto :goto_0

    .line 551
    :sswitch_0
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->onClick()V

    goto :goto_0

    .line 547
    :sswitch_1
    new-instance v2, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-direct {v2, v1}, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;-><init>(I)V

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v2, v1}, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;->go(Landroid/content/Context;)Z

    goto :goto_0

    .line 545
    :sswitch_data_0
    .sparse-switch
        0x7f100056 -> :sswitch_0
        0x7f10005d -> :sswitch_0
        0x7f10039b -> :sswitch_1
    .end sparse-switch
.end method

.method public onLongClick()Z
    .locals 2

    .prologue
    .line 569
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->lastItem:Lcom/vkontakte/android/ui/holder/messages/MessageListItem;

    iget v0, v0, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->type:I

    const/4 v1, 0x5

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->lastItem:Lcom/vkontakte/android/ui/holder/messages/MessageListItem;

    iget v0, v0, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->type:I

    const/4 v1, 0x6

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->chatFragment:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->chatFragment:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->lastItem:Lcom/vkontakte/android/ui/holder/messages/MessageListItem;

    .line 570
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->onItemLongClick(Lcom/vkontakte/android/ui/holder/messages/MessageListItem;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onLongClick(Landroid/view/View;)Z
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 559
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->onLongClick()Z

    move-result v0

    return v0
.end method

.method public setReadState(Z)V
    .locals 3
    .param p1, "state"    # Z

    .prologue
    .line 203
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->progressDrawable:Lcom/vkontakte/android/ui/drawables/MessageStatusDrawable;

    if-eqz v0, :cond_0

    .line 204
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->progressDrawable:Lcom/vkontakte/android/ui/drawables/MessageStatusDrawable;

    if-eqz p1, :cond_1

    sget-object v0, Lcom/vkontakte/android/ui/drawables/MessageStatusDrawable$DrawState;->haveBeenRed:Lcom/vkontakte/android/ui/drawables/MessageStatusDrawable$DrawState;

    :goto_0
    const/4 v2, 0x1

    invoke-virtual {v1, v0, v2}, Lcom/vkontakte/android/ui/drawables/MessageStatusDrawable;->setDrawState(Lcom/vkontakte/android/ui/drawables/MessageStatusDrawable$DrawState;Z)V

    .line 207
    :cond_0
    return-void

    .line 204
    :cond_1
    sget-object v0, Lcom/vkontakte/android/ui/drawables/MessageStatusDrawable$DrawState;->sent:Lcom/vkontakte/android/ui/drawables/MessageStatusDrawable$DrawState;

    goto :goto_0
.end method

.method public setTimeIsVisible(Z)V
    .locals 0
    .param p1, "isTimeVisible"    # Z

    .prologue
    .line 210
    iput-boolean p1, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->isTimeVisible:Z

    .line 211
    return-void
.end method

.method public setTimeIsVisibleAnim(Z)Ljava/util/List;
    .locals 7
    .param p1, "isTimeVisible"    # Z
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Ljava/util/List",
            "<",
            "Landroid/animation/Animator;",
            ">;"
        }
    .end annotation

    .prologue
    .line 221
    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->translatedViews:Ljava/util/List;

    if-nez v2, :cond_1

    .line 222
    const/4 v0, 0x0

    .line 229
    :cond_0
    return-object v0

    .line 224
    :cond_1
    new-instance v0, Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->translatedViews:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 225
    .local v0, "animators":Ljava/util/List;, "Ljava/util/List<Landroid/animation/Animator;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->translatedViews:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 226
    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->translatedViews:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    const-string/jumbo v4, "translationX"

    const/4 v2, 0x2

    new-array v5, v2, [F

    const/4 v6, 0x0

    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->translatedViews:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getTranslationX()F

    move-result v2

    aput v2, v5, v6

    const/4 v6, 0x1

    if-eqz p1, :cond_2

    sget v2, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->TIME_DX:I

    int-to-float v2, v2

    :goto_1
    aput v2, v5, v6

    invoke-static {v3, v4, v5}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 225
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 226
    :cond_2
    const/4 v2, 0x0

    goto :goto_1
.end method

.method public showFailed()V
    .locals 3

    .prologue
    .line 197
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->progressDrawable:Lcom/vkontakte/android/ui/drawables/MessageStatusDrawable;

    if-eqz v0, :cond_0

    .line 198
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->progressDrawable:Lcom/vkontakte/android/ui/drawables/MessageStatusDrawable;

    sget-object v1, Lcom/vkontakte/android/ui/drawables/MessageStatusDrawable$DrawState;->error:Lcom/vkontakte/android/ui/drawables/MessageStatusDrawable$DrawState;

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/ui/drawables/MessageStatusDrawable;->setDrawState(Lcom/vkontakte/android/ui/drawables/MessageStatusDrawable$DrawState;Z)V

    .line 200
    :cond_0
    return-void
.end method
